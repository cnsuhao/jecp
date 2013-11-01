package net.loyin.ctrl.bbs;

import net.loyin.interceptor.bbs.LoginInterceptor;
import net.loyin.model.bbs.Post;
import net.loyin.model.bbs.Topic;
import net.loyin.validator.bbs.PostValidator;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;

/**
 * Created with IntelliJ IDEA.
 * Author: StevenChow
 * Date: 13-3-30
 */
public class PostController extends Controller {
    public void index(){
        Long topicID = getParaToLong(0);
        int pageNumber = getParaToInt(1, 1);
        Page<Post> postPage = Post.dao.getPostPage(topicID, pageNumber);
        setAttr("postPage", postPage);
        setAttr("topic", Topic.dao.getTopic(topicID));
        render("/post/post.html");
    }

    @Before({LoginInterceptor.class, PostValidator.class})
    public void save(){
        Post post = getModel(Post.class);
        post.mySave();
        redirect("/post/" + post.getInt("topicID"));
    }

    public void edit(){
        setAttr("post", Post.dao.getPost(getParaToLong(0)));
        render("/post/editPost.html");
    }

    @Before({ PostValidator.class})
    public void update(){
        Post post = getModel(Post.class);
        post.myUpdate();
        redirect("/post/" + post.getInt("topicID"));
    }
}
