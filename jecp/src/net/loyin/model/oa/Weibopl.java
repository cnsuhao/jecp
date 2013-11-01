package net.loyin.model.oa;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
/**
 * 微博评论
 * @author loyin 龙影
 *2013-6-16
 */
@TableBind(name="oa_Weibopl")
public class Weibopl extends Model<Weibopl> {
	public static String tableName="oa_Weibopl";
	private static final long serialVersionUID = 3881565687486853785L;
	public static Weibopl dao=new Weibopl();
	/**设置为微博发布人读取此评论*/
	public void upRead(Long id){
		Db.update("update "+tableName+" set isshow=1 where id=?", id);
	}
	/**赞
	 * @param id 评论id
	 */
	public void zan(Long id){
		Db.update("update "+tableName+" set zan=zan+1 where id=?", id);
	}
	/***
	 * 删除评论 只有创建人可删除
	 * @param id 评论id
	 * @param cuid 创建人id
	 */
	public void delByC(Long id,Long cuid){
		Db.update("delete from "+tableName+" where id=? and cuid=?", id,cuid);
	}
}