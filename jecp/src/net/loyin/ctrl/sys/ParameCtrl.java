package net.loyin.ctrl.sys;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Parame;
import net.loyin.pageModel.TreeNode;
/**
 * 系统参数设置
 * @author loyin
 *2013-3-31 上午11:14:41
 */
@RouteBind(path="parame")
public class ParameCtrl extends AdminBaseController<Parame> {
	public ParameCtrl(){
		this.tableName=Parame.tableName;
		modelClass=Parame.class;
	}
	/**选择树*/
	public void combotree() {
		String type=this.getPara(0);
		List<Record> dataList =Parame.dao.qry(type);
		List<TreeNode> list = new ArrayList<TreeNode>();
		TreeNode rootNode = new TreeNode();
		rootNode.setId(dataList.get(0).getLong("pid"));
		rootNode.setText("");
		rootNode.setIconCls("icon-home");
		rootNode.setCanChk(false);
		fillTree(dataList, rootNode,"cname",true,null);
		list.add(rootNode);
		this.renderJson_(list);
	}
	public void combobox(){
		String type=this.getPara(0);
		List<Record> dataList =Parame.dao.qry(type);
		this.renderJson(dataList);
	}
}
