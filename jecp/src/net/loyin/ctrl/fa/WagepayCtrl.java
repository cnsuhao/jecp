package net.loyin.ctrl.fa;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.fa.Wagepay;
import net.loyin.pageModel.DataGrid;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.jfinal.upload.UploadFile;
/**
 * Powered By loyin 龙影 刘声凤
 * Web Site: http://www.loyin.net
 * Since 2008 - 2013
 *//**
*Wagepay
*/
@RouteBind(path = "wagepay")
public class WagepayCtrl extends AdminBaseController<Wagepay> {
	public WagepayCtrl() {
		this.tableName = Wagepay.tableName;
		modelClass = Wagepay.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		String qryField=this.getPara("qryField");//查询字段 以逗号分隔
		if(qryField!=null&&!"".equals(qryField)){
			String[] k=qryField.split(",");
			for(String q:k){
				Object t=this.getPara(q);
				if(t!=null&&!"".equals(t)){
					where.append(" and ");
					where.append(q);
					where.append(" =? ");
					param.add(t);
				}
			}
		}
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select t.ID,t.EMPSNO,t.EMPNAME,t.JBGZ,t.GZTS,t.GWGZ,t.CANTIE,t.JTBT,t.TXBT,t.QUANQIN,t.QJIA,t.SHEBAO,t.GJJ,t.YFGZ,t.YGJJ,t.QT,t.KCHJ,t.SFGZ,t.YM,t.CTIME, 1 ", "from " + this.tableName+ " t where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	private static final String[]fields=new String[]{"EMPSNO","EMPNAME","JBGZ","GZTS","GWGZ","CANTIE","JTBT","TXBT","QUANQIN","QJIA","SHEBAO","GJJ","YFGZ","YGJJ","QT","KCHJ","SFGZ"};
	/**上传 工资表*/
	public void up(){
		String errmsg ="";
		StringBuffer files=new StringBuffer();
		List<UploadFile> upfilelist = this.getFiles();
		boolean suc=false;
		if(upfilelist!=null&&upfilelist.isEmpty()==false){
			Date now=new Date();
			for(UploadFile upfile:upfilelist){
				File file = upfile.getFile();
				if(file != null){
					/**读取excel文件*/
					try{
						FileInputStream ios= new FileInputStream(file);
						HSSFWorkbook wb =new HSSFWorkbook(ios);
						HSSFSheet sheet= wb.getSheetAt(0);
						HSSFRow row1= sheet.getRow(0);
						String ym=row1.getCell(1).getStringCellValue();//月份
						 Iterator<Row> rows=  (Iterator<Row>)sheet.iterator();
						 int i=0;
						 while(rows.hasNext()){
							 Row row= rows.next();
							 if(i>1){
								 Iterator<Cell> cells=(Iterator<Cell>)  row.cellIterator();
								 Map<String,Object> attrs=new HashMap<String,Object>();
								 attrs.put("ctime",now);
								 attrs.put("ym", ym);
								 int j=0;
								 while(cells.hasNext()){
									 Cell cell=cells.next();
									 attrs.put(fields[j],cell.getStringCellValue());
									 j++;
								 }
								 Wagepay.dao.setAttrs(attrs);
								 Wagepay.dao.save();
							 }
							 i++;
						 }
						 ios.close();
						 suc=true;
					}catch(Exception e){
						errmsg="分析文件格式错误";
						this.renderText("{'err':'" + errmsg + "','msg':'" +files.toString()+ "','suc':"+suc+"}");
						return;
					}
				}
			}
			suc=true;
		}else{
			errmsg="未上传文件";
		}
		/**更新员工id*/
		Db.update("update fa_wagepay w,hr_employee e set w.empid=e.id,w.partmentid=e.partmentid where e.id=w.empid and w.empid is null;");
		this.renderText("{'err':'" + errmsg + "','msg':'" +files.toString()+ "','suc':"+suc+"}");
	}
}