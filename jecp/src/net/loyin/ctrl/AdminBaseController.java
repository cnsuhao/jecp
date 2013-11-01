package net.loyin.ctrl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import net.loyin.model.hr.Employee;
import net.loyin.pageModel.DataGrid;
import net.loyin.pageModel.TreeNode;

import org.apache.commons.lang.ArrayUtils;

import com.google.gson.Gson;
import com.jfinal.core.TypeConverter;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.activerecord.TableInfo;
import com.jfinal.plugin.activerecord.TableInfoMapping;
import com.jfinal.token.TokenManager;

/**
 * 后台管理基础Controller
 * 
 * @author 刘声凤 2012-9-3 下午10:37:28
 */
public abstract class AdminBaseController<M extends Model<M>> extends
		BaseController<M> {
	protected String tableName;
	protected Class<M> modelClass;
	protected static String tokenName="token";
	/**yyyy-MM-dd HH:mm:ss 日期时间*/
	protected static final SimpleDateFormat dateTimeFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**yyyy-MM-dd 日期*/
	protected static final SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
	/**yyyy年*/
	protected static final SimpleDateFormat yearFormat=new SimpleDateFormat("yyyy");
	/**MM月*/
	protected static final SimpleDateFormat monthFormat=new SimpleDateFormat("MM");
	/**dd 日*/
	protected static final SimpleDateFormat dayFormat=new SimpleDateFormat("dd");
	/**HH:mm:ss 时间*/
	protected static final SimpleDateFormat timeFormat=new SimpleDateFormat("HH:mm:ss");
	/**HH:mm 小时分钟*/
	protected static final SimpleDateFormat hmFormat=new SimpleDateFormat("HH:mm");
	/**EEE 星期*/
	protected static final SimpleDateFormat wdFormat=new SimpleDateFormat("EEE");
	/**token超时时间600s*/
	protected int tokenTout=600; 
	public void index(){
		String para=this.getPara();
		if(para!=null&&!"".equals(para))
		this.renderHTML(para);
	};

	public void dataGrid(){
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		String qryField=this.getPara("qryField");//查询字段 以逗号分隔
		if(qryField!=null&&!"".equals(qryField)){
			String[] k=qryField.split(",");
			for(String q:k){
				Object t=this.getPara(q);
				if(t!=null&&!"".equals(t)){
					where.append(" and ");
					if(q.endsWith("start")){
						where.append(q.replace("start",""));
						where.append(" >=? ");
					}else if(q.endsWith("end")){
						where.append(q.replace("end",""));
						where.append(" <=? ");
					}else{
						where.append(q);
						where.append(" =? ");
					}
					param.add(t);
				}
			}
		}
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select * ", "from " + this.tableName+ " where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	};
	/**树形表格*/
	public void treeDataGrid() {
		DataGrid dg=new DataGrid();
		List<Record> list= Db.find("select a.*,p.cname pcname from "+this.tableName+" a left join "+this.tableName+" p on p.id=a.pid");
		List<Map<String,Object>> list1=new ArrayList<Map<String,Object>>();
		for(Record r:list){
			Map<String,Object> d=new HashMap<String,Object>();
			for(String col:r.getcolumnNames()){
				d.put(col,r.get(col));
			}
			Long pid=r.getLong("pid");
			if(pid!=null&&pid!=0)
			d.put("_parentId",pid);//tree datagrid 需要使用此字段作为父节点关联
			list1.add(d);
		}
		dg.setRows(list1);
		dg.setTotal(list1.size());
		this.renderJson(dg);
	}
	/**选择树*/
	public void combotree() {
		List<Record> dataList = Db.find("select id,cname,pid from "+this.tableName);
		List<TreeNode> list = new ArrayList<TreeNode>();
		TreeNode rootNode = new TreeNode();
		rootNode.setId(0L);
		rootNode.setText("");
		rootNode.setIconCls("icon-home");
		rootNode.setCanChk(false);
		fillTree(dataList, rootNode,"cname",true,null);
		list.add(rootNode);
		this.renderJson_(list);
	}
	public void combobox(){
		List<Record> list=Db.find("select * from "+this.tableName);
		this.renderJson(list);
	}
	/** 获取当前系统操作人 */
	public Record getCurrentUser() {
		return Employee.dao.qryLoginUser(getCurrentUserId());
	}
	/** 获取当前系统操作人ID */
	public Long getCurrentUserId(){
		String login_user_id=this.getCookie("login_user_id");
		return idGenerater.to10(login_user_id);
	}

	public void save() {
		try {
			Model<M> m = this.getModel();
			Long id = m.getLong("ID");
			Long tokenl=this.getParaToLong("token");
			if(tokenl!=null){
				if(!TokenManager.validateToken(this, tokenName)){
					this.rendJson_(false, "会话令牌错误！",id,new Random().nextLong());
					return;
				}
			}
			Long uid=getCurrentUserId();
			Date now=new Date();
			if (id != null && id != 0) {
				m.set("utime",now);//修改时间
				m.set("updater",uid);//修改人
				m.update();
			} else {
				m.set("creater",uid);//创建人
				m.set("ctime",now);//创建时间
				m.save();
			}
			id = m.getLong("ID");
			rendJson_(true, "保存成功！", id,new Random().nextLong());
		} catch (Exception e) {
			log.error("保存异常", e);
			rendJson_(false, "保存异常！");
		}
	}
	/**是否有子集 针对树形数据*/
	private boolean hashChild(Long id){
		try{
		TableInfo tableInfo = TableInfoMapping.me().getTableInfo(modelClass);
		if(tableInfo.hasColumnLabel("pid")){
			List<Record> list=Db.find("select * from "+this.tableName+" where pid=?", id);
			return list!=null&&list.isEmpty()==false;
		}
		}catch(Exception e){
			return false;
		}
		return false;
	}
	public void del() {
		try {
			Long id = this.getParaToLong(0);
			if (id == null||id==0L){
				String ids = this.getPara("ids");
				if (ids != null && !"".equals(ids)) {
					Db.update("delete from " + this.tableName + " where id in ("+ ids+ ")");
				} else {
					id = this.getParaToLong("ID");
				}
			}else{
				po = get(id);
				Long uid=this.getCurrentUserId();
				Long creater=po.getLong("creater");
				if(creater!=null&&uid!=creater){
					rendJson_(false, "您无权限操作他人所创建的信息！");
					return;
				}
				if(hashChild(id)==false){
					Db.deleteById(this.tableName, id);
				}else{
					rendJson_(false, "此数据有相关联的子集数据，请先删除子集数据项！");
					return;
				}
			}
			rendJson_(true, "删除成功！",id);
		} catch (Exception e) {
			log.error("删除异常", e);
			rendJson_(false, "删除异常！");
		}
	}

	public void edit() {
		try {
			Long id = this.getParaToLong(0, 0L);
			if (id != 0L) {
				po = get(id);
//				Long uid=this.getCurrentUserId();
//				Long creater=po.getLong("creater");
				/*if(creater!=null&&uid!=creater&&creater.equals(uid)){
					this.renderText("<h1><font color=red>您无权限操作他人所创建的信息！</font></h1>");
					return;
				}*/
			}else{
				setAttr("now",new Date());
			}
			TokenManager.createToken(this, tokenName, tokenTout);
			 this.setAttr("po",po);
		} catch (Exception e) {
			log.error("编辑异常", e);
		}
	}

	public Model<M> get(Long id) {
		Model<M> model_;
		try {
			model_ = modelClass.newInstance();
			return model_.findById(id);//Db.findById(this.tableName, id);
		} catch (Exception e) {
		}
		return null;
	}

	public void view() {
		Long id= this.getParaToLong(0,0L);
		if(id!=null&&id!=0L)
			this.setAttr("po",get(id));
		else
			this.setAttr("po",new Record());
	}
	protected Model<M> getModel() throws Exception {
		HttpServletRequest request = this.getRequest();
		Model<M> model_ = modelClass.newInstance();
		TableInfo tableInfo = TableInfoMapping.me().getTableInfo(modelClass);
		model_.getAttrNames();
		Enumeration<String> attrNames = request.getParameterNames();
		while(attrNames.hasMoreElements()) {
			String attr = attrNames.nextElement();
			Class<?> colType = null;
			if (tableInfo.hasColumnLabel(attr.toLowerCase()))
				colType = tableInfo.getColType(attr.toLowerCase());
			if (tableInfo.hasColumnLabel(attr.toUpperCase())) {
				colType = tableInfo.getColType(attr.toUpperCase());
			}
			if (colType != null) {
				String value = request.getParameter(attr);
				model_.set(attr.toLowerCase(),
						value != null ? TypeConverter.convert(colType, value): null);
			}
		}
		return model_;
	}
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected Model getModel2(Class clz)  {
		HttpServletRequest request = this.getRequest();
		try{
			Model model_ = (Model) clz.newInstance();
			TableInfo tableInfo = TableInfoMapping.me().getTableInfo(clz);
			model_.getAttrNames();
			Enumeration<String> attrNames = request.getParameterNames();
			while(attrNames.hasMoreElements()) {
				String attr = attrNames.nextElement();
				Class<?> colType = null;
				if (tableInfo.hasColumnLabel(attr.toLowerCase()))
					colType = tableInfo.getColType(attr.toLowerCase());
				if (tableInfo.hasColumnLabel(attr.toUpperCase())) {
					colType = tableInfo.getColType(attr.toUpperCase());
				}
				if (colType != null) {
					String value = request.getParameter(attr);
					model_.set(attr.toLowerCase(),
							value != null ? TypeConverter.convert(colType, value): null);
				}
			}
			return model_;
		}catch(Exception e){
			return null;
		}
	}
	/**
	 * 通过pid字段关联
	 * @param dataList 集合
	 * @param pnode 父节点
	 * @param cname 节点名称字段
	 */
	protected void fillTree(List<Record> dataList,TreeNode pnode,String cname,Boolean canChk,List<Long>ckidList) {
		List<TreeNode> childelist = new ArrayList<TreeNode>();
		for (Record m : dataList) {
			Long pid_ = m.getLong("pid");
			if (pnode.getId() == pid_) {
				Long id = m.getLong("id");
				TreeNode nodechild = new TreeNode();
				nodechild.setId(id);
				nodechild.setText(m.getStr(cname));
				nodechild.setCanChk(canChk);
				childelist.add(nodechild);
				if(ckidList!=null&&ArrayUtils.contains(ckidList.toArray(), id))
				nodechild.setChecked(true);
				fillTree(dataList, nodechild,cname,canChk,ckidList);
			}
		}
		if (childelist.isEmpty() == false && childelist.size() > 0) {
			pnode.setChildren(childelist);
		}
	}
	/**通过Gson生成*/
	public void renderJson_(Object obj) {
		super.renderJson(new Gson().toJson(obj));
	}
}
