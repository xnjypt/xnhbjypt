<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../common/inc/meta.jsp"></jsp:include>
<jsp:include page="../common/inc/easyui.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/resources/js/menu.js" charset="UTF-8" type="text/javascript"></script>
<script type="text/javascript">
	var datagrid;
	var voteDialog;
	var voteForm;
	var passwordInput;
	$(function() {
		voteForm = $("#voteForm").form();

		passwordInput = voteForm.find('[name=name]').validatebox({
			required : true
		});
		voteDialog = $('#voteDialog').show().dialog({
			modal : true,
			title : '添加用户',
			top : '0px',
			buttons : [ { 
				text : '确定',
				handler : function() {
					if (voteForm.find('[name=id]').val() != '') {
						voteForm.form('submit', {
							url : '${pageContext.request.contextPath}/vote.do?editVote',
							success : function(data) {
								voteDialog.dialog('close');
								$.messager.show({
									msg : '修改奖品成功！',
									title : '提示'
								}); 
								datagrid.datagrid('reload');
							}
						});
					} else { 
						voteForm.form('submit', {
							url : '${pageContext.request.contextPath}/vote.do?addVote',
							success : function(data) {
								try {
									var d = $.parseJSON(data);
									if (d.success) {
										voteDialog.dialog('close');
										$.messager.show({
											msg : '添加奖品成功！',
											title : '提示'
										});
										datagrid.datagrid('reload');
									}else {
										$.messager.show({
											msg : '图片不可为空！',
											title : '提示'
										});
									}
								} catch (e) {
									voteDialog.dialog('close');
									$.messager.show({
										msg : '添加奖品失败！',
										title : '提示'
									});
									datagrid.datagrid('reload');
								}
							}
						});
					}
				}
			} ]
		}).dialog('close');
			
		datagrid = $('#datagrid').datagrid({
			url : '${pageContext.request.contextPath}/vote.do?voteDatagrid',
			toolbar : '#toolbar',
			title : '',
			iconCls : 'icon-save',
			pagination : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 60, 70, 80, 90, 100 ],
			fit : true,
			fitColumns : true,
			nowrap : false,
			border : false,
			idField : 'id',
			singleSelect : true,//单选 
			rownumbers : true,
			frozenColumns : [ [ {
				title : '编号',
				field : 'id',
				width : 50,
				hidden : true,
			} ] ],
			columns : [ [ {
				field : 'player',
				title : '店长', 
				width : 50,
			} ,{
				field : 'area',
				title : '区域',
				width : 50,
			} ,{
				field : 'shopName',
				title : '门店',
				width : 70,
			} ,{
				field : 'number',
				title : '作品编号',
				width : 50,
			} ,{
				field : 'photoOne',
				title : '店长图片',
				width : 50,
				formatter:function(value,row,index){
					return '<img src="'+value+'" style=" width: 60px; height: 50px;"/>';
				}
			},{
				field : 'photoTwo',
				title : '门店图片',
				width : 50,
				formatter:function(value,row,index){
					return '<img src="'+value+'" style=" width: 60px; height: 50px;"/>';
				}
			} ,{
				field : 'createTime',
				title : '创建时间',
				width : 50,
				formatter:formatterdate,
			}] ],
			onRowContextMenu : function(e, rowIndex, rowData) {
				e.preventDefault();
				$(this).datagrid('unselectAll');
				$(this).datagrid('selectRow', rowIndex);
				$('#menu').menu('show', {
					left : e.pageX,
					top : e.pageY
				});
			}
		});

	});
	
	function formatterdate(val, row) {
		if (val != null) {
		var date = new Date(val);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
		+ date.getDate()+' '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
		}
	}
	function append() {
		document.getElementById("pic1").style.display = 'none';
		$("#pic1").attr("src", "");
		document.getElementById("pic2").style.display = 'none';
		$("#pic2").attr("src", "");
		voteDialog.dialog('open');
		passwordInput.validatebox({
			required : true
		});
		voteForm.find('[name=name]').removeAttr('readonly');
		voteForm.form('clear');
		voteForm.form('load', {
			promotion : 0
		});
	}

	function edit() {
		var rows = datagrid.datagrid('getSelections');
		if (rows.length != 1 && rows.length != 0) {
			var names = [];
			for (var i = 0; i < rows.length; i++) {
				names.push(rows[i].name);
			}
			$.messager.show({
				msg : '只能择一条数据 进行编辑！您已经选择了【' + names.join(',') + '】'
						+ rows.length + '条数据',
				title : '提示'
			});
		} else if (rows.length == 1) {
			passwordInput.validatebox({
				required : false
			});
			voteForm.find('[name=id]').attr('readonly', 'readonly');
			voteDialog.dialog('open');
			voteForm.form('clear');
			voteForm.form('load', {
				id : rows[0].id,
				number : rows[0].number,
				area : rows[0].area,
				shopName : rows[0].shopName,
				player : rows[0].player,
				describt : rows[0].describt,
				photoOne : rows[0].photoOne,
				photoTwo : rows[0].photoTwo,
				promotion : rows[0].promotion
			});
			document.getElementById("pic1").style.display = 'block';
			document.getElementById("pic2").style.display = 'block';
			$("#pic1").attr("src", rows[0].photoOne);
			$("#pic2").attr("src", rows[0].photoTwo);
		}
	}
	function del() {
		var ids = [];
		var rows = datagrid.datagrid('getSelections');
		if (rows.length > 0) {
			$.messager.confirm('请确认', '您要删除当前所选项目？', function(r) {
				if (r) {
					for (var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/vote.do?del',  
						data : {
							ids : ids.join(',')
						},
						cache : false,
						dataType : "json",
						success : function(response) {
							datagrid.datagrid('unselectAll');
							datagrid.datagrid('reload');
							$.messager.show({
								title : '提示',
								msg : '删除成功！'
							});
						}
					});
				}
			});
		} else {
			$.messager.alert('提示', '请选择要删除的记录！', 'error');
		}
	}

	//查找
	function searchFun() {
		datagrid.datagrid('load',
				{
			player : $('#toolbar input[name=player]').val(),
			area : $('#toolbar input[name=area]').val(),
			shopName : $('#toolbar input[name=shopName]').val()
				});
	}
	
	function clearFun() {
		$('#toolbar input').val('');
		datagrid.datagrid('load', {});
	}
	function changePicUrl1( ) {
		var dFile = document.getElementById('file1');
		var dImg = document.getElementById('pic1');
		if (dFile.files) {
			document.getElementById("pic1").style.display = 'block';
			dImg.src = window.URL.createObjectURL(dFile.files[0]);
		} else if (dFile.value.indexOf('\\') > -1
			|| dFile.value.indexOf('\/') > -1) {
				dImg.src = dFile.value;
			} 
		}
	function changePicUrl2() {
		var dFile = document.getElementById('file2');
		var dImg = document.getElementById('pic2');
		if (dFile.files) {
			document.getElementById("pic2").style.display = 'block';
			dImg.src = window.URL.createObjectURL(dFile.files[0]);
		} else if (dFile.value.indexOf('\\') > -1
			|| dFile.value.indexOf('\/') > -1) {
				dImg.src = dFile.value;
			} 
	}
</script>
</head>
<body class="easyui-layout" fit="true">
	<div region="center" border="false" style="overflow: hidden">
		<div id="toolbar" class="datagrid-toolbar" style="height: auto;">
			<fieldset>
				<legend>筛选</legend>
				<table class="tableForm">
					<tr>
						<th>店长</th>
						<td><input name="player"></td>
						<th>区域</th>
						<td><input name="area"></td>
						<th>门店</th>
						<td><input name="shopName"></td>
					
					<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="searchFun();" href="javascript:void(0);">查找</a><a
							class="easyui-linkbutton" iconCls="icon-search" plain="true"
							onclick="clearFun();" href="javascript:void(0);">清空</a></td>
					</tr>
				</table>
			</fieldset>
			<div>
				<a class="easyui-linkbutton" iconCls="icon-add" onclick="append();"
					plain="true" href="javascript:void(0)">增加</a> <a
					class="easyui-linkbutton" iconCls="icon-edit" onclick="edit();"
					plain="true" href="javascript:void(0)">编辑</a><a
					class="easyui-linkbutton" iconCls="icon-remove" onclick="del();"
					plain="true" href="javascript:void(0)">删除</a> <a
					class="easyui-linkbutton" iconCls="icon-undo"
					onclick="datagrid.datagrid('unselectAll');" plain="true"
					href="javascript:void(0)">取消选中</a>
			</div>
		</div>
		<table id="datagrid"></table>
	</div>

	<div id="voteDialog" style="display: none; overflow: hidden;width:400px;min-height:470px;">
		<form id="voteForm" method="post" enctype="multipart/form-data">
			<table class="tableForm">
				<tr>
					<th></th>
					<td><input name="id" readonly="readonly" type="hidden" /></td>
				</tr>
				<tr>
					<th>区域：</th>
					<td><input name="area" style="width: 200px;"
						maxlength="30" class="easyui-validatebox" required="true" /></td>
				</tr>
				<tr>
					<th>门店：</th>
					<td><input name="shopName" style="width: 200px;"
						maxlength="30" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<th>店长：</th>
					<td><input name="player" style="width: 200px;"
						maxlength="30" class="easyui-validatebox" required="true"/></td>
				</tr>
				<tr>
					<th>作品编号：</th>
					<td><input name="number" style="width: 200px;"
						maxlength="30" class="easyui-validatebox" /></td>
				</tr>
				<tr>
					<th>描述：</th>
					<td><textarea cols="40" rows="9" name="describt" class="textarea easyui-validatebox"></textarea></td>
				</tr>
				<tr>
					<th>店长图片：</th>
					<td>
						<input id="file1" type="file" name="files" onchange="changePicUrl1()">
						<img name="pic" id="pic1" alt="" src=""
						style="display:none; width: 80px; height: 80px;">
					</td>
				</tr>
				<tr>
					<th>门店图片：</th>
					<td>
						<input id="file2" type="file" name="files" onchange="changePicUrl2()">
						<img name="pic" id="pic2" alt="" src=""
						style="display:none; width: 80px; height: 80px;">
					</td>
				</tr>
				<tr>
				    <th>全国排名</th>
					<td><input type="radio" name="promotion" value="0" checked="checked" style="width:20px;"/>否
						<input type="radio" name="promotion" value="1" style="width:20px;"/>是
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>