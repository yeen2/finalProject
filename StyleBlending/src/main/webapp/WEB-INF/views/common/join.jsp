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
							<small id="emailHelp" class="form-text text-success">사용가능한 이메일입니다</small>
						</div>
						<div class="form-group">
							<label for="nickname">Nickname</label>
							<input type="text" class="form-control" id="nickname" name="nickname"
								aria-describedby="nicknameHelp" placeholder="Enter nickname">
							<small id="nicknameHelp" class="form-text text-danger">이미 사용중인 닉네임입니다</small>
						</div>
						<div class="form-group">
							<label for="userPwd">Password</label>
							<input type="password" class="form-control" id="pass" name="pass"
								placeholder="Password">
							<small id="passwordHelp" class="form-text text-danger">형식에 맞지 않습니다</small>
						</div>
						<div class="form-group">
							<label for="pass2">Password Confirmation</label>
							<input type="password" class="form-control"
								id="pass2" name="pass2" placeholder="Password">
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
	

<jsp:include page="../includes/footer.jsp" />
</body>
</html>