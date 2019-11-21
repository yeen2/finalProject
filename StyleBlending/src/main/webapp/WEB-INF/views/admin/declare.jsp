<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<style type="text/css">
	.order-table:after, .order-table:before{
		position : relative !important;
	}
</style>
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
                    <li class="active">
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
    
    
       <!-- Right Panel -->

    <div id="right-panel" class="right-panel">
    
	<jsp:include page="header.jsp" />
    
    
		<div class="content ">
            <div class="animated fadeIn ">
               <div class="card-header" >
                   <strong class="card-title">신고목록</strong>
               </div>
              
              <div class="card-header" style="background:white;">
                          
                  
                  <div class="row">
                  
                  
                  	<div class="card-body card-block">
                        <form action="aDeclare.do" method="get" class="form-inline">
                        <div class="col-5 col-md-7">
               			  	게시판명 &nbsp;
                             <select name="select" id="select" class="form-control">
                                 <option value="0" <c:if test="${cate.all eq '0' }">selected</c:if>>전체</option>
                                 <option value="1" <c:if test="${cate.posting eq '1' }">selected</c:if>>포스팅</option>
                                 <option value="2" <c:if test="${cate.free eq '2' }">selected</c:if>>자유</option>
                             </select>&nbsp;
                        	<button type="submit" class="btn btn-primary btn-sm">검색</button>
                        </div>
                        <div class="col-5 col-md-5">
                  		   <button type="button" class="btn btn-outline-danger btn-sm" id="deleteBtn" 
                  		   data-toggle="modal" data-target="#deleteModal">
                  		   	게시물삭제
                  		   </button>
                  		 </div>
                        </form>
                    </div>
                  </div>
                          
                            <div class=" table-stats order-table ov-h col-md-10 offset-md-1">                            	
                                <table class="table">
                                    <thead>
                                        <tr >
                                        	<th><input type="checkbox" name="checkAll" id="checkAll" onclick="allCheck();"/></th>
                                            <th>No.</th>
                                            <th>신고자</th>
                                            <th>게시판명</th>
                                            <th>게시글</th>
                                            <th>글쓴이</th>
                                            <th>신고일자</th>
                                            <th>신고사유</th>
                                            <th>확인유무</th>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${list}" var="p">
                                    <tbody>
                                         <tr>
                                        	<td>
                                        		<input name="checkRow" type="checkbox" value="${p.dno}" />
                                        	</td>
                                            <td id="dno">${p.dno}</td>
                                            <td>
                                            	<div data-toggle="modal" data-target="#smallmodal">
                                                    <a href="#">${p.email }</a>
                                                </div>
                                            </td>
                                            <c:if test="${p.type eq 1 }">
                                            <td>포스팅</td>
                                            <td>
                                            	<div class="round-img">
                                                    <a href="#포스팅게시글로"><img src="${pageContext.request.contextPath}/resources/assets/img/${p.bname}"></a>
                                                </div>
                                            </td>
                                            </c:if>
                                            <c:if test="${p.type eq 2 }">
                                            <td>자유</td>
                                            <td>${p.bname}</td>
                                            </c:if>
                                            <td>${p.writer }</td>
                                            <td>${p.enrollDate }</td>
                                            <td>${p.category }</td>
                                            <td>
	                                            <c:if test="${p.isCheck eq 1 }">
	                                            <span class="badge badge-pending">확인요청</span>
	                                        	</c:if>
	                                        	<c:if test="${p.isCheck eq 2 }">
	                                        	<span class="badge badge-complete">확인</span>
	                                        	</c:if>
	                                        	<c:if test="${p.isCheck eq 3 }">
	                                        	<span class="badge" style="background:gray">삭제완료</span>
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
	                                			<li class="paginate_button page-item previous" >
                                				<c:if test="${pi.currentPage ne 1 }">
                                					<c:url value="aDeclare.do" var="previous">
                                						<c:param name="currentPage" value="${pi.currentPage -1 }"/>
                                					</c:url>
                                					<a href="${previous}" aria-controls="bootstrap-data-table" class="page-link">Previous</a>
                                				</c:if>
                                				<c:if test="${pi.currentPage eq 1}">
                                					<button class="page-link disabled" style="color:black; cursor:text;" disabled>Previous</button>
                                				</c:if>
	                                			</li>
	                                		<!-- 페이지 -->
	                                			<c:forEach begin="${pi.startPage}" end="${pi.endPage }" var="p">
	                                				<c:if test="${p ne pi.currentPage }">
			                                			<c:if test="${!empty cate.free }">
				                                			<c:url value="aDeclare.do" var="page">
				                                				<c:param name="currentPage" value="${p}"/>
				                                				<c:param name="select" value="2"></c:param>
				                                			</c:url>
			                                			</c:if>
			                                			<c:if test="${!empty cate.posting }">
				                                			<c:url value="aDeclare.do" var="page">
				                                				<c:param name="currentPage" value="${p}"/>
				                                				<c:param name="select" value="1"></c:param>
				                                			</c:url>
			                                			</c:if>
			                                			<c:if test="${empty cate.posting && empty cate.free }">
				                                			<c:url value="aDeclare.do" var="page">
				                                				<c:param name="currentPage" value="${p}"/>
				                                			</c:url>
			                                			</c:if>
				                                			<li class="paginate_button page-item active">
				                                				<a href="${page}" aria-controls="bootstrap-data-table" class="page-link">${p}</a>
				                                			</li>
			                                		</c:if>
		                                			<c:if test="${p eq pi.currentPage }">
		                                				<button class="page-link disabled" style="color:black; cursor:text;" disabled>${p}</button>
		                                			</c:if>
	                                			</c:forEach>
	                                		<!-- 다음 -->
	                                			<li class="paginate_button page-item next" id="bootstrap-data-table_next">
	                                			<c:if test="${pi.currentPage ne pi.endPage }">
	                                				<c:url value="aDeclare.do" var="next">
	                                					<c:param name="currentPage" value="${pi.currentPage +1 }" />
	                                				</c:url>
	                                				<a href="${next}" aria-controls="bootstrap-data-table" class="page-link">Next</a>
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
            </div><!-- .animated -->
        </div><!-- .content -->
		
	
	
	<jsp:include page="footer.jsp" />

    </div><!-- /#right-panel -->
    <!-- 자바스크립트 파일 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin_temp/js/admin.js"></script>
	
	<script>

	/**
	 * 삭제(체크박스 선택된 것 전부)
	 */
	function deleteAction(){
		
		 var checkRow = "";
		  $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow = checkRow + $(this).val()+"," ;
		  });
		  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
		 
		  if(checkRow == ''){
		    alert("삭제할 대상을 선택하세요.");
		    return false;
		 
		  }
	 
	     var dno = checkRow;
	      
	    location.href="${pageContext.request.contextPath}/aDeleteDeclareBoard.do?dno="+dno;  
	  
	};
	</script>
      
   
   		<!-- 게시물삭제 모달창 -->
   		  <div class="modal fade" id="deleteModal"role="dialog" aria-labelledby="deleteBoardModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="smallModalLabel"><b>게시물 삭제</b></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p id="modalContent">
                            	해당 게시물을 정말 삭제하시겠습니까?
                            </p>
                       </div>
                        
                       <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-primary" id="deleteOk" onclick="deleteAction();">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
   		
   		
   		
   		
    	<!-- 회원정보 모달창 -->
	   <div class="modal fade" id="smallmodal" tabindex="-1" role="dialog" aria-labelledby="smallmodalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content ">
                        <div class="modal-header">
                        	<i class="fa fa-user"></i><strong class="card-title pl-2">신고당한 회원</strong>
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
 
 

</body>
</html>