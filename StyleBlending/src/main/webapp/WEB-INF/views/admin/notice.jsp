<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>


<!-- jQuery -->
<script src="https://code.jquery.com/jquery.min.js"></script>
<!-- google charts -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style>
	.order-table:after, .order-table:before{
		position : relative !important;
	}
</style>

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
                    <li class="">
                        <a href="aStatistics.do"><i class="menu-icon fa ti-bar-chart-alt"></i>통계 </a>
                    </li>
                    <li class="active">
                        <a href="aNotice.do"><i class="menu-icon fa ti-pin-alt"></i>공지사항</a>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside>
    <!-- /#left-panel -->
    
        	<div class="content" style="padding-top:50px;">
            <div class="animated fadeIn mt-3" >
                <div class="row">
                	<div class="col-lg-12">
                        <div class="card" >
                            <div class="card-header">
                                <strong class="card-title">공지사항</strong>
                            </div>
                            <div class="card-body mt-5" style="min-height: 800px;">	
                            <div class="row">
	                            <div class="col-md-10 offset-md-1" style="padding:20px;">
	                            Showing <strong> ${pi.currentPage }</strong> to <strong>  ${pi.endPage }</strong> of <strong> ${pi.listCount }</strong> entries	
		                        	<button type="button" onclick="location.href='mainNotice.do';" class="btn btn-sm" style="float:right; margin-right:10px; margin-top:15px; background:#ffc107; color:black;" >
		                        		수정하기
		                        	</button>
	                          	</div>
                          	</div>
                      
                            <div class="table-stats order-table ov-h col-md-10 offset-md-1">                            	
                                <table class="table">
		                            <thead>
		                                <tr>
		                                    <th>No.</th>
		                                    <th>제목</th>
		                                    <th>내용</th>
		                                    <th>작성자</th>
		                                    <th>작성일</th>
		                                </tr>
		                            </thead>
		                            <c:if test="${!empty list}">
		                            <c:forEach items="${list }" var="n">
		                            <tbody>
		                                 <tr>
		                                    <td>${n.nno }</td>
		                                    <td>${n.title }</td>
		                                    <td><p style="border:none; resize:none; row:100px" readonly id="contentResult">${n.content }</p></td>
		                                    <td>${loginUser.email }</td>
		                                    <td>${n.enrollDate }</td>
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
	                                				<c:url value="aNotice.do" var="previous">	
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
	                                				<c:url value="aNotice.do" var="page">	
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
	                                				<c:url value="aNotice.do" var="next" >
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
                                </div> <!-- /.row 끝  -->
                                
                            </div> <!-- /.table-stats -->
                          </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
        
        <script>
        $(function(){
        	
	        var str = document.getElementById("contentResult").value;
	        str = str.replace(/(?:\r\n|\r|\n)/g, '<br />');
	        document.getElementById("contentResult").value = str;
        });
        </script>

      <jsp:include page="footer.jsp" />
