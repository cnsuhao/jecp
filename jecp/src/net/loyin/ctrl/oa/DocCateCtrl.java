package net.loyin.ctrl.oa;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.DocCate;
/**
 * 文档类别
 * @author loyin
 *2013-3-31 上午11:14:41
 */
@RouteBind(path="docCate")
public class DocCateCtrl extends AdminBaseController<DocCate> {
	public DocCateCtrl(){
		this.tableName=DocCate.tableName;
		modelClass=DocCate.class;
	}
}
