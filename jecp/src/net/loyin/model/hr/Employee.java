package net.loyin.model.hr;

import java.util.List;

import net.loyin.jfinal.anatation.TableBind;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
/***
 * 雇员
 * @author 刘声凤
 *  2012-9-4 上午10:39:04
 */
@TableBind(name="hr_employee")
public class Employee extends Model<Employee> {
	public static String tableName="hr_employee";
	private static final long serialVersionUID = 963448093676645483L;
	public static final Employee dao=new Employee();
	/**获取登录用户信息*/
	public Record qryLoginUser(Long uid){
		List<Record> ulist= Db.findByCache("oneday", "login_user_id_"+uid, "select e.userno,e.id,e.fullname,e.ip,e.logintime,p.cname partname from hr_employee e,sys_partment p where p.id=e.partmentid and e.id=? ", uid);
		 if(ulist!=null&&ulist.isEmpty()==false){
			 return ulist.get(0);
		 }
		 return null;
	}
}
