package net.loyin.ctrl.sys;

import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Area;
/**
 * 省份地市区域
 * @author loyin
 *2013-3-31 上午11:14:41
 */
@RouteBind(path="area")
public class AreaCtrl extends AdminBaseController<Area> {
	public AreaCtrl(){
		this.tableName=Area.tableName;
		modelClass=Area.class;
	}
	public void combobox(){
		Long pid=this.getParaToLong(0);
		List<Record> list=Db.find("select * from "+this.tableName+" where pid=?",pid);
		this.renderJson(list);
	}
}
