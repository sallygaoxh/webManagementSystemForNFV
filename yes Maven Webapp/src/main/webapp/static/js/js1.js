window.onload = function(){
	//类列表
	TabItem = ['tab-item-1-1-1','tab-item-1-1-2',
	           'tab-item-1-2-1','tab-item-1-2-2',
	           'tab-item-2-1-1','tab-item-2-1-2','tab-item-2-1-3',
	           'tab-item-2-2-1','tab-item-2-2-2','tab-item-2-2-3',
	           'tab-item-2-3-1','tab-item-2-3-2','tab-item-2-3-3',
	           'tab-item-2-4-1','tab-item-2-4-2','tab-item-2-4-3',
	           'tab-item-3-2-1','tab-item-3-2-2',
	           'tab-item-4-1-1','tab-item-4-1-2','tab-item-4-1-3',
	           'tab-item-4-2-1','tab-item-4-2-2',
	           'tab-item-6-1-1','tab-item-6-1-2','tab-item-6-1-3',
	           'tab-item-6-2-1','tab-item-6-2-2','tab-item-6-2-3',
	           'tab-item-6-3-1','tab-item-6-3-2','tab-item-6-3-3',
	           'tab-item-7-1-1','tab-item-7-1-2','tab-item-7-1-3',
	           'tab-item-7-2-1','tab-item-7-2-2','tab-item-7-2-3',
	           'tab-item-7-3-1','tab-item-7-3-2',
	           'tab-item-7-4-1','tab-item-7-4-2',
	          ];
	//面包削切换效果
	var radioInput = document.getElementsByClassName('tab-1')[0];
	var radioInput1 = document.getElementsByClassName('tab-2')[0];
	var radioInput2 = document.getElementsByClassName('tab-3')[0];
	var radioInput3 = document.getElementsByClassName('tab-4')[0];
	var radioInput4 = document.getElementsByClassName('tab-5')[0];
	var radioInput5 = document.getElementsByClassName('tab-6')[0];
	var radioInput6 = document.getElementsByClassName('tab-7')[0];
	var radioInput7 = document.getElementsByClassName('tab-8')[0];
	
	radioInput.onclick = function(){
		radioInputOnclick('主页');
	}
	radioInput1.onclick = function(){
		radioInputOnclick('资源清单');
	}
	radioInput2.onclick = function(){
		radioInputOnclick('用户');
	}
	radioInput3.onclick = function(){
		radioInputOnclick('网络查询');
	}
	radioInput4.onclick = function(){
		radioInputOnclick('服务器');
	}
	radioInput5.onclick = function(){
		radioInputOnclick('地图');
	}
	radioInput6.onclick = function(){
		radioInputOnclick('报表分析');
	}
	radioInput7.onclick = function(){
		radioInputOnclick('配置功能');
	}
	function radioInputOnclick(title0){
		document.getElementsByClassName('spanTitle1')[0].innerHTML = title0;
		document.getElementsByClassName('spanTitle1')[0].style.display = 'block';
		document.getElementsByClassName('spanTitle2')[0].style.display = 'none';
		document.getElementsByClassName('spanTitle3')[0].style.display = 'none';
		document.getElementsByClassName('spanTitle4')[0].style.display = 'none';
		buttonTitletitleOnclick1();
		
	}
	//点击菜单的效果
	var buttonTitle = document.getElementsByClassName('btn-primary dropdown-toggle')[0];
	var buttonTitle1 = document.getElementsByClassName('btn-success dropdown-toggle')[0];
	var buttonTitle2 = document.getElementsByClassName('btn-info dropdown-toggle')[0];
	var buttonTitle3 = document.getElementsByClassName('btn-warning dropdown-toggle')[0];
	var buttonTitle_2 = document.getElementsByClassName('btn-primary dropdown-toggle btn2')[0];
	var buttonTitle1_2 = document.getElementsByClassName('btn-success dropdown-toggle btn2')[0];
	var buttonTitle2_2 = document.getElementsByClassName('btn-info dropdown-toggle btn2')[0];
	var buttonTitle3_2 = document.getElementsByClassName('btn-warning dropdown-toggle btn2')[0];
	var buttonTitle_3 = document.getElementsByClassName('btn-primary dropdown-toggle btn3')[0];
	var buttonTitle1_3 = document.getElementsByClassName('btn-success dropdown-toggle btn3')[0];
	var buttonTitle2_3 = document.getElementsByClassName('btn-info dropdown-toggle btn3')[0];
	var buttonTitle3_3 = document.getElementsByClassName('btn-warning dropdown-toggle btn3')[0];
	var buttonTitle_4 = document.getElementsByClassName('btn-primary dropdown-toggle btn4')[0];
	var buttonTitle1_4 = document.getElementsByClassName('btn-success dropdown-toggle btn4')[0];
	var buttonTitle2_4 = document.getElementsByClassName('btn-info dropdown-toggle btn4')[0];
	var buttonTitle3_4 = document.getElementsByClassName('btn-warning dropdown-toggle btn4')[0];
	var buttonTitle_5 = document.getElementsByClassName('btn-primary dropdown-toggle btn5')[0];
	var buttonTitle1_5 = document.getElementsByClassName('btn-success dropdown-toggle btn5')[0];
	var buttonTitle2_5 = document.getElementsByClassName('btn-info dropdown-toggle btn5')[0];
	var buttonTitle3_5 = document.getElementsByClassName('btn-warning dropdown-toggle btn5')[0];
	var buttonTitle_6 = document.getElementsByClassName('btn-primary dropdown-toggle btn6')[0];
	var buttonTitle1_6 = document.getElementsByClassName('btn-success dropdown-toggle btn6')[0];
	var buttonTitle2_6 = document.getElementsByClassName('btn-info dropdown-toggle btn6')[0];
	var buttonTitle3_6 = document.getElementsByClassName('btn-warning dropdown-toggle btn6')[0];
	var buttonTitle_7 = document.getElementsByClassName('btn-primary dropdown-toggle btn7')[0];
	var buttonTitle1_7 = document.getElementsByClassName('btn-success dropdown-toggle btn7')[0];
	var buttonTitle2_7 = document.getElementsByClassName('btn-info dropdown-toggle btn7')[0];
	var buttonTitle3_7 = document.getElementsByClassName('btn-warning dropdown-toggle btn7')[0];
	buttonTitle.onclick = function(){
        buttonTitleOnclick('网络概览');
	}
	buttonTitle1.onclick = function(){
        buttonTitleOnclick('前十排名');
	}
//	buttonTitle2.onclick = function(){
//      buttonTitleOnclick('Info');
//	}
//	buttonTitle3.onclick = function(){
//      buttonTitleOnclick('Warning');
//	}
	buttonTitle_2.onclick = function(){
        buttonTitleOnclick('Primary');
	}
	buttonTitle1_2.onclick = function(){
        buttonTitleOnclick('Success');
	}
	buttonTitle2_2.onclick = function(){
        buttonTitleOnclick('Info');
	}
	buttonTitle3_2.onclick = function(){
        buttonTitleOnclick('Warning');
	}
	buttonTitle_3.onclick = function(){
        buttonTitleOnclick('网络拓扑');
	}
	buttonTitle1_3.onclick = function(){
        buttonTitleOnclick('所有设备');
	}
//	buttonTitle2_3.onclick = function(){
//      buttonTitleOnclick('Info');
//	}
//	buttonTitle3_3.onclick = function(){
//      buttonTitleOnclick('Warning');
//	}
	buttonTitle_4.onclick = function(){
        buttonTitleOnclick('应用管理服务设置');
	}
	buttonTitle1_4.onclick = function(){
        buttonTitleOnclick('动作');
	}
//	buttonTitle2_4.onclick = function(){
//      buttonTitleOnclick('Info');
//	}
//	buttonTitle3_4.onclick = function(){
//      buttonTitleOnclick('Warning');
//	}
//	buttonTitle_5.onclick = function(){
//      buttonTitleOnclick('Primary');
//	}
//	buttonTitle1_5.onclick = function(){
//      buttonTitleOnclick('Success');
//	}
//	buttonTitle2_5.onclick = function(){
//      buttonTitleOnclick('Info');
//	}
//	buttonTitle3_5.onclick = function(){
//      buttonTitleOnclick('Warning');
//	}
	buttonTitle_6.onclick = function(){
        buttonTitleOnclick('报表创建器');
	}
	buttonTitle1_6.onclick = function(){
        buttonTitleOnclick('动作报表');
	}
	buttonTitle2_6.onclick = function(){
        buttonTitleOnclick('流量报表');
	}
//	buttonTitle3_6.onclick = function(){
//      buttonTitleOnclick('Warning');
//	}
	buttonTitle_7.onclick = function(){
        buttonTitleOnclick('基本设置');
	}
	buttonTitle1_7.onclick = function(){
        buttonTitleOnclick('用户管理');
	}
	buttonTitle2_7.onclick = function(){
        buttonTitleOnclick('通知规则');
	}
	buttonTitle3_7.onclick = function(){
        buttonTitleOnclick('其他');
	}
	//更换头菜单的标题
	function buttonTitleOnclick(title){
		document.getElementsByClassName('spanTitle2')[0].innerHTML = title;
		document.getElementsByClassName('spanTitle2')[0].style.display = 'block';
		document.getElementsByClassName('spanTitle3')[0].style.display = 'none';
		document.getElementsByClassName('spanTitle4')[0].style.display = 'none';
	}
	
	
	//点击菜单的下拉菜单切换效果
	var buttonTitletitle = document.getElementsByClassName('dropdown-menu number0')[0].getElementsByTagName('li')[0];
	var buttonTitletitle_1 = document.getElementsByClassName('dropdown-menu number0')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle_2 = document.getElementsByClassName('dropdown-menu number0')[0].getElementsByTagName('li')[2];
	var buttonTitletitle1 = document.getElementsByClassName('dropdown-menu number1')[0].getElementsByTagName('li')[0];
	var buttonTitletitle1_1 = document.getElementsByClassName('dropdown-menu number1')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle1_2 = document.getElementsByClassName('dropdown-menu number1')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle2 = document.getElementsByClassName('dropdown-menu number2')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle2_1 = document.getElementsByClassName('dropdown-menu number2')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle2_2 = document.getElementsByClassName('dropdown-menu number2')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle3 = document.getElementsByClassName('dropdown-menu number3')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle3_1 = document.getElementsByClassName('dropdown-menu number3')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle3_2 = document.getElementsByClassName('dropdown-menu number3')[0].getElementsByTagName('li')[2];
	var buttonTitletitle4 = document.getElementsByClassName('dropdown-menu number4')[0].getElementsByTagName('li')[0];
	var buttonTitletitle4_1 = document.getElementsByClassName('dropdown-menu number4')[0].getElementsByTagName('li')[1];
	var buttonTitletitle4_2 = document.getElementsByClassName('dropdown-menu number4')[0].getElementsByTagName('li')[2];
	var buttonTitletitle5 = document.getElementsByClassName('dropdown-menu number5')[0].getElementsByTagName('li')[0];
	var buttonTitletitle5_1 = document.getElementsByClassName('dropdown-menu number5')[0].getElementsByTagName('li')[1];
	var buttonTitletitle5_2 = document.getElementsByClassName('dropdown-menu number5')[0].getElementsByTagName('li')[2];
	var buttonTitletitle6 = document.getElementsByClassName('dropdown-menu number6')[0].getElementsByTagName('li')[0];
	var buttonTitletitle6_1 = document.getElementsByClassName('dropdown-menu number6')[0].getElementsByTagName('li')[1];
	var buttonTitletitle6_2 = document.getElementsByClassName('dropdown-menu number6')[0].getElementsByTagName('li')[2];
	var buttonTitletitle7 = document.getElementsByClassName('dropdown-menu number7')[0].getElementsByTagName('li')[0];
	var buttonTitletitle7_1 = document.getElementsByClassName('dropdown-menu number7')[0].getElementsByTagName('li')[1];
	var buttonTitletitle7_2 = document.getElementsByClassName('dropdown-menu number7')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle8 = document.getElementsByClassName('dropdown-menu number8')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle8_1 = document.getElementsByClassName('dropdown-menu number8')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle8_2 = document.getElementsByClassName('dropdown-menu number8')[0].getElementsByTagName('li')[2];
	var buttonTitletitle9 = document.getElementsByClassName('dropdown-menu number9')[0].getElementsByTagName('li')[0];
	var buttonTitletitle9_1 = document.getElementsByClassName('dropdown-menu number9')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle9_2 = document.getElementsByClassName('dropdown-menu number9')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle10 = document.getElementsByClassName('dropdown-menu number10')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle10_1 = document.getElementsByClassName('dropdown-menu number10')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle10_2 = document.getElementsByClassName('dropdown-menu number10')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle11 = document.getElementsByClassName('dropdown-menu number11')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle11_1 = document.getElementsByClassName('dropdown-menu number11')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle11_2 = document.getElementsByClassName('dropdown-menu number11')[0].getElementsByTagName('li')[2];
	var buttonTitletitle12 = document.getElementsByClassName('dropdown-menu number12')[0].getElementsByTagName('li')[0];
	var buttonTitletitle12_1 = document.getElementsByClassName('dropdown-menu number12')[0].getElementsByTagName('li')[1];
	var buttonTitletitle12_2 = document.getElementsByClassName('dropdown-menu number12')[0].getElementsByTagName('li')[2];
	var buttonTitletitle13 = document.getElementsByClassName('dropdown-menu number13')[0].getElementsByTagName('li')[0];
	var buttonTitletitle13_1 = document.getElementsByClassName('dropdown-menu number13')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle13_2 = document.getElementsByClassName('dropdown-menu number13')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle14 = document.getElementsByClassName('dropdown-menu number14')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle14_1 = document.getElementsByClassName('dropdown-menu number14')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle14_2 = document.getElementsByClassName('dropdown-menu number14')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle15 = document.getElementsByClassName('dropdown-menu number15')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle15_1 = document.getElementsByClassName('dropdown-menu number15')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle15_2 = document.getElementsByClassName('dropdown-menu number15')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle16 = document.getElementsByClassName('dropdown-menu number16')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle16_1 = document.getElementsByClassName('dropdown-menu number16')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle16_2 = document.getElementsByClassName('dropdown-menu number16')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle17 = document.getElementsByClassName('dropdown-menu number17')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle17_1 = document.getElementsByClassName('dropdown-menu number17')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle17_2 = document.getElementsByClassName('dropdown-menu number17')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle18 = document.getElementsByClassName('dropdown-menu number18')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle18_1 = document.getElementsByClassName('dropdown-menu number18')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle18_2 = document.getElementsByClassName('dropdown-menu number18')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle19 = document.getElementsByClassName('dropdown-menu number19')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle19_1 = document.getElementsByClassName('dropdown-menu number19')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle19_2 = document.getElementsByClassName('dropdown-menu number19')[0].getElementsByTagName('li')[2];
	var buttonTitletitle20 = document.getElementsByClassName('dropdown-menu number20')[0].getElementsByTagName('li')[0];
	var buttonTitletitle20_1 = document.getElementsByClassName('dropdown-menu number20')[0].getElementsByTagName('li')[1];
	var buttonTitletitle20_2 = document.getElementsByClassName('dropdown-menu number20')[0].getElementsByTagName('li')[2];
	var buttonTitletitle21 = document.getElementsByClassName('dropdown-menu number21')[0].getElementsByTagName('li')[0];
	var buttonTitletitle21_1 = document.getElementsByClassName('dropdown-menu number21')[0].getElementsByTagName('li')[1];
	var buttonTitletitle21_2 = document.getElementsByClassName('dropdown-menu number21')[0].getElementsByTagName('li')[2];
	var buttonTitletitle22 = document.getElementsByClassName('dropdown-menu number22')[0].getElementsByTagName('li')[0];
	var buttonTitletitle22_1 = document.getElementsByClassName('dropdown-menu number22')[0].getElementsByTagName('li')[1];
	var buttonTitletitle22_2 = document.getElementsByClassName('dropdown-menu number22')[0].getElementsByTagName('li')[2];
//	var buttonTitletitle23 = document.getElementsByClassName('dropdown-menu number23')[0].getElementsByTagName('li')[0];
//	var buttonTitletitle23_1 = document.getElementsByClassName('dropdown-menu number23')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle23_2 = document.getElementsByClassName('dropdown-menu number23')[0].getElementsByTagName('li')[2];
	var buttonTitletitle24 = document.getElementsByClassName('dropdown-menu number24')[0].getElementsByTagName('li')[0];
	var buttonTitletitle24_1 = document.getElementsByClassName('dropdown-menu number24')[0].getElementsByTagName('li')[1];
	var buttonTitletitle24_2 = document.getElementsByClassName('dropdown-menu number24')[0].getElementsByTagName('li')[2];
	var buttonTitletitle25 = document.getElementsByClassName('dropdown-menu number25')[0].getElementsByTagName('li')[0];
	var buttonTitletitle25_1 = document.getElementsByClassName('dropdown-menu number25')[0].getElementsByTagName('li')[1];
	var buttonTitletitle25_2 = document.getElementsByClassName('dropdown-menu number25')[0].getElementsByTagName('li')[2];
	var buttonTitletitle26 = document.getElementsByClassName('dropdown-menu number26')[0].getElementsByTagName('li')[0];
	var buttonTitletitle26_1 = document.getElementsByClassName('dropdown-menu number26')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle26_2 = document.getElementsByClassName('dropdown-menu number26')[0].getElementsByTagName('li')[2];
	var buttonTitletitle27 = document.getElementsByClassName('dropdown-menu number27')[0].getElementsByTagName('li')[0];
	var buttonTitletitle27_1 = document.getElementsByClassName('dropdown-menu number27')[0].getElementsByTagName('li')[1];
//	var buttonTitletitle27_2 = document.getElementsByClassName('dropdown-menu number27')[0].getElementsByTagName('li')[2];
	buttonTitletitle.onclick = function(){
		buttonTitletitleOnclick('tab-item-1-1-1','最近告警');
	}
	buttonTitletitle_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-1-1-2','设备统计');
	}
//	buttonTitletitle_2.onclick = function(){
//		buttonTitletitleOnclick('tab-item-1-1-3','Something else here');
//	}
	buttonTitletitle1.onclick = function(){
		buttonTitletitleOnclick('tab-item-1-2-1','告警设备');
	}
	buttonTitletitle1_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-1-2-2','宽带使用');
	}
//	buttonTitletitle1_2.onclick = function(){
//		buttonTitletitleOnclick('tab-item-1-2-3','Something else here');
//	}
//	buttonTitletitle2.onclick = function(){
//		buttonTitletitleOnclick('tab-item-1-3-1','Action');
//	}
//	buttonTitletitle2_1.onclick = function(){
//      buttonTitletitleOnclick('tab-item-1-3-2','Another action');
//  }
//	buttonTitletitle2_2.onclick = function(){
//		buttonTitletitleOnclick('tab-item-1-3-3','Something else here');
//	}
//	buttonTitletitle3.onclick = function(){
//		buttonTitletitleOnclick('tab-item-1-4-1','Action');
//	}
//	buttonTitletitle3_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-1-4-2','Another action');
//	}
//	buttonTitletitle3_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-1-4-3','Something else here');
//	}
	buttonTitletitle4.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-1-1','Action');
	}
	buttonTitletitle4_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-1-2','Another action');
	}
	buttonTitletitle4_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-2-1-3','Something else here');
	}
	buttonTitletitle5.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-2-1','Action');
	}
	buttonTitletitle5_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-2-2','Another action');
	}
	buttonTitletitle5_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-2-2-3','Something else here');
	}
	buttonTitletitle6.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-3-1','Action');
	}
	buttonTitletitle6_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-3-2','Another action');
	}
	buttonTitletitle6_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-2-3-3','Something else here');
	}
	buttonTitletitle7.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-4-1','Action');
	}
	buttonTitletitle7_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-2-4-2','Another action');
	}
	buttonTitletitle7_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-2-4-3','Something else here');
	}
//	buttonTitletitle8.onclick = function(){
//		buttonTitletitleOnclick('tab-item-3-1-1','Action');
//	}
//	buttonTitletitle8_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-3-1-2','Another action');
//	}
//	buttonTitletitle8_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-3-1-3','Something else here');
//	}
	buttonTitletitle9.onclick = function(){
		buttonTitletitleOnclick('tab-item-3-2-1','ONU');
	}
	buttonTitletitle9_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-3-2-2','PC');
	}
//	buttonTitletitle9_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-3-2-3','Something else here');
//	}
//	buttonTitletitle10.onclick = function(){
//		buttonTitletitleOnclick('tab-item-3-3-1','Action');
//	}
//	buttonTitletitle10_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-3-3-2','Another action');
//	}
//	buttonTitletitle10_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-3-3-3','Something else here');
//	}
//	buttonTitletitle11.onclick = function(){
//		buttonTitletitleOnclick('tab-item-3-4-1','Action');
//	}
//	buttonTitletitle11_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-3-4-2','Another action');
//	}
//	buttonTitletitle11_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-3-4-3','Something else here');
//	}
	buttonTitletitle12.onclick = function(){
		buttonTitletitleOnclick('tab-item-4-1-1','Action');
	}
	buttonTitletitle12_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-4-1-2','Another action');
	}
	buttonTitletitle12_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-4-1-3','Something else here');
	}
	buttonTitletitle13.onclick = function(){
		buttonTitletitleOnclick('tab-item-4-2-1','可执行动作');
	}
	buttonTitletitle13_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-4-2-2','全部动作查询');
	}
//	buttonTitletitle13_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-4-2-3','Something else here');
//  }
//  buttonTitletitle14.onclick = function(){
//		buttonTitletitleOnclick('tab-item-4-3-1','Action');
//	}
//	buttonTitletitle14_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-4-3-2','Another action');
//	}
//	buttonTitletitle14_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-4-3-3','Something else here');
//	}
//	buttonTitletitle15.onclick = function(){
//		buttonTitletitleOnclick('tab-item-4-4-1','Action');
//	}
//	buttonTitletitle15_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-4-4-2','Another action');
//	}
//	buttonTitletitle15_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-4-4-3','Something else here');
//	}
//	buttonTitletitle16.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-1-1','Action');
//	}
//	buttonTitletitle16_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-1-2','Another action');
//	}
//	buttonTitletitle16_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-5-1-3','Something else here');
//	}
//	buttonTitletitle17.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-2-1','Action');
//	}
//	buttonTitletitle17_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-2-2','Another action');
//	}
//	buttonTitletitle17_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-5-2-3','Something else here');
//	}
//	buttonTitletitle18.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-3-1','Action');
//	}
//	buttonTitletitle18_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-3-2','Another action');
//	}
//	buttonTitletitle18_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-5-3-3','Something else here');
//	}
//	buttonTitletitle19.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-4-1','Action');
//	}
//	buttonTitletitle19_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-5-4-2','Another action');
//	}
//	buttonTitletitle19_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-5-4-3','Something else here');
//	}
	buttonTitletitle20.onclick = function(){
		buttonTitletitleOnclick('tab-item-6-1-1','Action');
	}
	buttonTitletitle20_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-6-1-2','Another action');
	}
	buttonTitletitle20_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-6-1-3','Something else here');
	}
	buttonTitletitle21.onclick = function(){
		buttonTitletitleOnclick('tab-item-6-2-1','Action');
	}
	buttonTitletitle21_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-6-2-2','Another action');
	}
	buttonTitletitle21_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-6-2-3','Something else here');
	}
	buttonTitletitle22.onclick = function(){
		buttonTitletitleOnclick('tab-item-6-3-1','Action');
	}
	buttonTitletitle22_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-6-3-2','Another action');
	}
	buttonTitletitle22_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-6-3-3','Something else here');
	}
//	buttonTitletitle23.onclick = function(){
//		buttonTitletitleOnclick('tab-item-6-4-1','Action');
//	}
//	buttonTitletitle23_1.onclick = function(){
//		buttonTitletitleOnclick('tab-item-6-4-2','Another action');
//	}
//	buttonTitletitle23_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-6-4-3','Something else here');
//	}
	buttonTitletitle24.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-1-1','系统查看');
	}
	buttonTitletitle24_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-1-2','数据库查看');
	}
	buttonTitletitle24_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-7-1-3','申请配置');
	}
	buttonTitletitle25.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-2-1','全部用户');
	}
	buttonTitletitle25_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-2-2','套餐使用上线推送');
	}
	buttonTitletitle25_2.onclick = function(){
        buttonTitletitleOnclick('tab-item-7-2-3','套餐推荐编辑');
	}
	buttonTitletitle26.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-3-1','变更通知规则');
	}
	buttonTitletitle26_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-3-2','申请网络资源调整');
	}
//	buttonTitletitle26_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-7-3-3','Something else here');
//	}
	buttonTitletitle27.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-4-1','帮助');
	}
	buttonTitletitle27_1.onclick = function(){
		buttonTitletitleOnclick('tab-item-7-4-2','技术支持');
	}
//	buttonTitletitle27_2.onclick = function(){
//      buttonTitletitleOnclick('tab-item-7-4-3','Something else here');
//	}
    //切换菜单选项的内容界面
	function buttonTitletitleOnclick(a,title1){
		document.getElementsByClassName('spanTitle3')[0].innerHTML = title1;
		document.getElementsByClassName('spanTitle3')[0].style.display = 'block';
		for(var i = 0;i<TabItem.length;i++){
			if(TabItem[i] == a){
				document.getElementsByClassName(TabItem[i])[0].style.display = 'block';
			}
			else{
				document.getElementsByClassName(TabItem[i])[0].style.display = 'none';
			}
		}
	}
	function buttonTitletitleOnclick1(){
		for(var i = 0;i<TabItem.length;i++){
			document.getElementsByClassName(TabItem[i])[0].style.display = 'none';
		}
	}
	


}

