package net.loyin.jfinal.plugin.sqlXml;

import java.io.File;
import java.io.FileFilter;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import freemarker.template.Template;


public class SqlManager {
	private static Map<String, String> sqlMap = new HashMap<String, String>();
	/***
	 * 从sql.xml中获取对应的Sqlgroup下的sql
	 * @param groupNameAndsqlId 如groupname.sqlid
	 * @return
	 */
	public static String sql(String groupNameAndsqlId) {
		return sqlMap.get(groupNameAndsqlId);
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
			StringReader reader=new StringReader(sqlMap.get(groupNameAndsqlId));
			Template temp=new Template("", reader);
			StringWriter out=new StringWriter();
			temp.process(paras, out);
			return out.toString();
		}catch(Exception e){}
		return "";
	}

	static void clearSqlMap() {
		sqlMap.clear();
	}

	static void parseSqlXml() {
		File file = new File(SqlManager.class.getClassLoader().getResource("").getFile());
		File[] files = file.listFiles(new FileFilter() {
			public boolean accept(File pathname) {
				if (pathname.getName().endsWith("sql.xml")) {
					return true;
				}
				return false;
			}
		});
		for (File xmlfile : files) {
			SqlGroup group = null;
			try {
				JAXBContext context = JAXBContext.newInstance(SqlGroup.class);
				Unmarshaller unmarshaller = context.createUnmarshaller();
				group = (SqlGroup) unmarshaller.unmarshal(xmlfile);
			} catch (JAXBException e) {
				throw new RuntimeException(e);
			}
			String name = group.name;
			if (name == null || name.trim().equals("")) {
				name = xmlfile.getName();
			}
			for (SqlItem sqlItem : group.sqlItems) {
				sqlMap.put(name + "." + sqlItem.id, sqlItem.value);
			}
		}
	}

	public static void main(String[] args) {
		parseSqlXml();
		System.out.println(sqlMap);
	}

}