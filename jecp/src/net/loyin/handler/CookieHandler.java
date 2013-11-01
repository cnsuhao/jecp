package net.loyin.handler;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.loyin.cfg.JsonData;
import net.loyin.cfg.StaticCfg;
import net.loyin.jfinal.model.IdGenerater;
import net.loyin.util.TextUtil;

import com.jfinal.handler.Handler;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
/**
 * cookie参数填入到request
 * @author 刘声凤
 *  2012-9-4 下午10:22:19
 */
public class CookieHandler extends Handler {
	private static IdGenerater idGenerater=new IdGenerater();
	@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
		StaticCfg cfg=new StaticCfg();
		request.setAttribute("cfg",cfg);
		JsonData JsonData=new JsonData();
		request.setAttribute("JsonData",JsonData);
	    request.setAttribute("root",//"http://"+cfg.get("yuming").get("value")+
	    		request.getContextPath());
		Cookie[] cookies= request.getCookies();
		String login_user_id=null;
		if(cookies!=null)
		for(Cookie cookie:cookies){
			String name=cookie.getName();
			request.setAttribute(name,cookie.getValue());
			if("login_user_id".equals(name)){
				login_user_id=cookie.getValue();
			}
		}
		if(login_user_id!=null&&!"".equals(login_user_id)){
			Long uid=idGenerater.to10(login_user_id);
			 List<Record> ulist= Db.findByCache("oneday", "login_user_id_"+uid, "select * from hr_employee e where id=? ", uid);
			 if(ulist!=null&&ulist.isEmpty()==false){
				 request.setAttribute("Login_User",ulist.get(0));
			 }
		}
		request.setAttribute("now",new Date());
		request.setAttribute("TextUtil",new TextUtil());
	     nextHandler.handle(target, request, response, isHandled);
	}
}
