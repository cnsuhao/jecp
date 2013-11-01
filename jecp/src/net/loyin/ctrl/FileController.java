package net.loyin.ctrl;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.ArrayUtils;

import net.loyin.jfinal.anatation.PowerBind;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.jfinal.model.IdGenerater;
import net.loyin.model.oa.FileBox;

import com.google.gson.Gson;
import com.jfinal.upload.UploadFile;

@SuppressWarnings("rawtypes")
@RouteBind(path = "/file")
public class FileController extends AdminBaseController {
	protected static IdGenerater idGenerater=new IdGenerater();
	public static String uploadroot = "/upload/";
	private static String root;
	//图片扩展名
	private static String[] imgFileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
	private static String[] mediaFileTypes= new String[]{"avi", "flv", "mp4"};
	private static String[] zipFileTypes= new String[]{"rar", "zip", "war","jar"};
	/**单个或多个文件上传      swfupload*/
	@SuppressWarnings("deprecation")
	@PowerBind
	public void up() {
		String savefilename="";
		StringBuffer files=new StringBuffer();
		List<UploadFile> upfilelist = this.getFiles();
		Map<String,Object> jsonMap=new HashMap<String,Object>();
		jsonMap.put("error",0);
		if(upfilelist!=null&&upfilelist.isEmpty()==false){
			if(root==null)
				root=this.getRequest().getContextPath();
			String realPath = this.getRequest().getRealPath("/");
			int fsize=upfilelist.size();
			int i=1;
			Long uid=this.getCurrentUserId();
			for(UploadFile upfile:upfilelist){
				File file = upfile.getFile();
				Map<String,Object>fbattrs=new HashMap<String,Object>();
				fbattrs.put("id",null);
				fbattrs.put("uid",uid);
				fbattrs.put("ctime",new Date());
				String filedataFileName = upfile.getOriginalFileName();
				fbattrs.put("filename",filedataFileName);
				String filetype=filedataFileName.substring(filedataFileName.lastIndexOf(".")+1).toLowerCase();
				String subdir=this.getPara("dir");
				if(subdir==null||"".equals(subdir)){
					subdir="file";
				}
				File dir=new File(realPath +uploadroot+subdir);
				if(!dir.exists()){
					dir.mkdirs();
				}
				savefilename =  subdir+"/"+idGenerater.to62(new Date().getTime())+"."+filetype ;
				fbattrs.put("filepath",savefilename);
				if(ArrayUtils.contains(imgFileTypes,filetype))
					fbattrs.put("ftype","img");
				else
				if(ArrayUtils.contains(mediaFileTypes,filetype))
					fbattrs.put("ftype","media");
				else
				if(ArrayUtils.contains(zipFileTypes,filetype))
					fbattrs.put("ftype","zip");
				else
					fbattrs.put("ftype","oth");
				file.renameTo(new File(realPath +uploadroot+ savefilename));
				files.append(root+uploadroot+savefilename);
				FileInputStream io=null;
				try{
					 io=new FileInputStream(realPath +uploadroot+ savefilename);
				fbattrs.put("size",io.available()/FileBox.mb);
				}catch(Exception eef){}finally{ try{if(io!=null)io.close();}catch(Exception eef1){}}
				if(i<fsize)
					files.append(",");
				i++;
				FileBox.dao.setAttrs(fbattrs);
				FileBox.dao.save();
			}
			jsonMap.put("url",files);
		}else{
			jsonMap.put("error",1);
			jsonMap.put("message","上传文件失败。");
		}
		this.renderJson(new Gson().toJson(jsonMap));
	}
	
	/**文件下载 */
	@PowerBind
	public void down() {
		
	}
	/***
	 * swf文件上传
	 */
	@SuppressWarnings("deprecation")
	public void swfup() {
		String errmsg ="", savefilename="";
		StringBuffer files=new StringBuffer();
		List<UploadFile> upfilelist = this.getFiles();
		boolean suc=false;
		if(upfilelist!=null&&upfilelist.isEmpty()==false){
			if(root==null)
				root=this.getRequest().getContextPath();
			String realPath = this.getRequest().getRealPath("/");
			Long uid=this.getParaToLong("uid");
			int fsize=upfilelist.size();
			int i=1;
			for(UploadFile upfile:upfilelist){
				File file = upfile.getFile();
				if(file != null){
					Map<String,Object>fbattrs=new HashMap<String,Object>();
					fbattrs.put("id",null);
					fbattrs.put("uid",uid);
					fbattrs.put("ctime",new Date());
					String filedataFileName = upfile.getOriginalFileName();
					fbattrs.put("filename",filedataFileName);
					String ftype=filedataFileName.substring(filedataFileName.lastIndexOf(".")+1);
					savefilename =  idGenerater.to62(new Date().getTime())+"."+ftype;
					fbattrs.put("filepath",savefilename);
					if(ArrayUtils.contains(imgFileTypes,ftype))
						fbattrs.put("ftype","img");
					else
					if(ArrayUtils.contains(mediaFileTypes,ftype))
						fbattrs.put("ftype","media");
					else
					if(ArrayUtils.contains(zipFileTypes,ftype))
						fbattrs.put("ftype","zip");
					else
						fbattrs.put("ftype","oth");
					upfile.getFile().renameTo(new File(realPath +uploadroot+ savefilename));
					FileInputStream io=null;
					try{
						 io=new FileInputStream(realPath +uploadroot+ savefilename);
					fbattrs.put("size",io.available()/FileBox.mb);
					}catch(Exception eef){}finally{ try{if(io!=null)io.close();}catch(Exception eef1){}}
					FileBox.dao.setAttrs(fbattrs);
					FileBox.dao.save();
					suc=true;
					files.append(root+uploadroot+savefilename);
					if(i<fsize)
						files.append(",");
				}
				i++;
			}
		}else{
			errmsg="未上传文件";
		}
		this.renderText("{'err':'" + errmsg + "','msg':'" +files.toString()+ "','suc':"+suc+"}");
	}
	@SuppressWarnings({ "unchecked", "deprecation" })
	public void manager(){
		HttpServletRequest request=this.getRequest();
		//根目录路径，可以指定绝对路径，比如 /var/www/attached/
		String rootPath = request.getRealPath("/") + uploadroot;
		//根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
		String rootUrl  = request.getContextPath() +uploadroot;
		//图片扩展名
		String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};

		String dirName = request.getParameter("dir");
		if (dirName != null) {
			if(!Arrays.<String>asList(new String[]{"","image", "flash", "media", "file"}).contains(dirName)){
				renderText("I无效目录名称");
				return;
			}
			rootPath += dirName + "/";
			rootUrl += dirName + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		//根据path参数，设置各路径和URL
		String path = request.getParameter("path") != null ? request.getParameter("path") : "";
		String currentPath = rootPath + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}

		//排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";

		//不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			renderText("此目录禁止访问");
			return;
		}
		//最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			renderText("参数无效");
			return;
		}
		//目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if(!currentPathFile.isDirectory()){
			renderText("目录不存在");
			return;
		}

		//遍历目录取的文件信息
		List<Hashtable<String,Object>> fileList = new ArrayList<Hashtable<String,Object>>();
		if(currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if(file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if(file.isFile()){
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
			}
		}

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("moveup_dir_path", moveupDirPath);
		result.put("current_dir_path", currentDirPath);
		result.put("current_url", currentUrl);
		result.put("total_count", fileList.size());
		result.put("file_list", fileList);
		this.renderJson(result);
	}
	@SuppressWarnings("rawtypes")
	public class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
			}
		}
	}
	@SuppressWarnings("rawtypes")
	public class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
					return 1;
				} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}
	@SuppressWarnings("rawtypes")
	public class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
			}
		}
	}
}