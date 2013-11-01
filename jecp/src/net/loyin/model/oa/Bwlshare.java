package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 备忘录共享
 * @author loyin 龙影
 *2013-06-16
 */
@TableBind(name="oa_Bwlshare")
public class Bwlshare extends Model<Bwlshare> {
	public static String tableName="oa_Bwlshare";
	private static final long serialVersionUID = -8270232243555946392L;
	public static Bwlshare dao=new Bwlshare();
}