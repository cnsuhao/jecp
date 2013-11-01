package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@TableBind(name="oa_kqset")
public class Kqset extends Model<Kqset> {
	private static final long serialVersionUID = -2619947374217253379L;
	public static final String tableName="oa_kqset";
	public static Kqset dao=new Kqset();
	public Kqset qryByDate(String date){
		return findFirst("select * from "+tableName+" where exctdate <=? order by id desc ",date);
	}
}