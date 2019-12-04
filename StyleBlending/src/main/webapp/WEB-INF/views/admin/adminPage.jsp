<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("a hh:mm:ss");
%>

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet"/>

<style>
	.order-table:after, .order-table:before{
		position : relative !important;
	}
	#weatherWidget .currentDesc {
	    color: #ffffff!important;
	}
    #flotPie1  {
        height: 150px;
    }
    #flotPie1 td {
        padding:3px;
    }
    #flotPie1 table {
        top: 20px!important;
    }
    .chart-container {
        display: table;
        min-width: 370px ;
        text-align: left;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #flotLine5  {
         height: 105px;
    }

    #cellPaiChart{
        height: 160px;
    }

</style>

<jsp:include page="header.jsp" />
    
<!-- Left Panel -->
    <aside id="left-panel" class="left-panel" style="padding-top:50px;">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
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
                    <li class="">
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
    
    <!-- Content -->
    <div class="content">
        <!-- Animated -->
        <div class="animated fadeIn">
                  <!-- Widgets  -->
            <div class="row">
             
                 
                <div class="col-sm-6 col-lg-3">
					<div class="card text-white bg-flat-color-6">
						<div class="card-body">
							<div class="card-left pt-1 float-left">
								<h3 class="mb-0 fw-r">
									<span class="currency float-left mr-1"></span>
									<span class="count">${newBoard}</span>
								</h3>
								<p class="text-light mt-1 m-0">새 게시글</p>
							</div>
							<div class="card-right float-right text-right">
								<i class="icon fade-5 icon-lg pe-7s-notebook"></i>
							</div>
						 </div>
					 </div>
				 </div>
				 
				 <div class="col-sm-6 col-lg-3">
					<div class="card text-white bg-flat-color-6">
						<div class="card-body">
							<div class="card-left pt-1 float-left">
								<h3 class="mb-0 fw-r">
									<span class="count">${fn:length(newMember) }</span>
								</h3>
								<p class="text-light mt-1 m-0">가입자 수</p>
							</div>
							<div class="card-right float-right text-right">
								<i class="icon fade-5 icon-lg  pe-7s-users"></i>
							</div>
						</div>
					</div>
				</div>
				
				 <div class="col-sm-6 col-lg-3">
					<div class="card text-white bg-flat-color-6">
						<div class="card-body">
							<div class="card-left pt-1 float-left">
								<h3 class="mb-0 fw-r">
								<c:if test="${!empty startAd}">
                                    <c:if test="${startAd.status eq '2' }">
                                    <div class="text-left dib">
                                    	<span class="">${startAd.name}</span>
                                        <p class="text-light mt-1 m-0">진행중</p>
                                    </div>
                                    </c:if>
                                </c:if>
                                <c:if test="${empty startAd}">
                                	<p class="text-light mt-1 m-0">모집중</p>
                                </c:if>
									
								</h3>
								
							</div>
							<div class="card-right float-right text-right">
								<i class="icon fade-5 icon-lg pe-7s-display1"></i>
							</div>
						</div>
					</div>
				</div>
				
				<div class="col-sm-6 col-lg-3">
					<div class="card text-white bg-flat-color-4">
						<div class="card-body">
							<div class="card-left pt-1 float-left">
								<h3 class="mb-0 fw-r">
									<span class="count">${declareCount}</span>
								</h3>
								<p class="text-light mt-1 m-0">미처리 신고</p>
							</div>
							<div class="card-right float-right text-right">
								<i class="icon fade-5 icon-lg pe-7s-attention"></i>
							</div>
						</div>
					</div>
				</div>

            </div>
            <!-- /Widgets -->
            
            <div class="clearfix"></div>
            <!-- Orders -->
            <div class="orders">
                <div class="row">
                    <div class="col-xl-7">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="box-title">New Members </h4>
                            </div>
                            <div class="card-body--">
                                <div class="table-stats order-table ov-h">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th class="serial">No.</th>
                                                <th class="avatar">프로필</th>
                                                <th>이메일</th>
                                                <th>닉네임</th>
                                                <th>가입일</th>
                                                <th>탈퇴유무</th>
                                            </tr>
                                        </thead>
                                        <c:if test="${!empty newMember}">
                                        <c:forEach var="m" begin="0" end="${fn:length(newMember)-1}">
                                        <tbody>
                                            <tr>
                                                <td class="serial">${m+1}</td>
                                                <td>
                                              <div class="round-img">
                                                  <a href=""><img class="rounded-circle" src="${pageContext.request.contextPath}${newMember[m].profilePath }${newMember[m].renameImg}" style="width:50px; height:50px;" alt=""></a>
                                              </div>
                                          </td> 
                                                <td> ${newMember[m].email } </td>
                                                <td> <span class="name">${newMember[m].nickName}</span> </td>
                                          <td> <span>${newMember[m].enrollDate }</span> </td>
                                          <td>
                                          	<c:if test="${newMember[m].isDelete eq 'N' }">
                                              <span class="badge badge-complete">${newMember[m].isDelete}</span>
                                              </c:if>
                                              <c:if test="${newMember[m].isDelete eq 'Y' }">
                                             	<span class="badge badge-pending">${newMember[m].isDelete}</span>
                                          	</c:if>
                                          </td> 
                                            </tr>
                                        </tbody>
                                        </c:forEach>
                                        </c:if>
                                        <c:if test="${ empty newMember}">
                                        <tbody>
                                        	<td colspan="6" style="text-align: center;">새로 가입한 회원이 없습니다.</td>
                                        </tbody>
                                        </c:if>
                                    </table>
                                </div> <!-- /.table-stats -->
                            </div>
                        </div> <!-- /.card -->
                    </div>  <!-- /.col-lg-8 -->
		
		
    
		 <!-- Calender   -->
                 <div class="col-md-12 col-lg-5">
                     <div class="card">
                         <div class="card-body">
                             <!-- <h4 class="box-title">Chandler</h4> -->
                             <div class="calender-cont widget-calender">
                                 <div id="calendar"></div>
                             </div>
                         </div>
                     </div><!-- /.card -->
                     
                     <!-- 해시태그 통계 -->
                     <div class="card">
						<div class="card-body">
                     	<b>해시태그 순위</b>
							<div class="chart-container">
								<div id="flotPie1" class="float-chart" style="padding: 0px; position: relative;">
									<canvas class="flot-base" width="405" height="225" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 270px; height: 150px;"></canvas>
									<canvas class="flot-overlay" width="405" height="225" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 270px; height: 150px;"></canvas>
									<div class="legend">
										<div style="position: absolute; width: 107px; height: 70px; top: 5px; right: 5px; background-color: rgb(255, 255, 255); opacity: 0.85;"></div>
										<table style="position:absolute;top:5px;right:5px;;font-size:smaller;color:#545454">
											<tbody>
												<tr>
													<td class="legendColorBox">
														<div style="border:1px solid #ccc;padding:1px">
															<div style="width:4px;height:0;border:5px solid #5c6bc0;overflow:hidden"></div>
														</div>
													</td>
													<c:forEach items="${hashRank}" var="r" varStatus="status">
													<c:if test="${status.index eq 0 }">
													<td class="legendLabel" id="hash1">1. ${r.hashtag }</td>
													</c:if>
													</c:forEach>
												</tr>
												<tr>
													<td class="legendColorBox">
														<div style="border:1px solid #ccc;padding:1px">
															<div style="width:4px;height:0;border:5px solid #ef5350;overflow:hidden"></div>
														</div>
													</td>
													<c:forEach items="${hashRank}" var="r" varStatus="status">
													<c:if test="${status.index eq 1 }">
													<td class="legendLabel" id="hash2">2. ${r.hashtag }</td>
													</c:if>
													</c:forEach>
												</tr>
												<tr>
													<td class="legendColorBox">
														<div style="border:1px solid #ccc;padding:1px">
															<div style="width:4px;height:0;border:5px solid #66bb6a;overflow:hidden"></div>
														</div>
													</td>
													<c:forEach items="${hashRank}" var="r" varStatus="status">
													<c:if test="${status.index eq 2 }">
													<td class="legendLabel" id="hash3">3. ${r.hashtag }</td>
													</c:if>
													</c:forEach>
												</tr>
											</tbody>
										</table>
									</div>
								</div><!-- flotPie1 끝 -->
							</div>
						</div>
					</div>
                     
                     
                    <div class="card  ">
						<div class="card-body">
							<div class="h1 text-muted text-right mb-1">
								<i class="fa fa-clock-o"></i>
							</div>
							<div class="h4 mb-0"><%= sdf.format(nowTime) %></div>
							<small class="text-muted text-uppercase font-weight-bold">Avg. Time</small>
							<div class="progress progress-xs mt-3 mb-0 bg-flat-color-5" style="width: 40%; height: 5px;"></div>
						</div>
					</div>	
                 </div>
               </div>
           </div>
            <!-- /.orders -->
            
            
	
            
       
           
            <!-- Modal - Calendar - Add New Event -->
            <div class="modal fade none-border" id="event-modal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><strong>Add New Event</strong></h4>
                        </div>
                        <div class="modal-body"></div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-success save-event waves-effect waves-light">Create event</button>
                            <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-dismiss="modal">Delete</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /#event-modal -->
            <!-- Modal - Calendar - Add Category -->
            <div class="modal fade none-border" id="add-category">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><strong>Add a category </strong></h4>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label class="control-label">Category Name</label>
                                        <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="control-label">Choose Category Color</label>
                                        <select class="form-control form-white" data-placeholder="Choose a color..." name="category-color">
                                            <option value="success">Success</option>
                                            <option value="danger">Danger</option>
                                            <option value="info">Info</option>
                                            <option value="pink">Pink</option>
                                            <option value="primary">Primary</option>
                                            <option value="warning">Warning</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-danger waves-effect waves-light save-category" data-dismiss="modal">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        <!-- /#add-category -->
        </div>
        <!-- .animated -->
    </div>
    <!-- /.content -->
    

	<!-- 캘린더 -->
    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script> 
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/init/fullcalendar-init.js"></script>
    <!--  Chart -->
    <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script> 
    <script>
    $(function() {
    	
    	var hash1 = $("#hash1").html();
    	var hash2 = $("#hash2").html();
    	var hash3 = $("#hash3").html();
    	    
            // Pie chart flotPie1 
            var piedata = [
                { label: hash1, data: [[1,32]], color: '#5c6bc0'},
                { label: hash2, data: [[1,33]], color: '#ef5350'},
                { label: hash3, data: [[1,35]], color: '#66bb6a'}
            ];

            $.plot('#flotPie1', piedata, {
                series: {
                    pie: {
                        show: true,
                        radius: 1,
                        innerRadius: 0.65,
                        label: {
                            show: true,
                            radius: 2/3,
                            threshold: 1
                        },
                        stroke: { 
                            width: 0
                        }
                    }
                },
                grid: {
                    hoverable: true,
                    clickable: true
                }
            });
    });
            // Pie chart flotPie1  End
    
    </script>

<jsp:include page="footer.jsp" />