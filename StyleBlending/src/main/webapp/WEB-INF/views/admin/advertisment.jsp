<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style type="text/css">
	.order-table:after, .order-table:before{
		position : relative !important;
	}
</style>

<jsp:include page="header.jsp" />
	
<!-- Left Panel -->
    <aside id="left-panel" class="left-panel" style="padding-top:20px; margin-top:35px;">
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
    
 
        <div class="content" style="padding-top:50px;">
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
                              <div class="tab-pane fade show active" id="nav-home" role="tabpanel" >
                              	<div class="row">
                                   <div class="col-md-10 offset-md-1" style="padding:20px;">
                                         <label style="display:inline-flex; padding-right:20px; ">Show 
                                            <select name="boardLimit" class="form-control form-control-sm" onchange="pageSet(value);">
                                               <option value="5" <c:if test="${pi.boardLimit eq '5'}">selected</c:if>>5</option>
                                               <option value="10" <c:if test="${pi.boardLimit eq '10'}">selected</c:if>>10</option>
                                               <option value="20" <c:if test="${pi.boardLimit eq '20'}">selected</c:if>>20</option>
                                               <option value="30" <c:if test="${pi.boardLimit eq '30'}">selected</c:if>>30</option>
                                            </select> entries
                                         </label>
                                   
                                         <label style="display:inline-flex; padding:15px;">Search: &nbsp;
                                            <input type="search" id="adName" class="form-control form-control-sm col-sm-10" placeholder="업체명으로 검색" aria-controls="bootstrap-data-table" value="${keyword }">
                                         </label>
                                       <button type="button" id="adEndBtn" data-toggle="modal" data-target="#adEndModal" class="btn btn-outline-danger btn-sm" style="float:right; margin-right:10px; margin-top:15px;">마감</button>
                                       <button type="button" id="adStartBtn" data-toggle="modal" data-target="#adStartModal"  class="btn btn-outline-primary btn-sm" style="float:right; margin-right:10px; margin-top:15px;">
                                          <i class="fa fa-magic"></i>등록
                                       </button>
                                   </div>
                                </div>
                              	
                              	<div class=" table-stats order-table ov-h ">                            	
	                                <table class="table">
	                                    <thead >
	                                        <tr>
	                                        	<th></th>
	                                            <th class="serial">No.</th>
	                                            <th>신청인</th>
	                                            <th>업체명</th>
	                                            <th>신청일자</th>
	                                            <th>등록일자</th>
	                                            <th>종료일자</th>
	                                            <th>등록여부</th>
	                                        </tr>
	                                    </thead>
	                                    <c:forEach items="${list}" var="a">
	                                    <tbody class="tbody">
	                                        <tr>
	                                        	<td>
                                        			<input name="checkRow" type="checkbox" id="checkRow" value="${a.adno}${a.status}"/>
                                        		</td>
	                                            <td class="serial">${a.adno}</td>
	                                            <td>${a.email }</td>
	                                            <td>${a.name }</td>
	                                            <td> ${a.enrollDate } </td>
	                                            <td> ${a.startDate } </td>
	                                            <td> ${a.endDate } </td>
	                                            <td>
	                                            	<c:if test="${a.status eq 1 }">
	                                            	<span class="badge adWaiting" style="background:#ffc107;">등록 대기</span>
	                                                </c:if>
	                                                <c:if test="${a.status eq 2 }">
	                                                <span class="badge adOngoing" style="background:rgb(0, 123, 255);">진행중</span>
	                                                </c:if>
	                                                <c:if test="${a.status eq 3 }">
	                                                <span class="badge adEnd" style="background:gray;">종료</span>
	                                                </c:if>
	                                            </td>
	                                        </tr>
	                                    </tbody>
	                                    </c:forEach>
	                                    <tbody class="hiddenTable"></tbody>
	                                </table>
	                                
	                                <div class="row" style="margin:auto;">
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
														<c:param name="boardLimit" value="${pi.boardLimit }"/>
														<c:param name="keyword" value="${keyword }"/>
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
	                                					<c:param name="boardLimit" value="${pi.boardLimit }"/>
	                                					<c:param name="keyword" value="${keyword }"/>
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
	                                					<c:param name="boardLimit" value="${pi.boardLimit }"/>
	                                					<c:param name="keyword" value="${keyword }"/>
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
                              <div class="tab-pane fade row" id="nav-waiting" style="display:inline-flex;" role="tabpanel" >
                              <c:forEach items="${newList}" var="a">
			                    <div class="col-md-4" >
			                        <div class="card col-md-8">
			                            <img class="card-img-top" src="${pageContext.request.contextPath}${a.imgPath}${a.renameImg}" width="100%" height="300px"  alt="Card image cap">
				                        <c:set var="url" value="${a.url}"/>
				                        <c:set var="idx1" value="${fn:indexOf(url,'=')}"/>
				                        <c:set var="idx2" value="${fn:indexOf(url,'&')}"/>
				                        <c:set var="resultUrl2" value="${fn:substring(url,idx1 +1,idx2)}"/>
				                        <iframe class="card-img-top" src="https://www.youtube.com/embed/${resultUrl2}" width="100%" height="200px" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
			                            <div class="card-body">
			                                <h4 class="card-title mb-3" align="center"><b>${a.name}</b></h4>
			                                 <p class="card-text"align="center"><b>${a.enrollDate}</b></p>
			                            </div>
			                        </div>
				                </div>
                              </c:forEach>
                              </div>
                              
                              
                             <!-- 진행중 목록 -->
                               <div class="tab-pane fade" id="nav-ongoing" style="display:inline-flex;" role="tabpanel">
		                     		<c:if test="${!empty startAd}"> 
				                    <div class="col-md-4" >
				                        <div class="card">
				                            <img class="card-img-top" src="${pageContext.request.contextPath}${startAd.imgPath}${startAd.renameImg}" alt="Card image cap">
				                            <div class="card-body">
				                            	 <c:set var = "string2" value = "${fn:toLowerCase(startAd.name)}" />
				                                <h4 class="card-title mb-3"><b>${string2}</b></h4>
				                                 <p class="card-text">${startAd.startDate}~ </p>
				                            </div>
				                        </div>
					                </div>
					                <div class="col-md-4" >
				                        <div class="card">
				                        <c:set var="url" value="${startAd.url}"/>
				                        <c:set var="idx1" value="${fn:indexOf(url,'=')}"/>
				                        <c:set var="idx2" value="${fn:indexOf(url,'&')}"/>
				                        <c:set var="resultUrl2" value="${fn:substring(url,idx1 +1,idx2)}"/>
				                             <iframe class="card-img-top" src="https://www.youtube.com/embed/${resultUrl2}" width="100%" height="90%" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>
				                        </div>
					                </div>
			                        </c:if>
			                        <c:if test="${empty startAd }">
			                        	<b>진행중인 광고가 없습니다.</b><br>
			                        </c:if>
                             </div>
                             
                             
							</div>
                      </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->


    

           
      <!-- 광고 마감 모달창 -->     
      <div class="modal fade" id="adEndModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="staticModalLabel"><b>광고 마감</b></h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                       </button>
                   </div>
                   <div class="modal-body">
                       <p>
                           	해당 광고를 마감하시겠습니까?
                      </p>
                      <p>
                           	마감시 등록여부 종료로 변경됩니다.
                      </p>
                    </div>
                    <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                       <button type="button" class="btn btn-primary" id="adEndConfirm" onclick="">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- 광고 승인 모달창 -->     
      <div class="modal fade" id="adStartModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
               <div class="modal-content">
                   <div class="modal-header">
                       <h5 class="modal-title" id="staticModalLabel"><b>광고 승인</b></h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                       </button>
                   </div>
                   <div class="modal-body">
                       <p>
                           	<b>해당 광고를 등록하시겠습니까?</b>
                      </p>
                      <p>
                           	등록시 현재 진행중인 광고는 자동 마감됩니다. 
                      </p>
                    </div>
                    <div class="modal-footer">
                       <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                       <button type="button" class="btn btn-primary" id="adStartConfirm" onclick="">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
         
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin_temp/js/admin.js"></script>
	<script>
	
	 function pageSet(boardLimit){ // 게시글수 변경
    	 location.href="${pageContext.request.contextPath}/aAdvertisment.do?boardLimit="+boardLimit; 
     } 
	
	
	
	$(function(){
		
			$('input[type="checkbox"][name="checkRow"]').click(function(){
				// click 이벤트 발생시
				if($(this).prop('checked')&& 
						$('input[type="checkbox"][name="checkRow"]:checked').size()>1){
					$(this).prop('checked',false);
					alert('두개이상 선택할수없습니다');
				}
			});
			
			$("#adStartBtn").click(function(){ // 등록버튼 클릭시 모달창 뜨도록
				  var checkRow = ""; // if문 안에서 사용하기위해
				  var adno = "";
				  $( "input[name='checkRow']:checked" ).each (function(){
				    checkRow = $(this).val(); 
				  });
				  
			  	  if(checkRow == ''){
				    alert("등록할 광고를 선택하세요.");
				    return false;
				  }else{
					  
					  if(checkRow.charAt(checkRow.length-1) == 1){
					    	//alert("1임");
					    	adno = checkRow.slice(0,-1);		    	
					  	    $("#adStartModal").show();
					  	    $("#adStartConfirm").click(function(){
					  	    	location.href="${pageContext.request.contextPath}/aUpdateStartAd.do?adno="+adno;
					  	    });
					    }else{
					    	alert("승인 대기인 광고가 아닙니다.");
					    	return false;
					   }
			  	  
				  }
				  
			});
			
			$("#adEndBtn").click(function(){ // 마감버튼 클릭시 모달창 뜨도록
				  var checkRow = ""; // if문 안에서 사용하기위해
				  var adno = "";
				  $( "input[name='checkRow']:checked" ).each (function(){
				    checkRow = $(this).val(); 
				  });
				  
			  	  if(checkRow == ''){
				    alert("마감할 광고를 선택하세요.");
				    return false;
				  }else{
					  
					  if(checkRow.charAt(checkRow.length-1) == 2){
					    	adno = checkRow.slice(0,-1);		    	
					  	    $("#adEndModal").show();
					  	    $("#adEndConfirm").click(function(){
					  	    	location.href="${pageContext.request.contextPath}/aUpdateEndAd.do?adno="+adno;
					  	    });
					    }else{
					    	alert("진행중인 광고가 아닙니다. 진행중인 광고만 마감 가능합니다.");
					    	return false;
					   }
			  	  
				  }
				  
			});
	
	});
	
	// 엔터키 누를시 업체명 검색
	$("#adName").keydown(function (key){
		
		if(key.keyCode == 13){
			location.href="aAdvertisment.do?keyword="+ $("#adName").val() + "&boardLimit=" +${pi.boardLimit};
		}
	});
	
	
	/*
	$(function(){
		var url = "${startAd.url}";
		console.log(url.indexOf("="));
		var idx1 = url.indexOf("="); 
		var idx2 = url.indexOf("&");
		console.log(idx2);
        
        if(idx2 == -1){
        	var result = url.substring(idx1+1);
        	console.log(result);
        }else{
        	var result = url.substring(idx1+1,idx2);
        	console.log(result);        	
        }
        
	});
	*/
	
	
	</script>
	

    <jsp:include page="footer.jsp" />  