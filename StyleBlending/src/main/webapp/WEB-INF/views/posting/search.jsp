<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.replyForm_div_2 { 
		margin-left: 50px;
	}
	.replyForm_imgDiv{
		width: 10%; height: 10%; border-radius: 50%;
	}
	.replyForm_img{
		width: 70%; height: 70%; border-radius: 50%;
	}
	.replyForm_contentDiv{
		width: 90%; height: 90%;
	}
	.replyForm_nickname {
		font-weight: bold;
	}
	.replyForm_content{
		height: 100px;
	}
	.rrBtn{
		color:gray;
		font-style : oblique;
		margin-left: 8px;
	}
	.rrBtn:hover{
		text-decoration : none;
		color : lightblue;
		cursor: pointer;
	}
	.replyForm_date {
		margin-left: 8px;
	}
	textarea{
		resize: none;
	}
	.rrContent {
		border: 1px solid #787878;
		border-radius: .25rem;
    	padding: .5rem 1rem;
    	border-color : none;
    	width: 550px;
    	rows : 3;
	}
	.rrContent:focus {outline:none;}
	.rrSubmit {
		margin-bottom: 30px;
		margin-left: 10px;
	}
	.r_modi_div {
		height: 66px;
		display: none;
	}
	.rModiContent{
		border: 1px solid #787878;
		border-radius: .25rem;
    	padding: .5rem 1rem;
    	border-color : none;
    	width: 400px;
    	rows : 3;
	}
	.rModiSubmit {
	 	margin-bottom: 30px;
		margin-left: 10px;
		display: inline-block;
	 }
	 
	 
	.spotDiv {
		width: 50%; height: 50%; display: inline-block;
		padding : 3px;
	}
	button:click {
		border:none;
	}
	#declareBtn:hover {
		cursor: pointer;
	}
	.fBtn {
		float: right; margin-right: 20px;
	}
	/* 댓글 수정삭제 아이콘 */
	.r_md{
		margin-left: 10px;
	}
	.r_md:hover{
		cursor: pointer;
	}
	a:hover {
		text-decoration: none;
	}
</style>
</head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<body>

	<jsp:include page="../includes/header.jsp" />


	<!-- Page Content -->
	<div class="container" style="margin-top: 150px; margin-bottom: 70px;">

		<div class="row">

			<!-- 왼쪽부분 -->
			<div class="col-lg-8">

				<!-- Title -->
				<h1 class="mt-4">Style Posting</h1>
				<!-- Author -->
				<p class="lead">
					by <a style="font-style: italic;">Style Blending</a>
				</p>

				<hr>
				<!-- 좋아요/신고 -->
				<div >
					<div style="display: inline; margin-right: 40px;">
						<button type="button" class="btn btn-secondary" id="likeBtn">LIKE</button> &nbsp;&nbsp;
						<h3 style="display: inline; margin-bottom: 0px;" id="pLikeCountH3">${p.likeCount}</h3>
					</div>
					<div style="display: inline; margin-right: 60px;">
						 <!--  카카오톡 공유하기  -->
							<a id="kakao-link-btn" href="javascript:sendLink()">
								<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"
										width="40px" height="40px;">
							</a>
							<span>
								<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
								<script type="text/javascript">
									new ShareNaver.makeButton({"type": "e" , "title":"[공유][StyleBlending]" , "url":"https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=Style+Blending&oquery=StyleBlending&tqi=UOhtCsp0J1sssTDAW8dssssssGK-038226"});
/* 									new ShareNaver.makeButton({"type": "e" , "title":"[공유][StyleBlending]" , "url":"https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&oquery=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0&ie=utf8&query=%EB%84%A4%EC%9D%B4%EB%B2%84+%EA%B0%9C%EB%B0%9C%EC%9E%90%EC%84%BC%ED%84%B0"}); */
								</script>
							</span>
					</div>
					<div style="display: inline; float: right; margin-right: 200px;">
						<a>
						<i class="fas fa-exclamation-triangle" id="declareBtn"
							style="color:red; font-size: xx-large; padding-top: 5px;"></i>
						</a>
					</div>
				</div>
				
				<br>
				<!-- 이미지 -->
				<div style="width: 500px; height: 600px;">
				
				
					<img class="img-fluid rounded" style="width: 100%; height: 100%;"
						src="${ pageContext.servletContext.contextPath }/resources/upload/posting/${p.renameImg}" alt="">
				</div>
				<!-- 좋아요,신고-->
				<div>
					<!-- 좋아요아이콘 -->
					<!-- 댓글 아이콘 -->
					<!-- 신고 아이콘 -->
				</div>
				
				<hr>
				
				<!-- Post Content -->
				<p>${p.content }</p>
				
				<hr>
		
 				</div>  <!-- #replyForm end -->
 
			</div> <!-- col-lg-8 end -->
			




			<!-- 오른쪽 -->
			<div class="col-md-4">
			
				<!-- 1. 작성자 정보 -->
				<div class="card my-4" style="padding: 10px;">
					<!-- 작성자 프로필 -->
					<div class="media mb-4" style="margin: 0 !important;">
						<!-- 이미지 -->
						<div style="width: 25%; height: 25%; border-radius: 50%;">
							<img style="width: 80%; height: 80%; border-radius: 50%;"
								src="http://placehold.it/60x60" 
								<%-- src="${ pageContext.servletContext.contextPath }/resources/upload/member/${p.rename_img}" --%>>
						</div>
						<!-- 정보 -->
						<div style="width: 75%; height: 75%;">
							<div >
								<!-- 닉네임 -->
								<h6 style="display: inline-block;">${ p.nickName }</h6>
								
								<!-- 팬추가 버튼 -->
								<!-- 팬추가 -->
								<c:if test="${p.fanCheck == 0}">
									<button type="button" class="btn btn-dark btn-sm fBtn" id="addFan">
										<i class="fa fa-plus"></i><b>Fan</b>
									</button>
									<button class="btn btn-dark btn-sm fBtn" id="removeFan" style="display: none;">
										<i style="width: 40px;" class="fas fa-check"></i>
									</button>
								</c:if>
								
								<!-- 팬제거 -->	
								<c:if test="${p.fanCheck == 1}">
									<button class="btn btn-dark btn-sm fBtn" id="removeFan">
										<i style="width: 40px;" class="fas fa-check"></i>
									</button>
									<button type="button" class="btn btn-dark btn-sm fBtn" id="addFan" style="display: none;">
										<i class="fa fa-plus"></i><b>Fan</b>
									</button>
								</c:if>
							</div>
							<div>
								<!-- 자기소개 -->
								<span style="fint-size:xx-small;">${p.profile }</span> <br>
								<i class="fas fa-map-marker-alt"></i>
								<span style="fint-size:xx-small;">${p.mlocation }</span>
							</div>
							
						</div>
					</div>
				</div>
				
				<!-- 2. 코디 정보 -->
				<div class="card my-4">
					<h5 class="card-header">Clothes stylist</h5>
					<div class="card-body">
					
						<c:forEach var="s" items="${s}">
						<div class="row" style="margin-bottom: 10px;">
							<div class="col-lg-3">
								<div  style="border-radius: 50%; width: 50px; height: 50px;">
									<img style="width: 100%; height: 100%; border-radius: 50%;"
										src="${ pageContext.servletContext.contextPath }/resources/image/cate/${s.img}">
								</div>
							</div>
							<div class="col-lg-9" style="display: inline-block;">
								<b>${s.name }</b>
								<br>
								<span>${s.brand }</span>
								<br>
								<div style="display: inline-block; border-radius: 50%; width: 15px; height: 15px;">
									<div style="border-radius: 50%; width:100%; height:100%; background-color: ${s.color}"></div>
								</div>
							</div>
						</div>
						</c:forEach>
						
					</div>
				</div>
				
				<!-- 3. 촬영위치(지도api) -->
				<div class="card my-4">
					<h5 class="card-header">Location</h5>
					<div class="card-body">
						<div id="map" style="height: 300px;"></div>
						<%-- <span>${p.location }</span> --%>
					</div>
				</div>
				<!-- 
				
				Search Widget
				<div class="card my-4">
					<h5 class="card-header">Search</h5>
					<div class="card-body">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for..."> <span
								class="input-group-btn">
								<button class="btn btn-secondary" type="button">Go!</button>
							</span>
						</div>
					</div>
				</div>

				Categories Widget
				<div class="card my-4">
					<h5 class="card-header">Categories</h5>
					<div class="card-body">
						<div class="row">
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">HTML</a></li>
									<li><a href="#">Freebies</a></li>
								</ul>
							</div>
							<div class="col-lg-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#">JavaScript</a></li>
									<li><a href="#">CSS</a></li>
									<li><a href="#">Tutorials</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
 -->
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Spotlight</h5>
					<div class="card-body">
						<div class="spotDiv">
							<img style="width: 100%; height: 100%;" 
								src="${ pageContext.servletContext.contextPath }/resources/image/hashtag/dailylook.jpg">
							<div style="left: 60px; width: 100px; bottom: 80px; font-size: 1em; 
										font-weight: bold; position: absolute; color: white;">
								#데일리룩
							</div>
						</div>
						
						<div class="spotDiv" style="float: right;">
							<img style="width: 100%; height: 100%;" 
								src="${ pageContext.servletContext.contextPath }/resources/image/hashtag/springlook.jpg">
							<div style="right: 25px; width: 100px; bottom: 80px; font-size: 1em; 
										font-weight: bold; position: absolute; color: white;">
								#봄코디
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	
<!------------------------------------------ 팬  ---------------------------------->

	<script type="text/javascript">
		var loginUser = "${loginUser.mno}";
		
		// 팬추가
		$(".fBtn").click(function () {
			
			var nowFanCheck = $(this).attr('id');
			console.log(nowFanCheck);
			
			if(loginUser == null || loginUser == ""){
				alert("로그인 후 이용 가능하세요");
				return;
			}else{ //로그인 했을때
				
				if(nowFanCheck == 'addFan'){
					insertFan(${p.mno});
				}else {
					deleteFan(${p.mno});
				}
				
				
			}
		});
	
		// insert 팬
		function insertFan(value){
			var meNo = value;
			$.ajax({
				url:"mpInsertFan.do",
				data:{meNo:meNo, youNo:loginUser},
				type:"post",
				success:function(result){
					if(result == 1){
						$("#addFan").hide();
						$("#removeFan").show();
					}else{
						console.log("실패");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		// delete 팬
		function deleteFan(value){
			var meNo = value;
			$.ajax({
				url:"mpDeleteFan.do",
				data:{meNo:meNo, youNo:loginUser},
				type:"post",
				success:function(result){
					if(result == 1){
						$("#removeFan").hide();
						$("#addFan").show();
					}else{
						console.log("실패");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
	</script>

<!------------------------------------------  좋아요 -------------------------------->

	<script type="text/javascript">


	// 이 포스팅의 좋아요 카운트 가져오기
	function getPLikeCount() {
		$.ajax({
			url:"getPLikeCount.do",
			data:{pno:${p.pno}},
			type:"get",
			success:function(data){
				
				$("#pLikeCountH3").text(data);
				
			},error:function(){
				console.log("ajax 서버 실패");
			}
		});
	};

	$("#likeBtn").hover(function () { // 버튼 마우스
		//likeCount = $(this).next().text();
		var loginLike;
		var mno = "${loginUser.mno}";
		
		if(mno == null || mno == ""){
			$(this).next().text("+1");
			
		}else{ // 로그인 되어있을때
		
			loginLike = getPLikeCheck(mno);
		
			if(loginLike == 0){
				$(this).next().text("+1");
			}else{
				$(this).next().text("-1");
			}	
		}

	}, function () { //마우스 뗄때
		getPLikeCount();
	});
	
	
	// 좋아요 클릭시 로그인되있는지 확인
	$("#likeBtn").on("click", function () {
		var loginUser = "  ${loginUser.email}";

		if(loginUser == null || loginUser == ""){
			alert("로그인 후 이용 가능하세요");
			return;
			
		}else{ // 로그인 되어있을때
			var mno = "${loginUser.mno}";
			var loginLike = getPLikeCheck(mno);
			
			if(loginLike == '0'){
				// 좋아요 추가
				$.ajax({
					url:"pLikeInsert.do",
					data:{pno:${p.pno},
						  mno:mno},
					type:"get",
					success:function(str){
						if(str == 'success'){
							console.log("좋아요 추가 성공");
							getPLikeCount();

						}else{
							console.log("좋아요 추가 실패");
						}
					},error:function(){
						console.log("ajax 서버 실패");
					}
				});
				
			}else{
				// 좋아요 취소
				$.ajax({
					url:"pLikeDelete.do",
					data:{pno:${p.pno},
						  mno:mno},
					type:"get",
					success:function(str){
						if(str == 'success'){
							console.log("좋아요 제거 성공");
							getPLikeCount();
						}else{
							console.log("좋아요 제거 실패");
						}
					},error:function(){
						console.log("ajax 서버 실패");
					}
				});
			}
		}
	});

	// 로그인 회원의 해당 포스팅 좋아요 확인
	function getPLikeCheck(mno) {
		var result=0;
		$.ajax({
			url:"getPLikeCheck.do",
			async: false,
			data:{pno:${p.pno},
				  mno:mno},
			type:"get",
			success:function(data){
				console.log(data);
				result = data;
			},error:function(){
				console.log("ajax 서버 실패");
			}
			
		});
			return result;
	};
	
	</script>

	<jsp:include page="../includes/footer.jsp" />

</body>
</html>