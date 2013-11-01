package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*Kuaidi
*/
@TableBind(name="sys_kuaidi")
public class Kuaidi extends Model<Kuaidi> {
	private static final long serialVersionUID = 6127997239358027146L;
	public static final String tableName="sys_kuaidi";
	public static Kuaidi dao=new Kuaidi();
}