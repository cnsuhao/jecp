package net.loyin.ctrl.oa;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Weibo;

/**
 * 微博
 * @author loyin 龙影
 *2013-6-16
 */
@RouteBind(path = "Weibo")
public class WeiboCtrl extends AdminBaseController<Weibo> {
	public  WeiboCtrl() {
		this.tableName = Weibo.tableName;
		modelClass = Weibo.class;
	}
}