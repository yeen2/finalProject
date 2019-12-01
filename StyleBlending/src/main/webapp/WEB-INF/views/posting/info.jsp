<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.card {
		box-shadow: none !important;
	}
	.replyForm_div_2 { 
		margin-left: 50px;
	}
	.replyForm_imgDiv{
		width: 10%; height: 10%; border-radius: 50%;
	}
	.replyForm_img{
		width: 70%; height: 70%; border-radius: 50%;
	}
	.replyForm_img:hover {cursor: pointer;}
	.replyForm_contentDiv{
		width: 90%; height: 90%;
	}
	.replyForm_nickname {
		font-weight: bold;
	}
	.replyForm_nickname:hover {cursor: pointer; color: #0080FF;}
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
	.rr_modi_div {
		height: 66px;
		display: none;
	}
	.rrModiContent{
		border: 1px solid #787878;
		border-radius: .25rem;
    	padding: .5rem 1rem;
    	border-color : none;
    	width: 400px;
    	rows : 3;
	}
	.rrModiSubmit {
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
	.rr_md{
		margin-left: 10px;
	}
	.rr_md:hover{
		cursor: pointer;
	}

	a:hover {
		text-decoration: none !important;
	}
	
	/* 작성자누르면 마이페이지 이동 */
	#writerImg:hover{
		cursor: pointer;
	}
	
	#writerNickname:hover {
		color:#0080FF;
		cursor: pointer;
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

				<!-- 댓글 -->
				<p>View all <b id="rCount">${ p.replyCount}</b> comments</p>
				<br>
				
				<!-- for문 돌릴떄, 전index랑 같으면  -->
				<div id="replyForm" class="replyForm">
					<!-- <div class="media mb-4 replyForm_div">
						<div class="replyForm_imgDiv">
							<img class="replyForm_img" src="http://placehold.it/50x50">
						</div>
						
						<div class="replyForm_contentDiv">
							닉네임
							<h5 class="mt-0 replyForm_nickname"></h5>
							댓글내용
							<span class="replyForm_content"></span>
							<br>
							<span class="replyForm_likecount"></span>
							<i class="fas fa-caret-up"></i>
							· <a class="rrBtn">reply</a>
							· <span class="replyForm_date"></span> day ago
							
							대댓글
							<br><br>
							<div class="replyForm_rrForm">
								<textarea rows="3" id="rrContent" class="rrContent" 
										style="resize: none; display: inline;"></textarea>
								<button class="btn btn-dark rrSubmit" id="rrSubmit" >등록</button>
							</div>
						</div>
					</div>  -->
	
					<!-- 댓글 -->
					<!-- <div class="media mb-4">
						<img class="d-flex mr-3 rounded-circle"
							src="http://placehold.it/50x50" alt="">
						<div class="media-body">
							<h5 class="mt-0">Commenter Name</h5>
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
							scelerisque ante sollicitudin. Cras purus odio, vestibulum in
							vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
							nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	
							
							대댓글
							<div class="media mt-4">
								<img class="d-flex mr-3 rounded-circle"
									src="http://placehold.it/50x50" alt="">
								<div class="media-body">
									<h5 class="mt-0">Commenter Name</h5>
									Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
									scelerisque ante sollicitudin. Cras purus odio, vestibulum in
									vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
									nisi vulputate fringilla. Donec lacinia congue felis in
									faucibus.
								</div>
							</div>
	
						</div>
					</div>  -->
		
 				</div>  <!-- #replyForm end -->
 
				<!-- 댓글 달기 폼 : 마우스로 textarea클릭시, 로그인 안되있으면 로그인해달라는 alert띄우기 -->
 				<div id="replyTextarea">
					<div class="card my-4">
						<div class="card-body">
							<div class="form-group">
								<textarea class="form-control" rows="3" id="rContent" placeholder="Post comment.."
										style="resize: none;"></textarea>
							</div>
							<button class="btn btn-dark" id="rBtn"disabled>Post comment</button>
						</div>
					</div>
				</div> <!-- #replyTextarea end -->
				
			</div> <!-- col-lg-8 end -->
			




			<!-- 오른쪽 -->
			<div class="col-md-4">
			
				<!-- 1. 작성자 정보 -->
				<div class="card my-4" style="padding: 10px;">
					<!-- 작성자 프로필 -->
					<div class="media mb-4" style="margin: 0 !important;">
						<!-- 이미지 -->
						<div style="width: 25%; height: 25%; border-radius: 50%;" id="writerImg">
							<img style="width: 80%; height: 80%; border-radius: 50%;"
								src="${ pageContext.servletContext.contextPath }/resources/upload/member/${p.profileImg}"
								<%-- src="${ pageContext.servletContext.contextPath }/resources/upload/member/${p.renameImg}" --%>>
						</div>
						<!-- 정보 -->
						<div style="width: 75%; height: 75%;">
							<div >
								<!-- 닉네임 -->
								<h5 style="display: inline-block;" id="writerNickname">${ p.nickName }</h5>
								
								<!-- 팬추가 버튼 -->
			
								<!-- 팬추가 -->
								<c:if test="${p.fanCheck == 0}">
									<c:choose>
										<!-- 로그인한 회원 = 포스팅등록 회원 일때-->
										<c:when test="${p.mno == loginUser.mno}">
											<button class="btn btn-dark btn-sm fBtn" id="removeFan" style="" disabled="disabled">
												<i style="width: 40px;" class="fas fa-check"></i>
											</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-dark btn-sm fBtn" id="addFan">
												<i class="fa fa-plus"></i><b>Fan</b>
											</button>
											<button class="btn btn-dark btn-sm fBtn" id="removeFan" style="display: none;">
												<i style="width: 40px;" class="fas fa-check"></i>
											</button>
										</c:otherwise>
									</c:choose>
									
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
				
				<hr>
				
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
				
				<hr>
				
				<!-- 3. 촬영위치(지도api) -->
				<div class="card my-4">
					<h5 class="card-header">Location</h5>
					<div class="card-body">
						<div id="map" style="height: 300px;"></div>
						<%-- <span>${p.location }</span> --%>
					</div>
				</div>
				
 				<hr>
 				
				<!-- Side Widget -->
				<div class="card my-4">
					<h5 class="card-header">Spotlight</h5>
					<div class="card-body">
						<div class="spotDiv">
						<a href="pNavSearch.do?type=2&keyword=데일리룩">
							<img style="width: 100%; height: 100%;" 
								src="${ pageContext.servletContext.contextPath }/resources/image/hashtag/dailylook.jpg">
							<div style="left: 60px; width: 100px; bottom: 80px; font-size: 1em; 
										font-weight: bold; position: absolute; color: white;">
								#데일리룩
							</div>
						</a>
						</div>
						
						<div class="spotDiv" style="float: right;">
							<a href="pNavSearch.do?type=2&keyword=봄코디">
							<img style="width: 100%; height: 100%;" 
								src="${ pageContext.servletContext.contextPath }/resources/image/hashtag/springlook.jpg">
							<div style="right: 25px; width: 100px; bottom: 80px; font-size: 1em; 
										font-weight: bold; position: absolute; color: white;">
								#봄코디
							</div>
							</a>
						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

<!----------------------------------- 해시태그 클릭시 locatio:href 정해주기 ----------------------- -->

	<script type="text/javascript">
	$(document).on("click",".hashtagHref", function () {
		var hashtag = $(this).text();
		console.log(hashtag);
		
		// #을 빼야함..
		hashtag = hashtag.substr(1,hashtag.length-1);
		console.log(hashtag);
		hashtag = hashtag.trim();
		location.href="pNavSearch.do?type=2&keyword="+hashtag
	}); 
	</script>
	

	
<!-------------  프로필 : 마이페이지 이동  ----------------->	
	<script type="text/javascript">
		$("#writerImg, #writerNickname").click(function () {
			location.href="mpViewProfile.do?mno="+${p.mno}
		});
	</script>
	<script type="text/javascript">
		$(document).on("click",".replyForm_img, .replyForm_nickname", function () {
			var mno = $(this).parent().parent().children().eq(0).text();
			location.href="mpViewProfile.do?mno="+mno
		});
	</script>


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
<!------------------------------------------ 신고하기  ---------------------------------->	

	<script type="text/javascript">

		// 신고하기
		$("#declareBtn").click(function () {
			var loginUser = "${loginUser.email}";
			if(loginUser == null || loginUser == ""){
				alert("로그인 후 이용 가능하세요");
				return;
				
			}else{ // 로그인 되어있을때
				var dc = ${p.loginDeclare};
				
				if(dc == 1){
					alert("이미 신고하신 게시물 입니다");
				}else{
					$("#declareModal").modal('show');
				}

			}
		});
	</script>
	
<!--  -------------------------------------신고하기 모달------------------------------------- -->
	<div class="modal fade" id="declareModal" tabindex="-1" role="dialog"  
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
					<!-- 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				
				<form action="pDeclare.do" method="post" id="declare_form">
				<div class="modal-body">
					<div class="form-group">
						<label for="d_category">신고항목</label> 
						<select name="d_category" class="form-control" id="d_category">
							<option value="0">----</option>
							<option value="1">불법광고</option>
							<option value="2">도배</option>
							<option value="3">음란물</option>
							<option value="4">욕설</option>
							<option value="5">개인정보침해</option>
							<option value="6">기타</option>
						</select>
					</div>
					<div class="form-group">
						<label for="content">신고내용</label>
						<textarea name="content" style="height: 180px" class="form-control" id="declare_content"></textarea>
					</div>
					
					<input type="hidden" name="mno" value="${loginUser.mno }">
					<input type="hidden" name="bno" value="${p.pno}">
					<input type="hidden" name="dcategory" id="dcategory">
					<div>
						<input type="checkbox" name="declare_check" id="declare_check">
						<label for="declare_check">한번 신고하시면 취소할 수 없습니다. 동의시 체크해주세요.</label>
					</div>
				</div>
					
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-success" id="declare_submit">신고하기</button>
				</div>
				</form>
				<script type="text/javascript">
					$("#declare_submit").attr("disabled", true);
					
					// 신고동의 체크
					$("#declare_check").on('click', function() {
						if($("input:checkbox[name='declare_check']").is(":checked")){
							$("#declare_submit").removeAttr("disabled");
						}else{
							$("#declare_submit").attr("disabled",true);
						}
					});
					
					// 신고버튼	
					$("#declare_submit").click(function() {
						var d_category = $("#d_category").val();
						var content = $("#declare_content").val();
						var cate = $("#d_category option:selected").text();
						
						// cate hidden에 값넣어주기
						console.log("cate는 : " + cate);
						
						$("#dcategory").val(cate);
						
						return;
						//alert($("#category").val());
						console.log("category에는 : "+$("#dcategory").val());
						
						if(d_category == 0){
							alert("신고유형을 선택해 주세요");
							$('#declareModal').modal();
							return false;
						}
						
						if(d_category == 6){							
							if(content.length == 0){
								alert("신고내용을 입력해주세요");
								$('#declareModal').modal();
								return false;
							}
						}
						
					});
				
				</script>
			</div>
		</div>
	</div>
	
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
				
			
			
<!------------------------------------------ 댓글 ajax -------------------------------------->

	<script type="text/javascript">
		$(function() {

			getReplyList();
			
			setInterval(function(){
				getReplyList();
			}, 50000); 

			
			// 댓글폼 클릭시 로그인되있는지 확인
			$("#rContent").on("click", function () {
				var loginUser = "${loginUser.email}";

				if(loginUser == null || loginUser == ""){
					alert("로그인 후 이용 가능하세요");
					return;
					
				}else{ // 로그인 되어있을때
					$("#rBtn").attr("disabled", false);
				}
			});
			
			// 댓글내용 있는지 확인
			$("#rBtn").on("click", function(){
				if($("#rContent").val().length == 0){
					alert("댓글내용을 입력해 주세요");
				}else{
					
					var content = $("#rContent").val();
					var pno = ${p.pno};
					var mno = "${loginUser.mno}"; // var writer = admin;
					
					// 댓글 insert
					$.ajax({
						url:"pReplyInsert.do",
						data:{content:content, 
							  pno:pno,
							  mno:mno},
						success:function(data){
							
							if(data == "success"){
								getReplyList();
								$("#rContent").val("");
							}else{
								alert("댓글 작성 실패");
							}
							
						},error:function(){
							console.log("ajax 통신 실패");
						}
					});
				}
			});
			
		});
		
		//reply 전체리스트 불러오기
		function getReplyList(){
			console.log("select리플 들어옴");
			var session_mno = "${loginUser.mno}";
			
			$.ajax({
				url:"pReplyList.do",
				data:{pno:${p.pno}},
				dataType:"json",
				success:function(data){
					
					//console.log(data);

					$replyForm = $("#replyForm");
					$replyForm.html("");

					if(data.length > 0){ // 댓글이 존재할 경우
						
						// 반복문을 통해서 한 행씩 추가될 수 있도록
						$.each(data, function(index, value){ // value == data[index]

							$replyForm = $("#replyForm");
							//리플하나의 큰div
							// 댓글일때
							$replyForm_div = $("<div class='media mb-4 replyForm_div'></div>");
							// 대댓글일때
							$replyForm_div_2 = $("<div class='media mb-4 replyForm_div_2'></div>");
							
							$replyForm_mno = $("<input type='hidden'>").text(value.mno);
							$replyForm_imgDiv = $("<div class='replyForm_imgDiv'></div>");	
							$img = $("<img class='replyForm_img'>").attr("src",'/styleblending/resources/upload/member/'+value.profileImg);
							
							$replyForm_contentDiv = $("<div class='replyForm_contentDiv'></div>");
							$nickname = $("<h5 class='mt-0 replyForm_nickname'></h5>").text(value.nickName);
							$rcontent = $("<span class='replyForm_content'></span>").html(value.content);
							//댓글 수정div(hidden)
							$r_modi_div = $("<div class='r_modi_div'></div>")
							$r_modi_textarea = $("<textarea class='rModiContent'></textarea>").html(value.content);
							$r_modi_submit = $("<button class='btn btn-dark rModiSubmit' id='rModiSubmit'>등록</button>");
							//대댓글 수정div(hidden)
							$rr_modi_div = $("<div class='rr_modi_div'></div>")
							$rr_modi_textarea = $("<textarea class='rrModiContent'></textarea>").html(value.content);
							$rr_modi_submit = $("<button class='btn btn-dark rrModiSubmit' id='rrModiSubmit'>등록</button>");
							
							$likecount = $("<span class='replyForm_likecount'></span>").text(value.likeCount);
							$likeImg = $("<i class='fas fa-caret-up'></i>");
							// 댓글 조아요 하트
							$r_likeBtn = $("<i class='fas fa-heart'></i>");
						
							$rrBtn = $("<a class='rrBtn'>reply</a>");
							$date = $("<span class='replyForm_date'></span>").text(value.enrollDate);
							//댓글 수정 삭제 아이콘
							$r_modi = $("<i class='fas fa-pencil-alt r_md r_modiBtn'></i>");
							$r_delete = $("<i class='fas fa-trash-alt r_md r_deleteBtn'></i>");
							//대댓글 수정 삭제 아이콘
							$rr_modi = $("<i class='fas fa-pencil-alt rr_md rr_modiBtn'></i>");
							$rr_delete = $("<i class='fas fa-trash-alt rr_md rr_deleteBtn'></i>");
							

							// 대댓글폼
							$replyForm_rrForm = $("<br><br><div class='replyForm_rrForm' style='display:none;'></div>");
							$prno = $("<input type='hidden'>").text(value.prno);
							$rrContent = $("<textarea id='rrContent' class='rrContent'></textarea>");
							$rrSubmit = $("<button class='btn btn-dark rrSubmit' id='rrSubmit'>등록</button>");
							
							//댓글
							if(value.level == 1){ 
								$replyForm_imgDiv.append($img);
								//대댓글
								$replyForm_rrForm.append($prno).append($rrContent).append($rrSubmit);
								
								if(session_mno == value.mno){ //댓글쓴사람 = 로그인회원
									//컨텐츠
									// => 수정div
									$r_modi_div.append($r_modi_textarea).append($r_modi_submit);
									$replyForm_contentDiv.append($nickname).append($rcontent)
													.append($r_modi_div)
													.append('<br>').append($likecount)
													.append($likeImg).append($rrBtn).append($date).append($r_modi).append($r_delete)
													.append($replyForm_rrForm);
								}else{ 
									$replyForm_contentDiv.append($nickname).append($rcontent).append('<br>').append($likecount)
									.append($likeImg).append($rrBtn).append($date)
									.append($replyForm_rrForm);
								}
								
								$replyForm_div.append($replyForm_mno).append($replyForm_imgDiv).append($replyForm_contentDiv);
								
								$replyForm.append($replyForm_div);
							
							//대댓글
							}else{ 
								
								if(session_mno == value.mno){ //댓글쓴사람 = 로그인회원
									// =>수정div
									$rr_modi_div.append($rr_modi_textarea).append($rr_modi_submit);
									$replyForm_imgDiv.append($img);
									//대댓글 (수정삭제할때 갖고올라고)
									$replyForm_rrForm.append($prno).append($rrContent).append($rrSubmit);
									
									$replyForm_contentDiv.append($nickname).append($rcontent)
													.append($rr_modi_div)
													.append('<br>').append($likecount)
													.append($likeImg).append($date).append($rr_modi).append($rr_delete)
													.append($replyForm_rrForm);
								
								}else {
									$replyForm_imgDiv.append($img);
									$replyForm_contentDiv.append($nickname).append($rcontent).append('<br>').append($likecount)
													.append($likeImg).append($date).append($replyForm_rrForm);
									
								}
								$replyForm_div_2.append($replyForm_mno).append($replyForm_imgDiv).append($replyForm_contentDiv);
								
								$replyForm.append($replyForm_div_2);
							}
							
						});
						
					}else{ // 댓글이 존재하지 않을 경우
						//console.log("댓글없움");
						$replyForm = $("#replyForm");
						$replyForm.append("<span>등록된 댓글이 없습니다.</span>");
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		} //getReplyList end 
		
		
		//댓글 삭제
		$(document).on("click",".r_deleteBtn", function () {
			var prno = $(this).parent().children(".replyForm_rrForm").children().eq(0).text();
			
			if(confirm('정말로 삭제하시겠습니까?')){
				// 댓글 삭제
				$.ajax({
					url:"pReplyDelete.do",
					data:{prno:prno},
					success:function(data){
						
						if(data == "success"){
							getReplyList();
						}else{
							alert("댓글 삭제 실패");
						}
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
			}
		});
		
		//대댓글 삭제
		$(document).on("click",".rr_deleteBtn", function () {
			var prno = $(this).parent().children(".replyForm_rrForm").children().eq(0).text();
			
			if(confirm('정말로 삭제하시겠습니까?')){
				// 댓글 삭제
				$.ajax({
					url:"pReReplyDelete.do",
					data:{prno:prno},
					success:function(data){
						
						if(data == "success"){
							getReplyList();
						}else{
							alert("댓글 삭제 실패");
						}
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
			}
		});
		
		
		//댓글 수정
		$(document).on("click",".r_modiBtn", function () {
			var prno = $(this).parent().children(".replyForm_rrForm").children().eq(0).text();

			$(this).parent().children(".r_modi_div").toggle();
			$(this).parent().children(".replyForm_content").toggle();
		});
		
		$(document).on("click",".rModiSubmit", function () {
			var prno = $(this).parent().parent().children(".replyForm_rrForm").children().eq(0).text();
			var content = $(this).prev().val();
			console.log(prno);
			console.log(content);
			
			$.ajax({
				url:"pReplyUpdate.do",
				data:{prno:prno,
					  content:content},
				success:function(data){
					
					if(data == "success"){
						getReplyList();
					}else{
						alert("댓글 삭제 실패");
					}
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
			});
		});
		
		//대댓글 수정
		$(document).on("click",".rr_modiBtn", function () {
			var prno = $(this).parent().children(".replyForm_rrForm").children().eq(0).text();

			$(this).parent().children(".rr_modi_div").toggle();
			$(this).parent().children(".replyForm_content").toggle();
		});
		
		$(document).on("click",".rrModiSubmit", function () {
			var prno = $(this).parent().parent().children(".replyForm_rrForm").children().eq(0).text();
			var content = $(this).prev().val();
			console.log(prno);
			console.log(content);
			
			$.ajax({
				url:"pReReplyUpdate.do",
				data:{prno:prno,
					  content:content},
				success:function(data){
					
					if(data == "success"){
						getReplyList();
					}else{
						alert("댓글 삭제 실패");
					}
					
				},error:function(){
					console.log("ajax 통신 실패");
				}
			});
		});
		
	</script>
			
<!------------------------------------------ 대댓글 ajax  ------------------------------------>

	<script>
		// reply쓰는 버튼 누를때 textarea 보여주기
		$(document).on("click",".rrBtn", function () {
			
			var loginUser = "${loginUser.email}";
			var tt = $(this).parent().children(".replyForm_rrForm");
			//console.log(tt);
			
			if(loginUser == null || loginUser == ""){
				alert("로그인 후 이용 가능하세요");
				return;
				
			}else{ // 로그인 되어있을때
				tt.toggle();
			}
		});
		
		
		// 대댓글내용 있는지 확인
		$(document).on("click",".rrSubmit" , function(){
			var content = $(this).prev().val(); //댓글내용
			var prno = $(this).prev().prev().text();
			
			if(content == 0){
				alert("내용을 입력해 주세요");
			}else{
				
				var pno = ${p.pno};
				var mno = "${loginUser.mno}"; // var writer = admin;
				
				// 대댓글 insert
				$.ajax({
					url:"pReReplyInsert.do",
					data:{content:content, 
						  prno:prno,	
						  pno:pno,
						  mno:mno},
					success:function(data){
						
						if(data == "success"){
							getReplyList();
							$(".rrContent").val("");
						}else{
							alert("댓글 작성 실패");
						}
						
					},error:function(){
						console.log("ajax 통신 실패");
					}
				});
			}
		});
		
	
	</script>
	
	<!------------------------------------------------- 카카오 공유하기 -------------------------------------------->
	
	
					<script type='text/javascript'>
					  //<![CDATA[
					    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
					    Kakao.init('8ef4b8fd4aebaa69e9172f4cc49921ca');
					    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
					    function sendLink() {
					    	
					    	var like = ${p.likeCount}
					    	var count = 35;
					    	
					      Kakao.Link.sendDefault({
					        objectType: 'feed',
					        content: {
					          title: '${c.cafe_name}',
					          description: '#StyleBlending,#ootd,#데일리룩,#${c.cafe_name},#${c.address},#${c.favorite}',
					         /*  imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png', */
					         imageUrl: 'http://mud-kage.kakao.co.kr/dn/Q2iNx/btqgeRgV54P/VLdBs9cvyn8BJXB3o7N8UK/kakaolink40_original.png',
					         link: {
					            /* mobileWebUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}',
					            webUrl: 'http://192.168.30.186:8030/LugarFresco/cafeInfo.ca?c_no=${c.c_no}' */
					            mobileWebUrl: 'http://localhost:8070/styleblending/pInfo.do?id=${p.pno}',
					            webUrl: 'http://localhost:8070/styleblending/pInfo.do?id=${p.pno}' 
					          }
					        },
					        social: {
					          likeCount: like,
					          commentCount: count,
					          sharedCount: 3
					        }, 
					        buttons: [
					          {
					            title: '웹으로 보기',
					            link: {
					              mobileWebUrl: 'http://localhost:8070/styleblending/pInfo.do?id=${p.pno}',
					              webUrl: 'http://localhost:8070/styleblending/pInfo.do?id=${p.pno}'
					            }
					          },
					          {
					            title: '앱으로 보기',
					            link: {
					              mobileWebUrl: 'http://localhost:8070/styleblending/pInfo.do?id=${p.pno}',
					              webUrl: 'http://localhost:8070/styleblending/pInfo.do?id=${p.pno}'
					            }
					          }
					        ]
					      });
					    }
					  //]]>
					</script>
					
	<!-------------------------------------------------------- 지도api  -------------------------------------->


	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8ef4b8fd4aebaa69e9172f4cc49921ca&libraries=services"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3 // 지도의 확대 레벨
		};
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
	
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
	
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(
			'${p.location}',
				function(result, status) {
	
					// 정상적으로 검색이 완료됐으면 
					if (status === kakao.maps.services.Status.OK) {
	
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});
	
								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">${p.location}</div>'
										});
								infowindow.open(map, marker);
	
								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>

	<jsp:include page="../includes/footer.jsp" />

</body>
</html>