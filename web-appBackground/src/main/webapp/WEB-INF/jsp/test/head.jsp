<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>数字资产交易平台</title>
<link href="<%=request.getContextPath()%>/resources/css/test/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="<%=request.getContextPath()%>/resources/js/test/jquery-1.11.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/test/Validform_v5.3.2_min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/test/base.js"></script>
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/resources/css/test/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="<%=request.getContextPath()%>/resources/css/test/add.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <script src="<%=request.getContextPath()%>/resources/js/test/bootstrap.min.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/test/flexslider.css" type="text/css" media="screen" />
<script src="<%=request.getContextPath()%>/resources/js/test/jquerySession.js"></script>

 <script type="text/javascript">
 var mark, demo ;
 $(function(){
	demo = $("#resetForm").Validform();  
	demo.config({
		 tiptype: function(msg,o,cssctl){
		 },
		 ajaxPost: true,
		 url: '${pageContext.request.contextPath}/test.do?resetPassword',
		 callback:function(data){
			if(data.success == false){
				if(data.msg == '1'){
					alert('验证码不对');
				}
			}else if(data.success == true){
				alert('密码已重置，请重新登陆');
				window.location.href = '${pageContext.request.contextPath}/test.do?index';
				/* $("#login_win").hide();	
				$(".find_win").hide(); */
			}
		}
	}); 
		
	 if('${sessionScope.frontUserM}'){
			$(".lg_win .res").click();
			$('.loginDiv').hide();
			$('.login_after').show();
			$('#div_userName').html('你好，' +'${sessionScope.frontUserM.userName}');
			$('#li_userName').html('用户名：'+'${sessionScope.frontUserM.userName}');
			$('#li_UID').html('UID　 ：'+'${sessionScope.frontUserM.uid}');
			$('#li_totalMoney').html('总资产：<span class="red">￥'+'${sessionScope.frontUserM.totalMoney}'+'</span>'); 
		}

	 
	 
	mark = {"loginUserName":false,"loginPassword":false,"regMobile":false,"regMobileCheckCode":false,
			"regPasswordMobile":false,"regRePasswordMobile":false,"regCheckCodeMobile":false,"regEmail":false,
			"regPasswordEmail":false,"regRePasswordEmail":false,"regCheckCodeEmail":false};
	//登陆校验
 	$('#login_userName').blur(function(){
		if(trim($('#login_userName').val()) == ''){
			$('#err_login_userName').html("请输入用户名！").addClass("Validform_checktip Validform_wrong");
			mark.loginUserName=false;
		}else{
			$('#err_login_userName').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
				.addClass("Validform_checktip Validform_right");
			mark.loginUserName=true;
		}
	});
 	
 	$('#login_password').blur(function(){
		if(trim($('#login_password').val()) == ''){
			$('#err_login_password').html("请输入密码！").addClass("Validform_checktip Validform_wrong");
			mark.loginPassword=false;
		}else{
			$('#err_login_password').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
				.addClass("Validform_checktip Validform_right");
			mark.loginPassword=true;
		}
	});
 	
 	//手机注册校验
	$("#reg_mobile").blur(function() {
		var mobile = trim($("#reg_mobile").val());
		if(mobile == ''){
			$('#err_reg_mobile').html("请填写信息！").addClass("Validform_checktip Validform_wrong");
			mark.regMobile=false;
		}else if(!checkMobile(mobile)){
			$('#err_reg_mobile').html("请输入手机号！").addClass("Validform_checktip Validform_wrong");
			mark.regMobile=false;
		}else{
			var dataPara = {userName:mobile};
			//校验号码是否已经注册
			$.ajax({
				url : '${pageContext.request.contextPath}/test.do?checkUserName',
				type : 'post',
				data : dataPara,
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success == true) {
						$('#err_reg_mobile').html("手机号已存在！").addClass("Validform_checktip Validform_wrong");
						mark.regMobile=false;
					}else {
						$('#err_reg_mobile').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
							.addClass("Validform_checktip Validform_right");
						mark.regMobile=true;
					}
				}
			});
		}
	}); 
 	
 	//手机验证码
	$("#reg_mobileCheckCode").blur(function() {
		var mobileCheckCode = trim($("#reg_mobileCheckCode").val());
		if(mobileCheckCode == ''){
			$('#err_reg_mobileCheckCode').html("请填写信息！").addClass("Validform_checktip Validform_wrong");
			mark.regMobileCheckCode=false;
		}else if(!checkMobileCheckCode(mobileCheckCode)){
			$('#err_reg_mobileCheckCode').html("请输入6位验证码！").addClass("Validform_checktip Validform_wrong");
			mark.regMobileCheckCode=false;
		}else{
			
			var dataPara = {mobileCheckCode:mobileCheckCode};
			
			$.ajax({
				url : '${pageContext.request.contextPath}/test.do?checkMobileCode',
				type : 'post',
				data : dataPara,
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success == false) {
						$('#err_reg_mobileCheckCode').html("手机验证码错误！").addClass("Validform_checktip Validform_wrong");
						mark.regCheckCodeMobile=false;
					}else {
						$('#err_reg_mobileCheckCode').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
						.addClass("Validform_checktip Validform_right");
						mark.regMobileCheckCode=true;
					}
				}
			});
			
			
		}
	});
	
	
	$("#reg_password_mobile").blur(function() {
		var password = $("#reg_password_mobile").val();
		if(password == ''){
			$('#err_reg_password_mobile').html("请填写信息！").addClass("Validform_checktip Validform_wrong");
			mark.regPasswordMobile=false;
		}else if((password.length < 6) || (password.length > 16)){
			$('#err_reg_password_mobile').html("请输入6-16位密码！").addClass("Validform_checktip Validform_wrong");
			mark.regPasswordMobile=false;
		}else{
			$('#err_reg_password_mobile').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
				.addClass("Validform_checktip Validform_right");
			mark.regPasswordMobile=true;
		}
	});
	
	$("#reg_repassword_mobile").blur(function() {
		var password = $("#reg_password_mobile").val();
		var repassword = $("#reg_repassword_mobile").val();
		if(repassword != password){
			$('#err_reg_repassword_mobile').html("两次输入密码不一至").addClass("Validform_checktip Validform_wrong");
			mark.regRePasswordMobile=false;
		}else{
			$('#err_reg_repassword_mobile').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
				.addClass("Validform_checktip Validform_right");
			mark.regRePasswordMobile=true;
		}
	});
	
	$("#reg_checkCode_mobile").blur(function() {
		var checkCode = $("#reg_checkCode_mobile").val();
		if( checkCode.length != 4){
			$('#err_reg_checkCode_mobile').html("验证码为4位").addClass("Validform_checktip Validform_wrong");
			mark.regCheckCodeMobile=false;
		}else{
			var dataPara = {checkCode:checkCode};
			//校验号码是否已经注册
			$.ajax({
				url : '${pageContext.request.contextPath}/test.do?checkcode',
				type : 'post',
				data : dataPara,
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success == false) {
						$('#err_reg_checkCode_mobile').html("验证码不正确！").addClass("Validform_checktip Validform_wrong");
						mark.regCheckCodeMobile=false;
					}else {
						$('#err_reg_checkCode_mobile').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
							.addClass("Validform_checktip Validform_right");
						mark.regCheckCodeMobile=true;
					}
				}
			});
		}
	});
	
	//邮箱注册校验
	$("#reg_email").blur(function() {
		var email = trim($("#reg_email").val());
		if(email == ''){
			$('#err_reg_email').html("请填写信息！").addClass("Validform_checktip Validform_wrong");
			mark.regEmail=false;
		}else if(!checkEmail(email)){
			$('#err_reg_email').html("请输入邮箱！").addClass("Validform_checktip Validform_wrong");
			mark.regEmail=false;
		}else{
			var dataPara = {userName:email};
			//校验号码是否已经注册
			$.ajax({
				url : '${pageContext.request.contextPath}/test.do?checkUserName',
				type : 'post',
				data : dataPara,
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success == true) {
						$('#err_reg_email').html("邮箱已存在！").addClass("Validform_checktip Validform_wrong");
						mark.regEmail=false;
					}else {
						$('#err_reg_email').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
							.addClass("Validform_checktip Validform_right");
						mark.regEmail=true;
					}
				}
			});
		}
	}); 
	
	$("#reg_password_email").blur(function() {
		var password = $("#reg_password_email").val();
		if(password == ''){
			$('#err_reg_password_email').html("请填写信息！").addClass("Validform_checktip Validform_wrong");
			mark.regPasswordEmail=false;
		}else if((password.length < 6) || (password.length > 16)){
			$('#err_reg_password_email').html("请输入6-16位密码！").addClass("Validform_checktip Validform_wrong");
			mark.regPasswordEmail=false;
		}else{
			$('#err_reg_password_email').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
				.addClass("Validform_checktip Validform_right");
			mark.regPasswordEmail=true;
		}
	});
	
	$("#reg_repassword_email").blur(function() {
		var password = $("#reg_password_email").val();
		var repassword = $("#reg_repassword_email").val();
		if(repassword != password){
			$('#err_reg_repassword_email').html("两次输入密码不一至").addClass("Validform_checktip Validform_wrong");
			mark.regRePasswordEmail=false;
		}else{
			$('#err_reg_repassword_email').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
				.addClass("Validform_checktip Validform_right");
			mark.regRePasswordEmail=true;
		}
	});
	
	$("#reg_checkCode_email").blur(function() {
		var checkCode = $("#reg_checkCode_email").val();
		if( checkCode.length != 4){
			$('#err_reg_checkCode_email').html("验证码为4位").addClass("Validform_checktip Validform_wrong");
			mark.regCheckCodeEmail=false;
		}else{
			var dataPara = {checkCode:checkCode};
			//校验号码是否已经注册
			$.ajax({
				url : '${pageContext.request.contextPath}/test.do?checkcode',
				type : 'post',
				data : dataPara,
				success : function(data) {
					var d = $.parseJSON(data);
					if (d.success == false) {
						$('#err_reg_checkCode_email').html("验证码不正确！").addClass("Validform_checktip Validform_wrong");
						mark.regCheckCodeEmail=false;
					}else {
						$('#err_reg_checkCode_email').html("通过信息验证！").removeClass("Validform_checktip Validform_wrong")
							.addClass("Validform_checktip Validform_right");
						mark.regCheckCodeEmail=true;
					}
				}
			});
		}
	});
 });
 
 
//登陆事件
 	function loginSubmit() {
 		$('#login_userName').blur();
 		$('#login_password').blur();
	
 		if(mark.loginUserName&&mark.loginPassword){
 			var dataPara = $('#loginForm').serializeArray();
 			$.ajax({
 				url : '${pageContext.request.contextPath}/test.do?frontLogin',
 				type : 'post',
 				data : dataPara,
 				success : function(data) {
 					var d = $.parseJSON(data);
 					if (d.success == true) {
 						$(".lg_win .res").click();
 						$('.loginDiv').hide();
 						$('.login_after').show();
 						$('#div_userName').html('你好，' +d.obj.userName);
 						$('#li_userName').html('用户名：'+d.obj.userName);
 						$('#li_UID').html('UID　 ：'+d.obj.uid);
 						$('#li_totalMoney').html('总资产：<span class="red">￥'+d.obj.totalMoney+'</span>');
 						
 						//如果是点击财务中心，安全中心的，登陆后跳转
 						if($.session.get("location")){
 							window.location.href = $.session.get("location");
							$.session.remove("location");
 						}
 					} else {
 						alert(d.msg);
 					}
 				}
 			});
 		}
	} 
	//注册
 	function regSubmit(regType) {
		var dataPara;
		if(regType == '1'){  //手机注册
			$("#reg_mobile").blur();
			$("#reg_mobileCheckCode").blur();
			$("#reg_password_mobile").blur();
			$("#reg_repassword_mobile").blur();
			$("#reg_checkCode_mobile").blur();
			
			if(!((mark.regMobile&&mark.regMobileCheckCode&&mark.regPasswordMobile&&mark.regRePasswordMobile&&mark.regCheckCodeMobile)))
				return;
			
			if(!$("#user_agreement_mobile").is(':checked')){
				$('#err_user_agreement_mobile').css("display","block");
				return;
			}else {
				$('#err_user_agreement_mobile').css("display","none");
			}
			
			dataPara = $('#regForm1').serializeArray();
		}else if(regType == '2'){  //邮箱注册
			$("#reg_email").blur();
			$("#reg_password_email").blur();
			$("#reg_repassword_email").blur();
			$("#reg_checkCode_email").blur();
			
			if(!((mark.regEmail&&mark.regPasswordEmail&&mark.regRePasswordEmail&&mark.regCheckCodeEmail)))
				return;
			
			if(!$("#user_agreement_email").is(':checked')){
				$('#err_user_agreement_email').show();
				return;
			}else {
				$('#err_user_agreement_email').hide();
			}
			
			dataPara = $('#regForm2').serializeArray();
		}
		
		$.ajax({
			url : '${pageContext.request.contextPath}/test.do?register',
			type : 'post',
			data : dataPara,
			success : function(data) {
				var d = $.parseJSON(data);
				if (d.success == true) {
					
					$(".lg_win .res").click();
					$('.loginDiv').hide();
					$('.login_after').show();
					$('#div_userName').html('你好，' +d.obj.userName);
					$('#li_userName').html('用户名：'+d.obj.userName);
					$('#li_UID').html('UID　 ：'+d.obj.uid);
					$('#li_totalMoney').html('总资产：<span class="red">￥'+d.obj.totalMoney+'</span>');
					
				} else {
					if(d.msg = '1'){	//验证码不正确
						$('#err_reg_mobileCheckCode').html("验证码不正确！").addClass("Validform_checktip Validform_wrong");
					}
				}
			}
		});
	}
 

	
 	function refreshVerifyCode() {
 		$('#imgVerifyCode').attr("src", "${pageContext.request.contextPath}/kaptcha.do?getKaptchaImage&t=" +  Math.floor(Math.random()*100));
 	}
 	
 	function ltrim(s) {
	    return s.replace(/^\s*/, "");
	}

	function rtrim(s) {
	    return s.replace(/\s*$/, "");
	}

	function trim(s) {
	    return rtrim(ltrim(s));
	}
 
	function checkTip(id, tips){
		
	}
	
	function checkMobile(mobile) {
	    filter = /^1[3|4|5|8|7][0-9]\d{8}$/;
	    if (!filter.test(trim(mobile))) {
	        return false;
	    } else {
	        return true;
	    }
	}
	//6位手机验证码
	function checkMobileCheckCode(mobile) {
	    filter = /^\d{6}$/;
	    if (!filter.test(trim(mobile))) {
	        return false;
	    } else {
	        return true;
	    }
	}
	
	function checkEmail(email) {
	    filter = /^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    if (!filter.test(trim(email))) {
	        return false;
	    } else {
	        return true;
	    }
	}
	
	function checkLogin(part){
		var location = '';
		if(part == 1){
			location = "${pageContext.request.contextPath}/finance.do?index";
		}else if(part == 2){
			location = "${pageContext.request.contextPath}/safe.do?safeSetting";
		}
		
		if($('.login_after').is(':hidden')){	
			//未登录
			$.session.set("location", location);
			$('#login_a').click();
		}else {
			window.location.href = location;
		}
		
	}
	
	//推出登陆
	function logOut(){
		 window.location.href = "<%=request.getContextPath()%>/test.do?logout";
	}
	
	//忘记密码
 	function forgetPassword(){
		
 		var userName = trim($('#login_userName').val());
		if(userName == ''){
			$('#err_login_userName').html("请输入用户名！").addClass("Validform_checktip Validform_wrong");
			return;
		}
		
		var dataPara = {userName: userName};
		//校验登陆名是否存在
		$.ajax({
			url : '${pageContext.request.contextPath}/test.do?checkUserName',
			type : 'post',
			data : dataPara,
			success : function(data) {
				var d = $.parseJSON(data);
				if (d.success == true) {
					$("#login_win").hide();	
					$(".find_win").show();
					$("#reset_userName").val(userName);
				}else {
					$('#err_login_userName').html("用户名不存在！").addClass("Validform_checktip Validform_wrong");
				}
			}
		});
	};	 
	
	//发送验证码 -- 忘记密码，手机找回密码
	function sendCode(){
		
		//发送验证码的效果
		var getTime = 0;
		var _this =  $("#send_resetMobileCode");
		var item =  $("#send_resetMobileCode");
		if($(item).hasClass("yz_unable")){
			return;	
		}
		
		//发送验证码
		var mobile = trim($("#reset_mobile").val());
		
		if(mobile == ''){
			$('#err_reset_mobile').html("请输入手机号码！").addClass("Validform_checktip Validform_wrong");
			return;
		}
		
		var dataPara = {mobile:mobile};
		$.ajax({
			url : '${pageContext.request.contextPath}/test.do?sendCheckCode',
			type : 'post',
			data : dataPara,
			success : function(data) {
				var d = $.parseJSON(data);
			}
		});
		
		$(item).addClass("yz_unable");
		var numAll = 60;
		$(item).html(numAll+"秒后重发");		
		getTime = setInterval(function(){
			numAll--;
			if(numAll <= 0){
				//重置session手机验证码
				$.ajax({
					url : '${pageContext.request.contextPath}/test.do?resetCheckCode',
					type : 'post',
					//data : dataPara,
					success : function(data) {
					}
				});
				
				$(_this).removeClass("yz_unable");	
				$(_this).html("发送验证码");
				clearInterval(getTime);
				return;
			}
			$(_this).html(numAll+"秒后重发");	
		},1000);
	}
	
	//发送验证码 -- 手机注册
	function sendMobileCheckCode(){
		
		//发送验证码的效果
		var getTime = 0;
//		var _this = this;
		var _this =  $("#send_RegMobileCode");
		var item =  $("#send_RegMobileCode");
		if($(item).hasClass("yz_unable")){
			return;	
		}
		
		$("#reg_mobile").blur();
		if(!(mark.regMobile)){
			return;
		}
		//发送验证码
		var mobile = trim($("#reg_mobile").val());
		var dataPara = {mobile:mobile};
		$.ajax({
			url : '${pageContext.request.contextPath}/test.do?sendCheckCode',
			type : 'post',
			data : dataPara,
			success : function(data) {
				var d = $.parseJSON(data);
			}
		});
		
		$(item).addClass("yz_unable");
		var numAll = 60;
		$(item).html(numAll+"秒后重发");		
		getTime = setInterval(function(){
			numAll--;
			if(numAll <= 0){
				//重置session手机验证码
				$.ajax({
					url : '${pageContext.request.contextPath}/test.do?resetCheckCode',
					type : 'post',
					//data : dataPara,
					success : function(data) {
					}
				});
				
				$(_this).removeClass("yz_unable");	
				$(_this).html("发送验证码");
				clearInterval(getTime);
				return;
			}
			$(_this).html(numAll+"秒后重发");	
		},1000);
	}
	
	function changeImg(type) {
		var imgSrc;
		if(type == 0){
			imgSrc = $("#imgObj");
		}else {
			imgSrc = $("#imgObj1");
		}
		var src = imgSrc.attr("src");
		imgSrc.attr("src", chgUrl(src));
	}
	//时间戳   
	//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳   
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		url = url.substring(0, 17);
		if ((url.indexOf("&") >= 0)) {
			url = url + "×tamp=" + timestamp;
		} else {
			url = url + "?code&timestamp=" + timestamp;
		}
		return url;
	}
	
 </script>
 
</head>
<body>
<!-- NAVBAR
================================================== -->
<div class="header">
    <div class="navbar-wrapper">
      <div class="container">
        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="navbar-header">
              <div class="logo wow">
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/test.do?index"><img src="<%=request.getContextPath()%>/resources/img/test/logo.png" /></a>
              </div>
            </div>
            
            <div class="login_after" style="display:none;"><!--登录后的放这里-->
            		<div id="div_userName" class="handle"></div>
            		<a href="#" class="flag">
            			<img src="<%=request.getContextPath()%>/resources/img/test/flag.png" />	
            		</a>
            		
            		<div class="login_slide">
            			<div class="sj"></div>
            			
            			<ul>
            				<li id="li_userName"></li>	
            				<li id="li_UID"></li>	
            				<li id="li_totalMoney"></li>	
            			</ul>
            			
            			<a href="#" class="go_btn">我要购买</a>
            			
            			<div class="mof">
            				<a href="javascript:logOut();">退出</a>
            				<a href="#">充值</a>
            				<a href="#">提现</a>
            				<a href="#">委托管理</a>
            			</div>
            			
            			<div class="clear"></div>	
            		</div>
            		
            </div>
            
            
            <div id="navbar" class="navbar-collapse collapse">
             <nav class="cl-effect-11">
              <ul class="nav navbar-nav">
                <li><a href="<%=request.getContextPath()%>/test.do?index" data-hover="Home"><img id="index" src="<%=request.getContextPath()%>/resources/img/test/navHome2.png"></a></li>
				<li><a href="<%=request.getContextPath()%>/trade.do?index" data-hover="About"><img id="trade" src="<%=request.getContextPath()%>/resources/img/test/navTrade.png"></a></li>
				<li><a href="#" data-hover="Services"><img onclick="checkLogin(1);" id="finance" src="<%=request.getContextPath()%>/resources/img/test/navFinance.png"></a></li>
				<li><a href="#" data-hover="Shortcodes"><img onclick="checkLogin(2);" id="safe" src="<%=request.getContextPath()%>/resources/img/test/navSafe.png"></a></li>
				<li><a href="<%=request.getContextPath()%>/news.do?index" data-hover="Portfolio"><img id="news" src="<%=request.getContextPath()%>/resources/img/test/navNews.png"></a></li>
				<li class="loginDiv">
					<img src="<%=request.getContextPath()%>/resources/img/test/btnLogin.png" id="login_a">
					<img src="<%=request.getContextPath()%>/resources/img/test/btnReg.png" id="reg_a">
					<img src="<%=request.getContextPath()%>/resources/img/test/flag.png">
				</li>
              </ul>
            </nav>
            </div>
            <div class="clearfix"> </div>
             </nav>
			 
          </div>
           <div class="clearfix"> </div>
    </div>
     <div class="clearfix"> </div>
</div>

<!--注册登录弹窗区-->
	<div class="alert_flog"></div>
	
	<div class="lg_win login_win" id="login_win">
		<div class="lgwin_handle">
			<span class="a1 hover"><em>登录</em></span>
			<span class="a2"><em>手机注册</em></span>
			<span class="a3"><em>邮箱注册</em></span>
		</div>
		
		<div class="lgwin_wrap show">
			<form  id="loginForm" name="loginForm" method="post">
				<div class="line25"></div>
				<div class="in">
					<input id="login_userName" name="userName" type="text" class="text" placeholder="请输入帐号"/>
					<span id='err_login_userName'></span>
				</div>
				<div class="line25"></div>
				<div class="in">
					<input id="login_password" name="password" type="password" class="text" placeholder="请输入密码"/>
					<!-- <input id="login_password" name="password" type="text" class="text ps1" placeholder="请输入密码" />
					<input type="password" class="text ps2" value=""  /> -->
					<span id='err_login_password'></span>
				</div>
				<div class="rem">
					<label>
						<input name="remember_password" type="checkbox" class="chk" checked="checked" />
						记住登录	
					</label>
					<a href="#" class="forget_a" onclick="forgetPassword();">忘记密码？</a>
					<div class="clear"></div>	
				</div>	
				
				<div class="sub_outer">
					<input type="button" class="sub" value="登录" onclick="loginSubmit()"/>
					<input type="reset" class="res" value="取消" />
					<div class="clear"></div>	
				</div>			
					
			</form>	
		</div>
		<div class="lgwin_wrap">
			<form id="regForm1" name="regForm1" method="post">
				<input name="regType" type="hidden"  value="mobile" />
				<div class="line25"></div>
				<div class="in">
					<select name="location">
						<option>中国大陆(China)</option>
						<option>美国(America)</option>	
						<option>英国(English)</option>	
					</select>
				</div>
				<div class="line25"></div>
				<div class="in">
					<span class="qh">+86</span>
					<input id="reg_mobile" name="mobile" type="text" class="text text_tel" placeholder="请输入你的手机号码"/>	
					<span id='err_reg_mobile'></span>
				</div>
				<div class="line25"></div>
				<div class="in">
					<div class="in">
						<a href="javascript:sendMobileCheckCode();" class="get_yz" id="send_RegMobileCode">发送验证码</a>
						<input id="reg_mobileCheckCode" name="mobileCheckCode" type="text" class="text" placeholder="短信验证码" />	
						<span id='err_reg_mobileCheckCode'></span>
					</div>
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text ps1" placeholder="请设置登录密码" />
					<input id="reg_password_mobile" name="password" type="password" class="text ps2" value="" />
					<span id='err_reg_password_mobile'></span>
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text ps1" placeholder="请再次输入密码" />
					<input id="reg_repassword_mobile" name="repassword" type="password" class="text ps2" value="" />
					<span id='err_reg_repassword_mobile'></span>
				</div>				
				<div class="line25"></div>
				<div class="in">
					<a href="#" onclick="changeImg(0)" class="re_code"><img id="imgObj" alt="验证码" src="<%=request.getContextPath()%>/code.do?code" /></a>
					<input id="reg_checkCode_mobile" name="checkCode" type="text" class="text" placeholder="验证码" />					
					<span id='err_reg_checkCode_mobile'></span>
				</div>
				<div class="rem">
					<label>
						<input id="user_agreement_mobile" type="checkbox" class="chk" checked="checked" />
						已阅读并同意<a href="#" class="xy_a">用户协议</a>
						<br>					
						<span id='err_user_agreement_mobile' class="Validform_checktip Validform_wrong" style="display:none">请阅读并同意用户协议！</span>
					</label>
					<div class="clear"></div>	
				</div>	
				
				<div class="sub_outer">
					<input type="button" class="sub" value="注册" onclick="regSubmit(1)"/>
					<input type="reset" class="res" value="取消" />
					<div class="clear"></div>	
				</div>			
					
			</form>	
		</div>
		<div class="lgwin_wrap">
			<form id="regForm2" name="regForm2" method="post">
				<input name="regType" type="hidden"  value="email" />
				<div class="line25"></div>
				<div class="email_tip">
					<span>重要提示：</span> 我们会给您的邮箱发一封邮件，您可以选择启动账户，方便以后找回密码。	
				</div>
				<div class="line25"></div>				
				<div class="in">
					<div class="in">						
						<input id="reg_email" name="email" type="text" class="text" placeholder="请输入邮箱"/>
						<span id='err_reg_email'></span>	
					</div>
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text ps1" placeholder="请输入密码" />
					<input id="reg_password_email" name="password" type="password" class="text ps2" />
					<span id='err_reg_password_email'></span>	
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text ps1" placeholder="请再次输入密码" />
					<input id="reg_repassword_email" name="repassword" type="password" class="text ps2" value="" />
					<span id='err_reg_repassword_email'></span>	
				</div>				
				<div class="line25"></div>
				<div class="in">
					<a href="#" onclick="changeImg(1)" class="re_code"><img id="imgObj1" alt="验证码" src="<%=request.getContextPath()%>/code.do?code" /></a>
					<input id="reg_checkCode_email" name="checkCode" type="text" class="text" placeholder="验证码" />					
					<span id='err_reg_checkCode_email'></span>	
				</div>
				<div class="rem">
					<label>
						<input id="user_agreement_email" type="checkbox" class="chk" checked="checked" />
						已阅读并同意<a href="#" class="xy_a">用户协议</a>
						<br>
						<span id='err_user_agreement_email' class="Validform_checktip Validform_wrong" style="display:none">请阅读并同意用户协议！</span>
					</label>					
					<div class="clear"></div>	
				</div>	
				
				<div class="sub_outer">
					<input type="button" class="sub" value="注册" onclick="regSubmit(2)"/>
					<input type="reset" class="res" value="取消" />
					<div class="clear"></div>	
				</div>			
					
			</form>	
		</div>
			
	</div>
	
	
	<div class="lg_win find_win">
		<div class="findwin_title">找回密码</div>		
		<form id="resetForm" method="post" >
			<div class="lgwin_wrap show" >
				<div class="line25"></div>
				<input type="hidden" name="userName" id="reset_userName" placeholder="用户账号" />
				<div class="in">
					<a href="javascript:sendCode();" class="get_yz" id="send_resetMobileCode">发送验证码</a>
					<input type="text" class="text" name="mobile" id="reset_mobile" placeholder="手机号码" datatype="m" errormsg="请输入手机号码" />
					<span id='err_reset_mobile'></span> 
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text" name="mobileCheckCode" id="reset_mobileCheckCode" placeholder="收到的验证码" datatype="n6-6" errormsg="请输入6位验证码" />
					<span id='err_reset_checkCode'></span>	
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text ps1" value="新设密码" />
					<input type="password" class="text ps2" name="password" id="reset_password" value="" datatype="*6-16" errormsg="密码为6到16位字符" />
					<span id='err_reset_userPass'></span>	
				</div>
				<div class="line25"></div>
				<div class="in">
					<input type="text" class="text ps1" value="再次输入密码" />
					<input type="password" class="text ps2" value="" datatype="*" recheck="password" errormsg="两次输入的密码不一至" />
					<span id='err_reset_userPass2'></span>	
				</div>			
				<div class="line25"></div>
				<div class="sub_outer">
					<input type="submit" class="sub" value="确定" id="btn_sub"/>
					<input type="reset" class="res" value="取消" id="btn_ret"/>
					<div class="clear"></div>	
				</div>			
					
			</div>		
		</form>	
			
	</div>

</body>

