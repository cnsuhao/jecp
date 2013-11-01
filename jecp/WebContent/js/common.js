function dateFormatYMD(date) {
	if (date != null && date.length > 0) {
		date = date.substring(0, 10);
	}
	return date;
}

// JS Object to String
// 不通用,因为拼成的JSON串格式不对
function obj2str(o) {
	var r = [];
	if (typeof o == "string" || o == null) {
		return "@" + o + "@";
	}
	if (typeof o == "object") {
		if (!o.sort) {
			r[0] = "{"
			for ( var i in o) {
				r[r.length] = "@" + i + "@";
				r[r.length] = ":";
				r[r.length] = obj2str(o[i]);
				r[r.length] = ",";
			}
			r[r.length - 1] = "}"
		} else {
			r[0] = "["
			for ( var i = 0; i < o.length; i++) {
				r[r.length] = obj2str(o[i]);
				r[r.length] = ",";
			}
			r[r.length - 1] = "]"
		}
		return r.join("");
	}
	return o.toString();
}

// JS String to Object
function strToObj(json) {
	return eval("(" + json + ")");
}

/*******************************************************************************
 * 列表点击不选择
 ******************************************************************************/
function unSelected(id, rowIndex, rowData) {
	var selected = $('#' + id).datagrid('getSelections');
	// 获取所有选中的行数组，如果里边有这个，不选中
	if (jQuery.inArray(rowData, selected) != -1) {
		$('#' + id).datagrid('unselectRow', rowIndex);
	} else {
		$('#' + id).datagrid('selectRow', rowIndex);
	}
	// 如果没有 则选中
}

function settilte(obj) {
	obj.title = $(obj).text();
}

// 消息提示
function messageshow(head, msg) {
	$.messager.show({
		title : head,
		msg : msg
	});
}

// 关闭弹出iframe
function closePayoutDialog() {
	iframeDialog.dialog('close');
}

/**
 * 根据长度截取先使用字符串，超长部分追加...
 * 
 * @param str
 *            对象字符串
 * @param len
 *            目标字节长度
 * @return 处理结果字符串
 */
function cutString(str, len) {
	// length属性读出来的汉字长度为1
	if (str.length * 2 <= len) {
		return str;
	}
	var strlen = 0;
	var s = "";
	for ( var i = 0; i < str.length; i++) {
		s = s + str.charAt(i);
		if (str.charCodeAt(i) > 128) {
			strlen = strlen + 2;
			if (strlen >= len) {
				return s.substring(0, s.length - 1) + "...";
			}
		} else {
			strlen = strlen + 1;
			if (strlen >= len) {
				return s.substring(0, s.length - 2) + "...";
			}
		}
	}
	return s;
}

/**
 * 字典表取数逻辑 paramLevel:类型 name:字段NAME id:字段id callback：回调函数名字
 */
function dictCombox(paramLevel, name, callback, id) {
	if (id != null) {
		$("#" + id + "").combobox(
				{
					url : 'dictParamAction!dictCombobox.action?paramLevel='
							+ paramLevel,
					valueField : 'paramValue',
					textField : 'paramName',
					mode : 'remote',
					panelHeight : 'auto',
					delay : 500,
					onSelect : function(record) {
						if (callback != null) {
							callback.apply(this, record)
						}
					}
				});
	}
	if (name != null) {
		$("input[name='" + name + "']").combobox(
				{
					url : 'dictParamAction!dictCombobox.action?paramLevel='
							+ paramLevel,
					valueField : 'paramValue',
					textField : 'paramName',
					mode : 'remote',
					panelHeight : 'auto',
					delay : 500,
					onSelect : function(record) {
						if (callback != null) {
							callback.apply(this, [ record ])
						}
					}
				});
	}
}

/**
 * 获取字典参数名字 paramLevel：参数类型 paramLevel：参数值
 */
function dictGetName(paramLevel, paramValue) {
	var name = '';
	$.ajax({
		url : 'dictParamAction!dictGetComboboxName.action',
		data : {
			paramLevel : paramLevel,
			paramValue : paramValue
		},
		dataType : 'json',
		cache : false,
		async : false,
		success : function(response) {
			if (response) {
				name = response.paramName;
			}
		}
	});
	return name;
}
function ValidForm(){
	$(".validate").validate({
		errorClass: "error",
		errore: "label",
		highlight:function(e, errorClass, validClass) {
			$(e).addClass("ferr");
		},
		unhighlight: function(e, errorClass, validClass) {
			$(e).removeClass("ferr");
		},
		submitHandler:function(){
			ajaxSubmit(".validate");
			return true;
		}
	});
}
function ajaxSubmit(form_){
	$.messager.progress({
		text : '数据提交中....',
		interval : 1000
	});
	var $form=$(form_);
	var action=$form.attr("action");
	var startEvent=$form.attr("startEvent");
	if(startEvent!=undefined&&startEvent!=""){
		eval(startEvent);
	}
	$.ajax({url:action,data:$form.serialize(),cache:false,dataType:'json',type:'POST',success:function(data){
		if(true==data.success){
			try{$("#poid",$form).val(data.idVal);}catch(e){}
			var event=$form.attr("event");
			if(event!=null&&event!=""){
				eval(event);
			}
		}
		$.messager.progress('close');
		if(true!=data.success)
		$.messager.alert("提示",data.msg);
	}});
}