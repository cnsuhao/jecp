package net.loyin.util;

import java.io.Serializable;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.jfinal.plugin.activerecord.Record;

/**
 * 文本工具
 * @author 刘声凤
 *  2012-8-28 下午3:04:30
 */
public class TextUtil implements Serializable {
	private static final long serialVersionUID = 6779662681684374738L;

	/***
	 * 去除html代码
	 * @param htmlstr
	 * @return
	 */
	public static String quHtml(String htmlStr){
		Document doc=Jsoup.parse(htmlStr);
		htmlStr= doc.text();
		String regEx_rn="[\\r]*[\\n]*[\\t]*[\\>]*[\\<]*[\\s]*";//去除空格、换行、><
		/*String regEx_script="<script[^>]*?>[\\s\\S]*?<\\/script>"; //定义script的正则表达式 
        String regEx_style="<style[^>]*?>[\\s\\S]*?<\\/style>"; //定义style的正则表达式 
        String regEx_link="<link[^>]*?>[\\s\\S]*?<\\/link>"; //定义style的正则表达式 
        String regEx_html="<[^>]+>"; //定义HTML标签的正则表达式 
        Pattern p_script=Pattern.compile(regEx_script,Pattern.CASE_INSENSITIVE); 
        Matcher m_script=p_script.matcher(htmlStr); 
        htmlStr=m_script.replaceAll(""); //过滤script标签 
        
        Pattern p_style=Pattern.compile(regEx_style,Pattern.CASE_INSENSITIVE); 
        Matcher m_style=p_style.matcher(htmlStr); 
        htmlStr=m_style.replaceAll(""); //过滤style标签 
        
        Pattern p_link=Pattern.compile(regEx_link,Pattern.CASE_INSENSITIVE); 
        Matcher m_link=p_link.matcher(htmlStr); 
        htmlStr=m_link.replaceAll(""); //过滤link标签 
        
        Pattern p_html=Pattern.compile(regEx_html,Pattern.CASE_INSENSITIVE); 
        Matcher m_html=p_html.matcher(htmlStr); 
        htmlStr=m_html.replaceAll(""); //过滤html标签 
        */
        Pattern p_rn=Pattern.compile(regEx_rn,Pattern.CASE_INSENSITIVE);
        Matcher m_rn=p_rn.matcher(htmlStr); 
        htmlStr=m_rn.replaceAll(""); //过滤换行
       return htmlStr.trim(); //返回文本字符串 
	}
	/**
	 * 
	 * @param list
	 * @param filedName
	 * @param vals
	 * @return
	 */
	public static String list2str(Record[] list,String filedName,String vals){
		StringBuffer sb=new StringBuffer();
		Map<Long,String> listmap=new HashMap<Long,String>();
		for(Record r:list){
			listmap.put(r.getLong("id"),r.getStr(filedName));
		}
		if(vals==null||"".equals(vals)||"0".equals(vals))
			return "";
		String[] vallist=vals.split(",");
		if(vallist!=null&&vallist.length>0)
		for(String v:vallist){
			try{
			String r=listmap.get(Long.parseLong(v));
			if(r!=null&&!"null".equals(r)){
				sb.append(r);
				sb.append(",");
			}}catch(Exception e){
			}
		}
		return sb.toString();
	}
	/**
	 * 
	 * @param list
	 * @param filedName
	 * @param vals
	 * @return
	 */
	public static String list2Long(Record[] list,String filedName,Long id){
		if(list!=null&&list.length>0){
			Map<Long,String> listmap=new HashMap<Long,String>();
			for(Record r:list){
				listmap.put(r.getLong("id"),r.getStr(filedName));
			}
			return listmap.get(id);
		}
		
		return "";
	}
	public static String list2str(String[] list,String vals){
		StringBuffer sb=new StringBuffer();
		if(vals==null)
			return "";
		String[] vallist=vals.split(",");
		for(String v:vallist){
			try{
			String s=list[Integer.parseInt(v)];
			if(s!=null){
				sb.append(s);
				sb.append(",");
			}}catch(Exception e){}
		}
		return sb.toString();
	}
	@SuppressWarnings("deprecation")
	public static String urlEncode(String val){
		return URLEncoder.encode(val);
	}
	@SuppressWarnings("deprecation")
	public static String urlDecode(String val){
		return URLDecoder.decode(val);
	}
	/**
	 * 获取指定源随机字符串
	 * @param str
	 * @return
	 */
	public static String randomStr(String str){
		StringBuffer s=new StringBuffer();
		String[] list=str.split(",");
		int listlen=list.length;
		int length=(int)(Math.random()*10);
		while(length>5&&length<8&&listlen>8){
			length=(int)(Math.random()*10);
		}
//		while("".equals(s.toString())){
			for (int i = 0; i < length; i++) {
				int rand = (int) (Math.random() * list.length);
				s.append(list[rand]);
				s.append(",");
			}
//		}
		return s.toString();
	}
	/**
	 * 产生随机数
	 * @return
	 */
	@SuppressWarnings("unused")
	private String[] getCode(int length,String[]s) {
		String[] rands = new String[length];
		for (int i = 0; i < length; i++) {
			int rand = (int) (Math.random() * s.length);
			rands[i] = s[rand];
		}
		return rands;
	}
}
