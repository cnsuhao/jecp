package net.loyin.model.bbs;

import java.util.List;

import net.loyin.jfinal.anatation.TableBind;
import net.loyin.model.hr.Employee;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

/**
 * Created with IntelliJ IDEA.
 * Author: iver
 * Date: 13-3-26
 */
@TableBind(name="bbs_Post")
public class Post extends Model<Post> {
	private static final long serialVersionUID = 7601478795565701965L;
	public static String tableName="bbs_Post";
    public static final Post dao = new Post();
    private static final String POST_CACHE = "post";
    private static final String POST_PAGE_CACHE = "postPage";
    private static final String CACHE_KEY_SEPARATE = "-";

    public Post getPost(Long postID){
        final Long POST_ID = postID;
        return CacheKit.get(POST_CACHE, POST_ID, new IDataLoader() {
            @Override
            public Object load() {
                return dao.findById(POST_ID);
            }
        });
    }
    public Page<Post> getPostPage(Long topicID, int pageNumber){
        if (pageNumber == 1){
            Topic.dao.increaseTopicPV(topicID);
        }
        Page<Post> postPage = dao.paginateByCache(POST_PAGE_CACHE, topicID + CACHE_KEY_SEPARATE + pageNumber,
                pageNumber, 20,
                "select id", "from "+tableName+" where topicID=?", topicID);
        loadPostPage(postPage);
        return postPage;
    }
    public void setHasReplyTrue(int postID){
        boolean hasReply = dao.findById(postID).getBoolean("hasReply");
        if ( ! hasReply){
            new Post().set("id", postID).set("hasReply", true).update();
        }
    }
    public void mySave(){
        this.save();
        Long topicID = this.getLong("topicID");
        Topic.dao.increaseTopicPostCount(topicID);
        removeAllPostPageCache();
    }
    public void myUpdate(){
        this.update();
        this.removeThisPostCache();
    }

    /* getter */
    public Employee getUser(){
        return Employee.dao.findById(this.getLong("userID"));
    }
    public Page<Reply> getReplyPage() {
        return Reply.dao.getReplyPage(this.getLong("id"), 1);
    }

    /* private */
    private void removeThisPostCache() {
        CacheKit.remove(POST_CACHE, this.getLong("id"));
    }
    private void removeAllPostPageCache() {
        CacheKit.removeAll(POST_PAGE_CACHE);
    }
    private void loadPostPage(Page<Post> postPage) {
        List<Post> postList = postPage.getList();
        for(int i = 0; i < postList.size(); i++){
            Post post = getPost(postList.get(i).getLong("id"));
            postList.set(i, post);
        }
    }
}
