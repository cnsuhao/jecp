package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/***
 * 部门
 * @author 刘声凤
 *  2012-9-4 上午10:39:04
 */
@TableBind(name="sys_partment")
public class Partment extends Model<Partment> {
	public static String tableName="sys_partment";
	private static final long serialVersionUID = 848553527430796237L;
	public static final Partment dao=new Partment();
}
