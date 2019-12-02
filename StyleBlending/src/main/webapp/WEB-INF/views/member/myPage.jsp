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
					<a class="nav-link active" data-toggle="tab" href="#updateProfile"> 
					<i class="fa fa-edit"></i>
						프로필 수정
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#" id="adBtn"> 
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
			<!-- 프로필 수정 탭 -->
			<div class="tab-pane fade show active" id="updateProfile">
				<div class="col-12 col-md-5" style="margin-left:auto; margin-right:auto;">
					<div class="register-form" id="updateForm">
					
						<form action="mpUpdatePf.do" method="post" onsubmit="return nickNameCheck();">
							<input type="hidden" name="mno" value="${ loginUser.mno }">
							<div class="form-group">
								<label for="email">Email address</label>
								<input type="email" class="form-control" id="email" name="email"
									aria-describedby="emailHelp" placeholder="${ loginUser.email }" disabled>
							</div>
							<div class="form-group" style="position:relative;">
								<label for="nickname">Nickname</label>
								<input type="text" class="form-control" id="nickName" name="nickName" maxlength="8" autocomplete="off"
									aria-describedby="nicknameHelp" value="${ loginUser.nickName }">
								<small id="nickNameCheck" class="form-text text-danger" style="display:none; position:absolute;">형식에 맞지 않는 닉네임입니다.</small>
								<small id="nickNameFail" class="form-text text-danger" style="display:none; position:absolute;">이미 사용중인 닉네임입니다.</small>
								<small id="nickNameSuccess" class="form-text text-success" style="display:none; position:absolute;">사용 가능한 닉네임입니다.</small>
							</div>
							<div class="form-group">
								<label for="introduce">Introduce</label>
								<p style="display:block;" align="right"><span id="lengthCheck">0</span>/100</p>
								<textarea cols="52" rows="5" class="form-control" id="profileContent" name="profile" style="resize:none;"><c:out value="${ loginUser.profile }"/></textarea>
							</div>
							<%-- <div class="form-group" style="margin-bottom:50px;">
								<label for="userPwd2">Location</label>
								<input type="text" class="form-control" autocomplete="off"
									id="location" name="location" value="${ loginUser.location }">
							</div> --%>
							
							<button type="submit" class="btn btn-block btn-dark" style="height:50px;">수정</button>
						</form>
		
					</div>
				</div>

			</div>
			
			
			<!-- 비밀번호 변경 탭 -->
			<!-- 비밀번호 변경 모달창 -->
			<div class="modal fade" id="updatePass" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="passClose">
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
				        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="passClose2">취소</button>
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
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="deleteClose">
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
				      <button type="button" class="btn btn-secondary" data-dismiss="modal" id="deleteClose2">취소</button>
				    </div>
			     
			    </div>
			  </div>
			</div>
			
			
		</div>
		
	</div>
	
	<script>
		<%-- 닉네임 중복체크 ajax --%>
		
		var checkNick = 0;
		
		$("#nickName").on("input", function(){
			var nickNameValue = $("#nickName").val();
			var regExp = /^[가-힣a-zA-Z0-9]{3,8}$/;
			
			if(nickNameValue.length != 0 && regExp.test(nickNameValue)){
				$.ajax({
					url:"mpNickNameCheck.do",
					type:"post",
					data:{nickName:nickNameValue},
					success:function(result){
						if(result == 1){
							checkNick = 1;
							$("#nickNameCheck").hide();
							$("#nickNameFail").show();
							$("#nickNameSuccess").hide();
						}else{
							checkNick = 0;
							$("#nickNameCheck").hide();
							$("#nickNameFail").hide();
							$("#nickNameSuccess").show();
						}
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				});
			}else{
				$("#nickNameCheck").show();
				$("#nickNameFail").hide();
				$("#nickNameSuccess").hide();
			}
			if(nickNameValue.length == 0){
				$("#nickNameCheck").hide();
				$("#nickNameFail").hide();
				$("#nickNameSuccess").hide();
			}
			
		});
		
		function nickNameCheck(){
			var nickNameValue = $("#nickName").val();
			var regExp = /^[가-힣a-zA-Z0-9]{3,8}$/;
			
			if(nickNameValue.length == 0){
				alert("닉네임을 입력해주세요.");
				$("#nickName").focus();
				return false;
			}else if(!regExp.test(nickNameValue)){
				alert("닉네임이 형식에 맞지 않습니다.");
				$("#nickName").val("").focus();
				return false;
			}else if(checkNick == 1){
				alert("이미 사용중인 닉네임입니다.");
				return false;
			}
			if($("#profileContent").val().length > 100){
				alert("자기소개는 100자 이하로 작성해주세요.");
				return false;
			}
			
			return true;
		}
		
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
				var real = confirm("정말로 탈퇴하시겠습니까?");
				if(real){
					location.href="mpDeleteMem.do";
				}
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				$("#userPass").val("").focus();
			}
		});
		
		<%-- 모달창 닫을 때 입력값 초기화 --%>
		$("html").click(function(e){
			if($("#updatePass").css("display") == "block"){
				if(!$("#updatePass").has(e.target).length){
					$("#currentPass").val("");
					$("#pass").val("");
					$("#pass2").val("");
					$(".fCheck1").hide();
					$(".sCheck1").hide();
					$(".fCheck2").hide();
					$(".sCheck2").hide();
				}
			}
		});
		
		$("html").click(function(e){
			if($("#deleteMember").css("display") == "block"){
				if(!$("#deleteMember").has(e.target).length){
					$("#userPass").val("");
				}
			}
		});
		
		$("#passClose, #passClose2").click(function(){
			$("#currentPass").val("");
			$("#pass").val("");
			$("#pass2").val("");
			$(".fCheck1").hide();
			$(".sCheck1").hide();
			$(".fCheck2").hide();
			$(".sCheck2").hide();
		});
		
		$("#deleteClose, #deleteClose2").click(function(){
			$("#userPass").val("");
		});
		
		
		// 자기소개 글자수 체크
		$("#profileContent").on("input", function(){
			var profileLength = $(this).val().length;
			
			$("#lengthCheck").text(profileLength);
			
			if(profileLength >100){
				$("#lengthCheck").css("color", "red");
			}else{
				$("#lengthCheck").css("color", "black");
			}
		});
		
		// 광고 페이지 이동
		$("#adBtn").click(function(){
			location.href="mpSAdList.do";
		});
	</script>


	<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>