package net.loyin.ctrl.sys;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import jxl.common.Logger;
import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.sys.Form;
import net.loyin.model.sys.FormField;
import net.loyin.pageModel.DataGrid;

import com.jfinal.kit.StringKit;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;

import freemarker.template.Template;
/**
 * 表单
 * @author loyin 龙影
 *2013-06-23
 */
@RouteBind(path = "form")
public class FormCtrl extends AdminBaseController<Form> {
	private static Logger log=Logger.getLogger(FormCtrl.class);
	public FormCtrl() {
		this.tableName = Form.tableName;
		modelClass = Form.class;
	}
	public void dataGrid() {
		List<Object> param = new ArrayList<Object>();
		StringBuffer where = new StringBuffer();
		/** 添加查询字段条件*/
		String sortName = this.getPara("sort");
		String sortOrder = this.getPara("order", "desc");
		if (sortName != null) {
			where.append(" order by ");
			where.append(sortName);
			where.append(" ");
			where.append(sortOrder);
		}
		Page<Record> p = Db.paginate(this.getParaToInt("page", 1), this.getParaToInt("rows", 20), "select * ", "from " + this.tableName+ " where 1=1 " + where.toString(), param.toArray());
		DataGrid dg = new DataGrid();
		dg.setRows(p.getList());
		dg.setTotal(p.getTotalRow());
		this.renderJson(dg);
	}
	@SuppressWarnings("deprecation")
	public void generaterCode(){
		Long id=this.getParaToLong("ID");
		Form form=Form.dao.findById(id);
		List<FormField> fieldList=FormField.dao.find("select * from sys_formfield order by sortNum asc");
		Date now=new Date();
		String path=FormCtrl.class.getResource("/").toString().replace("WebContent/WEB-INF/classes","doc/temp").replace("file:/", "");
		try{
			Map<String,Object>p=new HashMap<String,Object>();
			p.put("model_name",form.getStr("zhus"));
			p.put("Model",StringKit.firstCharToUpperCase( form.getStr("tname")));
			p.put("model",StringKit.firstCharToLowerCase( form.getStr("tname")));
			p.put("package",form.getStr("package"));
			p.put("date",now);
			p.put("fieldList",fieldList);
				String[] dir=new File(path).list();
					for(String f:dir){
						if(!"code".equals(f)&&!"modelList".equals(f)&&!"html".equals(f)&&!f.endsWith(".html")&&!"sql".equals(f)){
							Template temp=new Template("", new FileReader(path+"/"+f));
							StringWriter out=new StringWriter();
							temp.process(p, out);
							File dir_java=new File(path+"/code/net/loyin/"+p.get("package")+"/"+f.toLowerCase());
							dir_java.mkdirs();
							File tf=new File(path+"/code/net/loyin/"+p.get("package")+"/"+f.toLowerCase()+"/"+p.get("Model")+f.replace("model", "")+".java");
							FileWriter fw=new FileWriter(tf);
							fw.write(out.toString());
							fw.flush();
							fw.close();
						}else if(!"html".equals(f)&&f.endsWith(".html")){
							Template temp=new Template("", new FileReader(path+"/"+f));
							StringWriter out=new StringWriter();
							temp.process(p, out);
							File tfDir=new File(path+"/code/html/"+p.get("package")+"/"+p.get("model")+"/");
							tfDir.mkdirs();
							File tf=new File(path+"/code/html/"+p.get("package")+"/"+p.get("model")+"/"+f);
							FileWriter fw=new FileWriter(tf);
							fw.write(out.toString().replaceAll("FF",""));
							fw.flush();
							fw.close();
						}else if("sql".equals(f)){
							//生成对应的sql
							Template temp=new Template("", new FileReader(path+"/"+f));
							StringWriter out=new StringWriter();
							temp.process(p, out);
							File tfDir=new File(path+"/code/sql/"+p.get("package")+"/"+p.get("model")+"/");
							tfDir.mkdirs();
							File tf=new File(path+"/code/sql/"+p.get("package")+"/"+p.get("model")+"/"+p.get("model")+".sql");
							FileWriter fw=new FileWriter(tf);
							fw.write(out.toString().replaceAll("FF",""));
							fw.flush();
							fw.close();
						}
					}
					this.rendJson_(true,"生成代码成功！");
		}catch(Exception e){
			log.error("生成代码异常！",e);
			this.rendJson_(false,"生成代码异常！");
		}
	}
}