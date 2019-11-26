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
	ul {
    	list-style-type: none;
    	padding-left: 5px;
	}
	ol, ul {
   		list-style: none;
	}
	.card {
		box-shadow: none !important;
	}
	a:hover {
		text-decoration: none;
		
	}
	li {
		margin-bottom: 5px;
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
				
				<c:forEach var="p" items="${p}">
					<!-- 1. 게시물 작성자 정보-->
					<div id="pWriter" style="height: 70px; margin-bottom: 5px;">
						<!-- 프로필 사진 -->
						<div style="display: inline-block; width: 60px; height: 60px; border-radius: 50%; margin-right: 20px;">
							<img style="width: 100%; height: 100%; border-radius: 50%; margin-bottom:35px;"
									src="${ pageContext.servletContext.contextPath }/resources/upload/member/${p.renameImg}">
						</div>
						<!-- 상세정보 -->
						<div style="display: inline-block; margin: auto; height: 50px; padding-top: 5px;">
							<div style="height: 50%; margin-bottom:10px;">
								<a href="#" style="margin-right: 20px;"><span style="font-weight: bold; font-size: 1.3em; color: black;">${p.nickName}</span></a>
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
							<div style="height: 50%;">
								<i class="fas fa-map-marker-alt"></i>
								<span style="fint-size:xx-small;">${p.mlocation }</span>
							</div>
						</div>
					</div>
					
					<!-- 2. 댓글수, 작성시간 -->
					<div style="margin-left: 10px; color: gray; margin-bottom: 10px;">
						<span>${p.replyCount }</span>
						<i class="far fa-comment" style="margin-right: 5px;"></i>
						·
						<span style="margin-left: 5px;">1시간 전</span>
					</div>
					
					<!-- 포스팅 이미지 -->
					<div style="width: 400px; height: 500px; margin-bottom: 10px;">
						<img class="img-fluid rounded" style="width: 100%; height: 100%;"
							src="${ pageContext.servletContext.contextPath }/resources/upload/posting/20191114204719.jpg" alt="">
					</div>
					
					<!-- 좋아요 -->
					<div style="display: inline; margin-right: 40px;">
						<button type="button" class="btn btn-secondary" id="likeBtn" style="width: 80px;">LIKE</button> &nbsp;&nbsp;
						<h3 style="display: inline; margin-bottom: 0px;" id="pLikeCountH3">${p.likeCount }</h3>
					</div>
					
					<!-- 해시태그 -->

					<hr>
				</c:forEach>
				
				
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
				
				
				<hr>
				
				<!-- 카테고리 검색 -->
				<div class="card my-4">
					<h5 class="card-header">상의</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li">T-SHIRT</li>
							<li class="cate_li">SWEATSHIRT</li>
							<li class="cate_li">SHIRT</li>
							<li class="cate_li">BLAZER</li>
							<li class="cate_li">JACKET</li>
							<li class="cate_li">OUTER</li>
							<li class="cate_li">SLEEVELESS</li>
							<li class="cate_li">CROP TEE</li>
							<li class="cate_li">HOODIE</li>
							<li class="cate_li">POLO</li>
							<li class="cate_li">KNIT</li>
							<li class="cate_li">TANK TOP</li>
							<li class="cate_li">VEST</li>
							<li class="cate_li">CARDIGAN</li>
							<li class="cate_li">COAT</li>
						</ul>
					</div>
					<h5 class="card-header">하의</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li">JEANS</li>
							<li class="cate_li">PANTS</li>
							<li class="cate_li">SHORTS</li>
							<li class="cate_li">SKIRT</li>
						</ul>
					</div>
					<h5 class="card-header">신발</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li">SNEAKERS</li>
							<li class="cate_li">BOOTS</li>
							<li class="cate_li">HEELS</li>
							<li class="cate_li">SANDALS</li>
							<li class="cate_li">CASUAL SHOES</li>
							<li class="cate_li">FORMAL SHOES</li>
						</ul>
					</div>
					<h5 class="card-header">악세사리</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li">BAG</li>
							<li class="cate_li">BAG</li>
							<li class="cate_li">BRACELET</li>
							<li class="cate_li">WATCH</li>
							<li class="cate_li">HAT</li>
							<li class="cate_li">EYEWEAR</li>
							<li class="cate_li">GLOVES</li>
							<li class="cate_li">SCARF</li>
							<li class="cate_li">SOCKS</li>
							<li class="cate_li">WALLET</li>
							<li class="cate_li">TIE</li>
						</ul>
					</div>	
					<h5 class="card-header">기타</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li">SWIMWEAR</li>
							<li class="cate_li">DRESS</li>
							<li class="cate_li">JUMPSUIT</li>
							<li class="cate_li">OVERALL</li>
							<li class="cate_li">SUIT</li>
							<li class="cate_li">ONE-PIECE</li>
							<li class="cate_li">CAMERA</li>
							<li class="cate_li">PHONE</li>
							<li class="cate_li">SNACK</li>
							<li class="cate_li">ETC.</li>
							<li class="cate_li">BIKE</li>
						</ul>
					</div>				
				</div>
				
				<hr>
				
			</div>

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->
	


	<jsp:include page="../includes/footer.jsp" />
	
	
	<script type="text/javascript">
		
		$(".cate_li").hover(function () {
			$(this).css('cursor','pointer').css('background-color','black').css('color','white');
			
		}, function () {
			$(this).css('background-color','white').css('color','black');
		});
	
	</script>

</body>
</html>