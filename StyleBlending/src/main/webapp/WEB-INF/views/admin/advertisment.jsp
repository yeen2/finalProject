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
                         <div class="nav nav-tabs" id="nav-tab" role="tablist">
                             <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true"><b>광고목록</b></a>
                             <a class="nav-item nav-link " id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><b>승인대기</b></a>
                             <a class="nav-item nav-link " id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false"><b>진행중</b></a>
                         </div>
                     </nav>
                	  <br>
                
                      <div class="default-tab">
                          <div class="tab-content pl-3 p-1" id="nav-tabContent">
                          	  <!-- 광고목록 -->
                              <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
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
	                                    <tbody>
	                                        <tr>
	                                        	<td>
	                                        		<label class="switch switch-3d switch-danger mr-3">
	                                        			<input type="checkbox" class="switch-input" checked="true">
	                                       				<span class="switch-label"></span> 
	                                       				<span class="switch-handle"></span>
	                                        		</label>
	                                        	</td>
	                                            <td class="serial">1.</td>
	                                            <td>나이키</td>
	                                            <td> 2019-11-01 </td>
	                                            <td> 2019-11-02 </td>
	                                            <td>  </td>
	                                            <td>
	                                                <span class="badge" style="background:rgb(0, 123, 255);">진행중</span>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                        	<td>
	                                        		<label class="switch switch-3d switch-danger mr-3">
	                                        			<input type="checkbox" class="switch-input" checked="true">
	                                       				<span class="switch-label"></span> 
	                                       				<span class="switch-handle"></span>
	                                        		</label>
	                                        	</td>
	                                            <td class="serial">2.</td>
	                                            <td>아디다스</td>
	                                            <td> 2019-10-20 </td>
	                                            <td> </td>
	                                            <td> </td>
	                                            <td>
	                                                <span class="badge" style="background:#ffc107;">등록 대기</span>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                        	<td>
	                                        		<label class="switch switch-3d switch-danger mr-3">
	                                        			<input type="checkbox" class="switch-input" checked="true">
	                                       				<span class="switch-label"></span> 
	                                       				<span class="switch-handle"></span>
	                                        		</label>
	                                        	</td>
	                                            <td class="serial">3.</td>
	                                            <td>뉴발란스</td>
	                                            <td> 2019-10-20 </td>
	                                            <td> 2019-10-20 </td>
	                                            <td>  2019-10-27 </td>
	                                            <td>
	                                                <span class="badge" style="background:gray;">종료</span>
	                                            </td>
	                                        </tr>
	                                        <tr>
	                                        	<td>
	                                        		<label class="switch switch-3d switch-danger mr-3">
	                                        			<input type="checkbox" class="switch-input" checked="true">
	                                       				<span class="switch-label"></span> 
	                                       				<span class="switch-handle"></span>
	                                        		</label>
	                                        	</td>
	                                            <td class="serial">4.</td>
	                                            <td>나이키</td>
	                                            <td> 2019-10-20 </td>
	                                            <td> 2019-10-20 </td>
	                                            <td>  2019-10-27 </td>
	                                            <td>
	                                                <span class="badge" style="background:gray;">종료</span>
	                                            </td>
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
                           
                              
                              <!-- 승인대기 목록 -->
                              <div class="tab-pane fade" id="nav-profile" style="display:inline-flex;" role="tabpanel" aria-labelledby="nav-profile-tab" >
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
                               <div class="tab-pane fade" id="nav-contact" style="display:inline-flex;" role="tabpanel" aria-labelledby="nav-contact-tab" >
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
    
    
    
       <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/admin_temp/js/main.js"></script>

	<script>
	
		
		$("#nav-home-tab").click(function(){ 
			$("#nav-profile").hide();	
			$("#nav-contact").hide();	
			
		});
	</script>

    
</body>
</html>