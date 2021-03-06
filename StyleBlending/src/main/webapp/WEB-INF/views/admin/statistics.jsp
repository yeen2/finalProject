<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.text.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM");
	
	String month = sdf.format(nowTime);
	
	Calendar cal = Calendar.getInstance();
	
	sdf.format(cal.getTime());
	// 오늘자 기준 6개월
	String[] m = new String[6];
	for(int i=0; i<6; i++){
		cal.add(cal.MONTH,-1);
		String a = sdf.format(cal.getTime());
		m[i] = a;
		//System.out.println(m[i]);
	}
	
	// 오늘자 6일전까지
	Date nowTime2 = new Date();
	
	SimpleDateFormat sdf2 = new SimpleDateFormat("MM-dd");
	
	String day = sdf2.format(nowTime2);
	
	Calendar cal2 = Calendar.getInstance();
	
	sdf.format(cal.getTime());
	// 오늘자 기준 6개월
	String[] d = new String[5];
	for(int i=0; i<5; i++){
		cal2.add(cal.DAY_OF_MONTH,-1);
		String a = sdf2.format(cal2.getTime());
		d[i] = a;
		//System.out.println(d[i]);
	}
	
%>
<!-- 차트 보이게 cdn x-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>

<jsp:include page="header.jsp" />

<!-- Left Panel -->
    <aside id="left-panel" class="left-panel" style="padding-top:20px;margin-top:35px;">
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
        
       <div class="content" style="padding-top:50px;">
            <div class="animated fadeIn ">
                <div class="row">
                	
                	<div class="col-sm-12">
                		<div class="card-group">
                			<div class="card col-md-12 no-padding ">
                				<div class="card-body">
                				<b>> 총 누적</b>
                				</div>
                			</div>
                		</div>
                	</div>
                	<div class="col-sm-12 mb-2">
						<div class="card-group">
							<div class="card col-md-6 no-padding ">
								<div class="card-body">
									<div class="h1 text-muted text-right mb-4">
										<i class="fa fa-users"></i>
									</div>
									<div class="h4 mb-0">
									<c:forEach items="${totalCount}" var="c" varStatus="status">
									<c:if test="${status.index eq 1}">
										<span class="count">${c.totalCount}</span>
									</c:if>	
									</c:forEach>
									</div>
									<small class="text-muted text-uppercase font-weight-bold">회원</small>
									<div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
								</div>
							</div>
							<div class="card col-md-6 no-padding ">
								<div class="card-body">
									<div class="h1 text-muted text-right mb-4">
										<i class="fa fa-user-plus"></i>
									</div>
									<div class="h4 mb-0">
									<c:forEach items="${totalCount}" var="c" varStatus="status">
									<c:if test="${status.index eq 2}">
										<span class="count">${c.totalCount}</span>
									</c:if>		
									</c:forEach>								
									</div>
									<small class="text-muted text-uppercase font-weight-bold">게시글</small>
									<div class="progress progress-xs mt-3 mb-0 bg-flat-color-2" style="width: 40%; height: 5px;"></div>
								</div>
							</div>
							
							<div class="card col-md-6 no-padding ">
								<div class="card-body">
									<div class="h1 text-muted text-right mb-4">
										<i class="fa fa-cart-plus"></i>
									</div>
									<div class="h4 mb-0">
									<c:forEach items="${totalCount}" var="c" varStatus="status">
									<c:if test="${status.index eq 3}">
											<fmt:formatNumber value="${c.totalCount}" pattern="#,##0원" />
									</c:if>	
									</c:forEach>
									</div>
									<small class="text-muted text-uppercase font-weight-bold">광고 수익</small>
									<div class="progress progress-xs mt-3 mb-0 bg-flat-color-3" style="width: 40%; height: 5px;"></div>
								</div>
							</div>
							<div class="card col-md-6 no-padding ">
								<div class="card-body">
									<div class="h1 text-muted text-right mb-4">
										<i class="fa fa-pie-chart"></i>
									</div>
									<div class="h4 mb-0">
										<span class="count">28</span>%
									</div>
							 		<small class="text-muted text-uppercase font-weight-bold">Returning Visitors</small>
									<div class="progress progress-xs mt-3 mb-0 bg-flat-color-4" style="width: 40%; height: 5px;"></div>
								</div>
							</div>
							<div class="card col-md-6 no-padding ">
								<div class="card-body">
									<div class="h1 text-muted text-right mb-4">
										<i class="fa fa-comments-o"></i>
									</div>
									<div class="h4 mb-0">
									<c:forEach items="${totalCount}" var="c" varStatus="status">
									<c:if test="${status.index eq 0}">
										<span class="count">${c.totalCount}</span>
									</c:if>	
									</c:forEach>
									</div>
									<small class="text-muted text-uppercase font-weight-bold">COMMENTS</small>
									<div class="progress progress-xs mt-3 mb-0 bg-flat-color-1" style="width: 40%; height: 5px;"></div>
								</div>
							</div>
						</div>
					</div>
                
                	
				     <div class="col-lg-9 offset-md-1">
						<div class="card">
							<div class="card-body mt-3">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
									</div>
								</div>
								<h4 class="mb-3"><b>현황 통계 (게시글 / 가입자)</b></h4>
								<div style="float:right;">
								<span>
									<a id="monthRank" onclick="monthChart();" style="cursor:pointer;"><b>월간</b></a>&nbsp;
								</span>	
									<a id="dateRank" onclick="dayChart();" style="cursor:pointer;"><b>일간</b></a>
								</div>
								<canvas id="sales-chart" height="528" width="1057" class="chartjs-render-monitor" style="display: block; height: 352px; width: 705px;"></canvas>
							</div>
						</div>
					</div> <!-- 현황통계 끝 -->
					<!-- 
					<div class="col-lg-6">
						<div class="card">
							<div class="card-body">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:200%;height:200%;left:0; top:0"></div>
									</div>
								</div>
								<h4 class="mb-3">최근 6개월 현황통계</h4>
								<canvas id="lineChart" height="528" width="1057" class="chartjs-render-monitor" style="display: block; height: 352px; width: 705px;"></canvas>
							</div>
						</div>
					</div>			
					 -->	
					 <!--  -->	
					<div class="col-lg-4">
						<div class="card">
							<div class="card-body">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
									</div>
								</div>
								<h4 class="mb-3"><b>카테고리별 순위</b></h4>
								<canvas id="pieChart" height="500" width="500" class="chartjs-render-monitor" style="display: block; height: 753px; width: 753px;"></canvas>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4">
						<div class="card">
							<div class="card-body">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
									</div>
								</div>
								<h4 class="mb-3"><b>브랜드별 순위</b></h4>
								<canvas id="pieChart2" height="500" width="500" class="chartjs-render-monitor" style="display: block; height: 753px; width: 753px;"></canvas>
							</div>
						</div>
					</div>
					
					<div class="col-lg-4">
						<div class="card">
							<div class="card-body">
								<div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
									<div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
										<div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div>
									</div>
									<div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;">
									</div>
								</div>
								<h4 class="mb-3"><b>색깔별 순위</b></h4>
								<canvas id="pieChart3" height="500" width="500" class="chartjs-render-monitor" style="display: block; height: 753px; width: 753px;"></canvas>
							</div>
						</div>
					</div>
      			</div> <!-- /.row 끝  -->
      		</div>
      </div>
      
 
    <script>
    
  //pie chart
  
  $(function(){
	  
	  // 카테고리별 순위
	  $.ajax({
			 type:"post",
			 url:"aCateChart.do",
			 dataType:"json",
			 success:function(data){
					
				 	console.log(data.length);
				 	
				 	var count = [];
				 	for(var i=0; i<data.length; i++){
				 			count.push(data[i].pno);
				 	}
				 	console.log(count);
				 	
				 	var name = [];
				 	for(var i=0; i<data.length; i++){
				 			name.push(data[i].name);
				 	}
				
					var ctx = document.getElementById( "pieChart" );
				    ctx.height = 450;
				    var myChart = new Chart( ctx, {
				        type: 'pie',
				        data: {
				            datasets: [{
				                data:count,
				                backgroundColor: [
				                                    "rgb(96, 198, 207)",
				                                    "rgb(152, 156, 255)",
				                                    "#ef5350",
				                                    "rgba(0, 194, 146,0.5)",
				                                    "rgba(0,0,0,0.07)"
				                                ],
				                hoverBackgroundColor: [
				                                    "rgb(96, 198, 207)",
				                                    "rgb(152, 156, 255)",
				                                    "#ef5350",
				                                    "rgba(0, 194, 146,0.5)",
				                                    "rgba(0,0,0,0.07)"
				                                ]

				                            } ],
				            labels: name
				        },
				        options: {
				            responsive: true
				        }
				    } );
			 
				
			 },error:function(){
				 console.log("ajax통신 실패");
			 }
			 
		  });  
	
	  
      // 브랜드별 순위
	  $.ajax({
			 type:"post",
			 url:"aBrandChart.do",
			 dataType:"json",
			 success:function(data){
					
				 	var count = [];
				 	for(var i=0; i<data.length; i++){
				 			count.push(data[i].pno);
				 	}
				 	console.log(count);
				 	
				 	var name = [];
				 	for(var i=0; i<data.length; i++){
				 			name.push(data[i].name);
				 	}
				 
					var ctx = document.getElementById( "pieChart2" );
				    ctx.height = 450;
				    var myChart = new Chart( ctx, {
				        type: 'pie',
				        data: {
				            datasets: [{
				                data: count,
				                backgroundColor: [
				                                    "rgba(0, 194, 146,0.9)",
				                                    "rgba(0, 194, 146,0.7)",
				                                    "rgba(0, 194, 146,0.5)",
				                                    "rgba(0,0,0,0.07)"
				                                ],
				                hoverBackgroundColor: [
				                                    "rgba(0, 194, 146,0.9)",
				                                    "rgba(0, 194, 146,0.7)",
				                                    "rgba(0, 194, 146,0.5)",
				                                    "rgba(0,0,0,0.07)"
				                                ]

				                            } ],
				            labels: name
				        },
				        options: {
				            responsive: true
				        }
				    } );
				
			 },error:function(){
				 console.log("ajax통신 실패");
			 }
			 
		  });  
      
      
	  // 색깔별 순위
	  $.ajax({
			 type:"post",
			 url:"aColorChart.do",
			 dataType:"json",
			 success:function(data){
					
			 	var count = [];
			 	for(var i=0; i<data.length; i++){
			 			count.push(data[i].pno);
			 	}
			 	console.log(count);
			 	
			 	var name = [];
			 	for(var i=0; i<data.length; i++){
			 			name.push(data[i].name);
			 	}
				 	
					var ctx = document.getElementById( "pieChart3" );
				    ctx.height = 450;
				    var myChart = new Chart( ctx, {
				        type: 'pie',
				        data: {
				            datasets: [{
				                data: count,
				                backgroundColor: [
				                                    "#000",
				                                    "rgba(0,0,0,0.07)",
				                                    "#ef5350",
				                                    "rgba(0, 194, 146,0.5)",
				                                    "rgb(152, 156, 255)"
				                                ],
				                hoverBackgroundColor: [
				                                    "#000",
				                                    "rgba(0,0,0,0.07)",
				                                    "#ef5350",
				                                    "rgba(0, 194, 146,0.5)",
				                                    "rgb(152, 156, 255)"
				                                ]

				                            } ],
				            labels: name
				        },
				        options: {
				            responsive: true
				        }
				    } );
				
			 },error:function(){
				 console.log("ajax통신 실패");
			 }
			 
		  });  

    
  });  
    
    
  //Sales chart
  // 총누적 회원,게시글,광고,신고
 	 $(function(){
	  monthChart();
	 });
 // 일간별 
 function dayChart(){
	  
	  $("#dateRank").attr("color","rgb(132, 132, 132)");
	  $("#monthRank").attr("color","rgb(33, 37, 41)");
	  
	  $.ajax({
			 type:"post",
			 url:"aDayChart.do",
			 dataType:"json",
			 success:function(data){
				
					console.log(data[0]);
					console.log(data[1]);
					
				 	
				    var ctx = document.getElementById( "sales-chart" );
				    ctx.height = 350;
				    var myChart = new Chart( ctx, {
				        type: 'line',
				        data: {
				            labels: [ "<%=d[4]%>","<%=d[3]%>","<%=d[2]%>","<%=d[1]%>","<%=d[0]%>", "<%= day %>"],
				            type: 'line',
				            defaultFontFamily: 'Montserrat',
				            datasets: [ {
				                label: "게시글수",
				                data: [data[0].month1,data[0].month2,data[0].month3,data[0].month4,data[0].month5,data[0].month6],
				                backgroundColor: 'transparent',
				                borderColor: 'rgba(220,53,69,0.75)',
				                borderWidth: 3,
				                pointStyle: 'circle',
				                pointRadius: 5,
				                pointBorderColor: 'transparent',
				                pointBackgroundColor: 'rgba(220,53,69,0.75)',
				                    }, {
				                label: "가입자수",
				                data: [data[1].month1,data[1].month2,data[1].month3,data[1].month4,data[1].month5,data[1].month6],
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
					
			 },error:function(){
				 console.log("ajax통신 실패");
			 }
		  });  
	  
  }
 
  
  function monthChart(){
	  
	  $("#dateRank").attr("color","rgb(33, 37, 41)");
	  $("#monthRank").attr("color","rgb(132, 132, 132)");
	  
	  $.ajax({
			 type:"post",
			 url:"aChart.do",
			 dataType:"json",
			 success:function(data){
				
					console.log(data[0]);
					console.log(data[1]);
					
				// alert(data);
			
					// console.log(data[index]);
					var num =[];
					for(var i in data){
						num.push(data.month1);
						num.push(data.month2);
						num.push(data.month3);
						num.push(data.month4);
						num.push(data.month5);
						num.push(data.month6);
					}
					 
				    var ctx = document.getElementById( "sales-chart" );
				    ctx.height = 350;
				    var myChart = new Chart( ctx, {
				        type: 'line',
				        data: {
				            labels: [ "<%=m[4]%>","<%=m[3]%>","<%=m[2]%>","<%=m[1]%>","<%=m[0]%>", "<%= month %>"],
				            type: 'line',
				            defaultFontFamily: 'Montserrat',
				            datasets: [ {
				                label: "게시글수",
				                data: [data[0].month1,data[0].month2,data[0].month3,data[0].month4,data[0].month5,data[0].month6],
				                backgroundColor: 'transparent',
				                borderColor: 'rgba(220,53,69,0.75)',
				                borderWidth: 3,
				                pointStyle: 'circle',
				                pointRadius: 5,
				                pointBorderColor: 'transparent',
				                pointBackgroundColor: 'rgba(220,53,69,0.75)',
				                    }, {
				                label: "가입자수",
				                data: [data[1].month1,data[1].month2,data[1].month3,data[1].month4,data[1].month5,data[1].month6],
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
		
				
			 },error:function(){
				 console.log("ajax통신 실패");
			 }
		  });  
	  
  } 
	 
 
 
  
    </script>
	

<jsp:include page="footer.jsp" />