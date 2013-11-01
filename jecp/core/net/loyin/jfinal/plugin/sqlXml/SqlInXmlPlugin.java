package net.loyin.jfinal.plugin.sqlXml;

import com.jfinal.plugin.IPlugin;
/**
 *绝望的八皮 
 * @author 绝望的八皮
 * 2012-9-29
 */
public class SqlInXmlPlugin implements IPlugin {
	public boolean start() {
		try {
			SqlManager.parseSqlXml();
		} catch (Exception e) {
			new RuntimeException(e);
		}
		return true;
	}
	public boolean stop() {
		SqlManager.clearSqlMap();
		return true;
	}
}
