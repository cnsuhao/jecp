package net.loyin.model.bbs;

import java.util.Date;
import java.util.List;

import net.loyin.cfg.MyConstants;
import net.loyin.jfinal.anatation.TableBind;
import net.loyin.model.hr.Employee;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.IDataLoader;

/**
 * Created with IntelliJ IDEA.
 * Author: iver
 * Date: 13-3-31
 */
@TableBind(name="bbs_topic")
public class Topic extends Model<Topic>{
	private static final long serialVersionUID = 3400981347396083669L;
	public static String tableName="bbs_topic";
    public static final Topic dao = new Topic();
    private static final String TOPIC_CACHE = "topic";
    private static final String TOPIC_PAGE_FOR_INDEX_CACHE = "topicPageForIndex";
    private static final String TOPIC_PAGE_FOR_MODULE_CACHE = "topicPageForModule";
    private static final String HOT_TOPIC_PAGE_CACHE = "hotTopicPage";
    private static final String NICE_TOPIC_PAGE_CACHE = "niceTopicPage";
    private static final String CACHE_KEY_SEPARATE = "-";

    public Topic getTopic(Long id){
        final Long ID = id;
        return CacheKit.get(TOPIC_CACHE, ID, new IDataLoader() {
            @Override
            public Object load() {
                return dao.findById(ID);
            }
        });
    }
    public Page<Topic> getTopicPage(int pageNumber){
        Page<Topic> topicPage = dao.paginateByCache(TOPIC_PAGE_FOR_INDEX_CACHE, pageNumber,
                pageNumber, MyConstants.TOPIC_PAGE_SIZE,
                "select id", "from topic order by createTime desc");
        loadTopicPage(topicPage);
        return topicPage;
    }
    public Page<Topic> getTopicPageForModule(int moduleID, int pageNumber){
        Page<Topic> topicPage = dao.paginateByCache(TOPIC_PAGE_FOR_MODULE_CACHE, moduleID + CACHE_KEY_SEPARATE + pageNumber,
                pageNumber, MyConstants.TOPIC_PAGE_SIZE,
                "select id", "from topic where moduleID=? order by createTime desc", moduleID);
        loadTopicPage(topicPage);
        return topicPage;
    }
    public Page<Topic> getHotTopicPage(int pageNumber){
        Page<Topic> topicPage = dao.paginateByCache(HOT_TOPIC_PAGE_CACHE, pageNumber,
                pageNumber, MyConstants.TOPIC_PAGE_SIZE,
                "select id", "from topic order by pv desc");
        loadTopicPage(topicPage);
        return topicPage;
    }
    public Page<Topic> getNiceTopicPage(int pageNumber){
        Page<Topic> topicPage = dao.paginateByCache(NICE_TOPIC_PAGE_CACHE, pageNumber,
                pageNumber, MyConstants.TOPIC_PAGE_SIZE,
                "select id", "from topic where isNice=true order by createTime desc");
        loadTopicPage(topicPage);
        return topicPage;
    }
    public void increaseTopicPV(Long topicID){
        Topic topic = dao.findFirst("select pv from topic where id=?", topicID);
        if (topic != null){
            int pv = topic.getInt("pv");
            new Topic().set("id", topicID).set("pv", pv + 1).update();
        }
        increaseTopicAttrInCache(topicID, "pv");
    }
    public void increaseTopicPostCount(Long topicID){
        int postCount = dao.findFirst("select postCount from "+tableName+" where id=?", topicID).getInt("postCount");
        new Topic().set("id", topicID).set("postCount", postCount + 1).update();
        increaseTopicAttrInCache(topicID, "postCount");
    }
    public void myUpdate() {
        this.update();
        this.removeThisTopicCache();
    }
    public void mySave(Post post){
        this.set("createTime", new Date());
        this.save();
        post.set("topicID", this.getInt("id")).set("createTime", new Date());
        post.save();
        removeAllTopicPageCache();
    }

    public Employee getUser(){
        return Employee.dao.findById(this.getLong("userID"));
    }
    public Module getModule(){
        return Module.dao.getModule(this.getInt("moduleID"));
    }

    /* private */
    private void removeThisTopicCache() {
        CacheKit.remove(TOPIC_CACHE, this.getInt("id"));
    }
    private void removeAllTopicPageCache() {
        CacheKit.removeAll(TOPIC_PAGE_FOR_INDEX_CACHE);
        CacheKit.removeAll(TOPIC_PAGE_FOR_MODULE_CACHE);
        CacheKit.removeAll(HOT_TOPIC_PAGE_CACHE);
        CacheKit.removeAll(NICE_TOPIC_PAGE_CACHE);
    }
    private void loadTopicPage(Page<Topic> topicPage) {
        List<Topic> topicList = topicPage.getList();
        for(int i = 0; i < topicList.size(); i++){
            Topic topic = getTopic(topicList.get(i).getLong("id"));
            topicList.set(i, topic);
        }
    }
    private void increaseTopicAttrInCache(Long topicID, String attr) {
        CacheKit.put(TOPIC_CACHE, topicID, getTopic(topicID).set(attr, getTopic(topicID).getInt(attr) + 1));
    }
}