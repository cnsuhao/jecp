package net.loyin.model.sale;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@TableBind(name="sale_genjinfankui")
public class Genjinfankui extends Model<Genjinfankui> {
	public static final String tableName="sale_genjinfankui";
	public static Genjinfankui dao=new Genjinfankui();
}