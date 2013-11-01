package net.loyin.ctrl.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Partment;
import net.loyin.pageModel.DataGrid;
/**
 * 组织机构设置
 * @author loyin
 *2013-3-31 上午11:14:50
 */
@RouteBind(path="partment")
public class PartmentCtrl extends AdminBaseController<Partment> {
	public PartmentCtrl(){
		this.tableName=Partment.tableName;
		modelClass=Partment.class;
	}
	/**树形表格*/
	public void treeDataGrid() {
		DataGrid dg=new DataGrid();
		List<Record> list= Db.find("select a.*,p.cname pcname,concat(e.fullname,'(',e.userno,')')FZRNAME from "+this.tableName+" a left join "+this.tableName+" p on p.id=a.pid  left join hr_employee e on e.id=a.fzr ");
		List<Map<String,Object>> list1=new ArrayList<Map<String,Object>>();
		for(Record r:list){
			Map<String,Object> d=new HashMap<String,Object>();
			for(String col:r.getcolumnNames()){
				d.put(col,r.get(col));
			}
			Long pid=r.getLong("pid");
			if(pid!=null&&pid!=0)
			d.put("_parentId",pid);//tree datagrid 需要使用此字段作为父节点关联
			list1.add(d);
		}
		dg.setRows(list1);
		dg.setTotal(list1.size());
		this.renderJson(dg);
	}
}
