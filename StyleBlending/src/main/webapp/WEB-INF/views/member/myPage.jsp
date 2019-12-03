<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Insert title here</title>
<style>
	.c1, .c2{display:none;}
	#color input{width:30px; height:30px; border:1px solid lightgray; margin-right:5px;}
	#updateForm>form>div{margin-bottom:35px;}
	#deleteInfo li{margin-bottom:20px; color:orangered;}
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
							<div class="form-group" style="margin-bottom:50px;" style="position:relative;">
								<label for="userPwd2">Location</label>
								<input type="button" class="btn btn-dark" style="display:block; margin-left:auto;"onclick="sample6_execDaumPostcode();" value="주소 찾기">
				                <input type="text" class="form-control" id="sample6_postcode" name="content1" placeholder="우편번호" style="display:none;">
								<input type="text" class="form-control" id="sample6_address" name="location" placeholder="주소" value="${ loginUser.location }" style="pointer-events:none;">
								<input type="text" class="form-control" id="sample6_detailAddress" name="content3" placeholder="상세주소" style="display:none;">
								<input type="text" class="form-control" id="sample6_extraAddress" name="content4" placeholder="참고항목" style="display:none;">
								<small id="locationAlert" class="form-text text-success" style="position:absolute;">프로필의 주소는 시/구/군 까지만 보여집니다.</small>
							</div>
							<div class="form-group">
								<label for="introduce">Introduce</label>
								<p style="display:block;" align="right"><span id="lengthCheck">0</span>/100</p>
								<textarea cols="52" rows="5" class="form-control" id="profileContent" name="profile" style="resize:none;"><c:out value="${ loginUser.profile }"/></textarea>
							</div>
							
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
			      <div class="modal-body" id="deleteInfo">
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
	
	<%-- 카페 주소 API --%>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>


	<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>