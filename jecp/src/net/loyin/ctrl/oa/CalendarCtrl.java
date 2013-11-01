package net.loyin.ctrl.oa;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.Calendar;
/**
 * 日程安排
 * @author 刘声凤
 *2013年8月12日
 */
@RouteBind(path="calendar")
public class CalendarCtrl extends AdminBaseController<Calendar> {
	public CalendarCtrl(){
		modelClass=Calendar.class;
		tableName=Calendar.tableName;
	}
	public void index(){
		//获取传递的日期控件展示方式 日 周 月
		
		//查询当前的日程安排列表
	}
	
}
