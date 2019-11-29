<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yy/MM");
	
	String month = sdf.format(nowTime);
%>
<!-- 차트 보이게 cdn x-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>

<jsp:include page="header.jsp" />

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
    
    
 
        
       <div class="content">
            <div class="animated fadeIn mt-3">
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
                	<div class="col-sm-12 mb-4">
						<div class="card-group">
							<div class="card col-md-6 no-padding ">
								<div class="card-body">
									<div class="h1 text-muted text-right mb-4">
										<i class="fa fa-users"></i>
									</div>
									<div class="h4 mb-0">
									<c:forEach items="${totalCount}" var="c" varStatus="status">
									<c:if test="${status.index eq 0}">
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
									<c:if test="${status.index eq 1}">
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
									<c:if test="${status.index eq 2}">
										<span class="count">${c.totalCount}</span>
									</c:if>	
									</c:forEach>
									</div>
									<small class="text-muted text-uppercase font-weight-bold">Advertisment sold</small>
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
<span class="count">972</span>
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
								<h4 class="mb-3"><b>최근 6개월 현황 통계 (게시글 / 가입자)</b></h4>
								<canvas id="sales-chart" height="528" width="1057" class="chartjs-render-monitor" style="display: block; height: 352px; width: 705px;"></canvas>
							</div>
						</div>
					</div> <!-- 현황통계 끝 -->
      			</div> <!-- /.row 끝  -->
      		</div>
      </div>
      
 
    <script>
  //Sales chart
  // 총누적 회원,게시글,광고,신고
  $(function(){
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
				    ctx.height = 500;
				    var myChart = new Chart( ctx, {
				        type: 'line',
				        data: {
				            labels: [ "06", "07", "08", "09", "10", "<%= month %>"],
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
  });
 
  
    </script>
	

<jsp:include page="footer.jsp" />