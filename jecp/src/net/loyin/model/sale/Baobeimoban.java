package net.loyin.model.sale;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*SaleBaobeimoban
*/
@TableBind(name="sale_baobeimoban")
public class Baobeimoban extends Model<Baobeimoban> {
	private static final long serialVersionUID = -2550091191627847801L;
	public static final String tableName="sale_baobeimoban";
	public static Baobeimoban dao=new Baobeimoban();
}