package net.loyin.validator;

import com.jfinal.core.Controller;
import com.jfinal.i18n.I18N;
/**
 * 登录验证
 * @author loyin
 *2013-6-2 下午3:14:22
 */
public class LoginValid extends BaseValidtor {
	@Override
	protected void validate(Controller c) {
		filedErrKeyList=new String[]{"err_userno","err_pwd","err_validCode"};
		this.validateRequired("userno", "err_userno", I18N.getText("login_err_userno", c.getRequest().getLocale()));
		this.validateRequired("pwd", "err_pwd",  I18N.getText("login_err_pwd", c.getRequest().getLocale()));
		this.validateRequired("validCode", "err_validCode", I18N.getText("login_err_validCode", c.getRequest().getLocale()));
	}
}
