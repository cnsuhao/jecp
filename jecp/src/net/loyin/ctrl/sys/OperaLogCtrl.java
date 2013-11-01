package net.loyin.ctrl.sys;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.OperaLog;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * 登录日志
 * @author 刘声凤
 *2013年8月8日
 */
@RouteBind(path="operaLog")
public class OperaLogCtrl extends AdminBaseController<OperaLog> {
	public OperaLogCtrl(){
		this.modelClass=OperaLog.class;
		this.tableName=OperaLog.tableName;
	}
	@Override
	public void dataGrid() {

		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		try{
			String endDate=this.getPara("endDate");
			if(endDate!=null&&!"".equals(endDate)){
				where.append(" and g.ctime <=?");
				param.add(endDate+" 23:59:59");
			}
			String startDate=this.getPara("startDate");
			if(startDate!=null&&!"".equals(startDate)){
				where.append(" and g.ctime >=?");
				param.add(startDate+" 00:00:00");
			}
		}catch(Exception e){}
		String fullname=this.getPara("fullname");
		if(fullname!=null&&!"".equals(fullname)){
			where.append(" and fullname =?");
			param.add(fullname);
		}
		String userno=this.getPara("userno");
		if(userno!=null&&!"".equals(userno)){
			where.append(" and userno =?");
			param.add(userno);
		}
		/**模块*/
		String modelName=this.getPara("modelName");
		if(modelName!=null&&!"".equals(modelName)){
			where.append(" and modelName like ? ");
			param.add("%"+modelName+"%");
		}
		/**功能*/
		String func=this.getPara("func");
		if(func!=null&&!"".equals(func)){
			where.append(" and func like ? ");
			param.add("%"+func+"%");
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
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select g.*,e.userno,e.fullname,d.cname ", "from " + this.tableName+ " g,hr_employee e,sys_partment d where e.id=g.uid and d.id=e.partmentid " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void del(){
		try{
			Date now=new Date();
			Calendar calendar=Calendar.getInstance();
			calendar.setTime(now);
			calendar.add(Calendar.MONTH,-3);//3个月前
			String time=(new SimpleDateFormat("yyyy-MM-dd")).format(calendar.getTime())+" 23:59:59";
			Db.update("delete from "+tableName+" where ctime<=?",time);
			rendJson_(true, "删除成功！");
		} catch (Exception e) {
			log.error("删除异常", e);
			rendJson_(false, "删除异常！");
		}
	}
}
