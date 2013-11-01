package net.loyin.ctrl.oa;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.ctrl.FileController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.FileBox;
import net.loyin.pageModel.DataGrid;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
/**
 * 文件站
 * @author 刘声凤
 *2013年8月12日
 */
@RouteBind(path="fileBox")
public class FileBoxCtrl extends AdminBaseController<FileBox> {
	public FileBoxCtrl() {
		this.tableName =FileBox.tableName;
		modelClass = FileBox.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		where.append(" and uid=?");
		param.add(this.getCurrentUserId());
		/** 添加查询字段条件*/
		String startDate=this.getPara("startDate");
		if(startDate!=null&&!"".equals(startDate)){
			where.append(" and ctime >=?");
			param.add(startDate);
		}
		String endDate=this.getPara("endDate");
		if(endDate!=null&&!"".equals(endDate)){
			where.append(" and ctime <=?");
			param.add(endDate);
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}else{
			where.append(" order by ctime desc ");
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select g.* ", "from " + this.tableName+ " g where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}

	@SuppressWarnings("deprecation")
	public void del() {
		String ids=this.getPara("ids");
		try{
			String[] idList=ids.split(",");
			for(String id:idList){
				FileBox fb=FileBox.dao.findById(id);
				try{
					String fp=this.getRequest().getRealPath("/")+FileController.uploadroot+"/"+fb.getStr("filePath");
					log.info(fp);
					File f=new File(fp);
					f.delete();
				}catch(Exception ef){}
			}
			Db.update("delete from "+this.tableName+" where id in("+ids+")");
			rendJson_(true, "删除成功！");
		}catch(Exception e){
			log.error("删除文件站错误",e);
			rendJson_(false, "删除异常！");
		}
	}

}
