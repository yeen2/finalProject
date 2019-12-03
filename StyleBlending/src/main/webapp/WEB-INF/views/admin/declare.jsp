<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
	.order-table:after, .order-table:before{
		position : relative !important;
	}
	/* .table-stats table th img, .table-stats table td img{
		min-width:50px;
	} */
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
    
	<div class="content">
        <div class="animated fadeIn mt-3" >
            <div class="row">
            	<div class="col-lg-12">
                    <div class="card" >
                        <div class="card-header">
                            <strong class="card-title">신고 목록</strong>
                        </div>
                        <div class="card-body mt-5" style="min-height: 800px;">	
                         <div class="row">
                          <div class="col-md-10 offset-md-1" style="padding:20px;">
                        		<form action="aDeclare.do" method="get" class="form-inline">
	                        <div class="col-5 col-md-10">
	               			  	게시판명 &nbsp;
	                             <select name="select" id="select" class="form-control">
	                                 <option value="0" <c:if test="${cate.all eq '0' }">selected</c:if>>전체</option>
	                                 <option value="1" <c:if test="${cate.posting eq '1' }">selected</c:if>>포스팅</option>
	                                 <option value="2" <c:if test="${cate.free eq '2' }">selected</c:if>>자유</option>
	                             </select>&nbsp;
	                           	<%--   확인유무 &nbsp;
	                             <select name="isCheck" id="isCheck" class="form-control">
	                             	 <option value="0" <c:if test="${isCheck eq '0' }">selected</c:if>>전체</option>
	                                 <option value="1" <c:if test="${isCheck eq '1' }">selected</c:if>>확인요청</option>
	                                 <option value="2" <c:if test="${isCheck eq '2' }">selected</c:if>>확인</option>
	                                 <option value="3" <c:if test="${isCheck eq '3' }">selected</c:if>>삭제완료</option>
	                             </select>&nbsp; --%>
	                        	<button type="submit" class="btn btn-primary btn-sm">검색</button>
	                        </div>
	                  		   <button type="button" class="btn btn-outline-danger btn-sm" id="deleteBtn" 
	                  		   data-toggle="modal" data-target="#deleteModal" style="float:right; margin-top:15px;">
	                  		   	게시물삭제
	                  		   </button>
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
                                 <c:if test="${!empty list}">
                                 <c:forEach items="${list}" var="p">
                                 <tbody>
                                      <tr>
                                      	<input type="hidden" value="${p.bno }" name="bno"/>
                                      	<input type="hidden" value="${p.isCheck }" name="isCheck"/>
                                      	<input type="hidden" value="${p.type }" name="type"/>
                                     	<td>
                                     		<input name="checkRow" type="checkbox" value="${p.dno}" />
                                     	</td>
                                         <td id="dno">${p.dno}</td>
                                         <td>
                                         	<div>
                                         		<a data-toggle="modal" data-target="#fq${ p.dno }">
                                         			<img src="${pageContext.request.contextPath}${p.profilePath}${p.renameImg}" 
                                         		 	style="width:50px; margin:0; height:50px; border-radius: 50px;">
                                         		</a>
                                            </div>
                                         </td>
                                         <c:if test="${p.type eq 1 }">
                                         <td>포스팅</td>
                                         <td>
                                             <a class="detailBoard" style="cursor:pointer">
                                             <img src="${pageContext.request.contextPath}/resources/upload/posting/${p.bname}">
                                             </a>
                                         </td>
                                         </c:if>
                                         <c:if test="${p.type eq 2 }">
                                         <td>자유</td>
                                         <td>
                                         	<a class="detailBoard" style="cursor:pointer">${p.bname}</a>
                                         </td>
                                         </c:if>
                                         <td>
                                        	${p.writer }
                                         </td>
                                         <td>${p.enrollDate }</td>
                                         <td>${p.category }</td>
                                         <td id="check">
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
                    	</div> <!-- /.card-body -->
                    </div>
                </div>
            </div>
        </div><!-- .animated -->
    </div><!-- .content -->
        

    <!-- 자바스크립트 파일 -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/admin_temp/js/admin.js"></script>
	
	<script>
	
	$(".detailBoard").click(function(){
		
		var dno = $(this).parent().parent().children().eq(4).html();
		var bno = $(this).parent().parent().children().eq(0).val();
		var check = $(this).parent().parent().children().eq(1).val();
		var type = $(this).parent().parent().children().eq(2).val();
		
		console.log(check);

		
		// check가 2인경우만 확인으로 바꾸도록 아니면 바로 상세페이지로
		if(type==1){ // 포스팅
			if(check == 1){
				//alert("확인임");
				location.href="aupdateIsCheck.do?dno="+ dno +"&bno=" +bno +"&type="+type;
			}else{
				location.href="pInfo.do?id="+ bno;
			} 
		}else{ // 자유게시판
			if(check == 1){
				//alert("컨트롤가나");
				location.href="aupdateIsCheck.do?dno="+ dno +"&bno=" +bno +"&type="+type;
			}else{
				location.href="bdetail.do?bno="+ bno;
			}  
		}
		
		
	
	});

	/**
	 * 삭제(체크박스 선택된 것 전부)
	 */
	function deleteAction(){
		
		 var checkRow = "";
		 var type ="";
		 var bno ="";
		  $( "input[name='checkRow']:checked" ).each (function (){
		    checkRow = checkRow + $(this).val()+"," ;
		    type = type + $(this).parent().parent().children().eq(2).val()+","; 
		    bno = bno + $(this).parent().parent().children().eq(0).val()+",";
		  });
		  
		  console.log(type);
		  console.log(checkRow);
		  
		  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
		  type = type.substring(0,type.lastIndexOf( ","));
		  bno = bno.substring(0,bno.lastIndexOf( ",")); 
		  
		  if(checkRow == ''){
		    alert("삭제할 대상을 선택하세요.");
		    return false;
		  }
		  
	      
	    location.href="${pageContext.request.contextPath}/aDeleteDeclareBoard.do?dno="+checkRow+"&type="+type+"&bno="+bno;  
	  
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
   		
   		
  		<!-- 신고 상세정보 모달창 -->
  		<c:forEach items="${ list }" var="p">
   		<div class="modal fade" id="fq${ p.dno }"  role="dialog"  aria-labelledby="fq${ p.dno }" aria-hidden="true">
               <div class="modal-dialog">
                   <div class="modal-content ">
                       <div class="modal-header">
                       	<i class="fa fa-exclamation-triangle"></i><strong class="card-title pl-2">신고내역</strong>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                               <span aria-hidden="true">&times;</span>
                           </button>
                       </div>
                       <div class="modal-body">
                            <div class="card ">
                            <div class="card-body">
                                <div class="mx-auto" style="display:inline-flex;">
                                    <img class="rounded-circle" style="max-width:100px;" src="${pageContext.request.contextPath}${p.profilePath}${p.renameImg}" >
                                    <h5 class="text-sm-center mt-2 mb-1">신고자 <b>${p.email }</b></h5>
                                    <img class="rounded-circle" style="max-width:100px;" src="${pageContext.request.contextPath}${p.writerPath}${p.writerImg}" >
                                    <h5 class="text-sm-center mt-2 mb-1">신고당한 회원 <b>${p.writer }</b> <br><br><br>
                                    <a href="mpViewProfile.do?mno=${p.writerMno}"><i class="fa fa-address-card"></i>마이페이지</h5></a>
                                </div>
                                <hr>
                                <div class="card-text text-sm-center">
	                                <div class=""><i class="fa fa-check-square-o"></i>신고 사유 : ${p.category}</div>
	                                <c:if test="${!empty p.content }">
	                                <div class="text-sm-center"><i class="fa fa-comment-o"></i>${p.content}</div>
									</c:if>	                                
                                </div>
                            </div>
                       	</div>
                       </div><!-- /.modal-body -->
                   </div> <!-- /.modal-content -->
               </div>
           </div>
        </c:forEach>
        <!-- 회원정보 모달창  끝-->
        
        <script>
        	
        </script>
   		
	<jsp:include page="footer.jsp" />