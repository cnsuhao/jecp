package net.loyin.model.biz;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 联系人
 * @author 刘声凤
 *2013年8月14日
 */
@TableBind(name="biz_Contact")
public class Contact extends Model<Contact> {
	private static final long serialVersionUID = -2225431510883615908L;
	public  static Contact dao=new Contact();
	public static final String tableName="biz_Contact";
}
