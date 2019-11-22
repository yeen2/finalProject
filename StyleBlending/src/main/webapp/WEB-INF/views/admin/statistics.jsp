<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- jQuery -->
 <!--    <script src="https://code.jquery.com/jquery.min.js"></script> -->
    <!-- google charts -->
   <!--  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script> -->

</head>
<body>
	
<!-- Left Panel -->
    <aside id="left-panel" class="left-panel" style="padding-top:20px;">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="">
                        <a href="aPage.do"><i class="menu-icon fa fa-laptop"></i>AdminPage </a>
                    </li>
                     <li class="">
                        <a href="aUser.do"><i class="menu-icon fa ti-user"></i>회원 정보 </a>
                    </li>
                    <li class="">
                        <a href="aDeclare.do"><i class="menu-icon fa ti-alert"></i>신고관리</a>
                    </li>
                    <li class="">
                        <a href="aAdvertisment.do"><i class="menu-icon fa ti-desktop"></i>광고 관리 </a>
                    </li>
                    <li class="active">
                        <a href="aStatistics.do"><i class="menu-icon fa ti-bar-chart-alt"></i>통계 </a>
                    </li>
                    <li class="">
                        <a href="aNotice.do"><i class="menu-icon fa ti-pin-alt"></i>공지사항</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    
    
    
       <!-- Right Panel -->

    <div id="right-panel" class="right-panel">

      <jsp:include page="header.jsp" />
      
        
       <div class="content">
            <div class="animated fadeIn">
                <div class="row">
                
			      
			      <div class="col-lg-6">
<div class="card">
<div class="card-body"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
<h4 class="mb-3">Yearly Sales </h4>
<canvas id="sales-chart" height="528" width="1057" class="chartjs-render-monitor" style="display: block; height: 352px; width: 705px;"></canvas>
</div>
</div>
</div>
			      
			      
			      <div class="col-lg-6">
			      	<div class="card" style="padding:0px 20px 0px 0px; width:900px;">
			      		<div class="card-body" >
			      			<h4 class="mb-3">사이트 방문자 성별 현황 그래프</h4>
			      			 <div id="Line_Controls_Chart">
			      			 	<h4 class="mb-3">라인 차트 생성할 영역</h4>
     							
          						<div id="lineChartArea" style="padding:0px 20px 0px 0px;"></div>
          						<h4 class="mb-3">컨트롤바를 생성할 영역</h4>
    							
          						<div id="controlsArea" style="padding:0px 20px 0px 0px;"></div>
        					</div> 
			      		</div>
			      	</div>
			      </div>
			      
			      
			      <div class="col-lg-6">
			      	<div class="card" >
			      		<div class="card-body" >
			      			<h4 class="mb-3">광고유입률</h4>
							<div id="piechart_3d" ></div>
			      		</div>
			      	</div>
			      </div>
      
      			</div>
      		</div>
      </div>
      
      <script type="text/javascript">
      
      $(function(){
    	  
    	    //Sales chart
    	    var ctx = document.getElementById( "sales-chart" );
    	    ctx.height = 150;
    	    var myChart = new Chart( ctx, {
    	        type: 'line',
    	        data: {
    	            labels: [ "2012", "2013", "2014", "2015", "2016", "2017", "2018" ],
    	            type: 'line',
    	            defaultFontFamily: 'Montserrat',
    	            datasets: [ {
    	                label: "Foods",
    	                data: [ 0, 30, 15, 110, 50, 63, 120 ],
    	                backgroundColor: 'transparent',
    	                borderColor: 'rgba(220,53,69,0.75)',
    	                borderWidth: 3,
    	                pointStyle: 'circle',
    	                pointRadius: 5,
    	                pointBorderColor: 'transparent',
    	                pointBackgroundColor: 'rgba(220,53,69,0.75)',
    	                    }, {
    	                label: "Electronics",
    	                data: [ 0, 50, 40, 80, 35, 99, 80 ],
    	                backgroundColor: 'transparent',
    	                borderColor: 'rgba(40,167,69,0.75)',
    	                borderWidth: 3,
    	                pointStyle: 'circle',
    	                pointRadius: 5,
    	                pointBorderColor: 'transparent',
    	                pointBackgroundColor: 'rgba(40,167,69,0.75)',
    	                    } ]
    	        },
    	        options: {
    	            responsive: true,

    	            tooltips: {
    	                mode: 'index',
    	                titleFontSize: 12,
    	                titleFontColor: '#000',
    	                bodyFontColor: '#000',
    	                backgroundColor: '#fff',
    	                titleFontFamily: 'Montserrat',
    	                bodyFontFamily: 'Montserrat',
    	                cornerRadius: 3,
    	                intersect: false,
    	            },
    	            legend: {
    	                display: false,
    	                labels: {
    	                    usePointStyle: true,
    	                    fontFamily: 'Montserrat',
    	                },
    	            },
    	            scales: {
    	                xAxes: [ {
    	                    display: true,
    	                    gridLines: {
    	                        display: false,
    	                        drawBorder: false
    	                    },
    	                    scaleLabel: {
    	                        display: false,
    	                        labelString: 'Month'
    	                    }
    	                        } ],
    	                yAxes: [ {
    	                    display: true,
    	                    gridLines: {
    	                        display: false,
    	                        drawBorder: false
    	                    },
    	                    scaleLabel: {
    	                        display: true,
    	                        labelString: 'Value'
    	                    }
    	                        } ]
    	            },
    	            title: {
    	                display: false,
    	                text: 'Normal Legend'
    	            }
    	        }
    	    } );
      });
      




      </script>
      
     <!--    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    	<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['항목', '수치'],
          ["1",'1']
         
        ]);

        var options = {
          title: '광고 유입률',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>
 -->
	
        <jsp:include page="footer.jsp" />

    </div><!-- /#right-panel -->
    
    <script>
  //Sales chart
  
  $(function(){
	  

    var ctx = document.getElementById( "sales-chart" );
    ctx.height = 150;
    var myChart = new Chart( ctx, {
        type: 'line',
        data: {
            labels: [ "2012", "2013", "2014", "2015", "2016", "2017", "2018" ],
            type: 'line',
            defaultFontFamily: 'Montserrat',
            datasets: [ {
                label: "Foods",
                data: [ 0, 30, 15, 110, 50, 63, 120 ],
                backgroundColor: 'transparent',
                borderColor: 'rgba(220,53,69,0.75)',
                borderWidth: 3,
                pointStyle: 'circle',
                pointRadius: 5,
                pointBorderColor: 'transparent',
                pointBackgroundColor: 'rgba(220,53,69,0.75)',
                    }, {
                label: "Electronics",
                data: [ 0, 50, 40, 80, 35, 99, 80 ],
                backgroundColor: 'transparent',
                borderColor: 'rgba(40,167,69,0.75)',
                borderWidth: 3,
                pointStyle: 'circle',
                pointRadius: 5,
                pointBorderColor: 'transparent',
                pointBackgroundColor: 'rgba(40,167,69,0.75)',
                    } ]
        },
        options: {
            responsive: true,

            tooltips: {
                mode: 'index',
                titleFontSize: 12,
                titleFontColor: '#000',
                bodyFontColor: '#000',
                backgroundColor: '#fff',
                titleFontFamily: 'Montserrat',
                bodyFontFamily: 'Montserrat',
                cornerRadius: 3,
                intersect: false,
            },
            legend: {
                display: false,
                labels: {
                    usePointStyle: true,
                    fontFamily: 'Montserrat',
                },
            },
            scales: {
                xAxes: [ {
                    display: true,
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    scaleLabel: {
                        display: false,
                        labelString: 'Month'
                    }
                        } ],
                yAxes: [ {
                    display: true,
                    gridLines: {
                        display: false,
                        drawBorder: false
                    },
                    scaleLabel: {
                        display: true,
                        labelString: 'Value'
                    }
                        } ]
            },
            title: {
                display: false,
                text: 'Normal Legend'
            }
        }
    } );
  });
  
  
  
    </script>
    
       <!-- Scripts -->
    <%-- <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>--%>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/main.js"></script> 

	
	 <!--  <script>
	 
	 
 
   var chartDrowFun = {
 
    chartDrow : function(){
        var chartData = '';
 
        //날짜형식 변경하고 싶으시면 이 부분 수정하세요.
        var chartDateformat     = 'yyyy년MM월dd일';
        //라인차트의 라인 수
        var chartLineCount    = 10;
        //컨트롤러 바 차트의 라인 수
        var controlLineCount    = 10;
 
 
        function drawDashboard() {
 
          var data = new google.visualization.DataTable();
          //그래프에 표시할 컬럼 추가
          data.addColumn('datetime' , '날짜');
          data.addColumn('number'   , '남성');
          data.addColumn('number'   , '여성');
          data.addColumn('number'   , '전체');
 
          //그래프에 표시할 데이터
          var dataRow = [];
 
          for(var i = 0; i <= 29; i++){ //랜덤 데이터 생성
            var total   = Math.floor(Math.random() * 300) + 1;
            var man     = Math.floor(Math.random() * total) + 1;
            var woman   = total - man;
            
 
            dataRow = [new Date('2019', '10', i , '10'), man, woman , total];
            data.addRow(dataRow);
          } 
          
          
 
            var chart = new google.visualization.ChartWrapper({
              chartType   : 'LineChart',
              containerId : 'lineChartArea', //라인 차트 생성할 영역
              options     : {
                              isStacked   : 'percent',
                              focusTarget : 'category',
                              height          : 500,
                              width              : '100%',
                              legend          : { position: "top", textStyle: {fontSize: 13}},
                              pointSize        : 5,
                              tooltip          : {textStyle : {fontSize:12}, showColorCode : true,trigger: 'both'},
                              hAxis              : {format: chartDateformat, gridlines:{count:chartLineCount,units: {
                                                                  years : {format: ['yyyy년']},
                                                                  months: {format: ['MM월']},
                                                                  days  : {format: ['dd일']},
                                                                  hours : {format: ['HH시']}}
                                                                },textStyle: {fontSize:12}},
                vAxis              : {minValue: 100,viewWindow:{min:0},gridlines:{count:-1},textStyle:{fontSize:12}},
                animation        : {startup: true,duration: 1000,easing: 'in' },
                annotations    : {pattern: chartDateformat,
                                textStyle: {
                                fontSize: 15,
                                bold: true,
                                italic: true,
                                color: '#871b47',
                                auraColor: '#d799ae',
                                opacity: 0.8,
                                pattern: chartDateformat
                              }
                            }
              }
            });
 
            var control = new google.visualization.ControlWrapper({
              controlType: 'ChartRangeFilter',
              containerId: 'controlsArea',  //control bar를 생성할 영역
              options: {
                  ui:{
                        chartType: 'LineChart',
                        chartOptions: {
                        chartArea: {'width': '60%','height' : 80},
                          hAxis: {'baselineColor': 'none', format: chartDateformat, textStyle: {fontSize:12},
                            gridlines:{count:controlLineCount,units: {
                                  years : {format: ['yyyy년']},
                                  months: {format: ['MM월']},
                                  days  : {format: ['dd일']},
                                  hours : {format: ['HH시']}}
                            }}
                        }
                  },
                    filterColumnIndex: 0
                }
            });
 
            var date_formatter = new google.visualization.DateFormat({ pattern: chartDateformat});
            date_formatter.format(data, 0);
 
            var dashboard = new google.visualization.Dashboard(document.getElementById('Line_Controls_Chart'));
            window.addEventListener('resize', function() { dashboard.draw(data); }, false); //화면 크기에 따라 그래프 크기 변경
            dashboard.bind([control], [chart]);
            dashboard.draw(data);
 
        }
          google.charts.setOnLoadCallback(drawDashboard);
 
      }
    }
 
		$(document).ready(function(){
		  google.charts.load('current', {'packages':['line','controls']});
		  chartDrowFun.chartDrow(); //chartDrow() 실행
		}); 
  </script>
	 -->
	
    
</body>
</html>