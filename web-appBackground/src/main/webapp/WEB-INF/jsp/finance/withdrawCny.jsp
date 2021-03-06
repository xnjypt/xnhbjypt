<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html style="background:#f1f6f9;">
<head>
<link href="<%=request.getContextPath()%>/resources/css/test/style1.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="icon" href="#" type="image/x-icon">
<link rel="shortcut icon" href="#" type="image/x-icon">
<link href="<%=request.getContextPath()%>/resources/commonfiles/jquery-ui-1.10.4.custom.min.css" rel="stylesheet" type="text/css" media="screen, projection">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/common.css" type="text/css">

<link media="screen, projection" type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/common/financial.css">
<style type="text/css">.qly-ext-detail{cursor:pointer}.qly-shop-entry{line-height:22px}#qlyExtDetailTop{margin:7px 0 10px;color:#669bcb;border:1px solid #e8e8e8;overflow:hidden}#qlyExtDetailTop>div,#qlyExtDetailTop>div>p,#qlyExtDetailTop>div>span,#qlyExtDetailTop>span{float:left;padding-left:5px}#qlyExtDetailTop>div>p a{color:#f40}#qlyExtDetailTop .qly-shop-entry,#qlyExtDetailTop a{color:#669bcb}#qlyExtDetailTop>span{cursor:pointer}#qlyExtDetailTop>div{margin-top:2px}#qlyExtDetailTop .qly-ext-type{color:#6c6c6c}#qlyExtDetailTop .qly-ext-pc{clear:left}.qly-setting-wrap{visibility:hidden;position:relative;top:4px}.qly-container-hover .qly-setting-wrap{visibility:visible}.qly-low-version .qly-setting-wrap{visibility:hidden!important}</style><style type="text/css">.qly-kws,.qly-kws-bottom{overflow:hidden}.qly-kws-bottom .qly-updataTime{text-indent:10px;line-height:30px;float:left;color:#f40}.qly-kws-bottom .qly-more{float:right;line-height:30px;color:#4288c2;text-decoration:none}</style><style type="text/css">.qly_product_dTitle{display:inline-block;line-height:22px;font-size:12px;cursor:pointer;padding-left:5px}.qly_product_dTitle span{padding-left:5px;color:#f40}</style><style type="text/css">.qly_history_price{font-size:12px;position:relative}.qly_history_price>a{display:inline-block;cursor:pointer}.qly_history_price>a:hover{text-decoration:none}#qlyExtDetailTop .qly_history_price{line-height:22px}#qlyExtDetailTop .qly_history_price>a{border-radius:5px}.qly-ext-list-item .qly_history_price{padding:2px 0;display:inline-block;line-height:18px}.qly-ext-list-item .qly_history_price>a{padding:0 5px;border-radius:3px}</style><style type="text/css">.qly_qutu_warp{width:440px;height:320px;background:#fff;position:relative}.qly_qutu_warp .TK-qutu-sub-con{position:relative;height:240px}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-data{position:absolute;left:46px;top:220px}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-data span{margin-left:24px}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-price{position:absolute;left:0;top:-6px;width:26px;text-align:right}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-price span{display:block}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-price span:last-child{margin-bottom:0!important}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-price-item-2{margin-bottom:190px!important}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-price-item-3{margin-bottom:88px!important}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-price-item-6{margin-bottom:17px!important}.qly_qutu_warp .TK-qutu-sub-con #TK-canvas-sub-base,.qly_qutu_warp .TK-qutu-sub-con #TK-canvas-sub-layout{position:absolute;left:36px;top:0}.qly_qutu_warp .TK-qutu-sub-con .TK-qutu-sub-msg{position:absolute;padding:4px;display:none;background:#fefefe;border:1px solid #ccc;border-radius:6px}.qly_qutu_warp .qly_lowest_price{padding-left:36px;line-height:40px}.qly_qutu_warp .qly_lowest_price span{color:red;font-size:14px}.qly_qutu_warp .qly_by{text-align:center;line-height:40px}.qly_qutu_warp .TK-qutu-sub-msg-wrap{width:105px}.product_detail{float:right;font-size:12px;color:#6ea3ce}.product_detail:hover{text-decoration:inherit;color:#6ea3ce}</style><style type="text/css">.qly_product_dType{display:inline-block;line-height:22px;cursor:pointer}</style><style type="text/css">.qly-expand{cursor:pointer}#mainsrp-itemlist .grid .item-ad .qly-arrow-down,#mainsrp-itemlist .grid .item-ad .qly-arrow-up{right:35px;top:10px}#mainsrp-itemlist .grid .qly-arrow-down{width:6px;height:6px;border-right:2px solid #669bcb;border-bottom:2px solid #669bcb;position:absolute;margin-top:-4px;-webkit-transform:rotate(45deg);transform:rotate(45deg);right:6px;top:8px}#mainsrp-itemlist .grid .qly-arrow-down:after{content:''}#mainsrp-itemlist .grid .qly-arrow-up{width:6px;height:6px;border-right:2px solid #669bcb;border-bottom:2px solid #669bcb;position:absolute;-webkit-transform:rotate(225deg);transform:rotate(225deg);right:6px;top:8px}#mainsrp-itemlist .grid .qly-arrow-up:after{content:''}#mainsrp-itemlist .grid .qly-ext-list-item{padding-right:0;float:none;overflow:hidden;border-top:1px solid #ededed}#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-hang-down>div{display:block;margin-left:5px}#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-pc>a{margin-right:7px}#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-mobile>a,#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-pc>a{float:left;clear:both;color:#404040!important}#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-mobile>span,#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-pc>span{width:173px;float:left}#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-mobile>span .qly-ext-item,#mainsrp-itemlist .grid .qly-ext-list-item .qly-list-pc>span .qly-ext-item{float:left}#mainsrp-itemlist .grid .qly-list-setting{position:absolute;right:3px;top:5px}#mainsrp-itemlist .grid .qly-list-hang-down{position:relative;width:100%;top:0;left:-1px;background-color:#fff;z-index:2;border:1px solid #ededed;border-top:none}#mainsrp-itemlist .grid .qly-list-hang-down>div,#mainsrp-itemlist .grid .qly-list-hang-down>p{display:block}#J_ItemList .qly-arrow-down{margin-top:-4px;-webkit-transform:rotate(45deg);transform:rotate(45deg)}#J_ItemList .qly-arrow-down,#J_ItemList .qly-arrow-up{width:6px;height:6px;border-right:2px solid #669bcb;border-bottom:2px solid #669bcb;position:absolute;right:6px;top:8px}#J_ItemList .qly-arrow-up{-webkit-transform:rotate(225deg);transform:rotate(225deg)}#J_ItemList .qly-ext-list-item{overflow:hidden;border-top:1px solid #ededed}#J_ItemList .qly-ext-list-item .qly-list-hang-down>div{display:block;margin-left:5px}#J_ItemList .qly-ext-list-item .qly-list-pc>a{margin-right:10px}#J_ItemList .qly-ext-list-item .qly-list-mobile>a,#J_ItemList .qly-ext-list-item .qly-list-pc>a{float:left;clear:both;color:#404040!important}#J_ItemList .qly-ext-list-item .qly-list-mobile>span,#J_ItemList .qly-ext-list-item .qly-list-pc>span{width:164px;float:left}#J_ItemList .qly-ext-list-item .qly-list-mobile>span .qly-ext-item,#J_ItemList .qly-ext-list-item .qly-list-pc>span .qly-ext-item{float:left}#J_ItemList .qly-list-hang-down{position:relative}#J_ItemList .qly-list-hang-down>div,#J_ItemList .qly-list-hang-down>p{line-height:24px;padding-left:5px}#J_ItemList .qly-list-setting{position:absolute;right:3px;top:5px}#goods-in-stock .qly-expand,#goods-in-stock .qly-list-mobile,#goods-in-stock .qly-list-pc,#goods-on-sale .qly-expand,#goods-on-sale .qly-list-mobile,#goods-on-sale .qly-list-pc{display:none}#J_DataTable .qly-arrow-down:after,#mainsrp-itemlist .qly-arrow-down:after{width:6px;height:6px;right:0;top:3px;color:#669bcb;position:absolute;content:'>>'}#J_DataTable .qly-arrow-up:after,#mainsrp-itemlist .qly-arrow-up:after{width:6px;height:6px;position:absolute;right:0;top:3px;color:#669bcb;content:'<<'}#J_DataTable .qly-expand,#mainsrp-itemlist .qly-expand{right:-28px;top:5px}#J_DataTable .qly-ext-list-item,#mainsrp-itemlist .qly-ext-list-item{float:left;padding-right:30px}#J_DataTable .qly-ext-list-item .qly-list-mobile>a,#J_DataTable .qly-ext-list-item .qly-list-pc>a,#mainsrp-itemlist .qly-ext-list-item .qly-list-mobile>a,#mainsrp-itemlist .qly-ext-list-item .qly-list-pc>a{color:#404040!important}#J_DataTable .qly-ext-list-item>div,#mainsrp-itemlist .qly-ext-list-item>div{float:left}.response-narrow #mainsrp-itemlist .grid .qly-ext-list-item .qly-list-mobile>span,.response-narrow #mainsrp-itemlist .grid .qly-ext-list-item .qly-list-pc>span{width:133px}.qly-ext-list-item{clear:both;z-index:1}.qly-ext-list-item a{color:#f40!important}.qly-ext-item{cursor:pointer}.qly-list-hang-down{display:none}.qly-list-hang-down>div{display:inline-block}.qly-list-hang-down>p>a{color:#000;text-decoration:none}#J_DataTable .qly-list-hang-down,#mainsrp-itemlist .qly-list-hang-down{position:relative}#J_DataTable .qly-list-hang-down>div,#J_DataTable .qly-list-hang-down>p,#mainsrp-itemlist .qly-list-hang-down>div,#mainsrp-itemlist .qly-list-hang-down>p{line-height:24px;padding-left:5px}.qly-list-setting{visibility:hidden}.qly-container-hover .qly-list-setting{visibility:visible}.qly-low-version .qly-list-setting{visibility:hidden!important}#J_DataTable .qly-list-setting,#mainsrp-itemlist .qly-list-setting{position:absolute;right:-17px;top:6px}.qly-list-show{display:block!important}.qly-list-hide{display:none!important}#J_ItemList .product.qly-ext-append{height:407px!important}#J_ItemList.grid-nosku .product.qly-ext-append{height:368px!important}#J_ItemList.grid-cspu .product.qly-ext-append{height:388px!important}.m-itemlist .grid .item.qly-ext-append,.response-normal .m-itemlist .grid .item.qly-ext-append{height:383px!important}#listsrp-itemlist .m-itemlist .grid .item.qly-ext-append,#listsrp-itemlist .response-normal .m-itemlist .grid .item.qly-ext-append{height:450px!important}.response-narrow .m-itemlist .grid .item.qly-ext-append{height:343px!important}#J_ItemList .product.item-1111.qly-ext-append,.response-wider .m-itemlist .grid .item.qly-ext-append{height:413px!important}#J_ItemList.grid-nosku .product.item-1111.qly-ext-append{height:380px!important}#J_ItemList.grid-cspu .product.item-1111.qly-ext-append{height:406px!important}</style><style type="text/css">#qlyTaobaoSellerCenterPop{position:fixed;right:2px;width:300px;height:170px;-webkit-box-shadow:0 0 16px 1px rgba(0,0,0,.75);-webkit-transition:bottom .5s;background-color:#fff}#qlyTaobaoSellerCenterPop.qly-seller-center-pop-in{bottom:2px}#qlyTaobaoSellerCenterPop.qly-seller-center-pop-out{bottom:-174px}.qly-seller-center-close{position:absolute;top:5px;right:10px;color:#000}.qly-seller-center-close:hover{text-decoration:none}.qly-seller-center-post{position:absolute;font-size:18px;top:20px;left:20px;font-family:Simsun}</style><style type="text/css">.qly-top{width:100%;height:0;overflow:hidden;background:#fff;position:relative;z-index:1}.qly-top>a{display:block;width:100%;height:50px}.qly-top>a>img{position:absolute;top:0;left:50%;margin-left:-500px}.qly-top>span.qly-top-close{position:absolute;right:30px;top:15px;width:20px;height:20px;line-height:20px;text-align:center;cursor:pointer;background:#666;color:#fff}</style><style type="text/css">.qly-bottom{position:fixed;left:0;bottom:-70px;width:728px;height:70px;z-index:1}.qly-bottom>span.qly-bottom-close{position:absolute;right:0;top:0;width:20px;height:20px;line-height:20px;text-align:center;cursor:pointer;color:#fff;background:#666}</style><style type="text/css">#qly-popup{position:fixed;z-index:1;width:300px;height:170px;-webkit-box-shadow:0 0 16px 1px rgba(0,0,0,.75);-webkit-transition:bottom .5s;background-color:#fff;bottom:-200px;right:0}.qly-popup-close{position:absolute;right:2px;top:0;width:20px;height:20px;line-height:20px;text-align:center;cursor:pointer}</style><style type="text/css">#qly-textLink{position:fixed;z-index:1;width:300px;height:170px;-webkit-box-shadow:0 0 16px 1px rgba(0,0,0,.75);-webkit-transition:bottom .5s;background-color:#fff;bottom:-200px;right:0}#qly-textLink-ad{font-size:14px;margin:60px 20px 0;line-height:24px;display:inline-block;color:#0579c6}.qly-textLink-post{position:absolute;font-size:18px;top:20px;left:20px;font-family:Simsun}.qly-textLink-close{position:absolute;right:2px;top:0;width:20px;height:20px;line-height:20px;text-align:center;cursor:pointer}</style><link rel="stylesheet" type="text/css" href="chrome-extension://iekhgpdklpkpjjnpnbgcmlbjhaedbilf/styles/app.css"><style>@font-face{font-family:uc-nexus-iconfont;src:url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_1476274416_922599.woff) format('woff'),url(chrome-extension://pogijhnlcfmcppgimcaccdkmbedjkmhi/res/font_1476274416_922599.ttf) format('truetype')}</style>

<script src="<%=request.getContextPath()%>/resources/commonfiles/hm.js"></script><script type="text/javascript">var _hmt=_hmt||[];(function(){var hm = document.createElement("script");hm.src = "//hm.baidu.com/hm.js?96d9d92b8a4aac83bc206b6c9fb2844a";var s = document.getElementsByTagName("script")[0];s.parentNode.insertBefore(hm, s);}())</script><script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/jquery-1.8.2.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/script.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/coincommon.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/highstock.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/exporting.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/account.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/user.js"></script>
<script src="<%=request.getContextPath()%>/resources/commonfiles/fin.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/resources/commonfiles/jquery.flot.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/jquery.placeholder-1.0.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/commonfiles/language_cn.js"></script>

<jsp:include page="../test/head.jsp"></jsp:include>
<style type="text/css">
.rightArea {
	width: 815px;
	min-height: 560px;
	float: left;
	position: relative;
	margin-top: 43px;
	padding-left: 30px;
	padding-bottom: 65px;
}
.Areacon {
	font-size: 14px;
	background: #fff;
	border: 1px solid #e1e1e2;
	padding: 50px 30px 0;
	float: left;
	width: 953px;
	min-height: 542px;
}
.Areatitle {
	line-height: 45px;
	font-weight: 700;
	font-size: 14px;
	position: absolute;
	padding-left: 30px;
	top: -43px;
	left: 0;
}
.title {
	height: 45px;
	line-height: 45px;
	min-width: 150px;
	color: #000;
	background: #fff;
	display: inline;
	cursor: pointer;
	font-size: 16px;
	text-align: center;
	border: 1px solid #e1e1e2;
	border-style: solid solid none solid;
	float: left;
}
.bigTopTab {
	height: 40px;
	background: #fff;
}

 .accountfilter {
	line-height: 40px;
	color: #747373;
}
.coinBoxBody {
	background: none repeat scroll 0 0 #ffffff;
	*padding: 4px 3px;
	padding: 0 10px;
}
.riskArea {
	background: none repeat scroll 0 0 #fae5e7;
	padding: 10px 0;
	vertical-align: middle;
}
.rightArea .riskArea span.hinttext1 {
	vertical-align: middle;
	color: #777783;
	font-size: 14px;
	line-height: 20px;
}

</style>
<script type="text/javascript">

$(function(){
	//修改菜单头图片
	$("#index").attr('src', "<%=request.getContextPath()%>/resources/img/test/navHome.png"); 
	$("#trade").attr('src', "<%=request.getContextPath()%>/resources/img/test/navTrade.png"); 
	$("#finance").attr('src', "<%=request.getContextPath()%>/resources/img/test/navFinance2.png"); 
	$("#safe").attr('src', "<%=request.getContextPath()%>/resources/img/test/navSafe.png"); 
	$("#news").attr('src', "<%=request.getContextPath()%>/resources/img/test/navNews.png"); 
});

</script>
</head>
<body style="background:#f1f6f9;">

<div class="ad_main">	
	
	<div class="ad_aside">
		<a href="<%=request.getContextPath()%>/finance.do?rechargeCny" ><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico1.png" />人民币充值<i></i></a>
		<a href="#" class="hover"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico2.png" />人民币提现<i></i></a>
		<a href="<%=request.getContextPath()%>/finance.do?rechargeBtc"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico3.png" />网络流通币充值<i></i></a>
		<a href="<%=request.getContextPath()%>/finance.do?withdrawBtc"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico4.png" />网络流通币提现<i></i></a>
		<a href="<%=request.getContextPath()%>/finance.do?index" ><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico5.png" />个人财务<i></i></a>
		<a href="<%=request.getContextPath()%>/finance.do?record"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico6.png" />账单明细<i></i></a>
		<a href="<%=request.getContextPath()%>/finance.do?listentrust"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico7.png" />委托明细<i></i></a>
		<a href="<%=request.getContextPath()%>/question.do?question"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico8.png" />发起问题<i></i></a>
		<a href="<%=request.getContextPath()%>/question.do?questionColumn"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico9.png" />问题列表<i></i></a>
		<a href="#" class="end"><img src="<%=request.getContextPath()%>/resources/img/test/finance_ico10.png" />消息中心<i></i></a>
	</div>
	
	<div class="rightArea">
		<div class="Areatitle">
			<div class="title">
				<span class="bigTitle">
					人民币提现
				</span>
			</div>
		</div>
		<div class="coinBox lasttenorder Areacon">
			<div class="coinBoxBody">
				<div class="riskArea">
					<span class="icon"></span>
					<span class="hinttext1">
						<span class="define">重要提示：</span>为了您的账户安全，每次人民币提现的最高限额为<span class="red">￥50000.0</span>，提现的最低限额为<span class="red">￥100.0</span>，如果您有更高的需求，请与网站客服联系，银行卡提现不同的银行，实际到帐时间可能会有所延时。
					</span>
				</div>
				<div class="rmbout">
					<div class="divMargins">
						<input type="hidden" value="1" name="cnyOutType" id="cnyOutType">
						<span class="c1">
							提现方式:
						</span>
						<span>
							银行卡
						</span>
						<span style="padding-left: 50px;">
							<a onclick="javascript:showUpadteAddress(1,1);" href="javascript:void(0);">
								修改银行卡提现信息
							</a>
						</span>
					</div>
					<div class="divMargins">
						
					</div>
					<div>
						<span class="c1">
							提现金额:
						</span>
						<span>
							<input type="text" onblur="javascript:withdrawAmountBlur(&#39;modifyResultTips&#39;,&#39;withdrawBalance&#39;);" name="withdrawBalance" id="withdrawBalance">
						</span>
						&nbsp;&nbsp;
						<span id="withdrawAmountTips" class="fred"></span>
					</div>
					<div>
						<span class="c1">
							交易密码:
						</span>
						<span>
							<input type="password" name="tradePwd" id="tradePwd">
						</span>
					</div>
					
						<div id="withdrawPhoneCodeLi">
							<span class="c2">
								短信验证码:
							</span>
							<span>
								<input type="text" id="withdrawPhoneCode" name="withdrawPhoneCode">
							</span>
							&nbsp;&nbsp;
							<input type="button" class="sendmsg" value="发送验证码" onclick="javascript:sendMsgCode(4,&#39;modifyResultTips&#39;,&#39;msgCodeBtn&#39;);" id="msgCodeBtn">
							<input type="hidden" value="1" id="msgCodeBtnSign">
						</div>
					
					
					<div style="text-align:left;">
						<span class="c1">&nbsp;</span>
						<span id="modifyResultTips" class="fred">&nbsp;</span>
					</div>
					<div>
						<a class="button-blue2 confirmfin" title="确定提现" onclick="javascript:submitWithdrawCnyForm(&#39;modifyResultTips&#39;);" href="javascript:void(0);" id="withdrawCnyButton">
							确定提现
						</a>
					</div>
				</div>
			</div>
			<div class="entrustTen">
				<div class="Tentitle">
					<div class="title">
						<span class="left">
							提现记录
						</span>
					</div>
				</div>
				<div id="Tenbody" class="Tenbody" style="display: block">
					<table style="border:none;">
						<tbody><tr>
							<th width="200">
								提现时间
							</th>
							<th width="150">
								提现方式
							</th>
							<th width="120">
								提交金额
							</th>
							<th width="120">
								手续费
							</th>
							<th width="350">
								提现账户
							</th>
							<th width="100">
								备注号
							</th>
							<th width="128">
								状态
							</th>
						</tr>
						
						
							<tr>
								<td colspan="7">
									<span class="no-data-tips">
										您暂时没有提现记录。
									</span>
								</td>
							</tr>
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<div class="clear"></div>
</div>

	<div style="display: none;" id="withdrawCnyAddress" class="coin_dialog">
		<div id="dialog_content_CnyAddress" style="width:400px;" class="dialog_content">
			<div id="dialog_title_CnyAddress" class="dialog_title">
				<span>
					银行卡信息
				</span>
				<input type="hidden" id="outType" value="1">
				<input type="hidden" id="addressType" value="1">
				<a title="关闭" class="dialog_closed" href="javascript:closeAddress();"></a>
			</div>
			<div class="dialog_body">
				<ul class="con_body">
					<li id="openBankTypeAddrLi">
						<select name="openBankType" id="openBankTypeAddr">
							<option value="-1">
								请选择银行类型
							</option>
							
								<option value="1">工商银行</option>
							
								<option value="2">农业银行</option>
							
								<option value="3">建设银行</option>
							
								<option value="4">招商银行</option>
							
								<option value="5">交通银行</option>
							
								<option value="6">实业银行</option>
							
								<option value="7">平安银行</option>
							
								<option value="8">中国银行</option>
							
								<option value="9">浦发银行</option>
							
								<option value="10">兴业银行</option>
							
								<option value="11">光大银行</option>
							
								<option value="12">支付宝</option>
							
								<option value="13">民生银行</option>
							
								<option value="14">邮政银行</option>
							
								<option value="15">农村合作银行</option>
							
						</select>
					</li>
					<li>
						<span style="margin-left:-39px;display:none;" class="displayBankNumberNew" id="displayBankNumberAddr"></span>
						<input class="banck" type="text" placeholder="银行卡账号" onpaste="return false" oncopy="return false;" maxlength="30" name="withdrawAccount" id="withdrawAccountAddr">
					</li>
					<li>
						<span style="margin-left:-39px;display:none;" class="displayBankNumberNew2" id="displayBankNumberAddr2"></span>
						<input class="banck" type="text" placeholder="请再次输入银行卡账号" oncopy="return false;" onpaste="return false" maxlength="30" id="withdrawAccountAddr2">
					</li>
					<li id="payeeAddrLi">
						<input class="account" type="text" placeholder="收款人姓名" readonly="readonly" value="杨月" name="payee" id="payeeAddr">
					</li>
					<li id="payeeAddrLi">
						<input class="address" type="text" placeholder="开户行地址" name="address" id="address">
					</li>
					
						<li id="addressPhoneCodeLi">
							<input class="vcode" type="text" placeholder="短信验证码" id="addressPhoneCode" name="addressPhoneCode">
							<input class="scode" type="button" value="点击获取" onclick="javascript:sendWithdrawCnyAddressMsgCode(10);" id="WithdrawCnyAddressMsgCodeBtn">
						</li>
					
					
					<li>
						<span id="addrMsgSpan" class="tips">&nbsp;</span>
					</li>
					<li class="button">
						<input class="submit" type="button" value="确定提交" onclick="javascript:submitWithdrawCnyAddress();">
					</li>
				</ul>
			</div>
		</div>
	</div>

<!--footer start here-->
<jsp:include page="../test/footer.jsp"></jsp:include>
<!--footer end here-->

</body>
</html>