package net.loyin.jfinal.plugin.sqlXml;

import java.io.File;
import java.io.FileFilter;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import freemarker.template.Template;


public class SqlManager {
	private static Map<String, Object> sqlMap = new HashMap<String, Object>();
	/***
	 * 从sql.xml中获取对应的Sqlgroup下的sql
	 * @param groupNameAndsqlId 如groupname.sqlid
	 * @return
	 */
	public static String sql(String groupNameAndsqlId) {
		return (String)sqlMap.get(groupNameAndsqlId);
	}
	/**
	 * 依据所传参数生成sql<br>
	 * 使用freemarker语法
	 * @param groupNameAndsqlId
	 * @param paras
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static String sql(String groupNameAndsqlId,Map<String,Object>paras){
		try{
			StringReader reader=new StringReader(sql(groupNameAndsqlId));
			Template temp=new Template("", reader);
			StringWriter out=new StringWriter();
			temp.process(paras, out);
			return out.toString();
		}catch(Exception e){}
		return null;
	}

	static void clearSqlMap() {
		sqlMap.clear();
	}
	/**直接在classes目录下读取 xxxsql.xml*/
	static void parseSqlXml() {
		parseSqlXml( new File(SqlManager.class.getClassLoader().getResource("").getFile()));
	}
	/**dir目录下读取 xxxsql.xml*/
	static void parseSqlXml(File dir) {
		File[] files = dir.listFiles(new FileFilter() {
			public boolean accept(File pathname) {
				if (pathname.getName().endsWith("sql.xml")) {
					return true;
				}
				return false;
			}
		});
		for (File xmlfile : files) {
			SqlGroupList sqlGroupList = null;
			try {
				JAXBContext context = JAXBContext.newInstance(SqlGroupList.class);
				Unmarshaller unmarshaller = context.createUnmarshaller();
				sqlGroupList = (SqlGroupList) unmarshaller.unmarshal(xmlfile);
			} catch (JAXBException e) {
				throw new RuntimeException(e);
			}
			for(SqlGroup group:sqlGroupList.sqlGroupList){
				String name = group.name;
				List<String> sqlIdList=new ArrayList<String>();
				for (SqlItem sqlItem : group.sqlItems) {
					sqlMap.put(name + "." + sqlItem.id, sqlItem.value);
					sqlIdList.add(sqlItem.id);
				}
				sqlMap.put(name, sqlIdList);//当前group下有多少sql item id
			}
		}
	}

	public static void main(String[] args) {
		parseSqlXml();//new File("D:/workspaces/eclipse3.7.2/easyUIJFinal/WebContent/WEB-INF/report"));
		System.out.println(sqlMap);
	}

}