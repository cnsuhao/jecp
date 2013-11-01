package net.loyin.ctrl.sys;

import com.jfinal.plugin.ehcache.CacheKit;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Menu;

/**
 * 菜单
 * 
 * @author loyin 2013-3-31 上午11:20:05
 */
@RouteBind(path = "menu")
public class MenuCtrl extends AdminBaseController<Menu> {
	public MenuCtrl() {
		this.tableName = Menu.tableName;
		modelClass = Menu.class;
	}

	@Override
	public void save() {
		super.save();
		CacheKit.removeAll("oneday");
	}

	@Override
	public void del() {
		super.del();
		CacheKit.removeAll("oneday");
	}
	
}
