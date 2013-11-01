package net.loyin.ctrl.oa;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.EmailBox;
import net.loyin.model.oa.EmailSet;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * 邮箱
 * 
 * @author 刘声凤 2013年8月10日
 */
@RouteBind(path = "mailBox")
public class MailBoxCtrl extends AdminBaseController<EmailBox> {
	public MailBoxCtrl(){
		this.tableName=EmailBox.tableName;
		this.modelClass=EmailBox.class;
	}
	public void index(){
		String para=this.getPara();
		if(para!=null&&!"".equals(para)){
			if(isSet()){
				this.redirect("set");
				return;
			}
			try{
				//收件箱
				if("recvBox".equals(para))
				EmailBox.dao.recvMail(getCurrentUserId());
				}catch(Exception e){ }
			this.renderHTML(para);
		}
	}
	/** 邮箱设置 */
	public void set() {
		Long uid=this.getCurrentUserId();
		EmailSet emailSet=EmailSet.dao.qryByUidNoCache(uid);
		if(emailSet==null){
			emailSet=new EmailSet();
			emailSet.set("uid", uid);
		}
		this.setAttr("po",emailSet);
	}
	/** 邮箱设置 */
	public void set1() {
		Long uid=this.getCurrentUserId();
		EmailSet emailSet=EmailSet.dao.qryByCompanyEmail();
		if(emailSet==null){
			emailSet=new EmailSet();
			emailSet.set("uid", uid);
		}
		this.setAttr("po",emailSet);
	}
	/**验证邮箱设置*/
	public void valid(){
		
	}
	/**保存设置*/
	@SuppressWarnings("unchecked")
	public void saveSet() {
		try {
			Model<EmailSet> m = this.getModel2(EmailSet.class);
			if(m.getLong("id")==null)
				m.save();
			else
				m.update();
			rendJson_(true, "保存成功！", m.getLong("ID"),new Random().nextLong());
		} catch (Exception e) {
			log.error("保存异常", e);
			rendJson_(false, "保存异常！");
		}
	}
	public void delSet(){
		Long uid=this.getCurrentUserId();
		Db.update("delete from oa_emailset where uid=?",uid);
		rendJson_(true, "删除邮箱设置成功！");
	}
	public void stopSet(){
		Long uid=this.getCurrentUserId();
		Db.update("update oa_emailset set status=0 where uid=?",uid);
		rendJson_(true, "停用邮箱设置成功！");
	}
	public void alivSet(){
		Long uid=this.getCurrentUserId();
		Db.update("update oa_emailset set status=1 where uid=?",uid);
		rendJson_(true, "启用邮箱设置成功！");
	}
	/**是否设置了*/
	private boolean isSet(){
		return(EmailSet.dao.qryByUid(this.getCurrentUserId())==null);
	}
	public void dg(){
		Integer box=this.getParaToInt(0);
		Long uid=this.getCurrentUserId();
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		where.append(" and uid=? and box=? ");
		param.add(uid);
		param.add(box);
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		String qryField=this.getPara("qryField");//查询字段 以逗号分隔
		if(qryField!=null&&!"".equals(qryField)){
			String[] k=qryField.split(",");
			for(String q:k){
				Object t=this.getPara(q);
				if(t!=null&&!"".equals(t)){
					where.append(" and ");
					where.append(q);
					where.append(" ? ");
					param.add(t);
				}
			}
		}
		String title=this.getPara("title");
		if(title!=null&&!"".equals(title)){
			where.append(" and title like");
			param.add("%"+title+"%");
		}
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select id,title,mailfrom,isnew,MAILDATE,HASATTACH,REPLYSIGN ", "from " + this.tableName+ " where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
}
