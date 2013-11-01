package net.loyin.model.crm;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@TableBind(name="crm_custsale")
public class Custsale extends Model<Custsale> {
	public static final String tableName="crm_custsale";
	public static Custsale dao=new Custsale();
}