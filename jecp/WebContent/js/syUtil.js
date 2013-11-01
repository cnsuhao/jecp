String.prototype.format=function(){
	var args=arguments;
	return this.replace(/\{(\d+)\}/g,function (m,i){return args[i];});
};
String.prototype.format1=function(args){
	return this.replace(/\{(\d+)\}/g,function (m,i){
		return args[i];});
};
String.prototype.replaceAll = function(s1, s2) {
	return this.replace(new RegExp(s1, "gm"), s2);
};
/**
 * 包含easyui的扩展和常用的方法
 */
var sy = $.extend({}, sy);/* 定义全局对象，类似于命名空间或包的作用 */

/**
 * 取消easyui默认开启的parser
 * 在页面加载之前，先开启一个进度条
 * 然后在页面所有easyui组件渲染完毕后，关闭进度条
 * @requires jQuery,easyUI
 */
$.parser.auto = false;
$(function() {
	$.messager.progress({
		text : '页面加载中....',
		interval : 100
	});
	//update-begin author:JEECG-北京-夜雨 date:20130201  for:jsp不使用任何easyui控件会出问题-----------
	var a=0;
    for ( var i = 0; i < $.parser.plugins.length; i++) {  
        var name = $.parser.plugins[i];// 控件名  
        // 查找class为easyui-控件名的jq对象，例如，easyui-layout    
        var rrrr = $(".easyui-" + name,window.document);   
        if (rrrr.length==0&&$("#indexLayout",window.document).length==0) { 
             a++;
        }
    }
    if(a>=$.parser.plugins.length-1){
    	$.messager.progress('close');
    	return ;
    }
	//update-end author:JEECG-北京-夜雨 date:20130201  for:jsp不使用任何easyui控件会出问题------------
	$.parser.parse(window.document);
	window.setTimeout(function() {
		$.messager.progress('close');
		if (self != parent) {
			window.setTimeout(function() {
				try {
					parent.$.messager.progress('close');
				} catch (e) {
				}
			}, 500);
		}
	}, 1);
	$.parser.auto = true;
});

/**
 * 使panel和datagrid在加载时提示
 * @author 
 * @requires jQuery,easyUI
 */
$.fn.panel.defaults.loadingMessage = '加载中....';
$.fn.datagrid.defaults.loadMsg = '加载中....';

/**
 * @author 
 * @requires jQuery,easyUI
 * 通用错误提示
 * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
 */
var easyuiErrorFunction = function(XMLHttpRequest) {
	$.messager.progress('close');
	$.messager.alert('错误', XMLHttpRequest.responseText);
};
$.fn.datagrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.treegrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.tree.defaults.onLoadError = easyuiErrorFunction;
$.fn.combogrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.combobox.defaults.onLoadError = easyuiErrorFunction;
$.fn.form.defaults.onLoadError = easyuiErrorFunction;

/**
 * @author 
 * @requires jQuery,easyUI
 * 为datagrid、treegrid增加表头菜单，用于显示或隐藏列，注意：冻结列不在此菜单中
 */
var createGridHeaderContextMenu = function(e, field) {
	e.preventDefault();
	var grid = $(this);/* grid本身 */
	var headerContextMenu = this.headerContextMenu;/* grid上的列头菜单对象 */
	if (!headerContextMenu) {
		var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
		var fields = grid.datagrid('getColumnFields');
		for ( var i = 0; i < fields.length; i++) {
			var fildOption = grid.datagrid('getColumnOption', fields[i]);
			if (!fildOption.hidden) {
				$('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
			} else {
				$('<div iconCls="icon-empty" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
			}
		}
		headerContextMenu = this.headerContextMenu = tmenu.menu({
			onClick : function(item) {
				var field = $(item.target).attr('field');
				if (item.iconCls == 'icon-ok') {
					grid.datagrid('hideColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'icon-empty'
					});
				} else {
					grid.datagrid('showColumn', field);
					$(this).menu('setIcon', {
						target : item.target,
						iconCls : 'icon-ok'
					});
				}
			}
		});
	}
	headerContextMenu.menu('show', {
		left : e.pageX,
		top : e.pageY
	});
};
$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;

/**
 * @author 
 * @requires jQuery,easyUI
 * 防止panel/window/dialog组件超出浏览器边界
 * @param left
 * @param top
 */
var easyuiPanelOnMove = function(left, top) {
	if (left < 0) {
		$(this).window('move', {
			left : 1
		});
	}
	if (top < 0) {
		$(this).window('move', {
			top : 1
		});
	}
	var width = $(this).panel('options').width;
	var height = $(this).panel('options').height;
	var right = left + width;
	var buttom = top + height;
	var browserWidth = $(document).width();
	var browserHeight = $(document).height();
	if (right > browserWidth) {
		$(this).window('move', {
			left : browserWidth - width
		});
	}
	if (buttom > browserHeight) {
		$(this).window('move', {
			top : browserHeight - height
		});
	}
};
$.fn.panel.defaults.onMove = easyuiPanelOnMove;
$.fn.window.defaults.onMove = easyuiPanelOnMove;
$.fn.dialog.defaults.onMove = easyuiPanelOnMove;

/**
 * @author 
 * @requires jQuery,easyUI
 * panel关闭时回收内存
 */
$.fn.panel.defaults.onBeforeDestroy = function() {
	var frame = $('iframe', this);
	try {
		if (frame.length > 0) {
			frame[0].contentWindow.document.write('');
			frame[0].contentWindow.close();
			frame.remove();
			if ($.browser.msie) {
				CollectGarbage();
			}
		}
	} catch (e) {
	}
};

/**
 * @author 
 * @requires jQuery,easyUI
 * 扩展validatebox，添加验证两次密码功能
 */
$.extend($.fn.validatebox.defaults.rules, {
	eqPassword : {
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '密码不一致！'
	}
});

/**
 * @author 
 * @requires jQuery,easyUI
 * 扩展datagrid，添加动态增加或删除Editor的方法
 * 例子如下，第二个参数可以是数组
 * datagrid.datagrid('removeEditor', 'cpwd');
 * datagrid.datagrid('addEditor', [ { field : 'ccreatedatetime', editor : { type : 'datetimebox', options : { editable : false } } }, { field : 'cmodifydatetime', editor : { type : 'datetimebox', options : { editable : false } } } ]);
 */
$.extend($.fn.datagrid.methods, {
	addEditor : function(jq, param) {
		if (param instanceof Array) {
			$.each(param, function(index, item) {
				var e = $(jq).datagrid('getColumnOption', item.field);
				e.editor = item.editor;
			});
		} else {
			var e = $(jq).datagrid('getColumnOption', param.field);
			e.editor = param.editor;
		}
	},
	removeEditor : function(jq, param) {
		if (param instanceof Array) {
			$.each(param, function(index, item) {
				var e = $(jq).datagrid('getColumnOption', item);
				e.editor = {};
			});
		} else {
			var e = $(jq).datagrid('getColumnOption', param);
			e.editor = {};
		}
	}
});

/**
 * @author 
 * @requires jQuery,easyUI
 * 扩展datagrid的editor
 * 增加带复选框的下拉树
 * 增加日期时间组件editor
 * 增加多选combobox组件
 */
$.extend($.fn.datagrid.defaults.editors, {
	combocheckboxtree : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			options.multiple = true;
			editor.combotree(options);
			return editor;
		},
		destroy : function(target) {
			$(target).combotree('destroy');
		},
		getValue : function(target) {
			return $(target).combotree('getValues').join(',');
		},
		setValue : function(target, value) {
			$(target).combotree('setValues', sy.getList(value));
		},
		resize : function(target, width) {
			$(target).combotree('resize', width);
		}
	},
	datetimebox : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			editor.datetimebox(options);
			return editor;
		},
		destroy : function(target) {
			$(target).datetimebox('destroy');
		},
		getValue : function(target) {
			return $(target).datetimebox('getValue');
		},
		setValue : function(target, value) {
			$(target).datetimebox('setValue', value);
		},
		resize : function(target, width) {
			$(target).datetimebox('resize', width);
		}
	},
	multiplecombobox : {
		init : function(container, options) {
			var editor = $('<input />').appendTo(container);
			options.multiple = true;
			editor.combobox(options);
			return editor;
		},
		destroy : function(target) {
			$(target).combobox('destroy');
		},
		getValue : function(target) {
			return $(target).combobox('getValues').join(',');
		},
		setValue : function(target, value) {
			$(target).combobox('setValues', sy.getList(value));
		},
		resize : function(target, width) {
			$(target).combobox('resize', width);
		}
	}
});

/**
 * @author 
 * @requires jQuery,easyUI,jQuery cookie plugin
 * 更换easyUI主题的方法
 * @param themeName
 *            主题名称
 */
sy.changeTheme = function(themeName) {
	var $easyuiTheme = $('#easyuiTheme');
	var url = $easyuiTheme.attr('href');
	var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
	$easyuiTheme.attr('href', href);

	var $iframe = $('iframe');
	if ($iframe.length > 0) {
		for ( var i = 0; i < $iframe.length; i++) {
			var ifr = $iframe[i];
			$(ifr).contents().find('#easyuiTheme').attr('href', href);
		}
	}

	$.cookie('easyuiThemeName', themeName, {
		expires : 7
	});
};

/**
 * @author 
 * 获得项目根路径
 * 使用方法：sy.bp();
 * @returns 项目根路径
 */
sy.bp = function() {
	var curWwwPath = window.document.location.href;
	var pathName = window.document.location.pathname;
	var pos = curWwwPath.indexOf(pathName);
	var localhostPaht = curWwwPath.substring(0, pos);
	var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
	return (localhostPaht + projectName);
};

/**
 * @author 
 * 使用方法:sy.pn();
 * @returns 项目名称(/sshe)
 */
sy.pn = function() {
	return window.document.location.pathname.substring(0, window.document.location.pathname.indexOf('\/', 1));
};

/**
 * @author 
 * 增加命名空间功能
 * 使用方法：sy.ns('jQuery.bbb.ccc','jQuery.eee.fff');
 */
sy.ns = function() {
	var o = {}, d;
	for ( var i = 0; i < arguments.length; i++) {
		d = arguments[i].split(".");
		o = window[d[0]] = window[d[0]] || {};
		for ( var k = 0; k < d.slice(1).length; k++) {
			o = o[d[k + 1]] = o[d[k + 1]] || {};
		}
	}
	return o;
};

/**
 * @author 郭华(夏悸)
 * 生成UUID
 * @returns UUID字符串
 */
sy.random4 = function() {
	return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
};
sy.UUID = function() {
	return (sy.random4() + sy.random4() + "-" + sy.random4() + "-" + sy.random4() + "-" + sy.random4() + "-" + sy.random4() + sy.random4() + sy.random4());
};

/**
 * @author 
 * 获得URL参数
 * @returns 对应名称的值
 */
sy.getUrlParam = function(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
};

/**
 * @author 
 * 接收一个以逗号分割的字符串，返回List，list里每一项都是一个字符串
 * @returns list
 */
sy.getList = function(value) {
	if (value != undefined && value != '') {
		var values = [];
		var t = value.split(',');
		for ( var i = 0; i < t.length; i++) {
			values.push('' + t[i]);/* 避免他将ID当成数字 */
		}
		return values;
	} else {
		return [];
	}
};

/**
 * @author 
 * @requires jQuery
 * 判断浏览器是否是IE并且版本小于8
 * @returns true/false
 */
sy.isLessThanIe8 = function() {
	return ($.browser.msie && $.browser.version < 8);
};

/**
 * @author 
 * @requires jQuery
 * 将form表单元素的值序列化成对象
 * @returns object
 */
sy.serializeObject = function(form) {
	var o = {};
	$.each(form.serializeArray(), function(index) {
		if (o[this['name']]) {
			o[this['name']] = o[this['name']] + "," + this['value'];
		} else {
			o[this['name']] = this['value'];
		}
	});
	return o;
};

/**
 * 将JSON对象转换成字符串
 * @param o
 * @returns string
 */
sy.jsonToString = function(o) {
	var r = [];
	if (typeof o == "string")
		return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
	if (typeof o == "object") {
		if (!o.sort) {
			for ( var i in o)
				r.push(i + ":" + obj2str(o[i]));
			if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
				r.push("toString:" + o.toString.toString());
			}
			r = "{" + r.join() + "}";
		} else {
			for ( var i = 0; i < o.length; i++)
				r.push(obj2str(o[i]));
			r = "[" + r.join() + "]";
		}
		return r;
	}
	return o.toString();
};

/**
 * @author 郭华(夏悸)
 * 格式化日期时间
 * @param format
 * @returns
 */
Date.prototype.format = function(format) {
	if (isNaN(this.getMonth())) {
		return '';
	}
	if (!format) {
		format = "yyyy-MM-dd hh:mm:ss";
	}
	var o = {
		/* month */
		"M+" : this.getMonth() + 1,
		/* day */
		"d+" : this.getDate(),
		/* hour */
		"h+" : this.getHours(),
		/* minute */
		"m+" : this.getMinutes(),
		/* second */
		"s+" : this.getSeconds(),
		/* quarter */
		"q+" : Math.floor((this.getMonth() + 3) / 3),
		/* millisecond */
		"S" : this.getMilliseconds()
	};
	if (/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	}
	for ( var k in o) {
		if (new RegExp("(" + k + ")").test(format)) {
			format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
		}
	}
	return format;
};

/**
 * @author 
 * @requires jQuery
 * 改变jQuery的AJAX默认属性和方法
 */
$.ajaxSetup({
	type : 'POST',
	error : function(XMLHttpRequest, textStatus, errorThrown) {
		$.messager.progress('close');
		$.messager.alert('错误', XMLHttpRequest.responseText);
	}
});
/**上传图片*/
var swfuploaddir=root+"/js/swfupload";
function creatSWFUptoolImg(buttontext,upsuchandlerFun,custom_settings_,buttonid,
		upload_url,post_params,file_size_limit,file_upload_limit){
	if(upload_url==undefined||""==upload_url){
		upload_url=root+"/file/swfup";
	}
	if(post_params==undefined||""==post_params){
		post_params={};
	}
	if(file_size_limit==undefined||""==file_size_limit){
		file_size_limit="1 MB";
	}
	if(file_upload_limit==undefined||""==file_upload_limit){
		file_size_limit=1;
	}
	alert(upload_url);
	return new SWFUpload({
		upload_url:upload_url,
		post_params:post_params,
        file_post_name: "filedata",
		file_size_limit :file_size_limit,
		file_types : "*.jpg;*.png;*.jpeg'*.bmp",
		file_types_description : "bmp,jpeg,jpg,png图片",
		file_upload_limit :file_upload_limit,
		swfupload_preload_handler : preLoad,
		swfupload_load_failed_handler : loadFailed,
		file_queue_error_handler : fileQueueError,
		file_dialog_complete_handler : fileDialogComplete,
		upload_progress_handler : uploadProgress,
		upload_error_handler : uploadError,
		upload_success_handler :upsuchandlerFun,
		upload_complete_handler : uploadComplete,
		// Button Settings
		button_image_url : root+"/img/SmallSpyGlassWithTransperancy_17x18.png",
		button_placeholder_id :buttonid,
		button_width: 80,
		button_height: 18,
		button_text : '<span class="button">'+buttontext+'</span>',
		button_text_style : '.button {font-size: 12pt; }',
		button_text_top_padding: 0,
		button_text_left_padding: 18,
		button_window_mode: SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_cursor: SWFUpload.CURSOR.HAND,
		// Flash Settings
		flash_url : swfuploaddir+"/swfupload.swf",
		flash9_url : swfuploaddir+"/swfupload_fp9.swf",
		custom_settings :custom_settings_,
		debug: false
	});
}