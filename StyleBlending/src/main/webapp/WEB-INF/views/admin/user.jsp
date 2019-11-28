<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
	.order-table:after, .order-table:before{
		position : relative !important;
	}
</style>

<jsp:include page="header.jsp" />
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
     
    	<div class="content">
            <div class="animated fadeIn mt-3" >
                <div class="row">
                	<div class="col-lg-12">
                        <div class="card" >
                            <div class="card-header">
                                <strong class="card-title">회원 목록</strong>
                            </div>
                            <div class="card-body mt-5" style="min-height: 800px;">	
                            <div class="row">
	                            <div class="col-md-10 offset-md-1" style="padding:20px;">
	                          		<label style="display:inline-flex; padding-right:20px;">Show 
	                       				<select name="boardLimit"  class="form-control form-control-sm" onchange="pageSet(value);" >
	                       					<option value="5" <c:if test="${pi.boardLimit eq '5' }">selected</c:if>>5</option>
	                       					<option value="10" <c:if test="${pi.boardLimit eq '10' }">selected</c:if>>10</option>
	                       					<option value="20" <c:if test="${pi.boardLimit eq '20' }">selected</c:if>>20</option>
	                       					<option value="30" <c:if test="${pi.boardLimit eq '30' }">selected</c:if>>30</option>
	                       				</select> entries
	                       			</label>
	                       			<label for="keyword" style="display:inline-flex;" >Search: &nbsp;
	                       				<input type="search" id="keyword" class="form-control form-control-sm col-sm-12" placeholder="아이디 또는 닉네임을 입력해주세요." aria-controls="bootstrap-data-table">
	                       			</label>
		                        	<button type="button" id="deleteBtn" data-toggle="modal" data-target="#deleteModal" class="btn btn-secondary btn-sm" style="float:right; margin-right:10px; margin-top:15px;" >
		                        		회원삭제
		                        	</button>
	                          	</div>
                          	</div>
                      
                            <div class=" table-stats order-table ov-h col-md-10 offset-md-1">                            	
                                <table class="table">
                                    <thead>
                                        <tr>
                                        	<th><input type="checkbox" name="checkAll" id="checkAll" onclick="allCheck();"/></th>
                                            <th>No.</th>
                                            <th>프로필</th>
                                            <th>이메일</th>
                                            <th>닉네임</th>
                                            <th>가입일</th>
                                            <th>탈퇴일</th>
                                            <th>탈퇴유무</th>
                                        </tr>
                                    </thead>
                                    <c:if test="${!empty list}">
                                    <c:forEach items="${list}" var="m">
                                    <tbody>
                                        <tr>
                                        	<td>
                                        		<input name="checkRow" type="checkbox" value="${m.mno}"/>
                                        	</td>
                                            <td >${m.mno}</td>
                                            <td >
                                                <div class="round-img">
                                                    <a href="#"><img class="rounded-circle" src="${pageContext.request.contextPath}${m.profilePath}${m.renameImg}" alt=""></a>
                                                </div>
                                            </td>
                                            <td>${m.email}</td>
                                            <td> <span class="name">${m.nickName }</span> </td>
                                            <td> <span>${m.enrollDate }</span> </td>
                                            <td>
                                            	<c:if test="${m.isDelete eq 'Y' }">
                                            	<span>${m.deleteDate}</span>
                                            	</c:if>
                                            </td>
                                            <td>
                                            	<c:if test="${m.isDelete eq 'N' }">
                                                <span class="badge badge-complete">${m.isDelete}</span>
                                                </c:if>
                                                <c:if test="${m.isDelete eq 'Y' }">
                                               	<span class="badge badge-pending">${m.isDelete}</span>
                                            	</c:if>
                                            </td>
                                        </tr>
                                    </tbody>
                                    </c:forEach>
                                    </c:if>
                                </table>
                                
                                <br><br>
                                <div class="row">
	                                <div class="col-sm-4" style="margin-left:10px;">
	                                	Showing <strong> ${pi.currentPage } to ${pi.endPage }</strong> of <strong> ${pi.listCount }</strong> entries	
	                                </div>
	                                
	                                <div class=".col-md-6 .offset-md-3">
	                                	<div class="dataTables_paginate paging_simple_numbers" id="bootstrap-data-table_paginate">
	                                		<ul class="pagination">
	                                		<!-- 이전 -->
	                                			<li class="paginate_button page-item previous" id="bootstrap-data-table_previous">
	                                			<c:if test="${pi.currentPage ne 1 }">
	                                				<c:url value="aUser.do" var="previous">	
														<c:param name="currentPage" value="${pi.currentPage-1 }"/>
														<c:param name="boardLimit" value="${pi.boardLimit }"/>
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
	                                				<c:url value="aUser.do" var="page">	
	                                					<c:param name="currentPage" value="${p}"/>
	                                					<c:param name="boardLimit" value="${pi.boardLimit }"/>
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
	                                				<c:url value="aUser.do" var="next" >
	                                					<c:param name="currentPage" value="${pi.currentPage+1 }"/>
	                                					<c:param name="boardLimit" value="${pi.boardLimit }"/>
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
                        </div>
                    </div>

               

                </div>
            </div><!-- .animated -->
        </div><!-- .content -->



    
     <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin_temp/js/admin.js"></script>
     <script>
     
	     function pageSet(boardLimit){ // 게시글수 변경
	    	 location.href="${pageContext.request.contextPath}/aUser.do?boardLimit="+boardLimit; 
	     } 

		/* 삭제(체크박스된 것 전부) */
		function deleteAction(){
		 
		 var checkRow = "";
		  $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow = checkRow + $(this).val()+",";
		  });
		  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
			
		     var mno = checkRow;
		      
			location.href="${pageContext.request.contextPath}/aDeleteMember.do?mno="+mno;  
		  
		}; 


	</script> 
    
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
            
            
            
      <!-- 회원 삭제 모달창 -->     
      <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
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
                    </div>
                    <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                       <button type="button" class="btn btn-primary" onclick="deleteAction();">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
	

    <jsp:include page="footer.jsp" />