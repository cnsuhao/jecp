package net.loyin.ctrl.crm;

import java.util.ArrayList;
import java.util.List;
import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.crm.Customer;
import net.loyin.pageModel.DataGrid;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@RouteBind(path = "customer")
public class CustomerCtrl extends AdminBaseController<Customer> {
	public CustomerCtrl() {
		this.tableName = Customer.tableName;
		modelClass = Customer.class;
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
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select t.ID,t.CNAME,t.JCNAME,t.CTYPE,t.GZDJ,t.PROVINCE,t.CITY,t.WLGM,t.SXZQ,t.XYPJ,t.KHFWLX, 1 ", "from " + this.tableName+ " t where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
}