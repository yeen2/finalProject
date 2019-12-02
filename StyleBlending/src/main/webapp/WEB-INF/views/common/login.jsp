<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="703722063317-f13j5nmldg04ladv3i9cjrgcb8muql2o.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
</head>
<body>
<jsp:include page="../includes/header.jsp" />

	<div class="container" style="margin-top: 150px; margin-bottom: 70px;">
		
		<form action="login.do" method="post">
		<div align="center">
			<div class="col-lg-5">
				<img src="${pageContext.request.contextPath}/resources/assets/img/logo.svg" class="mr-1" height="35">
				<p class="lead pt-3"><b>Style Blending</b></p>
		
				<div class="input-group">
				  <div class="input-group-prepend">
				    <span class="input-group-text" id="basic-addon1"><i class="fas fa-user"></i></span>
				  </div>
				  	<!-- 이메일 입력창 -->
					<input type="text" class="form-control" id="email" name="email"
						placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" 
						style="padding-left: 2.5rem !important;">
				</div>
				
				<div class="input-group mt-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon2">
							<i class="fas fa-key"></i>
						</span>
					</div>
					<!-- 비번 입력창 -->
					<input type="password" class="form-control"name="pass" id="pass"
						aria-label="Password" aria-describedby="basic-addon2" placeholder="Password" 
						style="padding-left: 2.5rem !important;">
				</div>
				<div style="margin-top:10px;">
					<button type="submit" class="form-control btn btn-dark" style="height:50px;"><b>로그인</b></button>
				</div>

				<!-- 아이디기억 /  -->
				<div class="custom-control custom-checkbox" style="text-align:left !important; margin-top: 10px;">
					<div style="display: inline;">
	               		<input type="checkbox" class="custom-control-input" id="remember" name="remember">
	                	<label class="custom-control-label" for="remember">자동 로그인</label>
	                </div>
	               	<div style="float: right; display: inline;">
                		<input type="checkbox" class="custom-control-input" id="idid" name="idid">
                		<label class="custom-control-label" for="idid">아이디 기억하기</label>
              		</div>
              	</div>
				<hr>
				
				<div class="input-group-prepend" style="margin-top:10px;">
					<a href="searchPass.do" style="margin-right:235px;">Forgot Password?</a>
					<a href="joinForm.do">회원가입</a>
				</div>
				
				<div style="margin-top:35px;">
					<button type="button"id="kakaoBtn" style="border: none; background-color: white;">
						<img id="kakao-login-btn" src="https://kauth.kakao.com/public/widget/login/kr/kr_02_medium.png" style="cursor: pointer"></button>
					
				</div>


					<div style="margin-top:10px;" id="naver_id_login">
					<button type="button" class="form-control btn btn-success" id="navarBtn"><b>네이버 로그인</b></button>
				</div>
			</div>
		</div>
		</form>
		
	</div>





 
	<!-- 아이디/비번 기억하기 -->
	<script>
	$(function(){
		$("#email").val(Cookies.get('email'));      
		$("#pass").val(Cookies.get('pass'));      
	    if($("#email").val() != ""){
	        $("#idid").attr("checked", true);
	    }
	});
		
	    
	    $("#idid").change(function(){
	        if($("#idid").is(":checked")){
	            Cookies.set('email', $("#email").val(), { expires: 7 });
	            Cookies.set('pass', $("#pass").val(), { expires: 7 });
	        }else{
	              Cookies.remove('email');
	              Cookies.remove('pass');
	        }
	    });
	    
	    $("#email, #pass").keyup(function(){
	        if($("#idid").is(":checked")){
	            Cookies.set('email', $("#email").val(), { expires: 7 });
	            Cookies.set('pass', $("#pass").val(), { expires: 7 });
	        }
	    });
	</script>
	 
    <%-- 카카오 로그인 api --%>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
		$(document).ready(function(){
			Kakao.init("43c418db70d8c1c6392316577a947ee1");
			function getKakaotalkUserProfile(){
				
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res) {
						var email = res.kakao_account.email;
						var id = res.id;
						var nickName = res.properties.nickname;
						var nnn = null;
						location.href="${pageContext.request.contextPath}/kakaoLogin.me?nickName=" + nickName + "&email=" + email + "&id=" + id + "&nnn=" + nnn;
						
						Kakao.Auth.logout();
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				var loginBtn = $("#kakaoBtn");
				loginBtn.click(function(){
					Kakao.Auth.loginForm({
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							
						},
						fail: function(err) {
							console.log(err);
						}
					});
				});
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>
	
	<%-- 네이버 로그인 --%>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("lNlvAbGNkbK57ij7y2BJ", "http://localhost:8070/styleblending/views/common/naverCallback.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,40);
	  	naver_id_login.setDomain("YOUR_SERVICE_URL");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
  </script>
	
	

<jsp:include page="../includes/footer.jsp" />
	
	
</body>
</html>