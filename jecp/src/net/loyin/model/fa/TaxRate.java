package net.loyin.model.fa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;

/**
 * 税率
 * @author 刘声凤
 */
@TableBind(name = "fa_TaxRate")
public class TaxRate extends Model<TaxRate> {
	public static String tableName="fa_TaxRate";
	private static final long serialVersionUID = 5727296654700109351L;
	public static TaxRate dao = new TaxRate();
}
