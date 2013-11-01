package net.loyin.ctrl.bbs;

import net.loyin.model.bbs.Post;
import net.loyin.model.bbs.Topic;
import net.loyin.validator.bbs.PostValidator;
import net.loyin.validator.bbs.TopicValidator;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;

/**
 * 
 * @author 刘声凤
 *2013年8月13日
 */
public class TopicController extends Controller {
    public void index(){
        forwardAction("/post/" + getParaToInt(0));
    }
    public void module(){
        setAttr("topicPage", Topic.dao.getTopicPageForModule(getParaToInt(0), getParaToInt(1, 1)));
        setAttr("actionUrl", "/topic/module/" + getParaToInt(0) + "-");
        render("/common/index.html");
    }
    public void hotTopic(){
        setAttr("topicPage", Topic.dao.getHotTopicPage(getParaToInt(0, 1)));
        setAttr("actionUrl", "/topic/hotTopic/");
        render("/common/index.html");
    }
    public void niceTopic(){
        setAttr("topicPage", Topic.dao.getNiceTopicPage(getParaToInt(0, 1)));
        setAttr("actionUrl", "/topic/niceTopic/");
        render("/common/index.html");
    }

    public void add(){
        render("/topic/addTopic.html");
    }

    @Before({ TopicValidator.class, PostValidator.class})
    public void save(){
        Topic topic = getModel(Topic.class);
        topic.mySave(getModel(Post.class));
        redirect("/post/" + topic.getInt("id"));
    }

    public void edit(){
        Topic topic = Topic.dao.getTopic(getParaToLong(0));
        setAttr("topic", topic);
        render("/topic/editTopic.html");
    }

    @Before({TopicValidator.class})
    public void update(){
        Topic topic = getModel(Topic.class);
        topic.myUpdate();
        redirect("/post/" + topic.getInt("id"));
    }
}
