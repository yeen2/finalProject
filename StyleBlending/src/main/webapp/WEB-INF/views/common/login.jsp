<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
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
						placeholder="Email" aria-label="Email" aria-describedby="basic-addon1">
				</div>
				
				<div class="input-group mt-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon2">
							<i class="fas fa-key"></i>
						</span>
					</div>
					<!-- 비번 입력창 -->
					<input type="password" class="form-control"name="pass" id="pass"
						aria-label="Password" aria-describedby="basic-addon2" placeholder="Password" >
				</div>
				
				<div class="input-group-prepend" style="margin-top:10px;">
					<a href="#" style="margin-right:235px;">Forgot Password?</a>
					<a href="#">회원가입</a>
				</div>
				
				<div style="margin-top:10px;">
					<button type="submit" class="form-control btn btn-dark" style="height:50px;"><b>로그인</b></button>
				</div>
				<div style="margin-top:35px;">
					<button type="button" class="form-control btn btn-warning" id="kakaoBtn"><b>카카오톡 로그인</b></button>
				</div>
				<div style="margin-top:10px;">
					<button type="button" class="form-control btn btn-danger" id="googleBtn"><b>구글 로그인</b></button>
				</div>
				<div style="margin-top:10px;" id="naver_id_login">
					<button type="button" class="form-control btn btn-success" id="navarBtn"><b>네이버 로그인</b></button>
				</div>
			</div>
		</div>
		</form>
		
	</div>
	
	
	
	 
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
  	var naver_id_login = new naver_id_login("lNlvAbGNkbK57ij7y2BJ", "http://localhost:8070/fial/views/common/naverCallback.jsp");
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