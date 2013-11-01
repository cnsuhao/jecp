package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;

/**
 * 文档
 * @author loyin
 *2012-11-25 下午4:29:12
 */
@TableBind(name = "oa_document")
public class Document extends Model<Document> {
	public static String tableName="oa_document";
	private static final long serialVersionUID = -246148641655505272L;
	public static Document dao = new Document();
}
