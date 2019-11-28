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
    

    	<div class="content">
            <div class="animated fadeIn">
               <div class="card-header" >
                   <strong class="card-title">공지사항</strong>
               </div>
              
              <div class="card-header" style="background:white;">
                  <div class="row">
                  	<div class="card-body card-block">
                 		   
                 		   <button type="button" class="btn btn-outline-danger btn-sm" style="float:right; margin-right:10px;" data-toggle="modal" data-target="#staticModal">
                 		   	수정
                 		   </button>
                    </div>
                  </div>
                	       
                    <div class=" table-stats order-table ov-h col-md-10 offset-md-1 ">                            	
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
                                    <td>
                                    	<div data-toggle="modal" data-target="#smallmodal">
                                            <a href="#">${n.title }</a>
                                        </div>
                                    </td>
                                    <td>${n.content }</td>
                                    <td>${loginUser.email }</td>
                                    <td>${n.enrollDate }</td>
                                </tr>
                            </tbody>
                            </c:forEach>
                            </c:if>
                        </table>
                        
                        <br>
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
            </div><!-- .animated -->
        </div><!-- .content -->
		
      
      
      
      <jsp:include page="footer.jsp" />
