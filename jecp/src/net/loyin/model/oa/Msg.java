package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@TableBind(name="oa_msg")
public class Msg extends Model<Msg> {
	public static final String tableName="oa_msg";
	public static Msg dao=new Msg();
}