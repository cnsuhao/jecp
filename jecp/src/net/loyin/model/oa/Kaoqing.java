package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*
*/
@TableBind(name="oa_kaoqing")
public class Kaoqing extends Model<Kaoqing> {
	private static final long serialVersionUID = -4228949930994021532L;
	public static final String tableName="oa_kaoqing";
	public static Kaoqing dao=new Kaoqing();
	public Kaoqing qryByUidDate(Long uid,String date){
		return findFirst("select * from "+tableName+" where uid=? and kqrq=?", uid,date);
	}
	public Kaoqing qryByUid(Long uid){
		return findFirst("select * from "+tableName+" where uid=? order by id desc", uid);
	}
	/**
	 * 签退
	 * @param kqid 考勤记录id 
	 * @param uid 	
	 * @param date 考勤日期
	 * @param qtTime 签退时间
	 */
	public void qianTui(Long kqid,String qtTime,String ip,String beizhu){
		Db.update("update "+tableName+" set qttime=? ,qtip=? ,beizhu=? where id=? ",qtTime,ip,beizhu,kqid);
	}
}