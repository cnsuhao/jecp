package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*Holiday
*/
@TableBind(name="oa_holiday")
public class Holiday extends Model<Holiday> {
	public static final String tableName="oa_holiday";
	public static Holiday dao=new Holiday();
}