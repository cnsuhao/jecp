package net.loyin.model.fa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;

/**
 * 员工工资发放记录
 * 
 * @author loyin 2012-10-1
 */
@TableBind(name="fa_wagepay")
public class Wagepay extends Model<Wagepay> {
	public static String tableName="fa_wagepay";
	private static final long serialVersionUID = -4428715247115699812L;
	public static Wagepay dao = new Wagepay();
}
