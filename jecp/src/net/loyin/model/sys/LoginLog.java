package net.loyin.model.sys;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;

/**
 * 登录登出日志
 * 
 * @author 刘声凤 2013年8月8日
 */
@TableBind(name = "sys_LoginLog")
public class LoginLog extends Model<LoginLog> {
	public static String tableName="sys_LoginLog";
	private static final long serialVersionUID = -8687063029204140095L;
	public static LoginLog dao = new LoginLog();
}
