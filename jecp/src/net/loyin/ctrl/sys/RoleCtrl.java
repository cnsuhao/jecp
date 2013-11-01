package net.loyin.ctrl.sys;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Role;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.plugin.ehcache.CacheKit;
/**
 * 角色
 * @author loyin
 *2013-3-31 上午11:19:56
 */
@RouteBind(path="role")
public class RoleCtrl extends AdminBaseController<Role> {
	public RoleCtrl(){
		this.tableName=Role.tableName;
		modelClass=Role.class;
	}
	@Override
	public void dataGrid() {
		String sort=this.getPara("sort");
		String order=this.getPara("order");
		StringBuffer orderBy=new StringBuffer();
		if(sort!=null&&!"".equals(sort)){
			orderBy.append(" order by ");
			orderBy.append(sort);
			orderBy.append(" ");
			orderBy.append(order);
			
		}
		DataGrid dg=new DataGrid();
		Page<Role> p=Role.dao.paginate(this.getParaToInt("page",1),this.getParaToInt("rows",20),"select * "," from "+tableName+orderBy.toString());
		List<Role> rolelist=p.getList();
		List<Record> menulist=Db.find("select pm.objid id1,m.id id2,m.cname name from sys_menu m , sys_powermenu pm where pm.type=1 and pm.menuid=m.id");
		List<Map<String,Object>> maplist=new ArrayList<Map<String,Object>>();
		for(Role r:rolelist){
			Long rid=r.getLong("id");
			StringBuffer midlist=new StringBuffer();
			StringBuffer mnamelist=new StringBuffer();
			Map<String,Object> map=new HashMap<String,Object>();
			for(Record m:menulist){
				if(rid==m.getLong("id1")){
					midlist.append(m.getLong("id2"));
					midlist.append(",");
					mnamelist.append(m.getStr("name"));
					mnamelist.append(",");
				}
			}
			for(String attr:r.getAttrNames()){
				map.put(attr.toUpperCase(),r.get(attr));
			}
			map.put("menunames",mnamelist.toString());
			map.put("menuids",midlist.toString());
			maplist.add(map);
		}
		dg.setRows(maplist);
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	public void save(){
		try {
			Model<Role> m = this.getModel();
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
					Db.update("delete from sys_powermenu where objid=? and type=1 ",id);
					Db.batch("insert into sys_powermenu(menuid,objid,type) values(?,?,1)", paras,20);
					Db.update("insert into sys_powermenu (menuid,objid,type) select distinct pm.id,"+id+",1 from sys_menu pm,sys_menu cm where cm.pid=pm.id and pm.id not in("+menuids+") and cm.id in("+menuids+")");
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
