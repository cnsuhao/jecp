package net.loyin.ctrl.oa;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Kaoqing;
import net.loyin.model.oa.Kqset;
import net.loyin.pageModel.DataGrid;
import net.loyin.util.Lunar;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 */
@RouteBind(path = "kaoqing")
public class KaoqingCtrl extends AdminBaseController<Kaoqing> {
	public KaoqingCtrl() {
		this.tableName = Kaoqing.tableName;
		modelClass = Kaoqing.class;
	}
	public void dataGrid() {
		Long uid=this.getCurrentUserId();
		String now=dateFormat.format(new Date());
		Kqset kqset=Kqset.dao.qryByDate(now);
		setAttr("kqset",kqset);
		int i=this.getParaToInt(0,0);
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		if(i==0){
			where.append(" and t.uid=? ");
			param.add(uid);
		}
		/** 添加查询字段条件*/
		String qryField=this.getPara("qryField");//查询字段 以逗号分隔
		if(qryField!=null&&!"".equals(qryField)){
			String[] k=qryField.split(",");
			for(String q:k){
				Object t=this.getPara(q);
				if(t!=null&&!"".equals(t)){
					where.append(" and ");
					where.append(q);
					where.append(" =? ");
					param.add(t);
				}
			}
		}
		String KQRQ_start=this.getPara("KQRQ_start");
		if(KQRQ_start!=null&&!"".equals(KQRQ_start)){
			where.append(" and t.KQRQ >=?");
			param.add(KQRQ_start);
		}
		String KQRQ_end=this.getPara("KQRQ_end");
		if(KQRQ_start!=null&&!"".equals(KQRQ_start)){
			where.append(" and t.KQRQ <=?");
			param.add(KQRQ_end);
		}
		Long uid_=this.getParaToLong("UID");
		if(uid_!=null&&uid_!=0){
			where.append(" and (t.uid =? or e1.partmentid=?)");
			param.add(uid_);
			param.add(uid_);
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select t.ID,t.UID,QDTIME,QTTIME,QTIP,QDIP,LEGAL,e1.FULLNAME,p.cname PARTNAME,KQRQ,QDTIME1,QTTIME1,e2.fullname as BQFULLNAME,MONTH,DAY,YEAR ", "from " + this.tableName+ " t  join hr_employee e1 on e1.id=t.uid left join sys_partment p on e1.partmentid=p.id  left join hr_employee e2 on t.BQUID=e2.id where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void desktop(){
		Long uid=this.getCurrentUserId();
		Date now=new Date();
		Calendar today = Calendar.getInstance();
		today.setTime(now);
		String nowstr=dateFormat.format(now);
		Kqset kqset=Kqset.dao.qryByDate(nowstr);
		this.setAttr("kqset", kqset);
		Kaoqing kq=Kaoqing.dao.qryByUidDate(uid, nowstr);
		this.setAttr("kaoqing", kq);
		Lunar lunar = new Lunar(today);
		this.setAttr("lunarDate",lunar.cyclical() +"&nbsp;"+lunar.animalsYear()+ "年&nbsp;"+lunar.toString());
	}
	/**签到*/
	public void qianDao(){
		Long uid=this.getCurrentUserId();
		Date now=new Date();
		String ip=this.getRequest().getRemoteAddr();
		Kaoqing kq=Kaoqing.dao;
		Long kqsetid=this.getParaToLong(0);
		try{
			Map<String,Object>attrs=new HashMap<String,Object>();
			attrs.put("uid",uid);
			attrs.put("kqsetid",kqsetid);
			attrs.put("qdip",ip);
			attrs.put("qdtime",timeFormat.format(now));
			attrs.put("kqrq",dateFormat.format(now));
			attrs.put("year",yearFormat.format(now));
			attrs.put("month",monthFormat.format(now));
			attrs.put("day",dayFormat.format(now));
			attrs.put("beizhu",this.getPara("remark"));
			kq.setAttrs(attrs);
			kq.save();
			this.rendJson_(true, "签到成功，签到时间："+timeFormat.format(now));
		}catch(Exception e){
			log.error("签到异常",e);
			this.rendJson_(false, "签到异常");
		}
	}
	/**签退*/
	@SuppressWarnings("null")
	public void qianTui(){
		Long uid=this.getCurrentUserId();
		try{
			String qttime=timeFormat.format(new Date());
			Kaoqing kq=Kaoqing.dao.qryByUid(uid);
			if(kq==null){
				kq=Kaoqing.dao;
				Date now=new Date();
				String ip=this.getRequest().getRemoteAddr();
				Long kqsetid=this.getParaToLong(0);
				try{
					Map<String,Object>attrs=new HashMap<String,Object>();
					attrs.put("uid",uid);
					attrs.put("kqsetid",kqsetid);
					attrs.put("qtip",ip);
					attrs.put("qttime",timeFormat.format(now));
					attrs.put("kqrq",dateFormat.format(now));
					attrs.put("year",yearFormat.format(now));
					attrs.put("month",monthFormat.format(now));
					attrs.put("day",dayFormat.format(now));
					attrs.put("beizhu",this.getPara("remark"));
					kq.setAttrs(attrs);
					kq.save();
				}catch(Exception e){
					log.error("签退新增信息异常",e);
				}
			}
			
			String remark=getPara("remark");
			kq.qianTui(kq.getLong("id"), qttime, this.getRequest().getRemoteAddr(),remark);
			this.rendJson_(true, "签退成功，签退时间："+qttime);
		}catch(Exception e){
			log.error("签退异常",e);
			this.rendJson_(false, "签退异常");
		}
	}
}