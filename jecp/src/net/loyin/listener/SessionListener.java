package net.loyin.listener;

import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import net.loyin.ctrl.IndexCtrl;

/**
 * sessin监听器，统计在线客户端数及ip数量，以及处理失效后的memcache内容管理
 * 
 * @author 龙影 loyin 2012-10-28
 */
public class SessionListener implements HttpSessionListener, ServletRequestListener, HttpSessionActivationListener {

	HttpServletRequest request;

	public void sessionCreated(HttpSessionEvent ev) {

	}

	public void sessionDestroyed(HttpSessionEvent ev) {
		String sessionid = ev.getSession().getId();
		IndexCtrl.loginUser.remove(sessionid);// 移除已经登录超时的用户
	}

	public void sessionDidActivate(HttpSessionEvent ev) {

	}

	public void sessionWillPassivate(HttpSessionEvent ev) {

	}

	public void requestDestroyed(ServletRequestEvent ev) {

	}

	public void requestInitialized(ServletRequestEvent ev) {
		request = (HttpServletRequest) ev.getServletRequest();
	}

}
