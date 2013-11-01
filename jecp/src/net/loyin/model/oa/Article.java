package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 文章
 * @author loyin
 */
@TableBind(name="oa_Article")
public class Article extends Model<Article> {
	public static String tableName="oa_Article";
	private static final long serialVersionUID = -2865038753805061266L;
	public static final Article dao=new Article();
}
