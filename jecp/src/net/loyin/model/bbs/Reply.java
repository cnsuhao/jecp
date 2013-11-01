package net.loyin.model.bbs;

import java.util.Date;
import java.util.List;

import net.loyin.cfg.MyConstants;
import net.loyin.jfinal.anatation.TableBind;
import net.loyin.kit.HtmlTagKit;
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
@TableBind(name="bbs_Reply")
public class Reply extends Model<Reply> {
	private static final long serialVersionUID = -7582238084021366705L;
	public static String tableName="bbs_Reply";
    public static final Reply dao = new Reply();
    private static final String REPLY_CACHE = "reply";
    private static final String REPLY_PAGE_CACHE = "replyPage";
    private static final String CACHE_KEY_SEPARATE = "-";

    public Reply getReply(int replyID){
        final int REPLY_ID = replyID;
        return CacheKit.get(REPLY_CACHE, REPLY_ID, new IDataLoader() {
            @Override
            public Object load() {
                return dao.findById(REPLY_ID);
            }
        });
    }
    public Page<Reply> getReplyPage(Long postID, int pageNumber){
        Page<Reply> replyPage = Reply.dao.paginateByCache(REPLY_PAGE_CACHE, postID + CACHE_KEY_SEPARATE + pageNumber,
                pageNumber, MyConstants.REPLY_PAGE_SIZE, "select id", "from "+tableName+" where postID=?", postID);
        loadReplyPage(replyPage);
        return replyPage;
    }
    public void mySave(int postID){
        Post.dao.setHasReplyTrue(postID);
        this.set("content", HtmlTagKit.processHtmlSpecialTag(this.getStr("content"))).set("createTime", new Date());;
        this.save();
        removeAllReplyPageCache();
    }
    public void deleteByID(int id){
        dao.deleteById(id);
        removeAllReplyPageCache();
    }

    public Employee getUser(){
        return Employee.dao.findById(this.getLong("userID"));
    }
    /* private */
    private void removeAllReplyPageCache() {
        CacheKit.removeAll(REPLY_PAGE_CACHE);
    }
    private void loadReplyPage(Page<Reply> replyPage) {
        List<Reply> replyList = replyPage.getList();
        for(int i = 0; i < replyList.size(); i++){
            Reply reply = getReply(replyList.get(i).getInt("id"));
            replyList.set(i, reply);
        }
    }
}
