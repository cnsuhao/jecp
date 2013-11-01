package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/***
 * 省份地市地区
 * @author 刘声凤
 */
@TableBind(name="sys_area")
public class Area extends Model<Area> {
	private static final long serialVersionUID = -3591577384917167495L;
	public static String tableName="sys_area";
	public static final Area dao=new Area();
}
