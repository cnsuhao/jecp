package net.loyin.ctrl.biz;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.biz.Contact;
import net.loyin.pageModel.DataGrid;
/**
 *通信录联系人
 * @author 刘声凤
 *2013年8月14日
 */
@RouteBind(path="contact")
public class ContactCtrl extends AdminBaseController<Contact> {
	public ContactCtrl() {
		this.tableName = Contact.tableName;
		modelClass = Contact.class;
	}

	@Override
	public void dataGrid() {
		Integer tp=this.getParaToInt(0);
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
					where.append(q);
					where.append(" =? ");
					param.add(t);
				}
			}
		}
		if(tp==1){
			where.append(" and vid is null and cid is null and creater=?");
			param.add(this.getCurrentUserId());
		}
		if(tp==2){
			where.append(" and vid is null and cid is null ");
		}
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select t.* "+(tp==3?",c.cname PNAME":""), "from " + this.tableName+ " t "+(tp==3?", biz_vender c where c.id=t.vid and ":"where")+" 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	
}
