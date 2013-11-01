package net.loyin.model.oa;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeMessage;

import jxl.common.Logger;
import net.loyin.jfinal.anatation.TableBind;
import net.loyin.util.PropertiesContent;
import net.loyin.util.mail.ReciveMail;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * 邮件箱
 * 
 * @author 刘声凤 2013年8月12日
 */
@TableBind(name = "oa_EmailBox")
public class EmailBox extends Model<EmailBox> {
	public static String tableName="oa_EmailBox";
	private static Logger log=Logger.getLogger(EmailBox.class);
	private static String[] box = new String[] { "INBOX", "SENDBOX", "", "" };
	private static final long serialVersionUID = -8733069995700407680L;
	public static EmailBox dao = new EmailBox();

	public Long qryCount(Long uid, int i) {
		Record r = Db.findFirst("select count(1) cou from "+tableName+" where uid=? and box=?", uid, i);
		return r.getLong("cou");
	}

	/**
	 * 接收(收件箱)新邮件
	 * 
	 * @param uid
	 *            用户id
	 * @throws Exception
	 */
	public int recvMail(Long uid) throws Exception {
		EmailSet emailSet = EmailSet.dao.qryByUid(uid);
		String boxStr = box[0];
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
//		Long mailCount=this.qryCount(uid, 0);
		Store store = session.getStore("pop3");
		try{
			String user = emailSet.getStr("email");//帐户
			String password = emailSet.getStr("pwd");//密码
			store.connect(emailSet.getStr("pop3Addr"),emailSet.getInt("pop3Port"), user, password);
			Folder folder = store.getFolder(boxStr);
			folder.open(Folder.READ_ONLY);
			Message msgs[] = folder.getMessages();
			int count = msgs.length;
			int newCount=folder.getNewMessageCount();
			log.info("邮件总数:" + count);
			log.info("新邮件总数:" + newCount);
			ReciveMail rm = null;
//			if(newCount>0||count>mailCount)
			for (int i = 0; i < count; i++) {
				log.info("add new mail");
				MimeMessage part=(MimeMessage) msgs[i];
				rm = new ReciveMail(part);
				Map<String,Object> attrs=new HashMap<String,Object>();
				attrs.put("id",null);
				attrs.put("uid",uid);
				attrs.put("setid",emailSet.getLong("id"));
				attrs.put("title",rm.getSubject());
		        attrs.put("mailFrom",rm.getFrom());
		        attrs.put("mailTo",rm.getMailAddress("TO"));
		        attrs.put("mailBcc",rm.getMailAddress("BCC"));
		        attrs.put("mailCc",rm.getMailAddress("CC"));
		        attrs.put("mailDate",rm.getSendDate());
		        attrs.put("isNew",true);//rm.isNew()
		        boolean flag = rm.isContainAttch(part);
		        attrs.put("hasAttach",flag);
		        attrs.put("replySign",rm.getReplySign());
		        rm.getMailContent(part);
		        attrs.put("content",rm.getBodyText());
		        rm.setSaveAttchPath(PropertiesContent.get("mail.saveDir")+uid+"//"+i+"//");
		        if(flag){
		        	try{
			        	rm.saveAttchMent(part,attrs);
			        	attrs.put("attachment","");
		        	}catch(Exception ee){log.error("保存附件异常",ee);}
		        }
		        dao.setAttrs(attrs);
		        try{
		        	dao.save();
				}catch(Exception ee){log.error("保存邮件异常",ee);}
			}
			return  newCount;
		}catch(Exception e){
			throw e;
		}finally{
			store.close();
		}
	}
}
