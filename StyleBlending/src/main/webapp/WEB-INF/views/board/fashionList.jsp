<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="jquery/jquery-1.11.3.min.js"></script>
<script src="jquery/jquery-ui.js"></script>
<link href="jquery/jquery-ui.min.css" rel="stylesheet" type="text/css"> -->
<script src="http://code.jquery.com/jquery-3.4.1.js"></script>
<style>
.fashionListOuter {
	width: 900px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
	font-size: 13px !important;
}

body {padding-top: 20px;}
#readBtn{float: right;}
.thumbnail{height: 380px; margin-bottom: auto; margin-top: auto;}
.thumbnail img{height: 252px; margin-top: 10px;}
.col-sm-6 col-md-3{height: 360px;}
.line{padding-bottom: 20px; cursor: pointer;}
.caption h5 , p{text-align: center;}
.caption h5{padding-top: 10px;}
.caption #writer{margin-top: 15px;}
.date-count{padding-top: 10px;}
.date-count #createDate{float: left; padding-left: 20px;}
.date-count #count{float: right; padding-right: 20px;}
</style>
</head>
<body>
	<jsp:include page="../includes/header.jsp"/>

	<div class="fashionListOuter">

		<div class="container">
			<br>
			<h4>패션 정보 게시판</h4>
			<br>
			<div class="form-group" style="float: left; width: 200px;">
				<select class="custom-select" style="height: 32px;">
					<option selected>----</option>
					<option value="fredBoard">자유게시판</option>
					<option value="fashionInfo">패션정보게시판</option>
				</select>
			</div>
			<br><br>
			<hr>
			<br><br>
			<div class="row">
				<div class="col-sm-6 col-md-3 line">
					<div class="thumbnail ">
						<img src="${pageContext.request.contextPath}/resources/assets/img/board/정보1.jpg" alt="..." 
							onclick="location.href='${pageContext.request.contextPath}/views/board/listDetail.jsp';" class="img-responsive img-thumbnail">
						<div class="caption">
							<h5>f/w 신상품1</h5>
							<p id="writer">작성자</p>
							<div class="date-count">
							<p id="createDate">19.11.01</p>
							<p id="count">조회수</p>
							</div>							
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 line">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/resources/assets/img/board/e00f099626279f50d2fdfaa56f456132155509.jpg" alt="..." class="img-responsive img-thumbnail">
						<div class="caption">
							<h5>f/w 신상품2</h5>
							<p id="writer">작성자</p>
							<div class="date-count">
							<p id="createDate">19.11.01</p>
							<p id="count">조회수</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 line">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/resources/assets/img/board/f3ccdd27d2000e3f9255a7e3e2c48800120034.jpg" alt="..." class="img-responsive img-thumbnail">
						<div class="caption">
							<h5>제목</h5>
							<p id="writer">작성자</p>
							<div class="date-count">
							<p id="createDate">19.11.01</p>
							<p id="count">조회수</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 line">
					<div class="thumbnail">
						<img src="${pageContext.request.contextPath}/resources/assets/img/board/정보4.jpg" alt="" class="img-responsive img-thumbnail">
						<div class="caption">
							<h5>제목</h5>
							<p id="writer">작성자</p>
							<div class="date-count">
							<p id="createDate">19.11.01</p>
							<p id="count">조회수</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		<br><br>
		<!-- 검색 -->
		<div id="searchArea" align="center">
			<form action="" method="get">
 				<input type="text" class="form-control" id="searchInput" placeholder="내용을 입력해주세요" style="width: 300px; height: 32px; float: left;">
					<select class="custom-select" style="width: 100px; float: left; margin-left: 5px; height: 32px;" >
						<option selected>----</option>
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
						<option value="reply">댓글</option>
					</select>
				<button class="btn btn-primary btn-sm" type="submit" style="float: left; margin-left: 5px;" onclick="search();">검색하기</button>
			</form>
		</div>

		<div id="readBtn">
			<button class="btn btn-primary btn-sm" id="write" type="submit" style="float: right;"
			onclick="location.href='${pageContext.request.contextPath}/views/board/listDetailWrite.jsp';">글쓰기</button>
		</div>
		
		<!-- 페이징  -->
		<br><br>
		<div class="pagingArea" style="margin-top: 50px; margin-bottom: 30px;">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item disabled"><a class="page-link" href="#a"><i
						class="fas fa-long-arrow-alt-left"></i></a></li>
				<li class="page-item active"><a class="page-link" href="#a">1</a>
				</li>
				<li class="page-item"><a class="page-link" href="#a">2</a></li>
				<li class="page-item"><a class="page-link" href="#a">3</a></li>
				<li class="page-item"><a class="page-link" href="#a"><i
						class="fas fa-long-arrow-alt-right"></i></a></li>
			</ul>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp"/>
	
	
	<script>
	https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js
	
	$('.thumbnail').children('img').css('width','100%')
	//console.log($('.thumbnail').children('img').length);
	
	
	$(document).ready(function () {
	    $(".carousel").carousel();

	    $(window).resize(function () {
	        $(".carousel").carousel();
	    });
	});
	</script>
	

</body>
</html>