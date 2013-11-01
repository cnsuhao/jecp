package net.loyin.validator.bbs;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * Created with IntelliJ IDEA.
 * Author: StevenChow
 * Date: 13-5-3
 */
public class RegistValidator extends Validator {
    @Override
    protected void validate(Controller c) {
        validateEmail("Employee.email", "emailMsg", "错误的邮箱地址");
        validateRegex("Employee.Employeename", "[a-zA-Z0-9_\\u4e00-\\u9fa5]{2,8}", "EmployeenameMsg", "用户名的长度介于2-8之间，只能包含中文，数字，字母，下划线");
        validateRegex("Employee.password", "[a-zA-Z0-9_]{6,12}", "passwordMsg", "密码的长度介于2-8之间，只能包含数字，字母，下划线");
        validateEqualField("Employee.password", "repassword", "repasswordMsg", "2次输入的密码不一致");
        String email = c.getPara("Employee.email");
//        if(StringKit.notBlank(email) && Employee.dao.containEmail(email)){
//            addError("emailMsg", "该email已经被注册过了：（");
//        }
        String Employeename = c.getPara("Employee.Employeename");
//        if(StringKit.notBlank(Employeename) && Employee.dao.containEmployeename(Employeename)){
//            addError("EmployeenameMsg", "该用户名已经被注册过了：（");
//        }
    }

    @Override
    protected void handleError(Controller c) {
        c.keepModel(net.loyin.model.hr.Employee.class);
        c.render("/employee/regist.html");
    }
}
