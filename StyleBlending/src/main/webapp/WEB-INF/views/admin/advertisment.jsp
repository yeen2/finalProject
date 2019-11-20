<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <li class="active">
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
    
    
       <!-- Right Panel -->

    <div id="right-panel" class="right-panel">
	
	<jsp:include page="header.jsp" />
	
        <div class="content">
            <div class="animated fadeIn">
               	<div class="card-header" style="background:white;">
                     <nav>
                         <div class="nav nav-tabs" id="nav-tab" >
                             <a class="nav-item nav-link active" data-toggle="tab" href="#nav-home" id="adListTab"><b>광고목록</b></a>
                             <a class="nav-item nav-link " data-toggle="tab" href="#nav-waiting" id="adUnapproved"><b>승인대기</b></a>
                             <a class="nav-item nav-link " data-toggle="tab" href="#nav-ongoing" id="adOngoing"><b>진행중</b></a>
                         </div>
                     </nav>
                	  <br>
                
                      <div class="default-tab">
                          <div class="tab-content pl-3 p-1" id="nav-tabContent">
                          	  <!-- 광고목록 -->
                              <div class="tab-pane fade show active" id="nav-home" >
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
		                          				<input type="search" class="form-control form-control-sm col-sm-10" placeholder="업체명으로 검색" aria-controls="bootstrap-data-table">
		                          			</label>
				                        	<button type="button" class="btn btn-outline-danger btn-sm" style="float:right; margin-right:10px; margin-top:15px;">취소</button>
				                        	<button type="button" class="btn btn-outline-primary btn-sm" style="float:right; margin-right:10px; margin-top:15px;">
				                        		<i class="fa fa-magic"></i>등록
				                        	</button>
		                          		</div>
		                          	</div>
                         	 	</div>
                              	
                              	<div class=" table-stats order-table ov-h ">                            	
	                                <table class="table">
	                                    <thead >
	                                        <tr>
	                                        	<th>
	                                        		<label class="switch switch-3d switch-danger mr-3">
	                                        			<input type="checkbox" class="switch-input" checked="true">
	                                       				<span class="switch-label"></span> 
	                                       				<span class="switch-handle"></span>
	                                        		</label>
	                                        	</th>
	                                            <th class="serial">No.</th>
	                                            <th>업체명</th>
	                                            <th>신청일자</th>
	                                            <th>등록일자</th>
	                                            <th>종료일자</th>
	                                            <th>등록여부</th>
	                                        </tr>
	                                    </thead>
	                                    <c:forEach items="${list }" var="a">
	                                    <tbody>
	                                        <tr>
	                                        	<td>
	                                        		<label class="switch switch-3d switch-danger mr-3">
	                                        			<input type="checkbox" class="switch-input" checked="true">
	                                       				<span class="switch-label"></span> 
	                                       				<span class="switch-handle"></span>
	                                        		</label>
	                                        	</td>
	                                            <td class="serial">${a.adno}</td>
	                                            <td>${a.name }</td>
	                                            <td> ${a.enrollDate } </td>
	                                            <td> ${a.startDate } </td>
	                                            <td> ${a.endDate } </td>
	                                            <td>
	                                            	<c:if test="${a.status eq 1 }">
	                                            	<span class="badge" style="background:#ffc107;">등록 대기</span>
	                                                </c:if>
	                                                <c:if test="${a.status eq 2 }">
	                                                <span class="badge" style="background:rgb(0, 123, 255);">진행중</span>
	                                                </c:if>
	                                                <c:if test="${a.status eq 3 }">
	                                                <span class="badge" style="background:gray;">종료</span>
	                                                </c:if>
	                                            </td>
	                                        </tr>
	                                    </tbody>
	                                    </c:forEach>
	                                </table>
	                                
	                                <div class="row">
		                                <div class="col-sm-4" style="margin-left:10px;">
		                                	Showing ${pi.currentPage } to ${pi.endPage } of ${pi.listCount } entries		
		                                </div>
		                                
		                                <div class=".col-md-6 .offset-md-3">
		                                	<div class="dataTables_paginate paging_simple_numbers" id="bootstrap-data-table_paginate">
		                                		<ul class="pagination">
		                                	<!-- 이전 -->
	                                			<li class="paginate_button page-item previous" id="bootstrap-data-table_previous">
	                                			<c:if test="${pi.currentPage ne 1 }">
	                                				<c:url value="aAdvertisment.do" var="previous">	
														<c:param name="currentPage" value="${pi.currentPage-1 }"/>
	                                				</c:url>
	                                				<a href="${previous }" aria-controls="bootstrap-data-table" class="page-link">Previous</a>
	                                			</c:if>
	                                			<c:if test="${pi.currentPage eq 1 }">
	                                				<button class="page-link disabled" style="color:black; cursor:text;" disabled>Previous</button>
	                                			</c:if>
	                                			</li>
	                                		<!-- 페이지 -->
	                                			<c:forEach begin="${pi.startPage}" end="${pi.endPage }" var="p">
	                                			<c:if test="${p ne pi.currentPage }">
	                                				<c:url value="aAdvertisment.do" var="page">	
	                                					<c:param name="currentPage" value="${p}"/>
	                                				</c:url>
		                                			<li class="paginate_button page-item active">
		                                				<a href="${page}" aria-controls="bootstrap-data-table" class="page-link">${p }</a>
		                                			</li>
	                                			</c:if>
	                                			<c:if test="${p eq pi.currentPage }">
	                                				<button class="page-link disabled" style="color:black; cursor:text;" disabled>${p}</button>
	                                			</c:if>
	                                			</c:forEach>
	                                		<!-- 다음 -->	
	                                			<li class="paginate_button page-item next" id="bootstrap-data-table_next">
	                                			<c:if test="${pi.currentPage ne pi.endPage }">	
	                                				<c:url value="aAdvertisment.do" var="next" >
	                                					<c:param name="currentPage" value="${pi.currentPage+1 }"/>
	                                				</c:url>
	                                				<a href="${next }" aria-controls="bootstrap-data-table" class="page-link">Next</a>
	                                			</c:if>
	                                			<c:if test="${pi.currentPage eq pi.endPage }">
	                                				<button class="page-link disabled" style="color:black; cursor:text;" disabled>Next</button>
	                                			</c:if>
	                                			</li>	
		                                		</ul>
		                                	</div>
		                                </div>
	                                </div>
	                            </div> <!-- /.table-stats -->
                              </div>
                           
                              
                              <!-- 승인대기 목록 -->
                              <div class="tab-pane fade" id="nav-waiting" style="display:inline-flex;" >
				                	<div class="col-md-4">
				                        <div class="card">
				                            <img class="card-img-top" src="https://i.imgur.com/ue0AB6J.png" alt="Card image cap">
				                            <div class="card-body">
				                                <h4 class="card-title mb-3">나이키</h4>
				                                <p>2019.11.08</p>
				                            </div>
				                        </div>
				                    </div>
				                    
				                    <div class="col-md-4">
				                        <div class="card">
				                            <img class="card-img-top" src="https://i.imgur.com/hrS2McC.png" alt="Card image cap">
				                            <div class="card-body">
				                                <h4 class="card-title mb-3">아디다스</h4>
				                            </div>
				                        </div>
				                    </div>
				                    
				                    <div class="col-md-4">
				                        <div class="card">
				                            <img class="card-img-top" src="https://i.imgur.com/MUBS4Gh.png" alt="Card image cap">
				                            <div class="card-body">
				                                <h4 class="card-title mb-3">칼하트</h4>
				                            </div>
				                        </div>
				                    </div>
                              </div>
                              
                              
                             <!-- 진행중 목록 -->
                               <div class="tab-pane fade" id="nav-ongoing" style="display:inline-flex;" >
			                     <div class="col-md-4">
				                        <div class="card">
				                            <img class="card-img-top" src="https://i.imgur.com/hrS2McC.png" alt="Card image cap">
				                            <div class="card-body">
				                                <h4 class="card-title mb-3">아디다스</h4>
				                                 <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				                            </div>
				                        </div>
				                  </div>
                             </div>
                             
                          
							</div>
                      </div>
                  
                
                
             	<button type="button" class="btn btn-secondary btn-sm" onclick="javascript:openWin();">
	                        		광고등록
	            </button>
               

                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


       <jsp:include page="footer.jsp" />

    </div><!-- /#right-panel -->
    
    
    
    
	<script>
	
	function conditionCheck(){
		var check = $("#checkCondition").val();
		
		console.log(check);
		
		if($("#checkCondition").not(':checked')){
			alert("동의 후 진행.");
			return false;
		}
		return true;
	}
	
		
	function openWin(){  
	    window.open("aInsertAdView.do", "네이버새창", "width=800, height=700, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  
	} 

	
		/* $("#adListTab").click(function(){ 
			alert("gg");
			$("#nav-waiting div").hide();	
			$("#nav-ongoing div").hide();	
			
		});
		
		$("#adUnapproved").click(function(){
			$("#nav-home div").hide();	
			$("#nav-ongoing div").hide();	
		});
		
		$("#adOngoing").click(function(){
			$("#adListTab").hide();	
			$("#adUnapproved").hide();	
		});
		 */
	</script>

    
</body>
</html>