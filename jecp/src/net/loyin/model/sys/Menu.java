package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/***
 * 菜单
 * @author 刘声凤
 *  2012-9-4 上午10:39:04
 */
@TableBind(name="sys_menu")
public class Menu extends Model<Menu> {
	public static String tableName="sys_menu";
	private static final long serialVersionUID = 2930684285217028262L;
	public static final Menu dao=new Menu();
}
