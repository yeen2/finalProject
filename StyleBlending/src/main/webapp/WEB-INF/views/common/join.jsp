<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body class="register">
<jsp:include page="../includes/header.jsp" />


	<div class="container">

	<div class="container-fluid">
		<div class="row">
			<div class="col-12 col-md-6 offset-md-1 d-flex" style="margin-top: 80px;">
				<div class="full-picture flex-grow-1"></div>
			</div>
			
			<div class="col-12 col-md-4 offset-md-1">
				<div class="register-form">
					<div class="mb-5">
						<h1>회원가입</h1>
						<p>계정을 만들어 스타일 블렌딩을 즐겨보세요.</p>
					</div>
					
					<form action="join.do"  method="post" id="joinForm" onsubmit="return joinValidate();">
						<div class="form-group">
							<label for="email">Email address</label>
							<input type="email" class="form-control" id="email" name="email"
								aria-describedby="emailHelp" placeholder="Enter email">
								
							<small id="emailCheck1" class="form-text text-success" style="display:none;">사용가능한 이메일입니다</small>
							<small id="emailCheck2" class="form-text text-danger" style="display:none;">이미 사용중인 이메일입니다</small>
							<small id="emailCheck3" class="form-text text-danger" style="display:none;">형식에 맞지 않는 이메일입니다</small>
						</div>
						<div class="form-group">
							<label for="nickName">Nickname</label>
							<input type="text" class="form-control" id="nickName" name="nickName"
								aria-describedby="nicknameHelp" placeholder="Enter nickname">
							<small id="nickNameCheck1" style="display:none;" class="form-text text-success">사용 가능한 닉네임입니다</small>
							<small id="nickNameCheck2" style="display:none;" class="form-text text-danger">이미 사용중인 닉네임입니다</small>
							<small id="nickNameCheck3" style="display:none;" class="form-text text-danger">형식에 맞지 않는 닉네임입니다</small>
						</div>
						<div class="form-group">
							<label for="userPwd">Password</label>
							<input type="password" class="form-control" id="pass" name="pass" placeholder="Password">
							<small id="passwordHelp" style="display:none;" class="form-text text-danger">형식에 맞지 않습니다</small>
						</div>
						<div class="form-group">
							<label for="pass2">Password Confirmation</label>
							<input type="password" class="form-control" id="pass2" name="pass2" placeholder="Password">
						</div>
						
						<button type="submit" class="btn btn-block btn-dark" style="height:50px; margin-top:50px;">회원가입</button>
					</form>

					<p class="small my-4 text-center">
						Already have an account? <a href="loginForm.do">Sign In</a>
					</p>
				</div>
			</div>
			
		</div>
	</div>


	</div>





	<%-- 가입정보 체크  --%>
		<script>
			function joinValidate() {
				// 각각의 input 요소들 변수에 담아두기 
				var email = $("#joinForm input[name=email]");
				var nickname = $("#joinForm input[name=nickname]");
				var pass = $("#joinForm input[name=pass]");
				var pass2 = $("#joinForm input[name=pass2]");
				
				// 값 다 있나 검사
				if(email.val().trim() == ""){
					alert("이메일을 입력해주세요.");
					email.focus();
					return false;
				}else if(nickname.val().trim() == ""){
					alert("닉네임을 입력해주세요.");
					nickname.focus();
					return false;
				}else if(pass.val().trim() == ""){
					alert("비밀번호를 입력해주세요.");
					pass.focus();
					return false;
				}else if(pass2.val().trim() == ""){
					alert("비밀번호를 확인해주세요.");
					pass2.focus();
					return false;
				}
				
				// 아이디 형식 검사
				var regExp = /^[\w]{4,20}@[\w]+(\.[\w]+){1,2}$/;
				if(!regExp.test(email.val())){
					alert("이메일이 형식에 맞지 않습니다.")
					email.val("").focus();
					return false;
				}
				
				// 닉네임 검사
				regExp = /^[가-힣a-zA-Z0-9]{3,8}$/;
				
				if (!regExp.test(nickName.val())) {
					alert("닉네임이 형식에 맞지 않습니다.");
					nickName.val("").focus();
					return false;
				}

				// 비밀번호 검사
				regExp = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
				if (!regExp.test(pass.val())) {
					alert("비밀번호를 형식에 맞게 입력해주세요.");
					pass.val("").focus();
					pass2.val("");
					return false;
				}

				
				if (pass.val() != pass2.val()) {
					alert("비밀번호가 일치하지 않습니다.");
					pass2.val("").focus();
					return false;
				}

			}
			
		</script>
		
		
		<!-- ajax으로 검사 -->
		<script>
			var emailB = false; 
			$("#email").on("keyup", function(){
				var email = $(this).val();
				
				var regExp = /^[\w]{4,20}@[\w]+(\.[\w]+){1,2}$/;
				
				if(regExp.test(email)){
					
					$.ajax({
						url:"joinCheckEmail.do",
						data:{email:email},
						type:"post",
						success:function(result){
							if(result == "1"){
								$("#emailCheck1").css("display", "block");
								$("#emailCheck2").css("display", "none");
								$("#emailCheck3").css("display", "none");
								$("#emailCheck1").css({"color":"#1DDB16", "font-weight":"bold"});
								
								emailB = true;
							}else{
								$("#emailCheck2").css("display", "block");
								$("#emailCheck1").css("display", "none");
								$("#emailCheck3").css("display", "none");
								$("#emailCheck2").css({"color":"red", "font-weight":"bold"});
								
								$(".box button").attr("disabled", true);
							}
							
							if(email == ""){
								$("#emailCheck1").css("display", "none");
								$("#emailCheck2").css("display", "none");
								$("#emailCheck3").css("display", "none");
							}
							
						},
						error:function(result){
							alert("실패!");
						}
						
					});
				}else{
					$("#emailCheck1").css("display", "none");
					$("#emailCheck2").css("display", "none");
					$("#emailCheck3").css("display", "block");
					$("#emailCheck3").css({"color":"red", "font-weight":"bold"});
					
					if(email == ""){
						$("#emailCheck1").css("display", "none");
						$("#emailCheck2").css("display", "none");
						$("#emailCheck3").css("display", "none");
					}
				}
				
			});
			
			var nickNameB = false;
			$("#nickName").on("keyup", function(){
				var nickName = $(this).val();
				
				var regExp = /^[가-힣a-zA-Z0-9]{3,5}$/;
				
				if(regExp.test(nickName)) {
					
					$.ajax({
						url:"joinCheckNickName.do",
						data:{nickName:nickName},
						type:"post",
						success:function(result){
							if(result == "1"){
								$("#nickNameCheck1").css("display", "block");
								$("#nickNameCheck2").css("display", "none");
								$("#nickNameCheck3").css("display", "none");
								$("#nickNameCheck1").css({"color":"#1DDB16", "font-weight":"bold"});
								
								nickNameB = true;
							}else{
								$("#nickNameCheck3").css("display", "none");
								$("#nickNameCheck2").css("display", "block");
								$("#nickNameCheck1").css("display", "none");
								$("#nickNameCheck2").css({"color":"red", "font-weight":"bold"});
								
							}
							
							if(nickName == ""){
								$("#nickNameCheck1").css("display", "none");
								$("#nickNameCheck2").css("display", "none");
								$("#nickNameCheck3").css("display", "none");
							}
						},
						error:function(result){
							alert("실패!");
						}
						
					});
				}else{
					$("#nickNameCheck1").css("display", "none");
					$("#nickNameCheck2").css("display", "none");
					$("#nickNameCheck3").css("display", "block");
					$("#nickNameCheck3").css({"color":"red", "font-weight":"bold"});
					
					if(nickName == ""){
						$("#nickNameCheck1").css("display", "none");
						$("#nickNameCheck2").css("display", "none");
						$("#nickNameCheck3").css("display", "none");
					}
				}
				
			});
			
			var passB = false;
			$("#pass, #pass2").on("keyup", function(){
				var pass = $("#pass").val();
				var pass2 = $("#pass2").val();
				
				var regExp = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
				
				if (regExp.test(pass)) {
					$.ajax({
						url:"joinCheckPass.do",
						data:{pass:pass, pass2:pass2},
						success:function(result){
							if(result == "1"){
								$("#passCheck").css("color", "#1DDB16");
								$("#pass2Check").css("color", "#1DDB16");
								
								passB = true;
							}else{
								$("#passCheck").css("color", "gray");
								$("#pass2Check").css("color", "gray");
							}
							
							if(pass == "" && pass2 == ""){
								$("#passCheck").css("color", "gray");
								$("#pass2Check").css("color", "gray");
							}
						},
						error:function(result){
							alert("실패!");
						}
					});
				}else{
					$("#passCheck").css("color", "gray");
					$("#pass2Check").css("color", "gray");
				}
				
			});
		</script>
		
		
		
	

<jsp:include page="../includes/footer.jsp" />
</body>
</html>