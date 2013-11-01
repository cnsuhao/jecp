package net.loyin.ctrl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.loyin.cfg.StaticCfg;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.jfinal.plugin.sqlXml.SqlManager;
import net.loyin.model.hr.Employee;
import net.loyin.model.sys.LoginLog;
import net.loyin.pageModel.DataGrid;
import net.loyin.pageModel.LoginInfo;
import net.loyin.util.safe.MD5;
import net.loyin.validator.LoginValid;

import com.jfinal.aop.Before;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.token.TokenManager;

@SuppressWarnings("rawtypes")
@RouteBind(path="/")
public class IndexCtrl extends AdminBaseController {
	private static int maxLogin=10;
	/**存储已经登录的用户 map<ip,LoginInfo>*/
	public static Map<String,LoginInfo> loginUser=new HashMap<String,LoginInfo>();
	public void index() {
		Record user= this.getCurrentUser();
		if(user==null||user.getLong("id")==null){
			this.renderHTML("login");
			return;
		}
		this.setAttr("Login_User",user);
		this.setAttr("nowtime",new Date());
		String ip = this.getRequest().getHeader("X-Real-IP");
		if(ip==null){
			ip=this.getRequest().getRemoteAddr();
		}
		this.setAttr("IP",ip);
		Date time=new Date();
		loginUser.put(ip, new LoginInfo(ip,user.getLong("id"),time));
		super.index();
	}
	public void west(){
		String lid=this.getCookie("login_user_id");
		if(lid==null||"".equals(lid)){
			lid=this.getCookie("login_user_id");
		}
		Long login_user_id=0L;
		if(lid!=null&&!"".equals(lid)){
			login_user_id=idGenerater.to10(lid);
		}
		this.setAttr("menuList",fetchMenu(login_user_id));
	}
	private List<Record> fetchMenu(Long userid){
		List<Record> menus=Db.findByCache("oneday", "menu_"+userid,SqlManager.sql("webadmin.getpower"),userid);
		if(menus!=null&&menus.isEmpty()==false){
			//将菜单放置
			List<String> powersafecodelist=new ArrayList<String>();
			for(Record menu:menus){
				if(menu!=null){
					Integer menuType=menu.getInt("type");
					if(menuType!=null&&menuType==2){
						String safecode=menu.getStr("safecode");
						if(safecode!=null&&!"".equals(safecode.trim())){
							powersafecodelist.add(safecode);
						}
					}
				}
			}
			//将按钮放置
			CacheKit.put("oneday", "power_"+userid, powersafecodelist);
		}
		return menus;
	}
	@Before(LoginValid.class)
	public void login(){
		String userno=this.getPara("userno");
		String pwd=this.getPara("pwd");
		String code=this.getPara("validCode");
		String check= this.getSessionAttr("check");
		this.removeSessionAttr("check");
		
		if(userno==null||"".equals(userno.trim())||pwd==null||"".equals(pwd)||(code==null||"".equals(code))){
			this.rendJson_(false, "信息填写不全！");
			return;
	/*	}else
		if((check==null||"".equals(check))){
			this.rendJson_(false, "验证码超时！");
			return;
		}else if((check!=null&&code!=null&&!check.equals(code.toLowerCase()))){
			this.rendJson_(false, "验证码错误！");
			return;*/
		}
			/**授权人数控制 开始*/
			if(loginUser.keySet().size()>maxLogin){
				this.rendJson_(false, "<font color='#ff0000'>同时在线的用户数已达到最大！<br>如需支持更多用户在线请购买授权！</font>");
				return;
			}
			pwd=MD5.getMD5ofStr(pwd);
			Record m=Db.findFirst(SqlManager.sql("webadmin.login"), new Object[]{userno,pwd});
			if(m!=null&&m.getLong("id")!=0){
				Long uid=m.getLong("id");
				/**唯一登录，即同一用户只可在一处登录*/
				/**第一步 获取所有的登录集合
				 * 第二步 比较对应存储的Record记录
				 * 第三步 对应的ip进行删除操作*/
				boolean single="1".equals(StaticCfg.get("single").get("value"))?true:false;
				if(single){
					if(loginUser.size()>0)
					for(String key:loginUser.keySet()){
						LoginInfo loginInfo=loginUser.get(key);
						try{
								Long uid_=loginInfo.uid;
								if(uid_!=null&&uid_==uid){
									loginUser.remove(key);
								}
						}catch(Exception e){
							loginUser.remove(key);
						}
					}
				}
				/**唯一登录结束*/
				Date time=new Date();
				String ip = this.getRequest().getHeader("X-Real-IP");
				if(ip==null){
					ip=this.getRequest().getRemoteAddr();
				}
				/**授权人数控制 结束*/
				fetchMenu(m.getLong("id"));
				Db.update(SqlManager.sql("webadmin.uploginip"), new Object[]{ip,time,uid});
				//记录登录日志
				LoginLog loginLog=new LoginLog();
				Map<String,Object> attrs=new HashMap<String,Object>();
				attrs.put("uid",uid);
				attrs.put("ip",ip);
				attrs.put("logintime",time);
				loginLog.setAttrs(attrs);
				loginLog.save();
				Calendar calendar=Calendar.getInstance();
				Long maxTime=84600L;
				try {
					calendar.setTime(dateTimeFormat.parse(dateFormat.format(time)+" 23:59:59"));
					maxTime=(calendar.getTimeInMillis()-time.getTime())/1000;
				} catch (Exception e) {}
				this.setCookie("login_user_id",""+idGenerater.to62(m.getLong("id")),maxTime.intValue());
				this.setCookie("loginLogId",""+idGenerater.to62(loginLog.getLong("id")),maxTime.intValue());
				this.rendJson_(true, "登录成功");
				return;
			}else{
				this.rendJson_(false, "用户名或密码错误");
				return;
			}
	}
	public void logout(){
		String sessionId=this.getRequest().getSession().getId();
		loginUser.remove(sessionId);
		/**记录退出记录*/
		String loginLogId=this.getCookie("loginLogId");
		if(loginLogId!=null&&!"".equals(loginLogId)){
			Db.update("update sys_LoginLog set logouttime=? where id=?",new Date(),idGenerater.to10(loginLogId));
		}
		this.removeCookie("loginLogId");
		String login_user_id=this.getCookie("login_user_id");
		if(login_user_id!=null&&!"".equals(login_user_id)){
			Long uid=idGenerater.to10(login_user_id);
			CacheKit.remove("oneday","login_user_id_"+uid);
			CacheKit.remove("oneday","menu_"+uid);
		}
		this.removeCookie("login_user_id");
		this.redirect("/");
	}
	/**ajax 获取token令牌*/
	public void token(){
		String tokenId=TokenManager.createToken(this, tokenName,600);
		this.renderText(tokenId);
	}
	/**在线人数*/
	public void onlineUser(){
		List<Record> userList=new ArrayList<Record>();
		if(loginUser!=null)
		for(String key:loginUser.keySet()){
			LoginInfo i=loginUser.get(key);
			userList.add(Employee.dao.qryLoginUser(i.uid));
		}
		DataGrid dg = new DataGrid();
		dg.setRows(userList);
		dg.setTotal(loginUser.size());
		this.renderJson(dg);
	}
	public void err404(){System.out.println("404 ERROR:"+this.getRequest().getRequestURI());}
	public void err500(){System.out.println("500 ERROR:"+this.getRequest().getRequestURI());}
}
