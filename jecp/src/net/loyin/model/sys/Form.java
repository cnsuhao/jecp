package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 表单
 * @author loyin 龙影
 *2013-06-23
 */
@TableBind(name="sys_Form")
public class Form extends Model<Form> {
	public static String tableName="sys_Form";
	private static final long serialVersionUID = -8270232243555946392L;
	public static Form dao=new Form();
}