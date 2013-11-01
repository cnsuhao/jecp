package net.loyin.model.sys;

import java.util.List;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/***
 * 系统参数配置
 * @author 刘声凤
 *  2012-9-4 上午10:39:04
 */
@TableBind(name="sys_parame")
public class Parame extends Model<Parame> {
	public static String tableName="sys_parame";
	private static final long serialVersionUID = 8550674271875901835L;
	public static final Parame dao=new Parame();
	public List<Record> qry(String type){
		return Db.find("select t1.* from "+tableName+" t1,"+tableName+" t2 where t2.id=t1.pid and t2.type=? order by t1.sortnum desc",type);
	}
}
