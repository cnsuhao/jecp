package net.loyin.ctrl.bbs;

import net.loyin.model.bbs.Topic;

import com.jfinal.core.Controller;

/**
 * 
 * @author 刘声凤
 *2013年8月13日
 */
public class IndexController extends Controller {
    public void index(){
        setAttr("topicPage", Topic.dao.getTopicPage(getParaToInt(0, 1)));
        setAttr("actionUrl", "/");
        render("/common/index.html");
    }
    public void leaveMsg(){
        render("/common/leaveMsg.html");
    }
    public void regist(){
        render("/user/regist.html");
    }
    public void toLogin(){
        render("/user/login.html");
    }
    public void test(){
        render("/common/test.html");
    }
}
