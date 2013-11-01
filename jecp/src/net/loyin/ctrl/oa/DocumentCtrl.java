package net.loyin.ctrl.oa;

import java.util.ArrayList;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Document;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

/**
 * 文档管理
 * 
 * @author loyin 2013-4-4 下午12:06:55
 */
@RouteBind(path = "document")
public class DocumentCtrl extends AdminBaseController<Document> {
	public DocumentCtrl() {
		this.tableName = Document.tableName;
		modelClass = Document.class;
	}

	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		String title = this.getPara("title");
		if (title != null && !"".equals(title.trim())) {
			where.append(" and title = ?");
			param.add(title);
		}
		String DOCCATEID = this.getPara("DOCCATEID");
		if (DOCCATEID != null && !"".equals(DOCCATEID.trim())
				&& !"0".equals(DOCCATEID.trim())) {
			where.append(" and DOCCATEID = ?");
			param.add(DOCCATEID);
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db
				.paginate(
						this.getParaToInt("page", 1),
						this.getParaToInt("rows", 20),
						"select a.*,ac.CNAME ACTCATE,e.fullname EMP ",
						"from " + this.tableName
								+ " a,hr_employee e,oa_doccate ac where e.id=a.creater and ac.id=a.docCATEID "
								+ where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
}
