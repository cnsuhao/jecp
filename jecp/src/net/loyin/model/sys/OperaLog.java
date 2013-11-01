package net.loyin.model.sys;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Model;
/***
 * 操作日志
 * @author 刘声凤
 *2013年10月21日
 */
@TableBind(name = "sys_operaLog")
public class OperaLog extends Model<OperaLog> {
	private static final long serialVersionUID = 7051335669147016165L;
	public static String tableName="sys_operaLog";
	public static OperaLog dao = new OperaLog();
	/**其他*/
	public static final int OTH_=0;
	/**添加*/
	public static final int ADD_=1;
	/**删除*/
	public static final int DEL_=2;
	/**编辑*/
	public static final int EDIT_=3;
	/**授权*/
	public static final int AUTH_=4;
	/**审批*/
	public static final int PIHENPI_=5;
	/**
	 * 添加日志
	 * @param modelName 模块名称
	 * @param func 功能
	 * @param uid 用户id
	 * @param exct 执行操作
	 */
	public void addLog(String modelName,String func,Long uid,int exct){
		Map<String,Object> attrs=new HashMap<String,Object>();
		attrs.put("modelName", modelName);
		attrs.put("func", func);
		attrs.put("uid", uid);
		attrs.put("exct", exct);
		attrs.put("ctime", new Date());
		dao.setAttrs(attrs);
		dao.save();
	}
}
