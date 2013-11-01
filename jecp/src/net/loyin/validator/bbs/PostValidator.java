package net.loyin.validator.bbs;

import com.jfinal.core.Controller;
import com.jfinal.validate.Validator;

/**
 * Created with IntelliJ IDEA.
 * Author: StevenChow
 * Date: 13-5-9
 */
public class PostValidator extends Validator {
    @Override
    protected void validate(Controller c) {
        validateString("post.content", 1, 8000, "contentMsg", "不能为空且长度不超过50");
    }

    @Override
    protected void handleError(Controller c) {
        c.setAttr("msg", "内容不能为空且长度不超过8000");
        c.renderError(500);
    }
}
