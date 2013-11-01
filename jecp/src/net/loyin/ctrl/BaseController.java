package net.loyin.ctrl;

import java.util.HashMap;
import java.util.Map;

import net.loyin.jfinal.model.IdGenerater;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.jfinal.core.Controller;
import com.jfinal.i18n.I18N;
import com.jfinal.plugin.activerecord.Model;

/**
 * 基础Controller
 * @author 刘声凤
 *  2012-9-3 下午10:37:28
 */
public abstract class BaseController<M extends Model<M>> extends Controller {
	public Logger log=Logger.getLogger(getClass());
	protected static IdGenerater idGenerater=new IdGenerater();
	protected Model<M> po;
	protected Gson gson=new Gson();
	public abstract void index();
	public void renderHTML(String view) {
		if(view.endsWith(".html")){
			super.render(view);
		}else{
			super.render(view+".html");
		}
	}
	/**从jar包获取
	 * 
	 * */
	public void renderFormJar(String view){
		
	}
	/***
	 * 
	 * @param success
	 * @param msg
	 * @param obj 数组 [0]:id [1]:tokenid
	 */
	public void rendJson_(boolean success,String msg,Object... obj){
		Map<String,Object>json=new HashMap<String,Object>();
		json.put("success",success);
		json.put("msg",msg);
		if(obj!=null&&obj.length>0){
			json.put("obj",obj[0]);
			if(obj.length>1){
				json.put("tokenid",obj[1]);
			}
		}
		this.renderJson(json);
	}
	/**
	 * 获取国际化资源
	 * @param key 键
	 * @param defval 默认值
	 * @return
	 */
	public String getI18nText(String key,String defval){
		return I18N.getText(key, defval, this.getRequest().getLocale());
	}
}
