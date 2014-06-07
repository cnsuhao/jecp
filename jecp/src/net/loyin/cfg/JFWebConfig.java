package net.loyin.cfg;

import net.loyin.handler.CookieHandler;
import net.loyin.handler.SessionHandler;
import net.loyin.jfinal.plugin.AutoTableBindPlugin;
import net.loyin.jfinal.plugin.MyRoutesUtil;
import net.loyin.jfinal.plugin.TableNameStyle;
import net.loyin.jfinal.plugin.sqlXml.SqlInXmlPlugin;
import net.loyin.util.PropertiesContent;

import com.alibaba.druid.filter.stat.StatFilter;
import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.i18n.I18N;
import com.jfinal.plugin.activerecord.CaseInsensitiveContainerFactory;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.CacheKit;
import com.jfinal.plugin.ehcache.EhCachePlugin;
import com.jfinal.plugin.spring.SpringPlugin;
/**
 * API引导式配置
 * @author loyin 龙影
 *2013-6-5
 */
public class JFWebConfig extends JFinalConfig {
    public static DruidPlugin druidPlugin;
	/**
	 * 配置常量
	 */
	public void configConstant(Constants me) {
//		loadPropertyFile("a_little_config.txt");				// 加载少量必要配置，随后可用getProperty(...)获取值
		me.setDevMode(true);
//		me.setViewType(ViewType.JSP); 							// 设置视图类型为Jsp，否则默认为FreeMarker
		me.setError404View("/WEB-INF/pages/err404.html");
		me.setError500View("/WEB-INF/pages/err500.html");
		me.setBaseViewPath("/WEB-INF/pages/");
		/**国际化properties文件加载 只调用一次*/
		I18N.init("i18n/msg", null, null);
		I18N.init("i18n/err", null, null);
	}
	
	/**
	 * 配置路由
	 */
	public void configRoute(Routes me) {
		MyRoutesUtil.add(me);
	}
	/**
	 * 配置插件
	 */
	public void configPlugin(Plugins me) {
		me.add(new EhCachePlugin());
		// 配置数据库连接池插件
		druidPlugin = new DruidPlugin(PropertiesContent.get("jdbc.url"),
												  PropertiesContent.get("jdbc.username"),
												  PropertiesContent.get("jdbc.password"),
												  PropertiesContent.get("jdbc.driver"));
//		WallFilter wall = new WallFilter();
//		wall.setDbType(PropertiesContent.get("jdbc.dbType"));
//		druidPlugin.addFilter(wall);
		druidPlugin.addFilter(new StatFilter());
		me.add(druidPlugin);
		
		//添加自动绑定model与表插件
		AutoTableBindPlugin autoTableBindPlugin = new AutoTableBindPlugin(druidPlugin, TableNameStyle.LOWER);
		autoTableBindPlugin.setShowSql(true);
		autoTableBindPlugin.setContainerFactory(new CaseInsensitiveContainerFactory());
		me.add(autoTableBindPlugin);
		me.add(new SqlInXmlPlugin());
		/**spring 配置插件*/
		SpringPlugin springplugin=new SpringPlugin();
		me.add(springplugin);
		//移除所有的缓存
		Thread thread=new Thread(){
			public void run(){
				try{Thread.sleep(1000);}catch(Exception e){}
				CacheKit.getCacheManager().clearAll();//移除所有的缓存
			}
		};
		thread.start();;
	}
	
	/**
	 * 配置全局拦截器
	 */
	public void configInterceptor(Interceptors me) {
		
	}
	
	/**
	 * 配置处理器
	 */
	public void configHandler(Handlers me) {
		me.add(new SessionHandler());//将session里的参数传递到request中直接得到
		me.add(new CookieHandler());//将cookie里的参数传递到request中直接得到
	}
}
