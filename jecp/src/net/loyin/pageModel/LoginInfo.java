package net.loyin.pageModel;

import java.io.Serializable;
import java.util.Date;
/**
 * 用户登录信息
 * @author loyin
 *2013-6-2 上午9:54:51
 */
public class LoginInfo implements Serializable {
	private static final long serialVersionUID = 3528304610183292312L;
	public String ip;
	/**用户id*/
	public Long uid;
	/**登录时间*/
	public Date loginTime=new Date();
	public LoginInfo(){
	}
	public LoginInfo(String ip,Long uid,Date loginTime){
		this.ip=ip;
		this.uid=uid;
		if(loginTime!=null)
		this.loginTime=loginTime;
	}
	public static LoginInfo Init(){
		return new LoginInfo();
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
}
