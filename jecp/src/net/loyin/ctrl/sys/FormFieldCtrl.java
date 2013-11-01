package net.loyin.ctrl.sys;

import java.util.ArrayList;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.FormField;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * 表单字段
 * @author loyin 龙影
 *2013-06-23 19:43:20
 */
@RouteBind(path = "formField")
public class FormFieldCtrl extends AdminBaseController<FormField> {
	public FormFieldCtrl() {
		this.tableName = FormField.tableName;
		modelClass = FormField.class;
	}
	public void index(){
		this.setAttr("tableId", this.getParaToLong(0));
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		where.append(" order by sortnum asc ");//排序号 升序 
		if (sortName != null) {
			where.append(", ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Long tableId=this.getParaToLong(0);
		this.setAttr("tableId", tableId);
		param.add(tableId);
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select * ", "from " + this.tableName+ " where fmid=? " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
}