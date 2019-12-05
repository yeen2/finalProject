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

<style type="text/css">
	.aTag:hover {
		text-decoration: none;
		cursor: pointer;
		color: #007bff;
	}
</style>
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
					<a style="margin-right:235px;" class="aTag" id="forgotPassBtn">Forgot Password?</a>
					<a href="joinForm.do" class="aTag">회원가입</a>
				</div>
				
				<div style="margin-top:35px;">
					<button type="button"id="kakaoBtn" style="border: none; background-color: white;" onclick="loginWithKakao();">
						<img id="kakao-login-btn" src="resources/assets/img/kakao_login_btn_medium.png" style="cursor: pointer"></button>
					
				</div>


					<div style="margin-top:10px;" id="naver_id_login">
					<button type="button" class="form-control btn btn-success" id="navarBtn"><b>네이버 로그인</b></button>
				</div>
			</div>
		</div>
		</form>
		
	</div>

	
	<!----------------------------------------- 비밀번호 찾기 모달 ------------------------------>
	<script type="text/javascript">
		$("#forgotPassBtn").click(function () {
			console.log('클릭');
			$("#searchPassModal").modal('show');
		});
	</script>

	<div class="modal fade" id="searchPassModal" tabindex="-1" role="dialog"  
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">비밀번호 찾기</h5>
					<!-- 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form action="searchPass.do" method="post">
				<div class="modal-body">
					<div class="form-group">
						<label for="searchEmail">이메일</label>
						<input type="email" class="form-control"
								name="email" id="searchPassEmail">
						<small id="emailCheck1" style="display:none;" class="form-text text-danger">존재하지 않는 이메일입니다.</small>
						<small id="emailCheck2" style="display:none;" class="form-text text-success">존재하는 이메일입니다.</small>
					</div>
				</div>
					
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">돌아가기</button>
					<button type="submit" class="btn btn-success" id="searchPass_submit">찾기</button>
				</div>
				</form>
				<script type="text/javascript">
					$("#searchPass_submit").attr("disabled", true);
	
					$("#searchPassEmail").on("keyup", function(){	
						var email = $("#searchPassEmail").val();
						console.log(email);
						
						// 이메일 존재 체크ajax
						$.ajax({
							url:"joinCheckEmail.do",
							data:{email:email},
							type:"post",
							success:function(result){
								console.log('결과' + result);
								if(result == "1"){ //아이디 없음
									$("#emailCheck1").show();
									$("#emailCheck2").hide();
								}else{ // 아이디 존재
									$("#emailCheck1").hide();
									$("#emailCheck2").show();
									$("#searchPass_submit").removeAttr("disabled");
								}
							},
							error:function(result){
								alert("실패!");
							}
						});
					});

					// 찾기버튼 누를때	
					$("#searchPass_submit").click(function() {
						var email = $("#searchPassEmail").val();
						
					});
				
				</script>
			</div>
		</div>
	</div>
	
	<!------------------------ 아이디/비번 기억하기 ---------------------------->

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
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript">
    
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('31cf6de7a2c86437e847970902031c17');
	    function loginWithKakao() {
	      // 로그인 창을 띄웁니다.
	      Kakao.Auth.loginForm({
	        success: function(authObj) {
	        	console.log("카카오 성공");
	          getKakaotalkUserProfile();
	        },
	        fail: function(err) {
	        	console.log("카카오 실패");
	        }
	      });
	    };
	    
	    function getKakaotalkUserProfile(){
			
			Kakao.API.request({
				url: '/v2/user/me',
				success: function(res) {
					var email = res.kakao_account.email;
					var id = res.id;
					var nickName = res.properties.nickname;
					
					location.href="kakaoLogin.do?nickName=" + nickName + "&email=" + email + "&id=" + id;
					
					Kakao.Auth.logout();
					
				},
				fail: function(error) {
					console.log(error);
				}
			});
		};
	  //]]>
		
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