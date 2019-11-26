<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	.c1, .c2{display:none;}
	#color input{width:30px; height:30px; border:1px solid lightgray; margin-right:5px;}
	#updateForm>form>div{margin-bottom:35px;}
	li{margin-bottom:20px; color:orangered;}
	#searchForm div{display:inline-block;}
	.form-center {
		text-align: center !important;
		content: center !important;
	}
</style>
</head>
<body>
	
	<jsp:include page="../includes/header.jsp" />

	<div class="container" style="margin-bottom:70px;">
		
		<div class="navigation d-flex justify-content-center" style="margin-top:100px; margin-bottom:30px;">
			<!-- 메뉴바 -->
			<ul class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#updateProfile" id="updateProfileBtn"> 
					<i class="fa fa-edit"></i>
						프로필 수정
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#ad" id="adBtn"> 
					<i class="fa fa-ad"></i>
						광고 관리
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="modal" href="#updatePass"> 
					<i class="fa fa-key"></i>
						비밀번호 변경
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="modal" href="#deleteMember"> 
					<i class="fa fa-ban"></i>
						회원 탈퇴
					</a>
				</li>
			</ul>
		</div>
		

		<div class="profile-tabs tab-content">
			
			<!-- 내 광고 리스트 탭 -->
			<div class="tab-pane fade show active" id="ad">
				<div class="form-group">
	              <div class="input-group">
		              <div style="margin-left:auto;">
		              	<button class="btn btn-info" type="button" onclick="location.href='aInsertAdView.do';">광고 등록 신청</button>
		              </div>
	              </div>
	            </div>
	            <br>
				<table class="table table-hover" id="listArea" style="text-align:center; table-layout:fixed;">
				  <thead>
				    <tr>
				      <th scope="col">NO.</th>
				      <th scope="col">업체명</th>
				      <th scope="col">신청일자</th>
				      <th scope="col">등록일자</th>
				      <th scope="col">등록종료일자</th>
				      <th scope="col">등록여부</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${ list }" var="ad">
				  		
				  		<c:if test="${ empty list }">
				  			<tr>
				  				<td scope="col" colspan="6">내 광고가 없습니다.</td>
				  			</tr>
				  		</c:if>
				  		<tr>
					  		<td scope="col">${ ad.adno }</td>
					  		<td scope="col">${ ad.name }</td>
					  		<td scope="col">${ ad.enrollDate }</td>
					  		<td scope="col">${ ad.startDate }</td>
					  		<td scope="col">${ ad.endDate }</td>
					  		<td scope="col">
						  		<c:if test="${ ad.status == 1 }">
						  		승인 대기
						  		</c:if>
						  		<c:if test="${ ad.status == 2 }">
						  		등록중
						  		</c:if>
						  		<c:if test="${ ad.status == 3 }">
						  		등록 종료
						  		</c:if>
					  		</td>
				  		</tr>
				  	</c:forEach>
				  	
				   </tbody>
				</table>
				
				<!-- 페이징 처리 -->
			    <ul class="pagination justify-content-center">
			    	
			    	<!-- 맨 처음으로 -->
			    	<c:if test="${ pi.currentPage == 1 }">
			    		<li class="page-item disabled"><a class="page-link" href="#">&lt;&lt;</a></li>
			    	</c:if>
			    	<c:if test="${ pi.currentPage != 1 }">
			    		<c:url value="mpSAdList.do" var="start">
			    			<c:param name="currentPage" value="${ pi.startPage }"/>
			    		</c:url>
			    		<li class="page-item"><a class="page-link" href="${ start }">&lt;&lt;</a></li>
			    	</c:if>
			    	
			    	<!-- 이전으로 -->
			    	<c:if test="${ pi.currentPage == 1 }">
			    		<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
			    	</c:if>
			    	<c:if test="${ pi.currentPage != 1 }">
			    		<c:url value="mpSAdList.do" var="before">
			    			<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
			    		</c:url>
			    		<li class="page-item"><a class="page-link" href="${ before }">&lt;</a></li>
			    	</c:if>
			    	
			    	<!-- 페이지 -->
	           		<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	           			<c:if test="${ p == pi.currentPage }">
	           				<li class="page-item active"><a class="page-link">${ p }</a></li>
	           			</c:if>
	           			<c:if test="${ p != pi.currentPage }">
	           				<c:url value="mpSAdList.do" var="page">
	           					<c:param name="currentPage" value="${ p }"/>
	           				</c:url>
	           				<li class="page-item"><a class="page-link" href="${ page }">${ p }</a></li>
	           			</c:if>
	           		</c:forEach>
	           		
	           		<!-- 다음으로 -->
	           		<c:if test="${ pi.currentPage == pi.maxPage }">
	           			<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
	           		</c:if>
	           		<c:if test="${ pi.currentPage != pi.maxPage }">
	           			<c:url value="mpSAdList.do" var="next">
	           				<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
	           			</c:url>
	           			<li class="page-item"><a class="page-link" href="${ next }">&gt;</a></li>
	           		</c:if>
	           		
	           		<!-- 맨 마지막으로 -->
	           		<c:if test="${ pi.currentPage == pi.maxPage }">
	           			<li class="page-item disabled"><a class="page-link" href="#">&gt;&gt;</a></li>
	           		</c:if>
	           		<c:if test="${ pi.currentPage != pi.maxPage }">
	           			<c:url value="mpSAdList.do" var="end">
	           				<c:param name="currentPage" value="${ pi.maxPage }"/>
	           			</c:url>
	           			<li class="page-item"><a class="page-link" href="${ end }">&gt;&gt;</a></li>
	           		</c:if>
	           		
                </ul>
			</div>
			
			
			<!-- 비밀번호 변경 탭 -->
			<!-- 비밀번호 변경 모달창 -->
			<div class="modal fade" id="updatePass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <!-- 비밀번호 입력 폼 -->
			      <form action="mpUpdatePass.do" method="post" onsubmit="return passCheck();">
					<div class="form-group" style="margin-bottom:25px;">
						<label for="userPwd">현재 비밀번호</label>
						<input type="password" class="form-control" id="currentPass" name="currentPass" placeholder="현재 비밀번호" maxlength="16">
					</div>
					<div class="form-group" style="margin-bottom:25px; position:relative;">
						<label for="newPwd1">새 비밀번호</label>
						<input type="password" class="form-control" id="pass" name="pass" placeholder="새 비밀번호" maxlength="16">
						<div class="c1 fCheck1" style="position:absolute;"><p><small class="form-text text-danger">형식에 맞지 않습니다.</small></p></div>
						<div class="c1 sCheck1" style="position:absolute;"><p><small class="form-text text-success">사용 가능합니다.</small></p></div>
					</div>
					<div class="form-group" style="margin-bottom:25px; position:relative;">
						<label for="newPwd2">새 비밀번호 확인</label>
						<input type="password" class="form-control" id="pass2" name="pass2" placeholder="새 비밀번호 확인" maxlength="16">
						<div class="c2 fCheck2" style="position:absolute;"><p><small class="form-text text-danger">비밀번호가 일치하지 않습니다.</small></p></div>
						<div class="c2 sCheck2" style="position:absolute;"><p><small class="form-text text-success">비밀번호 확인!</small></p></div>
					</div>
				
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-success">변경하기</button>
				        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				      </div>
			       </form>
			     
			    </div>
			  </div>
			</div>
			
			<!-- 회원 탈퇴 탭 -->
			<!-- 회원 탈퇴 모달창 -->
			<div class="modal fade" id="deleteMember" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">회원 탈퇴</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <ul>
			        	<li><b>탈퇴 시 회원정보는 복구할 수 없습니다.</b></li>
			        	<li><b>모든 업로드 사진들이 같이 삭제됩니다.</b></li>
			        	<li><b>탈퇴하시려면 아래에 현재 비밀번호를 입력해주세요.</b></li>
			        </ul>
			      </div>
			      <!-- 회원 탈퇴 입력 폼 -->
			      <div align="center">
				      <div class="form-group">
				      	<label>이메일</label>
				      	<p style="color:royalblue;">${ loginUser.email }</p>
				      </div>
				      <div class="form-group">
				      	<label>닉네임</label>
				      	<p style="color:royalblue;">${ loginUser.nickName }</p>
				      </div>
			      </div>
			      
					<div class="form-group" align="center">
						<label for="userPwd">현재 비밀번호</label>
						<input type="password" class="form form-control form-center" id="userPass" name="userPass" placeholder="현재 비밀번호">
					</div>
				
				    <div class="modal-footer">
				      <button type="button" class="btn btn-success" id="deleteBtn">탈퇴하기</button>
				      <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				    </div>
			     
			    </div>
			  </div>
			</div>
			
		</div>
		
	</div>
	
	<script>
		<%-- 비밀번호 변경 유효성 검사 --%>
		$("#pass").on("input", function(){
			if($("#pass").val().length < 8){
				$(".fCheck1").show();
				$(".sCheck1").hide();
			}else{
				$(".fCheck1").hide();
				$(".sCheck1").show();
			}
			if($("#pass").val().length == 0){
				$(".c1").hide();
			}
			
		});
		
		$("#pass2").on("input", function(){
			if(($("#pass").val() != "") && ($("#pass").val() != $("#pass2").val())){
				$(".fCheck2").show();
				$(".sCheck2").hide();
			}else if($("#pass").val() == $("#pass2").val()){
				$(".fCheck2").hide();
				$(".sCheck2").show();
			}
			if($("#pass2").val().length == 0){
				$(".c2").hide();
			}
		});
		
		function passCheck(){
			if($("#currentPass").val() != "${loginUser.pass}"){
				alert("현재 비밀번호가 일치하지 않습니다.");
				$("#currentPass").val("").focus();
				return false;
			}
			if($("#pass").val().length < 8){
				alert("새 비밀번호 형식이 맞지 않습니다.");
				$("#pass").val("").focus();
				$("#pass2").val("");
				$(".fCheck1").hide();
				$(".sCheck1").hide();
				$(".fCheck2").hide();
				$(".sCheck2").hide();
				return false;
			}
			if($("#pass").val() != $("#pass2").val()){
				alert("새 비밀번호가 일치하지 않습니다.");
				$("#pass2").val("").focus();
				$(".fCheck2").hide();
				$(".sCheck2").hide();
				return false;
			}
			return true;
		}
		
		<%-- 회원탈퇴 유효성검사 --%>
		$("#deleteBtn").on("click", function(){
			if($("#userPass").val() == "${loginUser.pass}"){
				location.href="mpDeleteMem.do";
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPass").val("").focus();
			}
		});
		
		
		<%-- 내 프로필 상세정보 호출 --%>
		$("#updateProfileBtn").click(function(){
			location.href="mpProfileUpdate.do";
		});
		
	</script>


	<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>