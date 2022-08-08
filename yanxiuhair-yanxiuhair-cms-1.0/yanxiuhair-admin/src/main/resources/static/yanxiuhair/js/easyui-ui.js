/**
 * 通用js方法封装处理
 * Copyright (c) 2020 yanxiuhair
 */

//当前easyUIDataGrid相关信息
var easyUIDataGrid = {
	// 当前实例配置
    options: {}
};

(function ($) {
    $.extend({
        easyUIDataGrid: {
        	// 初始化表格参数
            init: function(options) {
            	var defaults = {
            		id: 'dg',
            		type: 2, // 0 代表bootstrapTable 1代表bootstrapTreeTable 2代表datagrid
            		method: 'post',
            		url: "",
        		    striped: true,
        		    fit: true,
    	            fitColumns: true,
        		    singleSelect: false,
        		    remoteSort: true,
        		    multiSort: false,
        		    sortName: "",
        		    sortOrder: "desc",
        		    rownumbers: true,
        		    pagination: true,
    				pageSize: 15,
    				pageNumber: 1,
    				pageList: [15,30,45],
    				toolbar: 'toolbar',
    				onLoadSuccess: function (data) {
    					$(this).datagrid('doCellTip', { 'max-width': '700px', 'delay': 300 });
    		        }
        		};
            	var options = $.extend(defaults, options);
            	easyUIDataGrid.options = options;
                $('#' + options.id).datagrid({
                    striped: options.striped,
    				singleSelect: options.singleSelect,
    	            url: options.url,
    	            method: options.method,
    	            queryParams: options.queryParams,
    	            idField: options.idField,
    	            fit: options.fit,
    	            fitColumns: options.fitColumns,
                    rownumbers : options.rownumbers,
                    remoteSort: options.remoteSort,
                    multiSort: options.multiSort,
                    sortName: options.sortName,
                    sortOrder: options.sortOrder,
                    rowStyler: options.rowStyler,
                    frozenColumns: options.frozenColumns,
                    columns: options.columns,
                    pagination: options.pagination,
      				pageSize: options.pageSize,
      				pageNumber: options.pageNumber,
      				pageList: options.pageList,
      				data: options.data,
                    onLoadSuccess: options.onLoadSuccess,                 
                    onClickRow: options.onClickRow,                 
                    onSelect: options.onSelect,                 
                    toolbar: '#' + options.toolbar
                });
            },
            // 搜索-默认第一个form
            search: function(formId, tableId) {
            	var params = $.common.formToJSON($.common.isEmpty(formId) ? $('form').attr('id') : formId);
    		    if($.common.isNotEmpty(tableId)){
    				$("#" + tableId).datagrid('load', params).datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    			} else{
    				$("#" + easyUIDataGrid.options.id).datagrid('load', params).datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
    			}
    		},
    		// 表单重置
    		reset: function(formId, tableId) {
            	var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
            	$("#" + currentId).form('clear');
            	var objArr = $("#" + currentId).find(".easyui-combobox");
                for(var i=0; i<objArr.length; i++){
                	$(objArr[i]).combobox("setValue", " ");
                }
            	var params = $.common.formToJSON(currentId);
            	if($.common.isEmpty(tableId)){
                	$('#' + easyUIDataGrid.options.id).datagrid('load', params).datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
            	} else{
            	    $("#" + tableId).datagrid('load', params).datagrid('uncheckAll').datagrid('unselectAll').datagrid('clearSelections');
            	}
            }
        },
        easyUITable: {
            
        },
        // 弹出层封装处理
    	easyUIModal: {
            // 关闭窗体
            close: function (id) {
            	if($.common.isNotEmpty(id)){
            		$("#" + id).dialog('destroy');
            	} else {
            		$(".window-body").dialog('destroy');
            	}
            },
            // 弹出层指定宽度
            open: function (title, iconCls, dialogId, openUrl, width, height) {
            	// 皮肤缓存
            	var skin = storage.get("skin");
            	var panelWindowTheme = "";
            	var panelWindowHeaderTheme = "";
            	var panelWindowBodyTheme = "";
            	// 本地主题优先，未设置取系统配置
            	if($.common.isNotEmpty(skin)){
            		panelWindowTheme = "easyui-window-" + skin.split('|')[0];
            		panelWindowHeaderTheme = "easyui-window-header-" + skin.split('|')[0];
            		panelWindowBodyTheme = "easyui-window-body-" + skin.split('|')[0];
            	}
            	var dialogObj = $('<div id="'+dialogId+'" style="overflow-x:hidden;"/>');
            	if ($.common.isEmpty(width)) {
                	width = 800;
                }
                if ($.common.isEmpty(height)) {
                	height = ($(window).height() - 50);
                }
            	dialogObj.dialog({
            		href: openUrl,
    				iconCls: iconCls,
    				width : width,
    				height : height,
    				modal : true,
    				maximizable: true,
    				title : title,
    				onOpen : function(){
    					$("#" + dialogId).parents(".window").addClass(panelWindowTheme);
    					$("#" + dialogId).addClass(panelWindowBodyTheme);
    					$("#" + dialogId).siblings(".window-header").find(".panel-title").addClass(panelWindowHeaderTheme);
    				},
    				onClose : function() {
    					dialogObj.dialog('destroy');
    				}
    			});
            },
            // 选卡页方式打开
            openTab: function (title, url) {
            	createMenuItem(url, title);
            }
        },
        // 操作封装处理
        easyUIOperate: {
        	ajax: function(url, submitType, dataType, queryParams, callback){
        		var config = {
			        url: url,
			        type: submitType,
			        dataType: dataType,
			        data: queryParams,
			        success: function(result) {
			        	if (typeof callback == "function") {
			        	    callback(result);
			        	} else {
			        		if (result.code == web_status.SUCCESS) {
			                	$.messager.show({
									title : '提示',
									msg : result.msg,
									timeout: 1000
								});
			                } else if (result.code == web_status.WARNING) {
			                    $.messager.alert("提示", result.msg, 'warning');
			                }  else {
			                	$.messager.alert("提示", result.msg, 'error');
			                }
			        	}
			        }
        		};
        		$.ajax(config);
        	},
        	// 提交数据
        	submit: function(url, type, dataType, data, callback) {
            	var config = {
        	        url: url,
        	        type: type,
        	        dataType: dataType,
        	        data: data,
        	        beforeSend: function () {
        	        	$.modal.loading("正在处理中，请稍后...");
        	        },
        	        success: function(result) {
        	        	if (typeof callback == "function") {
        	        	    callback(result);
        	        	}
        	        	$.easyUIOperate.ajaxSuccess(result);
        	        }
        	    };
        	    $.ajax(config);
            },
            // post请求传输
            post: function(url, data, callback) {
            	$.easyUIOperate.submit(url, "post", "json", data, callback);
            },
        	// get请求传输
            get: function(url, callback) {
            	$.easyUIOperate.submit(url, "get", "json", "", callback);
            },
            // 详细信息
            detail: function(id, width, height) {
            	var url = "";
            	if($.common.isEmpty(id) && easyUIDataGrid.options.type == table_type.datagrid) {
            		var selectionRows = $("#" + easyUIDataGrid.options.id).datagrid('getSelections');
            		if(selectionRows.length > 1){
            			$.messager.alert("提示", "只能选择一条记录！", 'warning');
            			return false;
            		} else if(selectionRows.length == 0){
            			$.messager.alert("提示", "请选择一条记录！", 'warning');
            			return false;
            		}
            		var row = selectionRows[0];
                    url = easyUIDataGrid.options.detailUrl.replace("{id}", row[easyUIDataGrid.options.idField]);
            	} else {
            		url = $.easyUIOperate.detailUrl(id);
            	}
            	var _width = $.common.isEmpty(width) ? "800" : width; 
                var _height = $.common.isEmpty(height) ? ($(window).height() - 50) : height;
                
                // 皮肤缓存
            	var skin = storage.get("skin");
            	var panelWindowTheme = "";
            	var panelWindowHeaderTheme = "";
            	var panelWindowBodyTheme = "";
            	// 本地主题优先，未设置取系统配置
            	if($.common.isNotEmpty(skin)){
            		panelWindowTheme = "easyui-window-" + skin.split('|')[0];
            		panelWindowHeaderTheme = "easyui-window-header-" + skin.split('|')[0];
            		panelWindowBodyTheme = "easyui-window-body-" + skin.split('|')[0];
            	}
            	var dialogObj = $('<div id="detailId" style="overflow-x:hidden;"/>');
            	dialogObj.dialog({
            		href: url,
    				iconCls: "icon-detail",
    				width : _width,
    				height : _height,
    				modal : true,
    				maximizable: true,
    				title : easyUIDataGrid.options.modalName + "详情",
    				buttons : [ {
    					text : '关闭',
    					iconCls : 'icon-cancel',
    					handler : function() {
    						dialogObj.dialog('destroy');
    					}
    				} ],
    				onOpen : function(){
    					$("#detailId").parents(".window").addClass(panelWindowTheme);
    					$("#detailId").addClass(panelWindowBodyTheme);
    					$("#detailId").siblings(".window-header").find(".panel-title").addClass(panelWindowHeaderTheme);
    				},
    				onClose : function() {
    					dialogObj.dialog('destroy');
    				}
    			});
            },
            // 详细信息
            detailTab: function(id) {
            	if($.common.isEmpty(id) && easyUIDataGrid.options.type == table_type.datagrid) {
            		var selectionRows = $("#" + easyUIDataGrid.options.id).datagrid('getSelections');
            		if(selectionRows.length > 1){
            			$.messager.alert("提示", "只能选择一条记录！", 'warning');
            			return false;
            		} else if(selectionRows.length == 0){
            			$.messager.alert("提示", "请选择一条记录！", 'warning');
            			return false;
            		}
            		var row = selectionRows[0];
                    var url = easyUIDataGrid.options.detailUrl.replace("{id}", row[easyUIDataGrid.options.idField]);
                    $.easyUIModal.openTab(easyUIDataGrid.options.modalName + "详情", url);
            	} else {
            	    $.easyUIModal.openTab(easyUIDataGrid.options.modalName + "详情", $.easyUIOperate.detailUrl(id));
            	}
            },
            // 详细访问地址
            detailUrl: function(id) {
            	var url = "/404.html";
            	if ($.common.isNotEmpty(id)) {
            	    url = easyUIDataGrid.options.detailUrl.replace("{id}", id);
            	} else {
            		var selectionRows = $("#" + easyUIDataGrid.options.id).datagrid('getSelections');
             		if(selectionRows.length > 1){
             			$.messager.alert("提示", "只能选择一条记录！", 'warning');
             			return false;
             		} else if(selectionRows.length == 0){
             			$.messager.alert("提示", "请选择一条记录！", 'warning');
             			return false;
             		}
             		var id = selectionRows[0][easyUIDataGrid.options.idField];
             	    url = easyUIDataGrid.options.detailUrl.replace("{id}", id);
            	}
                return url;
            },
            // 保存结果弹出msg刷新table表格
            ajaxSuccess: function (result) {
            	if (result.code == web_status.SUCCESS && easyUIDataGrid.options.type == table_type.datagrid) {
                	$.messager.show({
						title : '提示',
						msg : result.msg,
						timeout: 1000
					});
                	$.easyUIDataGrid.search();
                } else if (result.code == web_status.SUCCESS && $.common.isEmpty(easyUIDataGrid.options.type)) {//普通提交
                	$.messager.show({
						title : '提示',
						msg : result.msg,
						timeout: 1000
					});
                } else if (result.code == web_status.WARNING) {
                    $.messager.alert("提示", result.msg, 'warning');
                }  else {
                	$.messager.alert("提示", result.msg, 'error');
                }
            	$.modal.closeLoading();
            },
            // 保存信息 刷新表格
            save: function(url, formObj, callback) {
                /*var objArr = formObj.find(".easyui-textbox");
                for(var i=0; i<objArr.length; i++){
                	var obj = $(objArr[i]);
                	if(obj.textbox("options").novalidate){
                		$(obj).textbox({ novalidate: false });
                	}
                }*/
                if(formObj.form('validate')){
                	$(formObj.find(".easyui-linkbutton")[0]).linkbutton("disable");//禁用保存按钮
                	var config = {
            	        url: url,
            	        type: "post",
            	        dataType: "json",
            	        data: formObj.serialize(),
            	        beforeSend: function () {
            	        	/*$.messager.progress({
                                title:'请稍后',
                                msg:'正在处理中...',
                                text:''
                            });*/
            	        },
            	        success: function(result) {
            	        	if (typeof callback == "function") {
            	        	    callback(result);
            	        	}
            	        	$.easyUIOperate.successCallback(result);
            	        }
            	    };
            	    $.ajax(config);
                }
            },
            // 保存选项卡信息
            saveTab: function(url, formObj, callback) {
        	    if(formObj.form('validate')){
                	$($("#dlg-buttons").find(".easyui-linkbutton")[0]).linkbutton("disable");//禁用保存按钮
                	var config = {
            	        url: url,
            	        type: "post",
            	        dataType: "json",
            	        data: formObj.serialize(),
            	        beforeSend: function () {
            	        	$.modal.loading("正在处理中，请稍后...");
            	        },
            	        success: function(result) {
            	        	if (result.code == web_status.SUCCESS) {
                            	var topWindow = $(window.parent.document);
                	            var currentId = $('.page-tabs-content', topWindow).find('.active').attr('data-panel');
                	            var $contentWindow = $('.RuoYi_iframe[data-id="' + currentId + '"]', topWindow)[0].contentWindow;
                	            $.modal.close();
                	            $contentWindow.$.messager.show({
             						title : '提示',
             						msg : result.msg,
        							timeout: 1000
             					});
                	            $contentWindow.$(".layui-layer-padding").removeAttr("style");
                	            if ($contentWindow.easyUIDataGrid.options.type == table_type.datagrid) {
                	        		$contentWindow.$.easyUIDataGrid.search();
                	        	}
                	            $.modal.closeTab();
                            } else if (result.code == web_status.WARNING) {
                            	$($("#dlg-buttons").find(".easyui-linkbutton")[0]).linkbutton("enable");//启用保存按钮
                            	$.messager.alert("提示", result.msg, 'warning');
                            } else {
                            	$($("#dlg-buttons").find(".easyui-linkbutton")[0]).linkbutton("enable");//启用保存按钮
                            	$.messager.alert("提示", result.msg, 'error');
                            }
            	        }
            	    };
            	    $.ajax(config);
        	    }
            },
            // 成功回调执行事件（父窗体静默更新）
            successCallback: function(result) {
                if (result.code == web_status.SUCCESS) {
                	if (easyUIDataGrid.options.type == table_type.datagrid) {
                		$(".window-body").dialog('destroy');
                    	$.messager.show({
     						title : '提示',
     						msg : result.msg,
							timeout: 1000
     					});
                     	$.easyUIDataGrid.search();
                    } else {
                        $.modal.msgReload("保存成功,正在刷新数据请稍后……", modal_status.SUCCESS);
                    }
                } else if (result.code == web_status.WARNING) {
                	var formObj = $(".window-body").find("form");
                	$(formObj.find(".easyui-linkbutton")[0]).linkbutton("enable");//启用保存按钮
                	$.messager.alert("提示", result.msg, 'warning');
                }  else {
                	var formObj = $(".window-body").find("form");
                	$(formObj.find(".easyui-linkbutton")[0]).linkbutton("enable");//启用保存按钮
                	$.messager.alert("提示", result.msg, 'error');
                }
                //$.messager.progress('close');
            },
            // 导出数据
    		exportExcel: function(formId) {
    			 $.messager.confirm("确认", "确定导出所有" + easyUIDataGrid.options.modalName + "吗？", function (isDelete) {
     	        	if (isDelete) {
     	        		var currentId = $.common.isEmpty(formId) ? $('form').attr('id') : formId;
    	    			var params = $("#" + easyUIDataGrid.options.id).datagrid('options');
    	    			var dataParam = $("#" + currentId).serializeArray();
    	    			dataParam.push({ "name": "sort", "value": params.sortName });
    	    			dataParam.push({ "name": "order", "value": params.sortOrder });
    	    			$.modal.loading("正在导出数据，请稍后...");
    	    			$.post(easyUIDataGrid.options.exportUrl, dataParam, function(result) {
    	    				if (result.code == web_status.SUCCESS) {
    	    			        window.location.href = ctx + "common/download?fileName=" + encodeURI(result.msg) + "&delete=" + true;
    	    				} else if (result.code == web_status.WARNING) {
    	                        $.messager.alert("提示", result.msg, 'warning');
    	                    } else {
    	    					$.messager.alert("提示", result.msg, 'error');
    	    				}
    	    				$.modal.closeLoading();
    	    			});
     	        	}
     	        });
    		},
    		// 下载模板
    		importTemplate: function() {
    			$.get(easyUIDataGrid.options.importTemplateUrl, function(result) {
    				if (result.code == web_status.SUCCESS) {
    			        window.location.href = ctx + "common/download?fileName=" + encodeURI(result.msg) + "&delete=" + true;
    				} else if (result.code == web_status.WARNING) {
    					 $.messager.alert("提示", result.msg, 'warning');
                    } else {
                    	$.messager.alert("提示", result.msg, 'error');
    				}
    			});
            },
            // 导入数据
            importExcel: function(formId, width, height) {
            	var currentId = $.common.isEmpty(formId) ? 'importTpl' : formId;
            	var _width = $.common.isEmpty(width) ? "400" : width;
                var _height = $.common.isEmpty(height) ? "230" : height;
                
                // 皮肤缓存
            	var skin = storage.get("skin");
            	var panelWindowTheme = "";
            	var panelWindowHeaderTheme = "";
            	var panelWindowBodyTheme = "";
            	// 本地主题优先，未设置取系统配置
            	if($.common.isNotEmpty(skin)){
            		panelWindowTheme = "easyui-window-" + skin.split('|')[0];
            		panelWindowHeaderTheme = "easyui-window-header-" + skin.split('|')[0];
            		panelWindowBodyTheme = "easyui-window-body-" + skin.split('|')[0];
            	}
            	
            	var dialogObj = $('<div id="importExcelDialogId" style="overflow-x:hidden;"/>');
            	if ($.common.isEmpty(width)) {
                	width = 800;
                }
                if ($.common.isEmpty(height)) {
                	height = ($(window).height() - 50);
                }
            	dialogObj.dialog({
            		content: $('#' + currentId).html(),
    				iconCls: "icon-import",
    				width : _width,
    				height : _height,
    				modal : true,
    				maximizable: true,
    				title : '导入' + easyUIDataGrid.options.modalName + '数据',
    				buttons : [ {
    					text : '提交',
    					iconCls : 'icon-save',
    					handler : function() {
    						var file = $('#file').val();
    						if (file == '' || (!$.common.endWith(file, '.xls') && !$.common.endWith(file, '.xlsx'))){
                				 $.messager.alert("提示", "请选择后缀为 “xls”或“xlsx”的文件。", 'warning');
                				return false;
                			}
                			var formData = new FormData($('form')[1]);
                			$.ajax({
                				url: easyUIDataGrid.options.importUrl,
                				data: formData,
                				cache: false,
                				contentType: false,
                				processData: false,
                				type: 'POST',
                				success: function (result) {
                    	        	$.easyUIOperate.successCallback(result);
                				}
                			});
    					}
    				},{
    					text : '关闭',
    					iconCls : 'icon-cancel',
    					handler : function() {
    						dialogObj.dialog('destroy');
    					}
    				} ],
    				onOpen : function(){
    					$("#importExcelDialogId").parents(".window").addClass(panelWindowTheme);
    					$("#importExcelDialogId").addClass(panelWindowBodyTheme);
    					$("#importExcelDialogId").siblings(".window-header").find(".panel-title").addClass(panelWindowHeaderTheme);
    				},
    				onClose : function() {
    					dialogObj.dialog('destroy');
    				}
    			});
            },
            //删除信息
            remove: function(id) {
    	        $.messager.confirm("确认", "确定要删除该条数据吗？", function (isDelete) {
    	        	if (isDelete) {
				        var url = $.common.isEmpty(id) ? easyUIDataGrid.options.removeUrl : easyUIDataGrid.options.removeUrl.replace("{id}", id);
				        var data = { "ids": id };
	            	    $.easyUIOperate.submit(url, "post", "json", data);
    	        	}
    	        });
            },
            // 批量删除信息
            removeAll: function() {
            	//获取选中行的数据
    	        var selectRows = $("#" + easyUIDataGrid.options.id).datagrid("getSelections");
    	        if (selectRows.length < 1) {
    	            $.messager.alert("提示", "请选择要删除的记录！", 'warning');
    	            return;
    	        }
    	        var idsArr = new Array();
    	        for(var i=0; i<selectRows.length; i++){
    	        	idsArr.push(selectRows[i][easyUIDataGrid.options.idField]);
    	        }
    	        $.messager.confirm("确认", "确定要删除选中的" + selectRows.length + "条数据吗？", function (isDelete) {
    	        	if (isDelete) {
    	        		var url = easyUIDataGrid.options.removeUrl;
    	        		var data = { "ids": idsArr.join() };
				        $.easyUIOperate.submit(url, "post", "json", data);
    	        	}
    	        });
            },
            // 清空信息
            clean: function() {
            	$.messager.confirm("确认", "确定清空所有" + easyUIDataGrid.options.modalName + "吗？", function (isDelete) {
     	        	if (isDelete) {
     	        		var url = easyUIDataGrid.options.cleanUrl;
    	            	$.easyUIOperate.submit(url, "post", "json", "");
     	        	}
     	        });
            },
            // 新增信息
            add: function(width, height, id) {
            	$.easyUIModal.open("新增" + easyUIDataGrid.options.modalName, "icon-add", "addDialog", $.easyUIOperate.addUrl(id), width, height);
            },
            // 新增信息，以tab页展现
            addTab: function (id) {
                $.easyUIModal.openTab("新增" + easyUIDataGrid.options.modalName, $.easyUIOperate.addUrl(id));
            },
            // 新增访问地址
            addUrl: function(id) {
            	var url = $.common.isEmpty(id) ? easyUIDataGrid.options.createUrl.replace("{id}", "") : easyUIDataGrid.options.createUrl.replace("{id}", id);
                return url;
            },
            // 修改信息
            edit: function(width, height, id) {
            	if($.common.isEmpty(id) && easyUIDataGrid.options.type == table_type.datagrid) {
            		var selectionRows = $("#" + easyUIDataGrid.options.id).datagrid('getSelections');
            		if(selectionRows.length > 1){
            			$.messager.alert("提示", "只能选择一条记录！", 'warning');
            			return false;
            		} else if(selectionRows.length == 0){
            			$.messager.alert("提示", "请选择一条记录！", 'warning');
            			return false;
            		}
            		var row = selectionRows[0];
                    var url = easyUIDataGrid.options.updateUrl.replace("{id}", row[easyUIDataGrid.options.idField]);
                    $.easyUIModal.open("修改" + easyUIDataGrid.options.modalName, "icon-edit", "editDialog", url, width, height);
            	} else {
            	    $.easyUIModal.open("修改" + easyUIDataGrid.options.modalName, "icon-edit", "editDialog", $.easyUIOperate.editUrl(id), width, height);
            	}
            },
            // 修改信息，以tab页展现
            editTab: function(id) {
            	if($.common.isEmpty(id) && easyUIDataGrid.options.type == table_type.datagrid) {
            		var selectionRows = $("#" + easyUIDataGrid.options.id).datagrid('getSelections');
            		if(selectionRows.length > 1){
            			$.messager.alert("提示", "只能选择一条记录！", 'warning');
            			return false;
            		} else if(selectionRows.length == 0){
            			$.messager.alert("提示", "请选择一条记录！", 'warning');
            			return false;
            		}
            		var row = selectionRows[0];
                    var url = easyUIDataGrid.options.updateUrl.replace("{id}", row[easyUIDataGrid.options.idField]);
                    $.easyUIModal.openTab("修改" + easyUIDataGrid.options.modalName, url);
            	} else {
            	    $.easyUIModal.openTab("修改" + easyUIDataGrid.options.modalName, $.easyUIOperate.editUrl(id));
            	}
            },
            // 修改访问地址
            editUrl: function(id) {
            	var url = "/404.html";
            	if ($.common.isNotEmpty(id)) {
            	    url = easyUIDataGrid.options.updateUrl.replace("{id}", id);
            	} else {
            	    var selectionRows = $("#" + easyUIDataGrid.options.id).datagrid('getSelections');
            		if(selectionRows.length > 1){
            			$.messager.alert("提示", "只能选择一条记录！", 'warning');
            			return false;
            		} else if(selectionRows.length == 0){
            			$.messager.alert("提示", "请选择一条记录！", 'warning');
            			return false;
            		}
            		var id = selectionRows[0][easyUIDataGrid.options.idField];
            	    url = easyUIDataGrid.options.updateUrl.replace("{id}", id);
            	}
                return url;
            }
        }
    });
})(jQuery);

/** 表格类型 */
table_type = {
	datagrid: 2
};

/** 消息状态码 */
web_status = {
    SUCCESS: 0,
    FAIL: 500,
    WARNING: 301
};

/** 弹窗状态码 */
modal_status = {
    SUCCESS: "success",
    FAIL: "error",
    WARNING: "warning"
};