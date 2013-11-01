package net.loyin.ctrl.oa;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Kqset;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.token.TokenManager;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@RouteBind(path = "kqset")
public class KqsetCtrl extends AdminBaseController<Kqset> {
	public KqsetCtrl() {
		this.tableName = Kqset.tableName;
		modelClass = Kqset.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
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
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select t.* ", "from " + this.tableName+ " t where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void save(){

		try {
			Model<Kqset> m = this.getModel();
			Long id = m.getLong("ID");
			Long tokenl=this.getParaToLong("token");
			if(tokenl!=null){
				if(!TokenManager.validateToken(this, tokenName)){
					this.rendJson_(false, "会话令牌错误！",id,new Random().nextLong());
					return;
				}
			}
			if(m.getInt("z1")==null||m.getInt("z1")==0){
				m.set("z1",0);
			}
			if(m.getInt("z2")==null||m.getInt("z2")==0){
				m.set("z2",0);
			}
			if(m.getInt("z3")==null||m.getInt("z3")==0){
				m.set("z3",0);
			}
			if(m.getInt("z4")==null||m.getInt("z4")==0){
				m.set("z4",0);
			}
			if(m.getInt("z5")==null||m.getInt("z5")==0){
				m.set("z5",0);
			}
			if(m.getInt("z6")==null||m.getInt("z6")==0){
				m.set("z6",0);
			}
			if(m.getInt("z7")==null||m.getInt("z7")==0){
				m.set("z7",0);
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
}