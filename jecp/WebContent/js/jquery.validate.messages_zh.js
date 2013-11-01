/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, 中文 (Zhōngwén), 汉语, 漢語)
 */
jQuery.extend(jQuery.validator.messages, {
        required: "必填项",
		remote: "请修正该项",
		email: "请输入正确格式的电子邮件",
		url: "请输入合法的网址",
		date: "请输入合法的日期",
		dateISO: "请输入合法的日期 (ISO).",
		number: "请输入合法的数字",
		digits: "只能输入整数",
		creditcard: "请输入合法的信用卡号",
		equalTo: "请再次输入相同的值",
		accept: "请输入拥有合法后缀名的字符串",
		maxlength: jQuery.validator.format("长度最多是 {0}"),
		minlength: jQuery.validator.format("长度最少是 {0}"),
		rangelength: jQuery.validator.format("长度介于 {0} 和 {1} 之间"),
		range: jQuery.validator.format("数值介于 {0} 和 {1} 之间"),
		max: jQuery.validator.format("数值最大为 {0}"),
		min: jQuery.validator.format("数值最小为 {0}")
});