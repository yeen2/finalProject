<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	
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
                     <li class="active">
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
                        <a href="mainNotice.do"><i class="menu-icon fa ti-pin-alt"></i>공지사항</a>
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
                
                <div class="col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">Custom Table</strong>
                            </div>
                          
                          
                          <div class="row">
                          	<div class="col-sm-12 col-md-6" style="padding:20px;">
                          		<div class="dataTables_length" id="bootstrap-data-table_length">
                          			<label style="display:inline-flex";>Show 
                          				<select name="bootstrap-data-table_length" aria-controls="bootstrap-data-table" class="form-control form-control-sm">
                          					<option value="5">5</option>
                          					<option value="10">10</option>
                          					<option value="30">30</option>
                          					<option value="-1">All</option>
                          				</select> entries
                          			</label>
                          		</div>
                          	</div>
                          	
                          	<div class="col-sm-12 col-md-6">
                          		<div id="bootstrap-data-table_filter" class="dataTables_filter">
                          			<label style="display:inline-flex; padding:15px;">Search: &nbsp;
                          				<input type="search" class="form-control form-control-sm col-sm-12" placeholder="아이디 또는 닉네임을 입력해주세요." aria-controls="bootstrap-data-table">
                          			</label>
		                        	<button type="button" class="btn btn-secondary btn-sm" style="float:right; margin-right:10px; margin-top:15px;" data-toggle="modal" data-target="#staticModal">
		                        		회원삭제
		                        	</button>
                          		</div>
                          	</div>
                          </div>
                          
                      
                            <div class=" table-stats order-table ov-h ">                            	
                                <table class="table">
                                    <thead>
                                        <tr>
                                        	<th>
                                        		<label class="switch switch-3d switch-danger mr-3">
                                        			<input type="checkbox" class="switch-input" checked="true">
                                       				<span class="switch-label"></span> 
                                       				<span class="switch-handle"></span>
                                        		</label>
                                        	</th>
                                            <th class="serial">No.</th>
                                            <th>이미지</th>
                                            <th>이메일</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>게시글수</th>
                                            <th>탈퇴유무</th>
                                        </tr>
                                    </thead>
                                    
                                    <c:forEach items="${list}" var="m">
                                    <tbody>
                                        <tr>
                                        	<td>
                                        		<label class="switch switch-3d switch-danger mr-3">
                                        			<input type="checkbox" class="switch-input" checked="true">
                                       				<span class="switch-label"></span> 
                                       				<span class="switch-handle"></span>
                                        		</label>
                                        	</td>
                                            <td class="serial">${m.mno}</td>
                                            <td class="avatar">
                                                <div class="round-img">
                                                    <a href="#"><img class="rounded-circle" src="${pageContext.request.contextPath}/resources/admin_temp/images/avatar/1.jpg" alt=""></a>
                                                </div>
                                            </td>
                                            <td>${m.email}</td>
                                            <td> <span class="name">${m.nickName }</span> </td>
                                            <td> <span class="product">${m.enrollDate }</span> </td>
                                            <td><span class="count">${m.deleteDate}</span></td>
                                            <td>
                                                <span class="badge badge-complete">N</span>
                                               <!--  <span class="badge badge-pending">Y</span> -->
                                            </td>
                                        </tr>
                                    </tbody>
                                    </c:forEach>
                                </table>
                                
                                <div class="row">
	                                <div class="col-sm-4" style="margin-left:10px;">
	                                	Showing 1 to 10 of 12 entries	
	                                </div>
	                                
	                                <div class=".col-md-6 .offset-md-3">
	                                	<div class="dataTables_paginate paging_simple_numbers" id="bootstrap-data-table_paginate">
	                                		<ul class="pagination">
	                                			<li class="paginate_button page-item previous disabled" id="bootstrap-data-table_previous">
	                                				<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
	                                			</li>
	                                			<li class="paginate_button page-item active">
	                                				<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="1" tabindex="0" class="page-link">1</a>
	                                			</li>
	                                			<li class="paginate_button page-item ">
	                                				<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="2" tabindex="0" class="page-link">2</a>
	                                			</li>
	                                			<li class="paginate_button page-item next" id="bootstrap-data-table_next">
	                                				<a href="#" aria-controls="bootstrap-data-table" data-dt-idx="3" tabindex="0" class="page-link">Next</a>
	                                			</li>
	                                		</ul>
	                                	</div>
	                                </div>
                                </div>
                                
                            </div> <!-- /.table-stats -->
                        </div>
                    </div>

               

                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


        <jsp:include page="footer.jsp" />

    </div><!-- /#right-panel -->
    
    
    	<!-- 회원정보 모달창 -->
	   <div class="modal fade" id="smallmodal" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content ">
                        <div class="modal-header">
                        	<i class="fa fa-user"></i><strong class="card-title pl-2">Profile Card</strong>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                             <div class="card ">
	                            <div class="card-body">
	                                <div class="mx-auto d-block">
	                                    <img class="rounded-circle mx-auto d-block" src="${pageContext.request.contextPath}/resources/admin_temp/images/admin.jpg" alt="Card image cap">
	                                    <h5 class="text-sm-center mt-2 mb-1">Steven Lee</h5>
	                                </div>
	                                <hr>
	                                <div class="card-text text-sm-center">
	                                    <div class="location text-sm-center"><i class="fa fa-map-marker"></i> California, United States</div>
	                                </div>
	                            </div>
                        	</div>
                        </div>
                       
                    </div>
                </div>
            </div>
            
            
            
            
             <div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticModalLabel"><b>회원 탈퇴</b></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                                	해당 회원을 탈퇴하시겠습니까?
                           </p>
                           <p>
                                	이미 탈퇴된 회원인 경우 회원목록에서 삭제됩니다.
                           </p>
                       </div>
                       <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
            
   
    
       <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/main.js"></script>


    
</body>
</html>