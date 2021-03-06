<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="gb2312"%>
<!DOCTYPE HTML>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>统计分析</title>
	
<link href="css/tq.css" rel="stylesheet" type="text/css">
<link href="css/iconbuttons.css" rel="stylesheet" type="text/css">
	
	<script type="text/javascript" src="js/tq.js"></script>
	<script type="text/javascript" src="js/tq.hash.js"></script>
	<script type="text/javascript" src="js/tq.newtree.js"></script>
	<script type="text/javascript" src="js/tq.window.js"></script>
	<script language="javascript" src="js/tq.scrollbar.js"></script>
	<script src="js/tq.form.js?0817" type="text/javascript">//表单</script>
	<script src="js/tq.public.js?0817" type="text/javascript">//表格</script>
	
	
	
	<STYLE type="text/css">
    	html,body{overflow:hidden;margin:0px;padding:0px;width:100%;}
    	#sysmenu_bar {position:absolute;top:2px;width:10px;left:205px;border-left:0px solid #B5B5B5;z-index:999998;}
    	#sysmenu_bar .Scrollbar-Track{position:absolute;left:0;top:0px;width:10px;cursor:pointer;_cursor:hand}
    	#sysmenu_bar .Scrollbar-Track:hover{background:#f0f0f0}
    	#sysmenu_bar .Scrollbar-Handle{position:absolute;width:10px;height:50px;background:#999;border-radius:7px;-webkit-border-radius:7px;-moz-border-radius: 7px;cursor:pointer;_cursor:hand;}
    	#sysmenu_bar .Scrollbar-Handle:hover{background:#666}
    	div.hideleft{ background:#fff url(images/showhide.png) 0 0;border-radius:7px;-webkit-border-radius:7px;-moz-border-radius: 7px;}
    	div.showleft{ background:#fff url(images/showhide.png) -12px 0;border-radius:7px;-webkit-border-radius:7px;-moz-border-radius: 7px;}
	</STYLE>
	<style>
		body{font-size:11px; font-family:Verdana, Arial, Helvetica, sans-serif;}
		a{text-decoration:none;}
		.img{border:0px;}
		.black_overlay{
		text-align:center;
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: black;
			z-index:1001;
			-moz-opacity: 0.8;
			opacity:.80;
			filter: alpha(opacity=80);
		}
		.white_content {
			display: none;
			position: absolute;
			top: 15%;
			left: 42%;
			height: 320px;
			border: 16px solid #FFF;
			border-bottom:none;
			background-color: white;
			z-index:1002;
			overflow: auto;
		}
	</style>
</head>

<body>
<div id = "constructor" style="margin:0px;padding:0px;overflow:hidden;width:100%;height:100%;position:relative;float:left">
	<div id="top" style="width: 100%; height: 100px; position: relative; float: left; border-bottom: 0px solid #ccc;"></div>
	<div id="left" style="overflow:hidden;overflow-x:auto; margin:0px;padding:0px; position: absolute; top:0;left:0;z-index:1;border-top: 1px solid #ccc; border-right: 1px solid #ccc;">
		<div id = "sysmenu"  style="overflow:hidden;  position:absolute ;">
		</div>
	</div>
	<DIV id="sysmenu_bar">
		<DIV id="sysmenu_track" class="Scrollbar-Track" title="点击移到此处">
			<DIV id="sysmenu_bar_icon" class="Scrollbar-Handle" title="按住上下拖动">
				&nbsp;
			</DIV>
		</DIV>
	</DIV>
		
	<div id="right" style="position:absolute;padding:0px;margin:0px;top:0px;right:0px;overflow:hidden;border-top: 1px solid #ccc">
		<div id="righttop" style="width: 100%; margin:0px;padding:0px;height: 230px; position: relative; float: left"></div>
		<div id="rightbot" style="width: 100%; margin:0px;padding:0px;border-top: 0px solid #ccc; position: relative; float: left">
			<iframe id="framePage_anly" name="framePage_anly" style="width:100%;"  frameborder="0" scrolling="auto" style="margin:0px;padding:0px;"></iframe>
		</div>
	</div>
</div>
<div id = "scrollMask" style="position:absolute;left:0px;top:0px;background:#fff;filter:alpha(opacity=0);opacity:0;display:none"></div>
<div id = "hideShow" style="position:absolute;left:0px;top:0px;background:none;width:12px;"><div style="position:relative;width:12px;float:left;height:82px;cursor:pointer;display:none;color:#fff;font-weight:700" title="显示/隐藏左栏"></div></div>

<div id="light" class="white_content">
	<a href="javascript:void(0)" style="color:#f30;"
		onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"><input type="button" value="关闭"/></a>
	<div id="visitpic"></div>
	</div>
<div id="fade" class="black_overlay"></div>

<script type="text/javascript">
	var role=${role};
	//框架
	var t_h = 0;
	var l_w = 215;
	var r_t_h = 0;//240;
	
	var Constructor = T("#constructor");
	var topO = T("#top");
	var leftO = T("#left");
	var menuContent = T("#sysmenu");	
	var menuTrack = T("#sysmenu_track");
	var rightO = T("#right");
	var rightTopO = T("#righttop");
	var rightBotO = T("#rightbot");
	var frameO = T("#framePage_anly")
	
	topO.style.height = t_h  + "px";
	leftO.style.width = l_w  + "px";
	menuContent.style.width = l_w  + "px";
	leftO.style.paddingLeft = 0 + "px";
	
	leftO.style.paddingTop = 5 + "px";
	leftO.style.background = "#F9F9F9";
	leftO.style.height = T.gwh() - t_h - 6 + "px";
	menuTrack.style.height = T.gwh() - t_h - 6 + "px";
	rightO.style.width = T.gww() - l_w - 1  + "px";
	rightTopO.style.height = r_t_h  + "px";
	frameO.style.height = T.gwh() - t_h - r_t_h + "px";
	T("#scrollMask").style.height = T.gwh() + "px";
	T("#scrollMask").style.width = T.gww() + "px";
	
	var showO = T("#hideShow");
	showO.style.left = l_w + "px";
	showO.style.height = T.gwh() + "px";
	showO.onmouseover = function(e){
		this.firstChild.style.marginTop = mousePos(e).y - 50 + "px";
		this.firstChild.style.display = "block";
		if(leftO.style.width == "0px"){
			this.firstChild.className = "showleft";
			this.firstChild.title = "展开左栏";
		}else{
			this.firstChild.className = "hideleft";
			this.firstChild.title = "隐藏左栏";
		}
	};
	showO.onmouseout = function(){
		this.firstChild.style.display = "none";
	};
	showO.firstChild.onclick = function(){
		if(leftO.style.width == "0px"){
			l_w = 215;
			leftO.style.width = l_w  + "px";
			T("#sysmenu_bar").style.zIndex = "999";
			rightO.style.width = T.gww() - l_w - 1  + "px";
			this.parentNode.style.left = l_w + "px";
		}else{
			l_w = 0;
			leftO.style.width = l_w  + "px";
			T("#sysmenu_bar").style.zIndex = "-999";
			rightO.style.width = T.gww() - l_w - 1  + "px";
			this.parentNode.style.left = "0px";
		}
	};
	
	T.bind(window,"resize",function(){
		topO.style.height = t_h  + "px";
		leftO.style.width = l_w  + "px";
		leftO.style.height = T.gwh() - t_h - 6 + "px";
		menuTrack.style.height = T.gwh() - t_h - 6 + "px";
		rightO.style.width = T.gww() - l_w - 1  + "px";
		rightTopO.style.height = r_t_h  + "px";
		frameO.style.height = T.gwh() - t_h - r_t_h + "px";
		T("#scrollMask").style.height = T.gwh() + "px";
		T("#scrollMask").style.width = T.gww() + "px";
		scroller.reset();
		scrollbar.reset();
	})
	
    function mousePos(e){
        var x,y;
        var e = e||window.event;
        return {
            x:e.clientX+document.body.scrollLeft+document.documentElement.scrollLeft,
            y:e.clientY+document.body.scrollTop+document.documentElement.scrollTop
        };
    };
/*     function changepass(){
	var id='${userid}';
	var fields=[{fieldcnname:"新密码",fieldname:"pass",inputtype:"password", twidth:"100"},
				{fieldcnname:"确认密码",fieldname:"conpass",inputtype:"password", twidth:"100"}];
	Twin({Id:"editpass_"+id,Title:"修改密码",Width:550,sysfunI:id,sysfun:function(id,tObj){
			Tform({
				formname: "market_recharge_f",
				formObj:tObj,
				recordid:"id",
				suburl:"editpass.do?table=admin&id="+id,
				method:"POST",
				formAttr:[{
					formitems:[{kindname:"",kinditemts:fields}]
				}],
				Callback:
				function(f,rcd,ret,o){
					if(ret=="1"){
						T.loadTip(1,"密码修改成功！",2,"");
						TwinC("editpass_"+id);
					}else if(ret=='0'){
						T.loadTip(1,"密码修改失败！",2,"");
						TwinC("editpass_"+id);
					}else{
						T.loadTip(1,ret,2,o)
					}
				}
			});	
		}
	})
} */
</script>

<script type="text/javascript">
	var _localData = {
			"root_sys":{"id":"sys","name":"统计分析",icon:"home"}
			};
	_localData["sys_1"]=	{"id":1, "name":"停车员积分排名", fn:function(){GotoUrl('collectorsort.do')}};
	//if(role!=7)	//客服不显示这个菜单
	_localData["sys_2"]=	{"id":2, "name":"联网车场订单统计", fn:function(){GotoUrl('nfcanlysis.do') }};	
	_localData["sys_4"]=	{"id":4, "name":"车场交易统计", fn:function(){GotoUrl('mobileanlysis.do') }};
	_localData["sys_5"]=	{"id":5, "name":"总交易统计", fn:function(){GotoUrl('mobileanlysis.do?action=totaltrend') }};
	_localData["sys_6"]=	{"id":6, "name":"注册统计", fn:function(){GotoUrl('reganlysis.do') }};
	_localData["sys_7"]=	{"id":7, "name":"拜访记录", fn:function(){GotoUrl('visitanlysis.do') }};
	_localData["sys_8"]=	{"id":8, "name":"速通卡统计", fn:function(){GotoUrl('easypass.do') }};
	_localData["sys_10"]=	{"id":9, "name":"收费员在岗车场统计", fn:function(){GotoUrl('hasparker.do') }};
	_localData["sys_13"]=	{"id":13, "name":"支付宝微信充值统计", fn:function(){GotoUrl('charge.do') }};
	_localData["sys_11"]=	{"id":10, "name":"新增交易用户数统计", fn:function(){GotoUrl('consumeanlysis.do') }};
	_localData["sys_12"]=	{"id":12, "name":"来源统计", fn:function(){GotoUrl('bonusanly.do')}};	
	_localData["sys_14"]=	{"id":14, "name":"补贴和停车费统计", fn:function(){GotoUrl('allowance.do')}};
	_localData["sys_15"]=	{"id":15, "name":"已校验可支付车场统计", fn:function(){GotoUrl('efparkanlysis.do')}};
	_localData["sys_3"]=	{"id":3, "name":"计价测试", fn:function(){GotoUrl('pricetest.do') }};
	_localData["sys_17"]=	{"id":17, "name":"订单红包统计", fn:function(){GotoUrl('orderbonusanly.do') }};
	_localData["sys_18"]=	{"id":18, "name":"打赏统计", fn:function(){GotoUrl('reward.do')}};
	_localData["sys_16"]=	{"id":16, "name":"账户统计",fn:function(){return false}};
	_localData["16_1601"]=	{"id":1601, "name":"停车宝账户",fn:function(){GotoUrl('tcbaccountaly.do')}};
	_localData["16_1602"]=	{"id":1602, "name":"车主账户",fn:function(){GotoUrl('useraccountaly.do')}};
	_localData["16_1603"]=	{"id":1603, "name":"收费员账户",fn:function(){GotoUrl('parkuseraccountaly.do')}};
	_localData["16_1604"]=	{"id":1604, "name":"停车场账户",fn:function(){GotoUrl('parkaccountaly.do')}};
	//_localData["sys_4"]=	{"id":201, "name":"测试JS图表", fn:function(){GotoUrl('parklalaanly.do')}};	
	sysMenuTree = new tqTree({
		treeId:"sysMenuTree",
		treeH:"auto",
		dataType:0,
		localData:_localData,
		treeObj:T("#sysmenu"),
		focusExec:true,
		nodeFnArgs:"id",
		nodeClick:function(){
			var args = arguments;
			switch(args[0]){
				case 920 :
				break;
			}
		},
		expandFun:function(){
			try{
				scroller.reset();
				scrollbar.reset();
			}catch(e){}
		},
		loadfun:function(v){
			var initID = sysMenuTree.nodes["0"].childNodes["0"].id;
			sysMenuTree.focusNode(initID);//定位到节点
			sysMenuTree.expandLevel(3);
		}
	});
	sysMenuTree.C();
</script>
</body>
<script>
var tqpagetip = function(c){
	T.maskTip(1,c);
}

var tip = {
	close: function(){T.maskTip(0)}
};

function GotoUrl(url,opentip){
	//alert('test');
	//try{tqpagetip('正在打开页面,请稍后...');}catch(e){};
	document.getElementById("framePage_anly").setAttribute('src',url);
}
</script>
<script>	
//系统菜单滚动
var scroller  = null;
var scrollbar = null;
var scrollTween = null;
window.onload = function () {
  scroller  = new Scroller(document.getElementById("sysmenu"), 20 ,leftO);
  scrollbar = new Scrollbar(document.getElementById("sysmenu_bar"), scroller, true);
  scrollTween = new ScrollerTween(scrollbar, true);
}

</script>	
</html>