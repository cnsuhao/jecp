package net.loyin.ctrl.oa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.ArrayUtils;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Beiwanglu;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.token.TokenManager;
/**
 * 备忘录
 * @author loyin 龙影
 *2013-06-16
 */
@RouteBind(path = "beiwanglu")
public class BeiwangluCtrl extends AdminBaseController<Beiwanglu> {
	public BeiwangluCtrl() {
		this.tableName =Beiwanglu.tableName;
		modelClass = Beiwanglu.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		try{
			String endDate=this.getPara("endDate");
			if(endDate!=null&&!"".equals(endDate)){
				where.append(" and txdate <=?");
				param.add(endDate+" 23:59:59");
			}
			String startDate=this.getPara("startDate");
			if(startDate!=null&&!"".equals(startDate)){
				where.append(" and txdate >=?");
				param.add(startDate+" 00:00:00");
			}
		}catch(Exception e){}
		String title=this.getPara("title");
		if(title!=null&&!"".equals(title)){
			where.append(" and title like ?");
			param.add("%"+title+"%");
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}else{
			where.append(" order by id desc ");
		}
		
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select  g.id,g.ctime,g.txdate,g.title,g.txpl,e.FULLNAME ", "from " + this.tableName+ " g, hr_employee e where g.creater=e.id " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	/**共享的备忘录*/
	public void dataGrid2() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		try{
			String endDate=this.getPara("endDate");
			if(endDate!=null&&!"".equals(endDate)){
				where.append(" and txdate <=?");
				param.add(endDate+" 23:59:59");
			}
			String startDate=this.getPara("startDate");
			if(startDate!=null&&!"".equals(startDate)){
				where.append(" and txdate >=?");
				param.add(startDate+" 00:00:00");
			}
		}catch(Exception e){}
		String title=this.getPara("title");
		if(title!=null&&!"".equals(title)){
			where.append(" and title like ?");
			param.add("%"+title+"%");
		}
		Long uid=this.getCurrentUser().getLong("id");
		where.append(" and s.uid = ? ");
		param.add(uid);
		
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}else{
			where.append(" order by id desc ");
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select g.id,g.ctime,g.txdate,g.title,g.txpl,e.FULLNAME ", "from " + this.tableName+ " g, hr_employee e,oa_bwlshare s where s.bwlid=g.id and g.creater=e.id " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void edit(){
		Long id = this.getParaToLong(0, 0L);
		if (id != 0L) {
			po = get(id);
			List<Record>shareList=Db.find("select b.uid from oa_bwlshare b where b.bwlid=? ", id);
			List<Long> list=new ArrayList<Long>();
			if(shareList!=null&&shareList.isEmpty()==false){
				for(Record r:shareList){
					list.add(r.getLong("uid"));
				}
				this.setAttr("shareList",ArrayUtils.toString(list).replace("[", "").replace("]", "").replaceAll(" ",""));
			}
			this.setAttr("plList",Db.find("select b.*,e.fullname,e.userno,p.cname as pname from oa_bwlpinglun b,hr_employee e,sys_partment p where p.id=e.partmentid and e.id=b.uid and bwlid=? order by b.id asc",id));
		}
		this.setAttr("po",po);
	}
	/* (non-Javadoc)
	 * @see net.loyin.ctrl.AdminBaseController#save()
	 */
	public void save(){

		try {
			Model<Beiwanglu> m = this.getModel();
			Long id = m.getLong("ID");
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
			Db.update("delete from oa_bwlshare where bwlid=?",id);
			String uids_=this.getPara("uids");
			if(uids_!=null&&!"".equals(uids_)){
				String[] uids=uids_.split(",");
				for(String id_:uids){
					if(!id_.equals(uid+""))
					Db.update("insert into oa_bwlshare (bwlid,uid) values(?,?)",id,id_);
				}
			}
			rendJson_(true, "保存成功！", id,new Random().nextLong());
		} catch (Exception e) {
			log.error("保存异常", e);
			rendJson_(false, "保存异常！");
		}
	
	}
	public void view(){
		Long id = this.getParaToLong(0, 0L);
		if (id != 0L) {
			po = get(id);
			this.setAttr("shareList",Db.find("select e.fullname,e.userno,p.cname as pname from oa_bwlshare b,hr_employee e,sys_partment p where p.id=e.partmentid and e.id=b.uid and b.bwlid=? ", id));
			this.setAttr("plList",Db.find("select b.*,e.fullname,e.userno,p.cname as pname from oa_bwlpinglun b,hr_employee e,sys_partment p where p.id=e.partmentid and e.id=b.uid and bwlid=? order by b.id asc",id));
		}
		this.setAttr("po",po);
	}
	public void del(){
		try {
			Long id = this.getParaToLong(0);
			if (id == null||id==0L){
				String ids = this.getPara("ids");
				if (ids != null && !"".equals(ids)) {
					Db.update("delete from oa_bwlshare where bwlid in("+ids+") ");
					Db.update("delete from oa_bwlpinglun where bwlid in("+ids+") ");
					Db.update("delete from " + this.tableName + " where id in ("+ ids+ ")");
				} else {
					id = this.getParaToLong("ID");
				}
			}else{
				po = get(id);
				Record user= this.getCurrentUser();
				Long creater=po.getLong("creater");
				if(creater!=null&&user.getLong("id")!=creater){
					rendJson_(false, "您无权限操作他人所创建的信息！");
					return;
				}
				Db.deleteById(this.tableName, id);
				Db.update("delete from oa_bwlshare where bwlid =? ",id);
			}
			rendJson_(true, "删除成功！",id);
		} catch (Exception e) {
			log.error("删除异常", e);
			rendJson_(false, "删除异常！");
		}
	}
	/**评论*/
	public void pl(){
		try{
			Long id = this.getParaToLong(0);
			Record u=this.getCurrentUser();
			Db.update("insert into oa_bwlpinglun (bwlid,uid,pltime,context) values(?,?,?,?)",id,u.getLong("id"),new Date(),this.getPara("context"));
			rendJson_(true, "评论成功！");
		} catch (Exception e) {
			log.error("评论异常", e);
			rendJson_(false, "评论失败！");
		}
	}
}