package net.loyin.model.crm;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*Custtype
*/
@TableBind(name="crm_custtype")
public class Custtype extends Model<Custtype> {
	public static final String tableName="crm_custtype";
	public static Custtype dao=new Custtype();
}