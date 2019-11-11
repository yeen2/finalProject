<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
	 <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_temp/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_temp/css/lib/datatable/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_temp/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>


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
    
		<div class="content">
            <div class="animated fadeIn">
               <div class="card-header" >
                   <strong class="card-title">신고목록</strong>
               </div>
              
              <div class="card-header" style="background:white;">
                          
                  
                  <div class="row">
                  
                  	<div class="card-body card-block">
                        <form action="#" method="post" class="form-inline">
                        <div class="col-12 col-md-9">
               			  	게시판명 &nbsp;
                             <select name="select" id="select" class="form-control">
                                 <option value="0">전체</option>
                                 <option value="1">메인</option>
                                 <option value="2">자유</option>
                                 <option value="3">패션</option>
                             </select>&nbsp;
                        	<button type="button" class="btn btn-primary btn-sm">검색</button>
                        </div>
                  		   <button type="button" class="btn btn-outline-danger btn-sm" style="margin-left:120px;" data-toggle="modal" data-target="#staticModal">게시물삭제</button>
                        </form>
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
                                            <th>No.</th>
                                            <th>신고자</th>
                                            <th>게시글명</th>
                                            <th>신고일자</th>
                                            <th>처리일자</th>
                                            <th>신고사유</th>
                                            <th>확인유무</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <tr>
                                        	<td><label class="switch switch-3d switch-danger mr-3"><input type="checkbox" class="switch-input" checked="true"> <span class="switch-label"></span> <span class="switch-handle"></span></label>
                                        	</td>
                                            <td>4</td>
                                            <td>
                                            	<div data-toggle="modal" data-target="#smallmodal">
                                                    <a href="#">HYEN</a>
                                                </div>
                                            </td>
                                            <td>패션</td>
                                            <td>2019-11-04</td>
                                            <td></td>
                                            <td>비방</td>
                                            <td><span class="badge badge-pending">N</span></td>
                                        </tr>
                                         <tr>
                                         	<td><label class="switch switch-3d switch-danger mr-3"><input type="checkbox" class="switch-input" checked="true"> <span class="switch-label"></span> <span class="switch-handle"></span></label>
                                        	</td>
                                            <td>5</td>
                                            <td>
                                            	<div data-toggle="modal" data-target="#smallmodal">
                                                    <a href="#">Edinburgh</a>
                                                </div>
                                            </td>
                                            <td>패션</td>
                                            <td>2019-11-04</td>
                                            <td></td>
                                            <td>비방</td>
                                            <td><span class="badge badge-pending">N</span></td>
                                        </tr>
                                         <tr>
                                         	<td><label class="switch switch-3d switch-danger mr-3"><input type="checkbox" class="switch-input" checked="true"> <span class="switch-label"></span> <span class="switch-handle"></span></label>
                                        	</td>
                                            <td>6</td>
                                            <td>
                                            	<div data-toggle="modal" data-target="#smallmodal">
                                                    <a href="#">Edinburgh</a>
                                                </div>
                                            </td>
                                            <td>패션</td>
                                            <td>2019-11-04</td>
                                            <td></td>
                                            <td>비방</td>
                                            <td><span class="badge badge-pending">N</span></td>
                                        </tr>
                                        <tr>
                                        	<td><label class="switch switch-3d switch-danger mr-3"><input type="checkbox" class="switch-input" checked="true"> <span class="switch-label"></span> <span class="switch-handle"></span></label>
                                        	</td>
                                            <td>7</td>
                                            <td>
                                            	<div data-toggle="modal" data-target="#smallmodal">
                                                    <a href="#">Edinburgh</a>
                                                </div>
                                            </td>
                                            <td>패션</td>
                                            <td>2019-11-04</td>
                                            <td></td>
                                            <td>비방</td>
                                            <td><span class="badge" style="background:gray">Y</span></td>
                                        </tr>
                                        <tr>
                                        	<td><label class="switch switch-3d switch-danger mr-3"><input type="checkbox" class="switch-input" checked="true"> <span class="switch-label"></span> <span class="switch-handle"></span></label>
                                        	</td>
                                            <td>8</td>
                                            <td>
                                            	<div data-toggle="modal" data-target="#smallmodal">
                                                    <a href="#">Edinburgh</a>
                                                </div>
                                            </td>
                                            <td>패션</td>
                                            <td>2019-11-04</td>
                                            <td>2019-11-04</td>
                                            <td>비방</td>
                                            <td><span class="badge" style="background:gray">Y</span></td>
                                        </tr>
                                    </tbody>
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
            </div><!-- .animated -->
        </div><!-- .content -->
		
	
	
		

        <div class="clearfix"></div>

        <footer class="site-footer">
            <div class="footer-inner bg-white">
                <div class="row">
                    <div class="col-sm-6">
                        Copyright &copy; 2018 Ela Admin
                    </div>
                    <div class="col-sm-6 text-right">
                        Designed by <a href="https://colorlib.com">Colorlib</a>
                    </div>
                </div>
            </div>
        </footer>

    </div><!-- /#right-panel -->

   
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
   
   		<!-- 게시물삭제 모달창 -->
   		   <div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticModalLabel"><b>게시물 삭제</b></h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                                해당 게시물을 정말 삭제하시겠습니까?
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


    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/datatables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/dataTables.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/dataTables.buttons.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/vfs_fonts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.html5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.print.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.colVis.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/init/datatables-init.js"></script>


    
</body>
</html>