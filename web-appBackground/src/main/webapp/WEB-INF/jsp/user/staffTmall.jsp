<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../common/inc/meta.jsp"></jsp:include>
<jsp:include page="../common/inc/easyui.jsp"></jsp:include>
<script src="<%=request.getContextPath()%>/resources/js/menuUser.js" charset="UTF-8" type="text/javascript"></script>
<script type="text/javascript" charset="UTF-8">
	var datagrid;
	var userDialog;
	var userForm;
	var passwordInput;
	var userRoleDialog;
	var userRoleForm;
	
	var datagridScan;
	
	$(function() {
		
		$('#scanMemberId').dialog({
			title	: '',
			width	: 960,
			height	: 500,
			modal	: true,
			closed	: true,
			buttons : [{
				text :'确定',
				handler:function(){
					$("#scanMemberId").dialog('close');
					var row = $('#scanMemberDatagrid').datagrid('getSelected');
					$('input[name="cardName"]').val(row.name);	
					$('input[name="goodsItemId"]').val(row.id);	
				},
			},{
				text :'取消',
				handler :function(){
					$("#scanMemberId").dialog('close');
				}
			}]
		});
		
		userForm = $('#userForm').form();

		passwordInput = userForm.find('[name=password]').validatebox({
			required : true
		});

		userDialog = $('#userDialog').show().dialog({
			modal : true,
			title : '员工信息',
			buttons : [ {
				text : '确定',
				handler : function() {
					if (userForm.find('[name=id]').val() != '') {
						/* if(!checkDatas())return; */
						userForm.form('submit', {
							url : '${pageContext.request.contextPath}/staffTmall.do?edit',
							success : function(data) {
								var d = $.parseJSON(data);
								if(d.success==true){
									userDialog.dialog('close');
									$.messager.show({
										msg : d.msg,
										title : '提示',
									});
									datagrid.datagrid('reload');
								}else{
									$.messager.show({
										msg : d.msg,
										title : '提示'
									});
								}
							}
						});
					} else {
						/* if(!checkData()) return; */
						userForm.form('submit', {
							url : '${pageContext.request.contextPath}/staffTmall.do?add',
							success : function(data) {
								try {
									var d = $.parseJSON(data);
									if (d) {
										userDialog.dialog('close');
										$.messager.show({
											msg : '用户创建成功！',
											title : '提示'
										});
										datagrid.datagrid('reload');
									}
								} catch (e) {
									$.messager.show({
										msg : '用户名称已存在！',
										title : '提示'
									});
								}
							}
						});
					}
				}
			} ]
		}).dialog('close');

		datagrid = $('#datagrid').datagrid({
			url : '${pageContext.request.contextPath}/staffTmall.do?datagrid',
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
			singleSelect : true,
			frozenColumns : [ [ {
				title : 'id',
				field : 'id',
				width : 50,
				checkbox : true
			}, {
				field : 'userName',
				title : '门店员工',
				width : 100,
				sortable : true
			} ] ],
			columns : [ [ {
				field : 'password',
				title : '密码',
				width : 100,
				hidden : true
			},{
				field : 'realname',
				title : '真实姓名',
				width : 100,
				sortable : true
			},{
				field : 'userLevel',
				title : '会员等级',
				width : 100,
				sortable : true
			/* }, {
				field : 'position',
				title : '职务',
				width : 100,
				sortable : true */
			},{
				field : 'nowCoin',
				title : '当前拥有金币',
				width : 100,
				sortable : true
			}, {
				field : 'totalCoin',
				title : '总金币',
				width : 100,
				sortable : true
			}, {
				field : 'mobile',
				title : '手机',
				width : 100,
				sortable : true
			},{
				field : 'address',
				title : '地址',
				width : 100,
				sortable : true
			}, {
				field : 'experience',
				title : '经验值',
				width : 100,
				sortable : true
			},{
				field : 'shopName',
				title : '门店',
				width : 100,
				sortable : true
			}, {
				field : 'totalCoin',
				title : '总金币',
				width : 100,
				sortable : true
			},{
				field : 'avatar',
				title : '图片',
				width : 100,
				formatter:function(value,row,index){
					return '<img src="'+value+'" style=" width: 50px; height: 40px;"/>';
				}
			} ] ],
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

	function append() {
		userDialog.dialog('open');
		passwordInput.validatebox({
			required : true
		});
		userForm.find('[name=name]').removeAttr('readonly');
		userForm.form('clear');
	}

	function edit() {
		var rows = datagrid.datagrid('getSelections');
		if (rows.length != 1 && rows.length != 0) {
			var names = [];
			for (var i = 0; i < rows.length; i++) {
				names.push(rows[i].name);
			}
			$.messager.show({
				msg : '只能择一个用户进行编辑！您已经选择了【' + names.join(',') + '】'
						+ rows.length + '个用户',
				title : '提示'
			});
		} else if (rows.length == 1) {
			document.getElementById("pic").style.display = 'block';
			passwordInput.validatebox({
				required : false
			});
			
			   $.post("city.do?cityList",{"provinceId":rows[0].provinceId},callbackCity);
			 
			$.post("shop.do?shopList",{"cityId":rows[0].cityId},callbackShop);
		
			userForm.find('[name=name]').attr('readonly', 'readonly');
			userDialog.dialog('open');
			userForm.form('clear');
			$("#pic").attr("src",rows[0].avatar);
			$("#avatar").val(rows[0].avatar);
			//alert(rows[0].province+'*'+rows[0].city+'*'+rows[0].store+'*'+rows[0].createdatetime+'*'+rows[0].type);
			userForm.form('load', {
				userName : rows[0].userName,
				id : rows[0].id,
				position : rows[0].position,
				idCard : rows[0].idCard,
				realname : rows[0].realname,
				shopId : rows[0].shopId,
				mobile : rows[0].mobile,
				email : rows[0].email,
				oldShopId : rows[0].oldShopId,
				sex : rows[0].sex,
				address : rows[0].address,
				qq : rows[0].qq,
				pic : rows[0].avatar,
				provinceId :rows[0].provinceId,
				cityId : rows[0].cityId,
			});
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
						url : '${pageContext.request.contextPath}/staffTmall.do?del',
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

	function searchFun() {
		datagrid.datagrid('load',
				{
					userName : $('#toolbar input[name=userName]').val(),
					shopName : $('#toolbar input[name=shopName]').val(),
					position : $('#toolbar input[name=position]').val()

				});
	}
	function clearFun() {
		$('#toolbar input').val('');
		datagrid.datagrid('load', {});
	}
	
	//设置显示时间
	function formatterdate(val, row) {
		if (val != null) {
		var date = new Date(val);
		return date.getFullYear() + '-' + (date.getMonth() + 1) + '-'
		+ date.getDate()+' '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
		}
	}
	
	//查看会员
	function selectItems(){
		var rows = datagrid.datagrid('getSelections');
		if(rows.length==1){
			$('#scanMemberId').dialog('open');
	        datagridScan = $('#scanMemberDatagrid').datagrid({
				url : 'staffTmall.do?scanMemberList&employeeAccount='+rows[0].employeeAccount,
				toolbar : '',
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
				rownumbers : true,  
				singleSelect : false,
				frozenColumns : [ [
				{
					title : '编号',
					field : 'id',
					width : 50,
					hidden : true,
				} ] ],
				columns : [ [ {
					field : 'taobaoUserNick',
					title : '淘宝用户',
					width : 100,
					align : 'center',
				},{
					field : 'mobile',
					title : '会员手机',
					width : 100,
					align : 'center'
				},{
					align : 'center',
					field : 'bindTime',
					title : '绑定时间',
					width : 100,
					align : 'center',
					formatter:formatterdate
				}] ],
			});
		}else if(rows.length>1){
			$.messager.alert('提示', '请选择一位员工进行查看！', 'error');
		}else{
			$.messager.alert('提示', '请选择要查看的员工！', 'error');
		}
		
	}
	
	function delScan() {
		var ids = [];
		var rows = datagridScan.datagrid('getSelections');
		if (rows.length > 0) {
			$.messager.confirm('请确认', '<b>您确定要解绑选择的会员</b>？', function(r) {
				if (r) {
					for (var i = 0; i < rows.length; i++) {
						ids.push(rows[i].id);
					}
					$.ajax({
						url : '${pageContext.request.contextPath}/staffTmall.do?delScan',
						data : {
							ids : ids.join(',')
						},
						cache : false,
						dataType : "json",
						success : function(data) {
							datagridScan.datagrid('unselectAll');
							datagridScan.datagrid('reload');
							if(data.success==true){
								$.messager.show({
									title : '提示',
									msg : '解绑成功'
								});
							}else{
								$.messager.show({
									title : '提示',
									msg : '解绑失败'
								});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert('提示', '请选择要删除的记录！', 'error');
		}
	}
</script>
</head>
<body class="easyui-layout" fit="true">
	<div region="center" border="false" style="overflow: hidden;">
		<div id="toolbar" class="datagrid-toolbar"
			style="height: auto; display: none;">
			<fieldset>
				<legend>筛选</legend>
				<table class="tableForm">
					<tr>
						<th>员工名称</th>
						<td><input name="userName"></td>
						<th>门店</th>
						<td><input name="shopName">
						<%-- <select id="shopId" class="easyui-combobox"  
							name="shopId"  
							data-options="  
							url:'${pageContext.request.contextPath}/shop.do?getAll', 
							valueField:'id',  
							textField:'shopName',
							width:'200px'">  
							</select> --%></td>
						<!-- <th>职务</th>
						<td><input name="position"></td> -->
					
					<td><a class="easyui-linkbutton" iconCls="icon-search"
							plain="true" onclick="searchFun();" href="javascript:void(0);">查找</a><a
							class="easyui-linkbutton" iconCls="icon-search" plain="true"
							onclick="clearFun();" href="javascript:void(0);">清空</a></td>
					</tr>
				</table>
			</fieldset>
			<div>
				<!-- <a class="easyui-linkbutton" iconCls="icon-add" onclick="append();"
					plain="true" href="javascript:void(0);">增加</a> --> <!-- <a
					class="easyui-linkbutton" iconCls="icon-remove" onclick="del();"
					plain="true" href="javascript:void(0);">删除</a> --> 
					<!-- <a
					class="easyui-linkbutton" iconCls="icon-edit" onclick="edit();"
					plain="true" href="javascript:void(0);">编辑</a> -->
					<a
					class="easyui-linkbutton" iconCls="icon-undo"
					onclick="datagrid.datagrid('unselectAll');" plain="true"
					href="javascript:void(0);">取消选中</a>
					<a	class="easyui-linkbutton" iconCls="icon-add"
					onclick="selectItems();" plain="true"
					href="javascript:void(0);">查看扫码会员</a>
			</div>
		</div>
		<table id="datagrid"></table>
	</div>

	<div id="userDialog" style="display: none; overflow: hidden;width:350px">
		<form id="userForm" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>用户ID</th>
					<td><input name="id" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>登录名称</th>
					<td><input name="userName" class="easyui-validatebox"
						required="true" /></td>
				</tr>
				<tr title="如果不更改密码,请留空!">
					<th>登录密码</th>
					<td><input name="userPassword" id="userPassword" type="password" /></td>
				</tr>
				<!-- <tr>
					<th>职务</th>
					<td><input name="position" /></td>
				</tr> -->
				<tr>
					<th>身份证</th>
					<td><input name="idCard" id="idCard"/></td>
				</tr>
				<tr>
					<th>真实姓名</th>
					<td><input name="realname" /></td>
				</tr>
				<tr>
					<th>性别</th>
					<td><input type="radio" name="sex" value="男" checked="checked"/>男
						<input type="radio" name="sex" value="女"/>女
					</td>
				</tr>
					<tr>
					<th>省份</th> 
					<td><select name="provinceId" id="province" 
					 onchange="province1()" style="width: 175px"></select></td>
				</tr>
				<tr>
					<th>城市</th> 
					<td><select name="cityId" id="city" onchange="city1()"  
					 style="width: 175px"></select></td>
				</tr>
				<tr>
					<th>门店</th>
					<td>
					<select id="shop" 
							name="shopId" style="width: 175px"></select>
						<%-- <select id="shopId" class="easyui-combobox"  
							name="shopId"  
							data-options="  
							url:'${pageContext.request.contextPath}/shop.do?getAll',  
							required:true,  
							valueField:'id', 
							width :'155px', 
							textField:'shopName'">  
							</select> --%>
					</td>
				</tr>
				<tr>
					<th>手机</th>
					<td><input name="mobile" id="mobile" class="easyui-validatebox"
						required="true" /></td>
				</tr>
				<!-- <tr>
					<th>邮箱</th>
					<td><input name="email" id="email"/></td>
				</tr> -->
				<!-- <tr>
					<th>以前所在门店</th>
					<td><input name="oldShopId"  /></td>
				</tr> -->
				<tr>
					<th>地址</th>
					<td><input name="address" /></td>
				</tr>
				<tr>
					<th>QQ</th>
					<td><input name="qq" id="qq"/></td>
				</tr>
				<tr>
					<th>照片</th>
					<td>
						<input id="file" type="file" name="files" onchange="changePicUrl()">
						<input type="hidden" name="avatar" id="avatar">
						<img name="pic" id="pic" alt="" src=""
						style="display:none; width: 50px; height: 50px;">
					</td>
				</tr>
			</table>
		</form>
	</div>

	<div id="menu" class="easyui-menu" style="width: 120px; display: none;">
		<!-- <div onclick="append();" iconCls="icon-add">增加</div> -->
		<div onclick="del();" iconCls="icon-remove">删除</div>
		<div onclick="edit();" iconCls="icon-edit">编辑</div>
	</div>
	
	<!-- 卡项 -->
	<div id="scanMemberId">
		<div id="toolbar2" class="datagrid-toolbar2"
			style="height: auto;">
			<div>
					<a class="easyui-linkbutton" iconCls="icon-remove" onclick="delScan();"
					plain="true" href="javascript:void(0);">解绑</a>
					 <a	class="easyui-linkbutton" iconCls="icon-undo"
					onclick="datagridScan.datagrid('unselectAll');" plain="true"
					href="javascript:void(0);">取消选中</a>
			</div>
		</div>
		<table id="scanMemberDatagrid"></table>
	</div>
</body>
</html>