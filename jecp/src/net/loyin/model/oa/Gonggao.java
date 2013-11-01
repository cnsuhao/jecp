package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 公告
 * @author loyin 龙影
 *2013-06-16
 */
@TableBind(name="oa_Gonggao")
public class Gonggao extends Model<Gonggao> {
	public static String tableName="oa_Gonggao";
	private static final long serialVersionUID = -8270232243555946392L;
	public static Gonggao dao=new Gonggao();
}