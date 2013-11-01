package net.loyin.ctrl.oa;

import net.loyin.ctrl.AdminBaseController;
import net.loyin.jfinal.anatation.RouteBind;
import net.loyin.model.oa.ArticleCate;
/**
 * 文章类别
 * @author loyin
 *2013-3-31 上午11:14:41
 */
@RouteBind(path="articleCate")
public class ArticleCateCtrl extends AdminBaseController<ArticleCate> {
	public ArticleCateCtrl(){
		this.tableName=ArticleCate.tableName;
		modelClass=ArticleCate.class;
	}
}
