package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 公告栏
 * @author loyin 龙影
 *2013-06-16
 */
@TableBind(name="oa_Gglan")
public class Gglan extends Model<Gglan> {
	public static String tableName="oa_Gglan";
	private static final long serialVersionUID = -8270232243555946392L;
	public static Gglan dao=new Gglan();
}