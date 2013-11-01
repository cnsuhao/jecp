package net.loyin.ctrl.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Post;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
/**
 * 岗位职位
 * @author loyin
 *2013-3-31 上午11:19:56
 */
@RouteBind(path="post")
public class PostCtrl extends AdminBaseController<Post> {
	public PostCtrl(){
		this.tableName=Post.tableName;
		modelClass=Post.class;
	}
	/**树形表格*/
	public void treeDataGrid() {
		DataGrid dg=new DataGrid();
		List<Record> list= Db.find("select a.*,p.cname pcname from "+this.tableName+" a left join "+this.tableName+" p on p.id=a.pid");
		List<Record> menulist=Db.find("select pm.objid id1,m.id id2,m.cname name from sys_menu m , sys_powermenu pm where pm.type=3 and pm.menuid=m.id");
		List<Map<String,Object>> list1=new ArrayList<Map<String,Object>>();
		for(Record r:list){
			Map<String,Object> d=new HashMap<String,Object>();
			for(String col:r.getcolumnNames()){
				d.put(col,r.get(col));
			}
			Long pid=r.getLong("pid");
			if(pid!=null&&pid!=0)
			d.put("_parentId",pid);//tree datagrid 需要使用此字段作为父节点关联
			Long rid=r.getLong("id");
			StringBuffer midlist=new StringBuffer();
			StringBuffer mnamelist=new StringBuffer();
			for(Record m:menulist){
				if(rid==m.getLong("id1")){
					midlist.append(m.getLong("id2"));
					midlist.append(",");
					mnamelist.append(m.getStr("name"));
					mnamelist.append(",");
				}
			}
			d.put("menunames",mnamelist.toString());
			d.put("menuids",midlist.toString());
			list1.add(d);
		}
		dg.setRows(list1);
		dg.setTotal(list1.size());
		this.renderJson(dg);
	}
	public void save(){
		try {
			Model<Post> m = this.getModel();
			Long id = m.getLong("ID");
			if (id != null && id != 0) {
				m.update();
			} else {
				m.save();
			}
			id = m.getLong("ID");
			String menuids=this.getPara("menuids");
			if(menuids!=null&&!"".equals(menuids)){
				menuids=menuids+"EE";
				menuids=menuids.replaceAll(",EE","").replaceAll("EE","");
				String[] ids=menuids.split(",");
				if(ids.length>0){
					Object[][] paras=new Object[ids.length][2];
					int i=0;
					for(String id_:ids){
						paras[i][0]=id_;
						paras[i][1]=id;
						i++;
					}
					Db.update("delete from sys_powermenu where objid=? and type=3 ",id);
					Db.batch("insert into sys_powermenu(menuid,objid,type) values(?,?,3)", paras,20);
					Db.update("insert into sys_powermenu (menuid,objid,type) select distinct pm.id,"+id+",3 from sys_menu pm,sys_menu cm where cm.pid=pm.id and pm.id not in("+menuids+") and cm.id in("+menuids+")");
					CacheKit.removeAll("oneday");
				}
			}
			rendJson_(true, "保存成功！", id);
		} catch (Exception e) {
			log.error("保存异常", e);
			rendJson_(false, "保存异常！");
		}
	}
}
