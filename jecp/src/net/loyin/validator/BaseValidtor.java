package net.loyin.validator;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * 验证
 * 
 * @author loyin 2013-6-2 下午3:14:22
 */
public class BaseValidtor extends Validator {
	/** 用来装载错误系信息的key值 */
	protected String[] filedErrKeyList;
	/** true:转化成json错误信息 */
	protected boolean toJson = true;

	@Override
	protected void validate(Controller c) {
	}

	/***
	 * 生成json格式回显信息
	 */
	@Override
	protected void handleError(Controller c) {
		if (toJson == true) {
			Map<String, Object> json = new HashMap<String, Object>();
			StringBuffer msg = new StringBuffer();
			for (String key : filedErrKeyList) {
				String msgstr = c.getAttrForStr(key);
				if (msgstr != null)
					msg.append(msgstr);
			}
			json.put("success", false);
			json.put("msg", msg.toString());
			c.renderJson(json);
		}
	}

}
