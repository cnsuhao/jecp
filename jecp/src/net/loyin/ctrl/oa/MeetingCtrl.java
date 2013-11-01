package net.loyin.ctrl.oa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.apache.commons.lang.ArrayUtils;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.token.TokenManager;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Beiwanglu;
import net.loyin.model.oa.Meeting;
import net.loyin.pageModel.DataGrid;

/**
 * 会议
 * 
 * @author 刘声凤 2013年8月9日
 */
@RouteBind(path = "meeting")
public class MeetingCtrl extends AdminBaseController<Meeting> {
	public MeetingCtrl() {
		this.tableName = Meeting.tableName;
		this.modelClass = Meeting.class;
	}
	/**我发布的会议*/
	public void dataGrid2() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		Long uid=this.getCurrentUserId();
		param.add(uid);
		where.append(" and g.creater=? ");
			String endDate=this.getPara("endDate");
			if(endDate!=null&&!"".equals(endDate)){
				where.append(" and fbtime <=?");
				param.add(endDate+" 23:59:59");
			}
			String startDate=this.getPara("startDate");
			if(startDate!=null&&!"".equals(startDate)){
				where.append(" and fbtime >=?");
				param.add(startDate+" 00:00:00");
			}
			Integer stat=this.getParaToInt("stat");
			if(stat!=null){
				where.append(" and stat=?");
				param.add(stat);
			}
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
		
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select  g.id,g.ctime,g.fbtime,g.title,g.starttime,g.endtime,g.stat,e1.fullname guidangren,g.gdtime,e.FULLNAME ", "from " + this.tableName+ " g join hr_employee e left join hr_employee e1 on e1.id=g.GUIDANGREN   where e.id=g.creater " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	/**我参与的会议*/
	public void dataGrid(){
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		Long uid=this.getCurrentUserId();
		param.add(uid);
		where.append(" and mj.uid=? ");
		/** 添加查询字段条件*/
		String endDate=this.getPara("endDate");
		if(endDate!=null&&!"".equals(endDate)){
			where.append(" and fbtime <=?");
			param.add(endDate+" 23:59:59");
		}
		String startDate=this.getPara("startDate");
		if(startDate!=null&&!"".equals(startDate)){
			where.append(" and fbtime >=?");
			param.add(startDate+" 00:00:00");
		}
		Integer stat=this.getParaToInt("stat");
		if(stat!=null){
			where.append(" and stat=?");
			param.add(stat);
		}
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
	
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select  g.id,g.ctime,g.fbtime,g.title,g.starttime,g.endtime,g.stat,e1.fullname guidangren,g.gdtime,e.FULLNAME ", "from " + this.tableName+ " g join oa_meetingjoin mj on mj.mid=g.id join hr_employee e left join hr_employee e1 on e1.id=g.GUIDANGREN   where e.id=g.creater  " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void edit(){
		Long id = this.getParaToLong(0, 0L);
		if (id != 0L) {
			po = get(id);
			List<Record>shareList=Db.find("select b.uid from oa_meetingjoin b where b.mid=? ", id);
			List<Long> list=new ArrayList<Long>();
			if(shareList!=null&&shareList.isEmpty()==false){
				for(Record r:shareList){
					list.add(r.getLong("uid"));
				}
				this.setAttr("shareList",ArrayUtils.toString(list).replace("[", "").replace("]", "").replaceAll(" ",""));
			}
		}
		this.setAttr("po",po);
	}
	public void save(){
		try {
			Model<Meeting> m = this.getModel();
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
			Db.update("delete from oa_meetingjoin where mid=?",id);
			String uids_=this.getPara("uids");
			if(uids_!=null&&!"".equals(uids_)){
				String[] uids=uids_.split(",");
				for(String id_:uids){
					Db.update("insert into oa_meetingjoin (mid,uid) values(?,?)",id,id_);
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
			this.setAttr("shareList",Meeting.dao.shareList(id));
		}
		this.setAttr("po",po);
	}
	public void publish(){
		try {
				String ids = this.getPara("ids");
				if (ids != null && !"".equals(ids)) {
					Meeting.dao.publish(ids,this.getCurrentUserId());
				}else{
					rendJson_(false, "未选择需要发布的会议！");
				}
			rendJson_(true, "发布会议成功！");
		} catch (Exception e) {
			log.error("发布会议异常", e);
			rendJson_(false, "发布会议异常！");
		}
	}
}
