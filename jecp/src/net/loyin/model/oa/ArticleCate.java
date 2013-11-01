package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * 文章类别
 * @author thinkpad
 */
@TableBind(name="oa_Articlecate")
public class ArticleCate extends Model<ArticleCate> {
	public static String tableName="oa_Articlecate";
	private static final long serialVersionUID = 1291278238314905734L;
	public static final ArticleCate dao=new ArticleCate();
}
