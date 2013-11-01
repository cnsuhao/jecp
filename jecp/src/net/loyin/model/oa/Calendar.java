package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 日程安排
 * @author 刘声凤
 *2013年8月12日
 */
@TableBind(name="oa_Calendar")
public class Calendar extends Model<Calendar> {
	private static final long serialVersionUID = 8721928416565055455L;
	public static Calendar da=new Calendar();
	public static String tableName="oa_Calendar";
}
