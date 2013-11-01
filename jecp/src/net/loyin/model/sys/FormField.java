package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 表单字段
 * @author loyin 龙影
 *2013-06-23 19:43:20
 */
@TableBind(name="sys_FormField")
public class FormField extends Model<FormField> {
	public static String tableName="sys_FormField";
	private static final long serialVersionUID = -8270232243555946392L;
	public static FormField dao=new FormField();
}