package net.loyin.ctrl.rpt;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.loyin.cfg.JFWebConfig;
import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.rpt.ReportSqlResult;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.base.JRBaseReport;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporter;
import net.sf.jasperreports.engine.export.ooxml.JRDocxExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;

import org.apache.ibatis.mapping.Environment;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;

/**
 * 报表引擎
 * <pre>
 * 报表文件名：
 * 	 如含SQL则为外部BeanSource,使用myBatis执行外部的SQL。
 * 	 则是内部数据源执行DataSource
 * </pre>
 * @author 刘声凤
 *2013年12月13日
 */
@RouteBind(path = "report")
@SuppressWarnings("rawtypes")
public class ResportCtrl extends AdminBaseController{
	/**报表文件后缀*/
	private static final String REPORT_FILETYPE = ".jasper";
	/**跳转到 notFund.html*/
	private static final String NOTFUND = "notFund";
	/**图片访问链接*/
	private static String IMAGES_URI="/rpt/report/loadImg/?file=";
	/**报表模版路径 */
	private static String REPORT_DIR=null;
	/**报表存放图片路径 */
	private static String REPORT_IMAGE_DIR=null;
	/***展示报表*/
	@SuppressWarnings("deprecation")
	public void index(){
		if(REPORT_DIR==null){
			REPORT_DIR=this.getRequest().getRealPath("/")+"/WEB-INF/report/";
		}
		//报表文件名
		String reportName =this.getPara(0);
        // 报表编译之后生成的.jasper文件的存放位置
        File reportFile = new File(REPORT_DIR+reportName+REPORT_FILETYPE);
        if(reportFile.exists()==false)
        {
        	this.renderHTML(NOTFUND);
        	return;
        }
        try{
        	Map<String ,Object> parameters=new HashMap<String,Object>();//参数
        	Map<String,String[]> paraMap= this.getParaMap();
        	//传递参数到 报表中
        	for(String key:paraMap.keySet()){
        		String[] val=paraMap.get(key);
        		parameters.put(key, val[0]);//只能传一个值
        		System.out.println(val[0]);
        	}
        	int expFileType=this.getParaToInt(1,-1);//导出文件类型 0:PDF 1:WORD 2:EXCEL
           String expFileName=this.getPara(2,reportName);//导出文件名
           DataSource dataSource = JFWebConfig.druidPlugin.getDataSource();
        	Connection conn = dataSource.getConnection();
        	//外部数据源导入到parameters中 使用myBatis查询
        	if(reportName.contains("SQL")){
        		TransactionFactory transactionFactory = new JdbcTransactionFactory();
        		Environment environment =new Environment("development", transactionFactory, dataSource);
        		Configuration configuration = new Configuration(environment);
        		configuration.addMapper(ReportSqlResult.class);//映射到 ReportSqlResult
        		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);
        		SqlSession sqlSession=sqlSessionFactory.openSession();
        		List result= sqlSession.selectList("sqlName", paraMap);
        	}
        	JasperReport  jasperReport=(JasperReport)JRLoader.loadObject(reportFile);
        	JasperPrint jasperPrint=JasperFillManager.fillReport(jasperReport, parameters, conn);
        	toReport( expFileType,expFileName, jasperReport,jasperPrint);
        }catch(Exception e){
        	e.printStackTrace();
        }
        renderNull();
	}
	/**
	 * 导出对应的表模版
	 * @param expFileType
	 * @param expFileName
	 * @param jasperReport
	 * @param jasperPrint
	 * @throws Exception
	 * @throws SecurityException
	 */
	@SuppressWarnings("deprecation")
	private void toReport(int expFileType,String expFileName,JasperReport  jasperReport,JasperPrint jasperPrint) throws Exception, SecurityException{
		HttpServletResponse response=this.getResponse();
		// 防止浏览器缓冲
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		JRExporter exporter =null;
        OutputStream out=response.getOutputStream();
        OutputStreamWriter outWriter=new OutputStreamWriter(response.getOutputStream());
    	switch (expFileType){
    	case 0://导出PDF
    		response.setContentType("application/pdf"); 
    		String outFileName=expFileName+".pdf";  
    		String fileName = new String(outFileName.getBytes("GBK"), "utf-8");  
            response.setHeader("Content-disposition", "attachment; filename="+ fileName); 
            JasperExportManager.exportReportToPdfStream(jasperPrint, out);//输出 
    		break;
    	case 1://导出 WORD
    		response.setContentType("application/msword;charset=utf-8");
    		 outFileName=expFileName+".docx";  
    		 fileName = new String(outFileName.getBytes("GBK"), "utf-8");  
            response.setHeader("Content-disposition", "attachment; filename="+ fileName);  
    		exporter=new JRDocxExporter();
    		exporter.setParameter(JRDocxExporterParameter.CHARACTER_ENCODING,"GBK");  
            exporter.setParameter(JRDocxExporterParameter.JASPER_PRINT,jasperPrint);
            exporter.setParameter(JRDocxExporterParameter.OUTPUT_STREAM, out);
    		break;
    	case 2://导出 EXCEL
    		exporter=new JRXlsExporter();
    		/** 如果导出的是excel，则需要去掉周围的margin*/  
              Field margin = JRBaseReport.class.getDeclaredField("leftMargin");  
              margin.setAccessible(true);  
              margin.setInt(jasperReport, 0);  
              margin = JRBaseReport.class.getDeclaredField("topMargin");  
              margin.setAccessible(true);  
              margin.setInt(jasperReport, 0);  
              margin = JRBaseReport.class.getDeclaredField("bottomMargin");  
              margin.setAccessible(true);  
              margin.setInt(jasperReport, 0);  
              Field pageHeight = JRBaseReport.class.getDeclaredField("pageHeight");  
              pageHeight.setAccessible(true);  
//              pageHeight.setInt(jasperReport, 2147483647);
              /** 设置头信息*/
              response.setContentType("application/vnd.ms-excel");  
              outFileName=expFileName+".xls";  
              fileName = new String(outFileName.getBytes("GBK"), "utf-8");  
              response.setHeader("Content-disposition", "attachment; filename=" + fileName);  
              exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);  
              exporter.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET,Boolean.FALSE);  
              exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND,Boolean.FALSE);
              exporter.setParameter(JRXlsExporterParameter.CHARACTER_ENCODING,"GBK");  
              exporter.setParameter(JRXlsExporterParameter.JASPER_PRINT,jasperPrint);
              exporter.setParameter(JRXlsExporterParameter.OUTPUT_STREAM,out);
    		break;
    	default: //显示HTML
        	exporter=new JRHtmlExporter();
        	exporter.setParameter(JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN, Boolean.FALSE);
        	exporter.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
        	exporter.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,Boolean.TRUE);
        	exporter.setParameter(JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR,Boolean.TRUE);//输出图片到目录
        	exporter.setParameter(JRHtmlExporterParameter.IMAGES_DIR,new File(this.getRequest().getRealPath("/")+"upload/report"));//图片保存目录
        	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,IMAGES_URI);//图片访问URI
        	exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,"/rpt/report/loadImg/");//图片访问URI
        	exporter.setParameter(JRHtmlExporterParameter.JASPER_PRINT, jasperPrint);
        	exporter.setParameter(JRHtmlExporterParameter.OUTPUT_WRITER, outWriter);
    	}
    	if(expFileType!=0){
    		exporter.exportReport();
    	}
    	out.flush();
    	out.close();
	}
	/**加载保存到报表生成的图片,显示完后删除*/
	@SuppressWarnings("deprecation")
	public void loadImg(){
		HttpServletResponse response = this.getResponse();
		if(REPORT_IMAGE_DIR==null){
			REPORT_IMAGE_DIR=this.getRequest().getRealPath("/")+"upload/report/";
		}
		File f= new File(REPORT_IMAGE_DIR+this.getPara(0));
		response.setContentType("image/jpeg");
		// 防止浏览器缓冲
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		if(f.exists()&&f.isDirectory()==false&&f.isFile()){
			try {
				ServletOutputStream out = response.getOutputStream();
				ByteArrayOutputStream bos = new ByteArrayOutputStream();
				FileInputStream fi= new FileInputStream(f);
				byte[] buf =new byte[1024];
				while((fi.read(buf))!=-1){
					out.write(buf);
				}
				fi.close();
				bos.close();
				out.close();
			} catch (Exception e) {}finally{
				f.deleteOnExit();
			}
		}
		renderNull();
	}
}
