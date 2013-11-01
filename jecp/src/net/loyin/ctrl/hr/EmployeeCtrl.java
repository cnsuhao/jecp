package net.loyin.ctrl.hr;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.hr.Employee;
import net.loyin.pageModel.DataGrid;
import net.loyin.pageModel.TreeNode;
import net.loyin.util.safe.MD5;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
/**
 * 员工管理
 * @author loyin
 *2013-3-31 上午11:15:04
 */
@RouteBind(path="employee")
public class EmployeeCtrl extends AdminBaseController<Employee> {
	public EmployeeCtrl(){
		this.tableName=Employee.tableName;
		modelClass=Employee.class;
	}
	@Override
	public void dataGrid() {
		List<Object> param=new ArrayList<Object>();
		StringBuffer where=new StringBuffer();
		String userno=this.getPara("userno");
		if(userno!=null&&!"".equals(userno.trim())){
			where.append(" and userno = ?");
			param.add(userno);
		}
		String fullname=this.getPara("fullname");
		if(fullname!=null&&!"".equals(fullname.trim())){
			where.append(" and fullname = ?");
			param.add(fullname);
		}
		String role=this.getPara("role");
		if(role!=null&&!"".equals(role)&&!"0".equals(role)){
			where.append(" and e.id in (select userid from sys_userrole where roleid in ("+(role+"EE").replaceAll(",EE","").replaceAll("EE","")+")) ");
		}
		String partid=this.getPara("partid");
		if(partid!=null&&!"".equals(partid.trim())&&!"0".equals(partid.trim())){
			where.append(" and (e.partmentid = ? or p.id=? or p.pid=?)");
			param.add(partid);
			param.add(partid);
			param.add(partid);
		}
		String postid=this.getPara("postid");
		if(postid!=null&&!"".equals(postid.trim())&&!"0".equals(postid.trim())){
			where.append(" and e.postid = ?");
			param.add(postid);
		}
		String stat=this.getPara("stat");
		if(stat!=null&&!"".equals(stat.trim())){
			where.append(" and e.stat = ?");
			param.add(stat);
		}
		String sortName=this.getPara("sort");
		String sortOrder=this.getPara("order","desc");
		if(sortName!=null){
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p=Db.paginate(this.getParaToInt("page",1),this.getParaToInt("rows",20),"select e.id,e.userno,e.fullname,e.gender,e.phone,e.telphone,e.stat,e.worktime,p.cname partname,po.cname postname ","from "+this.tableName +" e ,sys_partment p,sys_post po where e.postid=po.id and p.id=e.partmentid " +where.toString(),param.toArray());
		DataGrid dg=new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	@Override
	public void edit(){
		String id=this.getPara(0);
		StringBuffer roles=new StringBuffer();
		List<Record> rolelist=Db.find("select roleid from sys_userrole where userid=?",id);
		if(rolelist!=null&&rolelist.isEmpty()==false){
			for(Record r:rolelist){
				roles.append(r.getLong("roleid"));
				roles.append(",");
			}
			roles.append("EE");
		}
		this.setAttr("roles",roles.toString().replace(",EE","").replace("EE",""));
		super.edit();
	}
	@Override
	public void save(){
		try {
			Record user=this.getCurrentUser();
			Employee m = (Employee)super.getModel();
			Long id = m.getLong("ID");
			if (id!=null &&id!=0L) {
				m.set("utime",new Date());//修改时间
				m.set("updater",user.getLong("id"));//修改人
				m.update();
			} else {
				m.set("creater",user.getLong("id"));//创建人
				m.set("ctime",new Date());//创建时间
				m.save();
			}
			id = m.getLong("ID");
			String[] roles = this.getParaValues("roles");
				if (roles != null && !"".equals(roles)) {
					if (roles.length > 0) {
						Object[][] paras = new Object[roles.length][2];
						int i = 0;
						for (String id_ : roles) {
							paras[i][0] = id_;
							paras[i][1] = id;
							i++;
						}
						Db.update("delete from sys_userrole where userid=? ",id);
						Db.batch("insert into sys_userrole(roleid,userid) values(?,?)",paras, 10);
					}
				}
				CacheKit.remove("oneday","login_user_id_"+id);
			rendJson_(true, "保存成功！", id);
		} catch (Exception e) {
			log.error("保存异常", e);
			rendJson_(false, "保存异常！");
		}
	}
	public void savePwd(){
		String id=this.getPara("id");
		String pwd=this.getPara("pwd");
		try{
			if(id!=null&&pwd!=null){
				Db.update("update hr_employee set pwd=? where id=?",MD5.getMD5ofStr(pwd),id);
				rendJson_(true, "设置密码成功！", id);
			}else{
				rendJson_(false, "未提交完整数据！");
			}
		} catch (Exception e) {
			log.error("保存异常", e);
			rendJson_(false, "保存异常！");
		}
	}
	public void combobox(){
		
	}
	/**选择树*/
	public void combotree() {
		String ck=this.getPara("ck");//需要选中的
		List<Long> idlist=null;
		if(ck!=null&&!"".equals(ck)){
			String[] ckstr=ck.replaceAll(" ","").split(",");
			idlist=new ArrayList<Long>();
			for(String c:ckstr){
				if(!"".equals(c)){
					idlist.add(Long.parseLong(c));
				}
			}
		}
		List<Record> dataList = Db.find("(select id,cname,pid from sys_partment) union (select e.id,concat(e.fullname,'(',e.userno,')') cname,e.partmentid pid from "+this.tableName+" e where e.stat !=0) ");
		List<TreeNode> list = new ArrayList<TreeNode>();
		TreeNode rootNode = new TreeNode();
		rootNode.setId(0L);
		rootNode.setText("");
		rootNode.setIconCls("icon-home");
		rootNode.setCanChk(false);
		fillTree(dataList, rootNode,"cname",false,idlist);
		list.add(rootNode);
		this.renderJson_(list);
	}
}
