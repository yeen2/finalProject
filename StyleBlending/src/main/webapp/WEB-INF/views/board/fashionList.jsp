<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<select class="custom-select" onchange="location.href=this.value">
					<option selected>분류</option>
					<option value="blist.do">자유게시판</option>
					<option value="fblist.do">패션정보게시판</option>
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
							<h5>${ f.title }</h5>
							<p id="writer">${ f.mno }</p>
							<div class="date-count">
							<p id="createDate">${ f.enrollDate }</p>
							<p id="count">${ f.count }</p>
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
			<c:if test="${ !empty loginUser }">
			<button class="btn btn-primary btn-sm" id="write" type="submit" style="float: right;"
			onclick="location.href=location.href='binsertForm.do';">글쓰기</button>
			</c:if>
		</div>
		
		<!-- 페이징  -->
		<br><br>
		<div class="pagingArea" style="margin-top: 50px; margin-bottom: 30px;">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item disabled">
					<!-- 이전 --> <!-- 수정중 --> 
					<c:if test="${ pi.currentPage eq 1 }">
						<i class="fas fa-long-arrow-alt-left"></i>
					</c:if> 
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url value="fblist.do" var="before">
							<c:param name="currentPage" value="${ pi.currentPage-1 }" />
						</c:url>
						<a class="page-link" href="${ before }"><i
							class="fas fa-long-arrow-alt-left"></i></a>
					</c:if>
				</li>
				<!-- 페이지  -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<li class="page-item active">
						<c:if test="${ p eq pi.currentPage }">
							<a class="page-link" href="#a">${ p }</a>
						</c:if> 
						<c:if test="${ p ne pi.currentPage }">
							<c:url value="fblist.do" var="page">
								<c:param name="currentPage" value="${ p }" />
							</c:url>
							<a class="page-link" href="${ page }">${ p }</a>
						</c:if>
					</li>
				</c:forEach>

				<!-- 다음 -->
				<li class="page-item"><c:if test="${ pi.currentPage eq pi.maxPage }">
						<i class="fas fa-long-arrow-alt-right"></i>
					</c:if> <c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url value="fblist.do" var="last">
							<c:param name="currentPage" value="${ pi.currentPage+1 }" />
						</c:url>
						<a class="page-link" href="${ last }"> <i
							class="fas fa-long-arrow-alt-right"></i></a>
					</c:if></li>
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