/**
 * 公共js方法
 */
var WebUtils={};
/**
 * 公共初始化
 */
$.ajaxSetup({
//	contentType:"application/x-www-form-urlencoded; charset=utf-8"
//	contentType:"application/json;charset=utf-8"
});
$.ajaxSettings.traditional = true;

/**
 * 增加事件监听
 * 
 * obj
 * evt
 * func
 */
WebUtils.addEvent = function (obj,evt,func,evtobj){
	evtobj = !evtobj?obj:evtobj;
	if(obj.addEventListener){
		obj.addEventListener(evt,func,false);
	}else if(evtobj.attachEvent){
		obj.attachEvent('on'+evt,func);
	}
};

/**
 * 主页上新建TAB页
 * 
 * tabid  区分Tab的id
 * text   Tab页显示名称
 * url    路径
 */
WebUtils.openTab = function(tabid,text, url){
	var xtab =  $("#tabhead li a[href='#"+ tabid +"']");
	if ($("#tabhead li a").size() > 9) {
		WebUtils.alert("打开的Tab页过多!");
		return;
	}
	if ( xtab.size() > 0 ) {
		$('#tabhead>li').removeClass("active");
		$('#tabbody>div').removeClass("active");
		$(xtab).parentsUntil("ul").addClass("active");
		$('#tabbody>div#' +tabid).addClass("active");
	}
	else {
		var contentHeight = $('body').height() - $('.navbar').height() - 30 - 40 - 15 ;
		try{
			$('#tabhead>li').removeClass("active");
			$('#tabhead').append("<li class=\"active\"><a href=\"#"+tabid +"\" data-toggle=\"tab\"><span class=\"visible-xs\">" +
					"<i class=\"fa-cog\"></i></span><span class=\"hidden-xs\">" + text + "</span></a></li>");
			$('#tabhead li').last().bind("dblclick",function(e) {
				var content = $("a",this).attr("href");
				WebUtils.removeTabById(content.substr(1));
			});
			$('#tabbody>div').removeClass("active");
			$('#tabbody').append("<div class=\"tab-pane active\" id=\""+tabid+"\" >" +
					"<div class=\"breadcrumb-env\"></div>" +
					"<iframe style=\"height:" +contentHeight+ "px;width:100%;\" frameborder=\"0\" src=\"" +url+ "\"></iframe></div>");
			
		}catch(e){
			alert(e);
		}
	}
}
/*
 * 移除tab项
 */
WebUtils.removeTabById=function(tabid){
	var xtab =  $("#tabhead li a[href='#"+ tabid +"']");
	$('#' + tabid).remove();
	$(xtab).parent().remove();
	var next = $("#tabhead li").last();
	var ntabid = $("a",next).attr("href");
	$('#tabbody>div' +ntabid).addClass("active");
	next.addClass("active");
}

/**
 * 枚举类型变量存放处
 */
var _enum_params ={};

/**
 * 绑定平台定义枚举类型变量
 * <select name="vnodeImg" id="vnodeImg"></select>
 */
WebUtils.bindSelectFromUrl = function(ctrlId,url, datafield,idfield,namefield) {
    var control = $('#' + ctrlId); 
    //绑定Ajax的内容
    $.getJSON(url, function (data) {
        control.empty();//清空下拉框
        control.append("<option></option>");
        var rows = data;
        if (datafield) {
            rows = data[datafield];
        }
        $.each(rows, function (i, item) {
            control.append("<option value='" + item[idfield] + "'>&nbsp;" + item[namefield] + "</option>");
        });
    });
    //设置Select2的处理
    control.select2({
    	placeholder: '请选择 ...',
    	allowClear: true,
    	minimumResultsForSearch: -1  // Hide the search bar
    }).on('select2-open', function(){
		$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
	});
}

/**
 * 绑定平台定义枚举类型变量
 * <select name="vnodeImg" id="vnodeImg"></select>
 */
WebUtils.bindSelect = function(ctrlId,enumId,allowClear) {
    var control = $('#' + ctrlId); 
    if (control ) {
	    control.empty();//清空下拉框
	    control.append("<option></option>");
	    var enums = _enum_params[enumId];
	    if (enums) {
	        $.each(enums, function (i, item) {
	            control.append("<option value='" + i + "'>&nbsp;" + item + "</option>");
	        });
	    }
	    var flag = allowClear? true:allowClear;
	    //设置Select2的处理
	    control.select2({
	    	placeholder: '请选择 ...',
	    	allowClear: flag,
	    	minimumResultsForSearch: -1  // Hide the search bar
	    }).on('select2-open', function(){
			$(this).data('select2').results.addClass('overflow-hidden').perfectScrollbar();
		}).on("change", function(){
			$(this).valid();
		});
    }
}

WebUtils.deepCopy = function(source) { 
	var result={};
	for (var key in source) {
	      result[key] = typeof source[key]==='object'? WebUtils.deepCopy(source[key]): source[key];
	   } 
	   return result; 
}

/**
 * 判断结果是否成功
 */
WebUtils.isSuccess = function(result) {
	if (result && result.retcode) {
		if (result.retcode.substr(0,1) == 'I') {
			return true;
		}
	}
	return false;
}

 /**
  * 提交
  * @param action 地址
  * @param data 数据
  * @param onSuccess 成功执行方法
  * @param onError 失败执行方法
  */
WebUtils.ajaxSubmit = function(action, data, onSuccess,onError)
{
	$.ajax({
		url: action,
		data: data,
		type: 'POST',
		dataType: 'json',
		success: function(result){
			if (WebUtils.isSuccess(result)) {
				if (onSuccess) {
					onSuccess(result);
				}
				else {
					if (result.msg) {
						alert(result.msg);
					}
				}
			}
			else{
				if (onError) {
					onError(result);
				}
				else {
					if (result.retcode == "E0008") {//无效登录
						alert("登录超时,请重新登录!");
						window.location = result.url; //如重定向到登陆页面
					}
					else {
						alert(result.msg);
					}
					
				}
			}
		},
		error: function(result) {
			if (result.status = "403") {
				alert("访问异常.");
			}
			else {
				alert(result.responseText || "无法访问服务器",null,null,null,'error');
			}
		}
	});
}

/**
 * 提交
 * @param action 地址
 * @param data 数据
 * @param onSuccess 成功执行方法
 * @param onError 失败执行方法
 */
WebUtils.ajaxSubmitJson = function(action, data, onSuccess,onError)
{
	$.ajax({
		url: action,
		data: data,
		type: 'POST',
		dataType: 'json',
		contentType:"application/json;charset=utf-8",
		success: function(result){
			if (WebUtils.isSuccess(result)) {
				if (onSuccess) {
					onSuccess(result);
				}
				else {
					if (result.msg) {
						alert(result.msg);
					}
				}
			}
			else{
				if (onError) {
					onError(result);
				}
				else {
					if (result.retcode == "E0008") {//无效登录
						alert("登录超时,请重新登录!");
						window.location = result.url; //如重定向到登陆页面
					}
					else {
						alert(result.msg);
					}
				}
			}
		},
		error: function(result) {
			if (result.status = "403") {
				alert("访问异常.");
			}
			else {
				alert(result.responseText || "无法访问服务器",null,null,null,'error');
			}
		}
	});
}

WebUtils.alert = function (msg) {
	$('#sysmsg .modal-body').text(msg);
	$('#sysmsg').modal('show');
}

WebUtils.getAbsPosition = function(object) {
	var o = $(object);
	if (o.length == 0) {
		return false;
	}
	o = o[0];
	var left, top;
	left = o.offsetLeft;
	top = o.offsetTop;
	while (o = o.offsetParent) {
		left += o.offsetLeft;
		top += o.offsetTop;
	}
	return {left: left,top: top};
}


/**
 * 打开选择人员对话框,多选
 * okFunction 回调函数
 */
WebUtils.openSelectStaff = function(okFunction,cancelFunction){
	var url = _CONTEXT_PATH + "/jsp/common/pubstaffquery.jsp?dup=true";
	var p = {id:"_selectStaffDialog",title:'选择员工',lock:true,opacity:0.07};
	$.dialogBox.openDialog(url,p,okFunction,cancelFunction);
}
/**
* 打开选择人员对话框，单选
* okFunction 回调函数
*/
WebUtils.openSelectAStaff = function(okFunction,cancelFunction){
	var url = _CONTEXT_PATH + "/jsp/common/pubstaffquery.jsp?dup=false";
	var p = {id:"_selectStaffDialog",title:'选择员工',lock:true,opacity:0.07};
	$.dialogBox.openDialog(url,p,okFunction,cancelFunction);
}

/**
* 获取随机代理主键,前13位是时间戳+后17位随机数
*/
WebUtils.getRandomKey = function(){
	var random = (Math.random()+"").replace("0.", "").substr(0,17);
	var len = random.length ; 
	if(len<17){
		for(var j=0;j<17-len;j++){
			random = random+"0";
		}
	}
	var curtime = new Date().getTime();
	return curtime+random;
}

/**
 * 获取枚举类型变量对应值
 */
WebUtils.getCodeValue = function(codetype,itemid) {
	var xe = _enum_params[codetype];
	if (xe) {
		if (xe[itemid]) {
			return xe[itemid];
		}
	}
	return itemid;
}

WebUtils.initColumnHider = function(table) {
	//表格行选择
	table.on( 'click', 'tr', function () {
        $(this).toggleClass('selected');
    } );
    $('li.hiden-columns-title span').each(function(i,item) {
        var p = $(this).parent().parent();
        $(item).click(function(e) {
            e.preventDefault();
            $('ul.hiden-columns',p).toggleClass('showcol');
            //$(parent).scrollTop(0);
        });
        
        //构件隐藏列的控制组件
        var colHtml = [];
        var cols = table.columns();
        for (var x =0 ; x < cols[0].length; x ++) {
            var hname = table.column(x).header();
            colHtml.push("<li><label><input type=\"checkbox\" class=\"cbr toggle-vis\" checked data-column=\"");
            colHtml.push(x);
            colHtml.push("\" >");
            colHtml.push($(hname).text());
            colHtml.push("</label></li>");
        }
        $('ul.hiden-columns',p).append(colHtml.join(''));
        cbr_replace();
        
        $('input.toggle-vis',p).on('change', function (e) {
            e.preventDefault();

            // Get the column API object
            var b = $(this).attr('data-column');
            var column = table.column( b );
     
            // Toggle the visibility
            column.visible( $(this).attr("checked") == "checked" );
        } );
        
    });

};

/**
 * Datatable缺省参数
 */
WebUtils.settings = {
        "language": {
            "sProcessing":   "处理中...",
            "sLengthMenu":   "显示 _MENU_ 项",
            "sZeroRecords":  "没有匹配结果",
            "sInfo":         "显示第 _START_ 至 _END_ 项，共 _TOTAL_ 项",
            "sInfoEmpty":    "显示第 0 至 0 项，共 0 项",
            "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
            "sInfoPostFix":  "",
            "sSearch":       "搜索:",
            "sUrl":          "",
            "sEmptyTable":     "表中数据为空",
            "sLoadingRecords": "载入中...",
            "sInfoThousands":  ",",
            "oPaginate": {
                "sFirst":    "首页",
                "sPrevious": "上页",
                "sNext":     "下页",
                "sLast":     "末页"
            },
            "oAria": {
                "sSortAscending":  ": 以升序排列此列",
                "sSortDescending": ": 以降序排列此列"
            }
        },
        "autoWidth":true,
        "scrollX": true,
//        "scrollXInner":"99.9%",
        "lengthMenu": [[10, 15, 25, 50, 100], [10, 15, 25, 50, 100]],
        "pagingType": "full_numbers",
        "processing": true,
        "serverSide": true,
        "search":false,
        dom: "t" + "<'row'<'col-xs-2'l><'col-xs-5'i><'col-xs-5'p>>"
    };

/**
* 转换方法 
* 
* formId    form id
* 
* 例如：
* formId: myform
* ==>
* {name:value}
*/
WebUtils.convertFormData = function(formId) {
	var ret = {};
	if (!formId) {
		return ret;
	}
	var method = '';
	$('#'+formId+' input').each(function(i,ele){
		var key = (method =='' ? ele.name: (method + '.' + ele.name));
		if (ele.name) {
			if (ele.type === "checkbox") {
				var curVal = ret[key];
				if (curVal === undefined) {
					ret[key] = [];
				}
				if (ele.checked) {
					ret[key].push(ele.value);
				}
			}
			else if (ele.type === "radio") {
				if (ele.checked) {
					ret[key] = ele.value;
				}
			}
			else {
				ret[key] = ele.value;
			}
		}
	});
	$('#'+formId+' select').each(function(i,ele){
		var key = (method =='' ? ele.name: (method + '.' + ele.name));
		if (ele.name) {
			ret[key] = ele.value;
		}
	});
	$('#'+formId+' textarea').each(function(i,ele){
		var key = (method =='' ? ele.name: (method + '.' + ele.name));
		if (ele.name) {
			ret[key] = ele.value;
		}
	});
	return ret;
};

/**
 * 机构选择
 */
$(document).ready(function() {
	var $body = $('body');
	var $unitselects = $(".unitselect");
	$unitselects.each(function(i, el) {
		var dialog = "<div class='modal fade' id='comm_selectUnit" + i + "'><div class='modal-dialog' style='width: 60%'><div class='modal-content'></div></div></div>";
		$body.append(dialog);
		$(el).on('click',
			function() {
				var options = $(el).attr("unitselect");
				var vo = eval('('+options+')');
				var idField = vo.idfield;
				var nameField = vo.namefield;
				var selectMode = vo.selectmode;
				if (!nameField) {
					nameField = $(el).attr("id");
				}
				$('#comm_selectUnit' + i).modal(
					{
						remote:'unit/treedialog?mode='+selectMode +'&name=' + nameField + '&id=' + idField
					}
				);
			});
	});
			
});

