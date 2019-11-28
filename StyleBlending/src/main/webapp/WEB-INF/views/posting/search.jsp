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
	.writerNickname:hover{cursor: pointer; color: #0080FF;}
	.writerImg:hover{cursor: pointer;}
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
				<c:if test="${empty p}">
					<span>검색 결과가 없습니다</span>
				</c:if>
				<c:if test="${not empty p}">
				<c:forEach var="p" items="${p}">
					
					<!-- 1. 게시물 작성자 정보-->
					<div id="pWriter" style="height: 70px; margin-bottom: 5px;">
						<input type="hidden" value="${p.mno }">
						<!-- 프로필 사진 -->
						<div style="display: inline-block; width: 60px; height: 60px; border-radius: 50%; margin-right: 20px;">
							<img class="writerImg" style="width: 100%; height: 100%; border-radius: 50%; margin-bottom:35px;"
									src="${ pageContext.servletContext.contextPath }/resources/upload/member/${p.profileImg}">
						</div>
						<!-- 상세정보 -->
						<div style="display: inline-block; margin: auto; height: 50px; padding-top: 5px;">
							<div style="height: 50%; margin-bottom:10px;">
								<span class="writerNickname" style="font-weight: bold; font-size: 1.3em; color: black; margin-right: 20px;">${p.nickName}</span>
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
				</c:if>
				
			</div> <!-- col-lg-8 end -->

			<!-- 오른쪽 -->
			<div class="col-md-4">
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
							<li class="cate_li" value="1">T-SHIRT</li>
							<li class="cate_li" value="2">SWEATSHIRT</li>
							<li class="cate_li" value="3">SHIRT</li>
							<li class="cate_li" value="4">BLAZER</li>
							<li class="cate_li" value="5">JACKET</li>
							<li class="cate_li" value="6">OUTER</li>
							<li class="cate_li" value="7">SLEEVELESS</li>
							<li class="cate_li" value="8">CROP TEE</li>
							<li class="cate_li" value="10">HOODIE</li>
							<li class="cate_li" value="11">POLO</li>
							<li class="cate_li" value="12">KNIT</li>
							<li class="cate_li" value="13">TANK TOP</li>
							<li class="cate_li" value="14">VEST</li>
							<li class="cate_li" value="15">CARDIGAN</li>
							<li class="cate_li" value="16">COAT</li>
						</ul>
					</div>
					<h5 class="card-header">하의</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li" value="17">JEANS</li>
							<li class="cate_li" value="18">PANTS</li>
							<li class="cate_li" value="19">SHORTS</li>
							<li class="cate_li" value="20">SKIRT</li>
						</ul>
					</div>
					<h5 class="card-header">신발</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li" value="21">SNEAKERS</li>
							<li class="cate_li" value="22">BOOTS</li>
							<li class="cate_li" value="23">HEELS</li>
							<li class="cate_li" value="24">SANDALS</li>
							<li class="cate_li" value="25">CASUAL SHOES</li>
							<li class="cate_li" value="26">FORMAL SHOES</li>
						</ul>
					</div>
					<h5 class="card-header">악세사리</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li" value="27">BAG</li>
							<li class="cate_li" value="28">BRACELET</li>
							<li class="cate_li" value="29">WATCH</li>
							<li class="cate_li" value="30">HAT</li>
							<li class="cate_li" value="31">EYEWEAR</li>
							<li class="cate_li" value="32">GLOVES</li>
							<li class="cate_li" value="33">SCARF</li>
							<li class="cate_li" value="34">SOCKS</li>
							<li class="cate_li" value="35">WALLET</li>
							<li class="cate_li" value="36">TIE</li>
						</ul>
					</div>	
					<h5 class="card-header">기타</h5>
					<div class="card-body">
						<ul class="linespaced more_bottomspaced" style="margin-top: -8px; color: black;">
							<li class="cate_li" value="37">SWIMWEAR</li>
							<li class="cate_li" value="38">DRESS</li>
							<li class="cate_li" value="39">JUMPSUIT</li>
							<li class="cate_li" value="40">OVERALL</li>
							<li class="cate_li" value="41">SUIT</li>
							<li class="cate_li" value="42">ONE-PIECE</li>
							<li class="cate_li" value="43">CAMERA</li>
							<li class="cate_li" value="44">PHONE</li>
							<li class="cate_li" value="45">SNACK</li>
							<li class="cate_li" value="46">ETC.</li>
							<li class="cate_li" value="47">BIKE</li>
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
		$(document).on("click",".writerImg", function () {
			var mno = $(this).parent().parent().children().eq(0).val();
			location.href="mpViewProfile.do?mno="+mno
		});
		$(document).on("click",".writerNickname", function () {
			var mno = $(this).parent().parent().parent().children().eq(0).val();
			location.href="mpViewProfile.do?mno="+mno
		});
	</script>
	<script type="text/javascript">
		// cate hover
		$(".cate_li").hover(function () {
			$(this).css('cursor','pointer').css('background-color','black').css('color','white');
		}, function () {
			$(this).css('background-color','white').css('color','black');
		});
		
		// 클릭시 이동
		$(".cate_li").click(function () {
			var cate = $(this).text();
			console.log(cate);
			location.href="pNavSearch.do?type=4&keyword="+cate;
		});
	</script>

</body>
</html>