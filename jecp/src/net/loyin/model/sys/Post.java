package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;

/***
 * 职位
 * @author 刘声凤
 *  2012-9-4 上午10:39:04
 */
@TableBind(name="sys_post")
public class Post extends Model<Post> {
	public static String tableName="sys_post";
	private static final long serialVersionUID = 1287150070505939605L;
	public static final Post dao=new Post();
}
