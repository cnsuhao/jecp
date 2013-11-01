jQuery.validator.addMethod("mobile", function(value, element) { 
var length = value.length; 
var mobile = /^(((13[0-9]{1})|(14[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
return this.optional(element) || (length == 11 && mobile.test(value)); 
}, "手机号码格式错误");
jQuery.validator.addMethod("phone", function(value, element) { 
	var tel = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$/; 
	return this.optional(element) || (tel.test(value)); 
	}, "电话号码格式为010-12345678");
jQuery.validator.addMethod("zipCode", function(value, element) { 
	var tel = /^[0-9]{6}$/; 
	return this.optional(element) || (tel.test(value)); 
	}, "邮政编码格式错误");
jQuery.validator.addMethod("qq", function(value, element) {
	var tel = /^[1-9]\d{4,9}$/; 
	return this.optional(element) || (tel.test(value)); 
	}, "QQ号码格式错误");
jQuery.validator.addMethod("ip", function(value, element) { 
	var ip = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/; 
	return this.optional(element) || (ip.test(value) && (RegExp.$1 < 256 && RegExp.$2 < 256 && RegExp.$3 < 256 && RegExp.$4 < 256)); 
	}, "Ip地址格式错误");
jQuery.validator.addMethod("chrnum", function(value, element) {
	var chrnum = /^([a-zA-Z0-9]+)$/;
	return this.optional(element) || (chrnum.test(value));
	}, "只能是数字和字母(字符A-Z, a-z, 0-9)");
jQuery.validator.addMethod("chinese", function(value, element) {
	var chinese = /^[\u4e00-\u9fa5]+$/;
	return this.optional(element) || (chinese.test(value));
	}, "只能输入中文");
//下拉框验证
$.validator.addMethod("selectNone", function(value, element) {
return value == "请选择";
}, "必须选择一项");
//字符验证 
jQuery.validator.addMethod("stringCheck", function(value, element) { 
return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value); 
}, "只能包括中文字、英文字母、数字和下划线");
//身份证号码验证 
jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
return this.optional(element) || /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/.test(value)||/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/.test(value); 
}, "请正确输入您的身份证号码");
//字节长度验证
jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
	var length = value.length;
	for (var i = 0; i < value.length; i++) {
		if (value.charCodeAt(i) > 127) {
		length++;
		}
	}
return this.optional(element) || (length >= param[0] && length <= param[1]);
},$.validator.format("请确保输入的值在{0}-{1}个字节之间(一个中文字算2个字节)"));