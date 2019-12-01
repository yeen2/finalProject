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
	width: 1010px;
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



@import url(https://fonts.googleapis.com/css?family=Oswald);
@import url(https://fonts.googleapis.com/css?family=Quattrocento);
.snip1361 {
  font-family: 'Quattrocento', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #141414;
  text-align: left;
  line-height: 1.4em;
  font-size: 16px;
}
.snip1361 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
.snip1361 img {
  max-width: 100%;
  vertical-align: top;
}
.snip1361 figcaption {
  position: absolute;
  top: calc(77%);
  width: 100%;
  background-color: #ffffff;
  padding: 15px 25px 65px;
}
.snip1361 figcaption:before {
  position: absolute;
  content: '';
  z-index: 2;
  bottom: 100%;
  left: 0;
  width: 100%;
  height: 50px;
  background-image: -webkit-linear-gradient(top, transparent 0%, #ffffff 100%);
  background-image: linear-gradient(to bottom, transparent 0%, #ffffff 100%);
}
.snip1361 h3,
.snip1361 p {
  margin: 0 0 10px;
}
.snip1361 h3 {
  font-weight: 300;
  font-size: 1.4em;
  line-height: 1.2em;
  font-family: 'Oswald', Arial, sans-serif;
  text-transform: uppercase;
}
.snip1361 p {
  font-size: 0.9em;
  letter-spacing: 1px;
  opacity: 0.9;
}
.snip1361 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 2;
}
.snip1361:hover figcaption,
.snip1361.hover figcaption {
  top: 80px;
}
</style>
</head>
<body>
	<jsp:include page="../includes/header.jsp"/>

	<div class="fashionListOuter">

		<div class="container">
			<br>
			<h4 style="cursor: pointer;" onclick="location.href='fblist.do';">패션 정보 게시판</h4>
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
			
			<c:forEach items="${ list }" var="f">
				<div class="col-sm-6 col-md-3 line">
					<div class="thumbnail">
						<img src="" alt="..." 
							onclick="location.href='fbdetail.do?fbno=${ f.fbno }';" class="img-responsive img-thumbnail">
						<div class="caption">
							<h5 style="height: 40px;">${ f.title }</h5>
							<p style="margin-top: 20px;" id="writer">${ f.nickName }</p>
							<div class="date-count">
							<p id="createDate">${ f.enrollDate }</p>
							<p id="count">${ f.count }</p>
							</div>							
						</div>
					</div>
				</div>
			</c:forEach>
			
			<%-- <c:forEach items="${ list }" var="f">
				<figure class="snip1361"> 
				<img
					src="http://seoulfashionfestival.co.kr/wp-content/uploads/2019/04/sff2019_designer_heroine.jpg"
					alt="sample45" /> 
				<figcaption>
					<h3>${ f.title }</h3>
					<p>${ f.content }</p>	
				</figcaption>
				<a href="bdetail.do?bno=${ b.bno }"></a> 
			</figure>
			</c:forEach> --%>
				
			</div>
		</div>
		<br><br>
		<!-- 검색 -->
		<!-- <div id="searchArea" align="center">
			<form action="" method="get">
 				<input type="text" name="search" class="form-control" id="searchInput" placeholder="내용을 입력해주세요" style="width: 300px; float: left;">
					<select name="type" class="custom-select" style="width: 100px; float: left; margin-left: 10px;" >
						<option value="title">제목</option>
						<option value="writer">작성자</option>
						<option value="content">내용</option>
						<option value="reply">댓글</option>
					</select>
				<button class="btn btn-primary btn-sm" type="submit" style="float: left; margin-left: 8px; height: 38px;"  onclick="search();">검색하기</button>
			</form>
		</div> -->
		
		<!-- 검색 -->
		<div id="searchArea" align="center" style="margin-top: 50px;">
			<form action="fbsearch.do" method="get" id="searchForm">
						
					<c:if test="${ empty sc }">
						<input type="text" class="form-control input-sm" name="search"
							id="searchInput" placeholder="검색어를 입력해주세요"
							style="width: 300px; float: left;">
					</c:if>

					<c:if test="${ !empty sc }">
						<input type="text" class="form-control input-sm"
							value="${ search }" name="search" id="searchInput"
							placeholder="검색어를 입력해주세요" style="width: 300px; float: left;">
					</c:if>

					<c:if test="${ type eq 'title' }">
						<c:set var="tSelected" value="selected" />
					</c:if>
					<c:if test="${ type eq 'writer' }">
						<c:set var="wSelected" value="selected" />
					</c:if>
					<c:if test="${ type eq 'content' }">
						<c:set var="cSelected" value="selected" />
					</c:if>
					<select class="custom-select" name="type" id="selected-type" style="width: 100px; float: left; margin-left: 8px;">
							<option value="title" ${ tSelected }>제목</option>
							<option value="writer" ${ wSelected }>작성자</option>
							<option value="content" ${ cSelected }>내용</option>	
					</select>
					
					<button class="btn btn-primary btn-sm" id="searchBtn" type="submit" 
						style="float: left; margin-left: 8px; height:38px;">검색하기</button>
				</form>
			</div>

		<div id="readBtn">
			<c:if test="${ !empty loginUser }">
			<button class="btn btn-primary btn-sm" id="write" type="submit" style="float: right; height: 38px;"
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
						<i class="fas fa-long-arrow-alt-left"> </i>
					</c:if> 
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url value="fblist.do" var="before">
							<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						</c:url>
						<a class="page-link" href="${ before }"> <i class="fas fa-long-arrow-alt-left"></i></a>
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
				<li class="page-item">
					<c:if test="${ pi.currentPage eq pi.maxPage }">
						<i class="fas fa-long-arrow-alt-right"> </i>
					</c:if> 
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url value="fblist.do" var="last">
							<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						</c:url>
						<a class="page-link" href="${ last }"> <i class="fas fa-long-arrow-alt-right"></i></a>
					</c:if>
				</li>
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


	  function() {
		    $(this).removeClass("hover");
		  }
		);
	</script>
	
</body>
</html>