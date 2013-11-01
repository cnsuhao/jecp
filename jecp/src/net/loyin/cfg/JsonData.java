package net.loyin.cfg;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.common.Logger;

import com.google.gson.Gson;
/**
 * 对应js/data目录下的参数进行加载到map中
 * @author loyin 龙影
 *
 *2013-6-7
 */
public class JsonData {
	private static Logger log=Logger.getLogger(JsonData.class);
	public static Map<String,Map<String,String>> cfg = new HashMap<String,Map<String,String>>();
	private static Gson gson= new Gson();
	static {
		load();
	}
	@SuppressWarnings("unchecked")
	public static void load() {
		try {
			String path = StaticCfg.class.getResource("/").getPath().replace("/WEB-INF/classes/", "/js/data");
			log.debug(path);
			File dir = new File(path.substring(1));
			if (dir.isDirectory() == true) {
				File[] files = dir.listFiles();
				for (File f : files) {
					if(f.getName().endsWith(".json")){
						InputStreamReader isr = new InputStreamReader(	new FileInputStream(f), "utf-8");
						BufferedReader reader = new BufferedReader(isr);
						String line;
						StringBuffer json = new StringBuffer();
						while ((line = reader.readLine()) != null) {
							json.append(line);
						}
						reader.close();
						String key=	f.getName().replace(".json","");
						log.debug("{\""+key+"\":"+json.toString()+"}");
						Map<String,String> ss = new HashMap<String,String>();
						Map<String,List<Map<String,String>>> list=(Map<String,List<Map<String,String>>>)gson.fromJson("{\""+key+"\":"+json.toString()+"}",Map.class);
						List<Map<String,String>> mp=list.get(key);
							for(Map<String,String> mp1:mp){
									ss.put(mp1.get("id"),mp1.get("text"));
							}
						cfg.put(key, ss);
					}
				}
			}
		} catch (Exception e) {
			log.error("加载json数据错误",e);
		}
	}

	public static Map<String,String> get(String key) {
		return cfg.get(key);
	}

}
