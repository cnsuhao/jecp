package net.loyin.ctrl.fa;

import java.util.ArrayList;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.fa.TaxRate;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * 费率设置
 * @author
 */
@RouteBind(path = "taxRate")
public class TaxRateCtrl extends AdminBaseController<TaxRate> {
	public TaxRateCtrl() {
		this.tableName = TaxRate.tableName;
		modelClass = TaxRate.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		String startDate=this.getPara("startDate");
		if(startDate!=null&&!"".equals(startDate)){
			where.append(" and startdate >=?");
			param.add(startDate);
		}
		String endDate=this.getPara("endDate");
		if(endDate!=null&&!"".equals(endDate)){
			where.append(" and startdate <=?");
			param.add(endDate);
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
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select g.* ", "from " + this.tableName+ " g where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
}
