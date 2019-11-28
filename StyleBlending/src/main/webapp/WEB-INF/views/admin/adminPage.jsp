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

<link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
<style>
#weatherWidget .currentDesc {
    color: #ffffff!important;
}
    .traffic-chart {
        min-height: 335px;
    }
    #flotPie1  {
        height: 150px;
    }
    #flotPie1 td {
        padding:3px;
    }
    #flotPie1 table {
        top: 20px!important;
        right: -10px!important;
    }
    .chart-container {
        display: table;
        min-width: 270px ;
        text-align: left;
        padding-top: 10px;
        padding-bottom: 10px;
    }
    #flotLine5  {
         height: 105px;
    }

    #flotBarChart {
        height: 150px;
    }
    #cellPaiChart{
        height: 160px;
    }

</style>

<jsp:include page="header.jsp" />
    
<!-- Left Panel -->
    <aside id="left-panel" class="left-panel" style="padding-top:20px;">
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
                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-1">
                                    <i class="ti-book"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text"><span class="count">${newBoard}</span></div>
                                        <div class="stat-heading">새 게시글</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-2">
                                    <i class="ti-video-clapper"></i>
                                </div>
                                <div class="stat-content">
                                <c:if test="${!empty startAd}">
                                    <c:if test="${startAd.status eq '2' }">
                                    <div class="text-left dib">
                                        <div class="stat-text"><span>${startAd.name}</span></div>
                                        <div class="stat-heading">진행중</div> 
                                    </div>
                                    </c:if>
                                </c:if>
                                <c:if test="${empty startAd}">
                                	<div>모집중</div>
                                </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-4">
                                    <i class="pe-7s-users"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text"><span class="count"> ${fn:length(newMember) } </span></div>
                                        <div class="stat-heading">가입자 수</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="stat-widget-five">
                                <div class="stat-icon dib flat-color-3">
                                    <i class="ti-light-bulb"></i>
                                </div>
                                <div class="stat-content">
                                    <div class="text-left dib">
                                        <div class="stat-text"><span class="count">${declareCount}</span></div>
                                        <div class="stat-heading" style="font-size: 13px;">미처리신고</div>
                                    </div>
                                </div>
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
                                                  <a href="#"><img class="rounded-circle" src="${pageContext.request.contextPath}${newMember[m].profilePath }${newMember[m].renameImg}" alt=""></a>
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
  
            	<!-- /Calender  -->
						
	<div class="col-lg-7">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title box-title">To Do List</h4>
                            <div class="card-content">
                                <div class="todo-list">
                                    <div class="tdl-holder">
                                        <div class="tdl-content">
                                            <ul>
                                                <li>
                                                    <label>
                                                        <input type="checkbox"><i class="check-box"></i><span>Conveniently fabricate interactive technology for ....</span>
                                                        <a href='#' class="fa fa-times"></a>
                                                        <a href='#' class="fa fa-pencil"></a>
                                                        <a href='#' class="fa fa-check"></a>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label>
                                                        <input type="checkbox"><i class="check-box"></i><span>Creating component page</span>
                                                        <a href='#' class="fa fa-times"></a>
                                                        <a href='#' class="fa fa-pencil"></a>
                                                        <a href='#' class="fa fa-check"></a>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label>
                                                        <input type="checkbox" checked><i class="check-box"></i><span>Follow back those who follow you</span>
                                                        <a href='#' class="fa fa-times"></a>
                                                        <a href='#' class="fa fa-pencil"></a>
                                                        <a href='#' class="fa fa-check"></a>
                                                    </label>
                                                </li>
                                                <li>
                                                    <label>
                                                        <input type="checkbox" checked><i class="check-box"></i><span>Design One page theme</span>
                                                        <a href='#' class="fa fa-times"></a>
                                                        <a href='#' class="fa fa-pencil"></a>
                                                        <a href='#' class="fa fa-check"></a>
                                                    </label>
                                                </li>

                                                <li>
                                                    <label>
                                                        <input type="checkbox" checked><i class="check-box"></i><span>Creating component page</span>
                                                        <a href='#' class="fa fa-times"></a>
                                                        <a href='#' class="fa fa-pencil"></a>
                                                        <a href='#' class="fa fa-check"></a>
                                                    </label>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div> <!-- /.todo-list -->
                            </div>
                        </div> <!-- /.card-body -->
                    </div><!-- /.card -->
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
    
   
    <!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <!--Chartist Chart-->
    <script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/init/weather-init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/init/fullcalendar-init.js"></script>
    
    

<jsp:include page="footer.jsp" />