<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%@ taglib prefix="s" uri="/auth"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>客户经理</title>

<link rel="stylesheet" href="../assets/css/fonts/linecons/css/linecons.css">
<link rel="stylesheet" href="../assets/css/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet" href="../assets/css/bootstrap.css">
<link rel="stylesheet" href="../assets/css/xenon-core.css">
<link rel="stylesheet" href="../assets/css/xenon-forms.css">
<link rel="stylesheet" href="../assets/css/xenon-components.css">
<link rel="stylesheet" href="../assets/css/xenon-skins.css">
<link rel="stylesheet" href="../assets/css/custom.css">

<link rel="stylesheet" href="../assets/js/datatables/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="../assets/js/select2/select2.css">
<link rel="stylesheet" href="../assets/js/select2/select2-bootstrap.css">
<link rel="stylesheet" href="../assets/js/multiselect/css/multi-select.css">
<link rel="stylesheet" href="../css/app.css">

<style type="text/css">
.page-container {
  width: 90%;
}
.col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
  padding-left: 7px;
  padding-right: 7px;
}
.chart-item-bg {
  margin-bottom: 14px;
}
.messageCol {
  padding-left: 25px;
  padding-right: 25px;
}
.messagelabel {
  padding: 10px;
}
.pe3Row{
  width:  670px;
  height: 330px;
}
.leftCol {
  padding-left: 15px;
}
.rightCol {
  padding-right: 15px;
}
.downCol{
  padding-top :15px;
}
.topCol{
  padding-bottom :15px;
}
.lessCol {
  width: 43%;
}
.moreCol {
  width: 57%;
}
.fro50Col {
  width: 50%;
}
.echartsCol {
  height: 340px;
}

.echartsColDown {
  height : 660px;
}
.echartsHeight {
  height: 280px;
}
.echartsHeight-left {
  wigth: 470px;
  height: 660px;
}
.chart-label {
  width :570px;
  height :330px;
}
.chart-label-Left{
  width : 490px;
  height : 660px;
}
.p3topColBg {
  width :660px;
  height :330px;
}
.chart-labelTop{
  width :660px;
  height :330px;
}
.chart-labelDown{
  width :190px;
  height :300px;
}
.pe3ColTop{
  width : 670px;
  height :330px;
}
.model {
  width :530px;
  height :300px
}
.messageHeight {
  height: 180px;
}
.echartsHeight1 {
  width :630px;
  height : 320px; 
}
.message-header {
  font-size: 14px;
  line-height: 14px;
}
.message-body {
  font-size: 12px;
  line-height: 12px;
}
#topRow {
  margin-top: 1.5%;
}
#performanceDiv {
  width: 440px;
}
#unfinishedDiv {
  width: 580px;
}
#pubLoanChgDiv {
  width: 337px;
}
#busiOppDiv {
  width: 337px;
}

</style>
</head>

<body class="page-body">
  <div class="page-container">
    <div class="main-content">
      <div id="topRow" class="row">
        <div class="col-sm-6 leftCol fro50Col">
          <div class="chart-item-bg echartsCol">
            <div class="chart-label">
              <div id="MktTaskInfoDiv" class="echartsHeight model"></div>
            </div>
          </div>
        </div>
        <div class="col-sm-6 rightCol fro50Col">
          <div class="chart-item-bg echartsCol">
            <div class="chart-label">
              <div><div style="float: left;width: 100px">任务审批图例</div><div style="float: right;width: 280px"><a href=""><img alt="" src="../images/crm/0_doing.png">任务审批完成&nbsp;&nbsp;&nbsp;</a><a href=""><img alt="" src="../images/crm/1_done.png">有新审批任务</a></div></div>
              <div id="PubVifyListPoDiv" class="echartsHeight model"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6 leftCol lessCol">
          <div class="echartsColDown chart-item-bg">
            <div class="chart-label-Left">
              <div id="perfRankingDiv" class="echartsHeight-left"><img alt="" src="../images/crm/yxhdfqlc.png" usemap="yxhdfqlc">
              	<map name="yxhdfqlc">
              	  <area shape="rect" coords="325,135,180,190" onclick="alert('\'发起\'功能开发中。。。。。')" title="发起" target="_blank" ><!-- href="http://hao.360.cn/daxue/hlj.html" -->
              	  <area shape="rect" coords="445,430,305,480" onclick="alert('\'分配\'功能开发中。。。。。')" title="黑龙江" target="_blank" >
              	</map>
              </div>
            </div>
          </div>
        </div>
        <div class="col-sm-6 rightCol moreCol">
          <div class="pe3Row">
            <div class="col-sm-4 pe3ColTop chart-item-bg">
          	 <div class="p3topColBg"> 
               <div class="chart-labelTop">
                <div id="MktStfPerfPoDiv" class="echartsHeight1"></div>
              </div>
             </div>
            </div>
             <div class="col-sm-12 messageCol downCol chart-item-bg"><!-- TODO -->
              <div class="row">
                <div class="col-sm-4">
                  <div class="chart-labelDown" style="padding-left: 10px; padding-right: 10px;">
                    <div class="xe-widget xe-status-update">
                      <div class="xe-header message-header"></div>
                      <div>&nbsp;</div>
                      <div class="xe-body message-body messageHeight"></div>
                      <div class="xe-footer">
                        <a href="#">
                          <i class="fa-retweet"></i>了解更多&gt;
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="chart-labelDown" style="padding-left: 10px; padding-right: 10px;">
                    <div class="xe-widget xe-status-update">
                      <div class="xe-header message-header"></div>
                      <div>&nbsp;</div>
                      <div class="xe-body message-body messageHeight"></div>
                      <div class="xe-footer">
                        <a href="#">
                          <i class="fa-retweet"></i>了解更多&gt;
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-sm-4">
                  <div class="chart-labelDown" style="padding-left: 10px; padding-right: 10px;">
                    <div class="xe-widget xe-status-update">
                      <div class="xe-header message-header"></div>
                      <div>&nbsp;</div>
                      <div class="xe-body message-body messageHeight"></div>
                      <div class="xe-footer">
                        <a href="#">
                          <i class="fa-retweet"></i>了解更多&gt;
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

<script src="../assets/js/jquery-1.11.1.min.js"></script>
<script src="../assets/js/jquery-ui/jquery-ui.min.js"></script>
<script src="../assets/js/jquery-validate/jquery.validate.min.js"></script>

<script src="../assets/js/bootstrap.min.js"></script>
<script src="../assets/js/TweenMax.min.js"></script>
<script src="../assets/js/resizeable.js"></script>
<script src="../assets/js/joinable.js"></script>
<script src="../assets/js/xenon-api.js"></script>
<script src="../assets/js/xenon-toggles.js"></script>
<script src="../assets/js/xenon-custom.js"></script>
<script src="../assets/js/moment.min.js"></script>

<script src="../assets/js/datepicker/bootstrap-datepicker.js"></script>
<script src="../assets/js/datatables/js/jquery.dataTables.min.js"></script>
<script src="../assets/js/datatables/dataTables.bootstrap.js"></script>
<script src="../assets/js/datatables/tabletools/dataTables.tableTools.min.js"></script>
<script src="../assets/js/select2/select2.min.js"></script>
<script src="../assets/js/selectboxit/jquery.selectBoxIt.min.js"></script>

<script src="../assets/js/echarts/echarts.js"></script>
<script src="../assets/js/echarts/macarons.js"></script>

<script src="../js/WebUtils.js"></script>

<jsp:include page="/WEB-INF/template/settings.jsp"></jsp:include>

<script type="text/javascript">
    var layouts = [
        [[0, 0]],
        [[-0.25, 0], [0.25, 0]]
    ];
     //图标处理位置 
    var pathes = [
        'M936.857805 523.431322c0 0-42.065715-68.89513-88.786739-68.89513-46.68416 0-95.732122 71.223091-95.732122 71.223091s-44.28544-72.503296-93.440922-71.152538c-35.565466 0.977306-62.89705 30.882406-79.124275 64.06615L579.773747 790.800797c-3.253248 37.391565-5.677568 50.904371-12.002816 69.63497-6.651802 19.698688-19.544883 35.227341-31.650099 45.909606-14.30231 12.621414-29.59831 22.066586-45.854208 27.424563-16.28969 5.362074-30.098739 6.496973-51.536794 6.496973-19.498906 0-36.95104-2.963456-52.395418-8.850534-15.410586-5.887078-28.420403-14.313984-39.034573-25.246003-10.613146-10.930995-18.757939-24.08151-24.435507-39.525171-5.676544-15.443763-8.532685-40.195482-8.532685-59.270963l0-26.232454 74.435273 0c0 24.644301-0.17705 64.452915 8.81408 77.006848 9.02697 12.515021 22.756147 18.092032 41.148826 18.791014 16.728678 0.636518 30.032179-8.061645 30.032179-8.061645s11.922022-10.5472 14.992077-19.756954c2.674995-8.025805 3.565363-22.180147 3.565363-22.180147s2.080461-21.789286 2.080461-34.234675L489.399906 514.299369c-16.678502-18.827776-43.801395-61.938688-82.756096-60.927693-54.699008 1.419366-100.422144 70.059622-100.422144 70.059622s-56.065126-70.059622-93.440922-70.059622c-37.376717 0-91.077939 70.059622-91.077939 70.059622S105.343488 156.737741 476.742042 119.363584l53.70327-74.714624 51.373056 74.714624C964.889395 142.740992 936.857805 523.431322 936.857805 523.431322z',
        'M533.504 268.288q33.792-41.984 71.68-75.776 32.768-27.648 74.24-50.176t86.528-19.456q63.488 5.12 105.984 30.208t67.584 63.488 34.304 87.04 6.144 99.84-17.92 97.792-36.864 87.04-48.64 74.752-53.248 61.952q-40.96 41.984-85.504 78.336t-84.992 62.464-73.728 41.472-51.712 15.36q-20.48 1.024-52.224-14.336t-69.632-41.472-79.872-61.952-82.944-75.776q-26.624-25.6-57.344-59.392t-57.856-74.24-46.592-87.552-21.504-100.352 11.264-99.84 39.936-83.456 65.536-61.952 88.064-35.328q24.576-5.12 49.152-1.536t48.128 12.288 45.056 22.016 40.96 27.648q45.056 33.792 86.016 80.896z',
    ]; 
    var colors = [
        '#c4332b', '#16B644'
    ]; 

    function renderItem(params, api) {
        var cellPoint = api.coord(api.value(0));
        var cellWidth = params.coordSys.cellWidth;
        var cellHeight = params.coordSys.cellHeight;

        var value = api.value(1);
        var events = value && value.split('|');

        if (isNaN(cellPoint[0]) || isNaN(cellPoint[1])) {
            return;
        }

        var group = {
            type: 'group',
            children: echarts.util.map(layouts[events.length - 1], function (itemLayout, index) {
                return {
                    type: 'path',
                    shape: {
                        pathData: pathes[events[index]],
                        x: -8,
                        y: -8,
                        width: 16,
                        height: 16
                    },
                    position: [
                        cellPoint[0] + echarts.number.linearMap(itemLayout[0], [-0.5, 0.5], [-cellWidth / 2, cellWidth / 2]),
                        cellPoint[1] + echarts.number.linearMap(itemLayout[1], [-0.5, 0.5], [-cellHeight / 2+20, cellHeight / 2])
                    ],
                    style: api.style({
                        fill: colors[events[index]]
                    })
                };
            }) || []
        };

        group.children.push({
            type: 'text',
            style: {
                x: cellPoint[0],
                y: cellPoint[1] - cellHeight / 2 + 15,
                text: echarts.format.formatTime('dd', api.value(0)),
                fill: '#777',
                textFont: api.font({fontSize: 14})
            }
        });
        return group;
    }
    
    // 图1：营销进度图
    var myChart_MktTaskInfo = echarts.init(document.getElementById("MktTaskInfoDiv"), "macarons");
    myChart_MktTaskInfo.setOption({
    	title : {
	        text : "营销进度",
	        x : 3,
	        y : 0,
	        textStyle:{
	        	fontSize :16
	        }
	    },
	    grid : {
        	right : 150
        },
	    angleAxis: {
	        type: 'category',
	        z: 10
	    },
	    radiusAxis: {
	    },
	    polar: {
	    },
	    legend: {
	        orient: 'vertical',
	        right: 0,
	        bottom: 70,
	    },
        series : [],
        color : ['#33a3dc','#cbc547', '#de773f', '#f15b6c', '#224b8f']
    }, true);

    // 未完成营销任务
    var myChart_pubvifylist = echarts.init(document.getElementById("PubVifyListPoDiv"), "macarons");

    // 客户存款变动排名
    var myChart_mktstfperfpo = echarts.init(document.getElementById("MktStfPerfPoDiv"), "macarons");
    myChart_mktstfperfpo.setOption({
    	title : {
            text : "业绩比较",
            x : 18,
            y : 5.5,
            textStyle:{
	        	fontSize :16
	        }
        },
        legend: {
        	x : '87%',
        	y : '20%',
        },
        grid : {
        	right : 85
        },
		xAxis: {
   		 	type: 'category',
    		data: [1,2,3,4,5,6,7,8,9,10,11,12],
    	 	name: "(月)",
		},
		yAxis: {
    		type: 'value',
     		name :"(万元)"
		},
        series : [],
        color : ['#A2007C','#00B2BF', '#EC870E']
    }, true);

    // 异步加载数据
    $.ajax({
        url : "busi_manage/homepage",
        type : "post",
        dataType : "json",
        async : true,
        success : function(result) {
            if (WebUtils.isSuccess(result)) {
            	var nameList = result.data.MktTaskInfoPoName;
            	var numList = result.data.MktTaskInfoPoStu; 
                // 营销业绩趋势图
                myChart_MktTaskInfo.setOption({
                    series: getDataToJosn(nameList,numList)
                }); 
                // 未完成营销任务
                myChart_pubvifylist.setOption({
                	tooltip: {
                    },
                    calendar: [{
                        left: '80',
                        top: '40',
                        cellSize: [55, 45],
                        yearLabel: {show: false},
                        orient: 'vertical',
                        dayLabel: {
                            firstDay: 1,
                            nameMap:['日', '一', '二', '三', '四', '五', '六']
                        },
                        monthLabel: {
                            show: false
                        },
                        range : result.data.PubVifyListTabYear
                    }],
                    series: [{
                    	type: 'custom',
                        coordinateSystem: 'calendar',
                        renderItem : renderItem,
                        dimensions: [null, {type: 'ordinal'}],
                        data: result.data.PubVifyListTab	
                    }]
                }, true);
                // 业绩比较图
                var yearStr = result.data.MktStfPerfPoTabYear;
                var numStr = result.data.MktStfPerfPoTabNum;
                myChart_mktstfperfpo.setOption({
                    series: getDataToJosn3(yearStr,numStr)
                });
                
                // 公告栏
                var msg = result.data.message;
                if (msg.length > 0) {
                    var $msgheader = $(".message-header");
                    var $msgbody = $(".message-body");
                    for (var i_msg = 0; i_msg < 3; i_msg++) {
                        $($msgheader[i_msg]).empty().append(msg[i_msg].slice(0, 8));
                        $($msgbody[i_msg]).empty().append(msg[i_msg].slice(0, 100));
                    }
                }
            }
        },
        error : function(errorMsg) {
            WebUtils.alert("图表请求数据失败!");
        }
    })
    
  function getDataToJosn(nameList,numList){
    	var data = [];
    	for(var i = 0 ; i <nameList.length ; i++){
    		data.push({type: 'bar',
		        data: [numList[i]],
		        coordinateSystem: 'polar',
		        name: nameList[i].slice(0, 5)});
    	}
    	return data;
    }  
    
   function getDataToJosn3(yearStr,numStr){
	   var data = [];
   	   for(var i = 0 ; i <yearStr.length ; i++){
   			data.push({
   	            type : "line",
   	            smooth : true,
   	            data : numStr[i],
   				name : yearStr[i]
   	        });
   			
   	}
   	console.log(data);
   	return data;
   }
</script>
</html>