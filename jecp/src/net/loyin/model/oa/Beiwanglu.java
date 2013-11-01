package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 备忘录
 * @author loyin 龙影
 *2013-06-16
 */
@TableBind(name="oa_Beiwanglu")
public class Beiwanglu extends Model<Beiwanglu> {
	public static String tableName="oa_Beiwanglu";
	private static final long serialVersionUID = -8270232243555946392L;
	public static Beiwanglu dao=new Beiwanglu();
}