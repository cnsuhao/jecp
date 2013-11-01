package net.loyin.interceptor;

import java.util.List;

import net.loyin.jfinal.anatation.PowerBind;
import net.loyin.jfinal.model.IdGenerater;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
/**
 * 管理用户后台权限验证拦截器
 * @author 刘声凤
 *  2012-9-6 下午8:32:53
 */
public class ManagerPowerInterceptor implements Interceptor {
	protected static IdGenerater idGenerater=new IdGenerater();
	/** 获取当前系统操作人 */
	public void intercept(ActionInvocation ai) {
		Controller ctrl=ai.getController();
		ctrl.setAttr("root",ctrl.getRequest().getContextPath());
		PowerBind p=ai.getMethod().getAnnotation(PowerBind.class);
		if(p==null){
			p=ai.getController().getClass().getAnnotation(PowerBind.class);
		}
		if(p!=null){
			Record po=null;
			String login_user_id=ctrl.getCookie("login_user_id");
			if(login_user_id==null||"".equals(login_user_id)){
				ctrl.renderJson("{\"success\":false,\"msg\":\"登录超时，请重新登录！\"}");
			}else{
				Long uid=idGenerater.to10(login_user_id);
				 List<Record> ulist= Db.findByCache("oneday", "login_user_id_"+uid, "select * from employee e where id=? ", uid);
				 if(ulist!=null&&ulist.isEmpty()==false){
					 po= ulist.get(0);
				 }
				if(po==null){
					ctrl.renderJson("{\"success\":false,\"msg\":\"登录超时，请重新登录！\"}");
				}else{
					ai.invoke();
				}
			}
		}else{
			/*boolean v=true;
			String code=null;
			PowerBind p=ai.getController().getClass().getAnnotation(PowerBind.class);
			if(p!=null){
				v=p.v();
				code=p.code();
			}
			p=ai.getMethod().getAnnotation(PowerBind.class);
			if(p!=null){
				v=p.v();
				code=p.code();
			}
			boolean f=false;
			if(v==true){
				//菜单权限判断
				List<Record> menus=(List<Record>)MemcacheTool.mcc.get("menu"+sid);
				if(menus!=null&&menus.isEmpty()==false){
					if(checkPower(menus,ai.getActionKey(),code)){//链接或安全码匹配
						ctrl.setAttr("powersafecodelist",MemcacheTool.mcc.get("powersafecodelist"+sid));
						ai.invoke();//注意 一定要执行此方法
					}else{
						f=true;
					}
				}else{
					f=true;
				}
			}
			if(f)
			ctrl.renderText("{\"statusCode\":300,\"message\":\"<font color='red'><B>您未有此操作权限！请勿越权操作！<br>请重新登录获得最新权限设置！</B></font>\"}");
			*/
			ai.invoke();//注意 一定要执行此方法
		}
	}
	/**
	 * 检查权限
	 * @param menus
	 * @param url
	 * @param safecode
	 * @return
	 */
	@SuppressWarnings("unused")
	private boolean checkPower(List<Record> menus,String url,String safecode){
		for(Record m:menus){
			String u=m.getStr("url");
			String mcode=m.getStr("safecode");
			if((u!=null&&url.contains(u))||(mcode!=null&&mcode.equals(safecode))){
				return true;
			}
		}
		return false;
	}
}