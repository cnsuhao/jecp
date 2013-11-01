package net.loyin.ctrl.oa;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Gonggao;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * 公告
 * @author loyin 龙影
 *2013-06-16
 */
@RouteBind(path = "Gonggao")
public class GonggaoCtrl extends AdminBaseController<Gonggao> {
	public GonggaoCtrl() {
		this.tableName = Gonggao.tableName;
		modelClass = Gonggao.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		Date now=new Date();
		StringBuffer where = new StringBuffer();
		param.add(now);
		param.add(now);
		where.append(" and ((case when startdate is not null then startdate<=? else 1=1 end) and (case when enddate is not null then enddate>=? else 1=1 end))");
		/** 添加查询字段条件*/
			String endDate=this.getPara("endDate");
			if(endDate!=null&&!"".equals(endDate)){
				where.append(" and fbdate <=?");
				param.add(endDate+" 23:59:59");
			}
			String startDate=this.getPara("startDate");
			if(startDate!=null&&!"".equals(startDate)){
				where.append(" and fbdate >=?");
				param.add(startDate+" 00:00:00");
			}
		String title=this.getPara("title");
		if(title!=null&&!"".equals(title)){
			where.append(" and title like ?");
			param.add("%"+title+"%");
		}
		String gglid=this.getPara("gglid");
		if(gglid!=null&&!"".equals(gglid)){
			where.append(" and gglid = ?");
			param.add(gglid);
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}else{
			where.append(" order by fbdate desc ");
		}
		
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select g.id,g.title,g.fbdate,g.startdate,g.enddate,g.ctime,g.showcont,gl.name glname,e.FULLNAME ", "from " + this.tableName+ " g, hr_employee e ,oa_gglan gl where g.gglid=gl.id and g.creater=e.id and fbdate is not null " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void fabu(){}
	public void pulish(){
		String ids = this.getPara("ids");
		Long id=this.getParaToLong(0);
		try{
			if(ids!=null&&!"".equals(ids))
				Db.update("update "+tableName+" set fbdate=? where id in("+ids+")",new Date());
			else if(id!=null){
				Db.update("update "+tableName+" set fbdate=? where id =?",id,new Date());
			}
			this.rendJson_(true, "发布公告成功！");
		}catch(Exception e){
			log.error("发布公告错误",e);
			this.rendJson_(false, "发布公告异常！请检查。");
		}
	}
	/**发布公告维护列表*/
	public void faBuDataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		Record uu= this.getCurrentUser();
		Long uid=uu.getLong("id");
		param.add(uid);
		/** 添加查询字段条件*/
			String endDate=this.getPara("endDate");
			if(endDate!=null&&!"".equals(endDate)){
				where.append(" and fbdate <=?");
				param.add(endDate+" 23:59:59");
			}
			String startDate=this.getPara("startDate");
			if(startDate!=null&&!"".equals(startDate)){
				where.append(" and fbdate >=?");
				param.add(startDate+" 00:00:00");
			}
		String title=this.getPara("title");
		if(title!=null&&!"".equals(title)){
			where.append(" and title like ?");
			param.add("%"+title+"%");
		}
		String gglid=this.getPara("gglid");
		if(gglid!=null&&!"".equals(gglid)){
			where.append(" and gglid = ?");
			param.add(gglid);
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select g.id,g.title,g.fbdate,g.startdate,g.enddate,g.ctime,g.showcont,gl.name glname,e.FULLNAME,(case when fbdate is null then 0 else 1 end) status ", "from " + this.tableName+ " g, hr_employee e,oa_gglan gl where g.gglid=gl.id and g.creater=e.id and g.creater=?  " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void view(){
		Long id= this.getParaToLong(0,0L);
		if(id!=null&&id!=0L){
			Model<Gonggao> r=get(id);
			Timestamp fbdate=r.getTimestamp("fbdate");
			if(fbdate!=null){
				try{
				Db.update("insert into oa_ggreadlist (uid,ggid,rdate) values(?,?,?)",this.getCurrentUserId(),id,new Date());
				Db.update("update "+tableName+" g set g.showcont=(select count(1) from oa_ggreadlist gl where gl.ggid=g.id) where g.id=?",id);
				}catch(Exception e){}
			}
			this.setAttr("po",r);
		}else{
			this.setAttr("po",new Record());
		}
	}
	/**在桌面显示*/
	public void desktop(){
		List<Object> param = new ArrayList<Object>();
		Date now=new Date();
		StringBuffer where = new StringBuffer();
		param.add(now);
		param.add(now);
		where.append(" and ((case when startdate is not null then startdate<=? else 1=1 end) and (case when enddate is not null then enddate>=? else 1=1 end))");
		/** 添加查询字段条件*/
		where.append(" order by fbdate desc ");
		List<Record> list=Db.find("select g.id,g.title,g.fbdate,g.startdate,g.enddate,g.ctime,g.showcont,gl.name glname,e.FULLNAME,e.userno from " + this.tableName+ " g, hr_employee e ,oa_gglan gl where g.gglid=gl.id and g.creater=e.id and fbdate is not null " + where.toString()+" limit 10", param.toArray());
		this.setAttr("list",list);
	}
}