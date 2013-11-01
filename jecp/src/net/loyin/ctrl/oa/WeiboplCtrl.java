package net.loyin.ctrl.oa;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Weibopl;

/**
 * 微博评论
 * @author loyin 龙影
 *2013-6-16
 */
@RouteBind(path = "Weibopl")
public class WeiboplCtrl extends AdminBaseController<Weibopl> {
	public WeiboplCtrl() {
		this.tableName =Weibopl.tableName;
		modelClass = Weibopl.class;
	}
}