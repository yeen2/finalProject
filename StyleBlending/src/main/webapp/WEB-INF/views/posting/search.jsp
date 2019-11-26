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

				<!-- Author -->
				<p class="lead">
					<span style="font-style: italic;">" ${keyword } "</span><span> 의 검색 결과</span>
				</p>
				<hr>
				<!-- 게시물 작성자 정보-->
				<div id="pWriter" style="height: 70px;">
					<!-- 프로필 사진 -->
					<div style="display: inline-block; width: 60px; height: 60px; border-radius: 50%; margin-right: 20px;">
						<img style="width: 100%; height: 100%; border-radius: 50%;" src="http://placehold.it/60x60" >
					</div>
					<!-- 상세정보 -->
					<div style="display: inline-block; margin: auto; height: 50px; padding-top: 5px;">
						<div style="height: 50%;">
							<a href="#" style="margin-right: 20px;"><span style="font-weight: bold;">닉네임</span></a>
							<button type="button" class="btn btn-dark btn-sm fBtn" id="addFan">
								<i class="fa fa-plus"></i><b>Fan</b>
							</button>
						</div>
						<div style="height: 50%;">
							<i class="fas fa-map-marker-alt"></i>
							<span style="fint-size:xx-small;">위치</span>
						</div>
					</div>
				</div>
				<!-- 이미지 -->
				<div style="width: 500px; height: 600px;">
					<img class="img-fluid rounded" style="width: 100%; height: 100%;"
						src="${ pageContext.servletContext.contextPath }/resources/upload/posting/" alt="">
				</div>

  
			</div> <!-- col-lg-8 end -->
			




			<!-- 오른쪽 -->
			<div class="col-md-4">
			
			
			<%-- 
				<!-- 1. 작성자 정보 -->
				<div class="card my-4" style="padding: 10px;">
					<!-- 작성자 프로필 -->
					<div class="media mb-4" style="margin: 0 !important;">
						<!-- 이미지 -->
						<div style="width: 25%; height: 25%; border-radius: 50%;">
							<img style="width: 80%; height: 80%; border-radius: 50%;"
								src="http://placehold.it/60x60" 
								src="${ pageContext.servletContext.contextPath }/resources/upload/member/${p.rename_img}">
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
						
					</div>
				</div>
				
				<!-- 3. 촬영위치(지도api) -->
				<div class="card my-4">
					<h5 class="card-header">Location</h5>
					<div class="card-body">
						<div id="map" style="height: 300px;"></div>
						<span>${p.location }</span>
					</div>
				</div>
			--%>

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
	


	<jsp:include page="../includes/footer.jsp" />

</body>
</html>