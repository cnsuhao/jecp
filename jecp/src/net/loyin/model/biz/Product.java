package net.loyin.model.biz;

import net.loyin.jfinal.anatation.TableBind;
import com.jfinal.plugin.activerecord.Model;
/*
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 */

@TableBind(name="biz_product")
public class Product extends Model<Product> {
	public static final String tableName="biz_product";
	public static Product dao=new Product();
}