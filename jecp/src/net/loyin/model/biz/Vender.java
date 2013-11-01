package net.loyin.model.biz;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 厂家
 * @author 刘声凤
 *2013年8月13日
 */
@TableBind(name="biz_Vender")
public class Vender extends Model<Vender> {
	private static final long serialVersionUID = 6606481004216328944L;
	public static final String tableName="biz_Vender";
	public static Vender dao=new Vender();
}
