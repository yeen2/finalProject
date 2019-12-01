<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free Board</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.detailOuter{width: 900px; height:auto; margin-left: auto; margin-right: auto; margin-top: 150px;}
	#readBtn{float: right;}
	.detailOuter{font-size: 13px !important;}
	
</style>
</head>
<body>

	<jsp:include page="../includes/header.jsp"/>
	
	<div class="detailOuter">
		<h4>자유게시판 </h4>

		<br>
		<div class="form-group" style="float: left; width: 200px;">
				<select class="custom-select" onchange="location.href=this.value">
					<option selected>분류</option>
					<option value="blist.do">자유게시판</option>
					<option value="fblist.do">패션정보게시판</option>
				</select>
		</div>
		<br><br>
		
		<table class="table table-hover">
			<tr>
				<th>No.</th>
				<th style="text-align: center;">제목</th>
				<th>글쓴이</th>
				<th>조회수</th>
				<th>날짜</th>
				<th>추천수</th>
			</tr>
			
			<c:forEach items="${ list }" var="b">
			<tr>
				<td>${ b.bno }</td>
				<td style="width: 430px; text-align: center;">
				<a style="text-decoration: none; color: black;" href="bdetail.do?bno=${ b.bno }">${ b.title }</a>
				</td>
				<td>${ b.nickName }</td>
				<td>${ b.count }</td>
				<td>${ b.enrollDate }</td>
				<td>${ b.likeCount }</td>
			</tr>
			</c:forEach>
			
		</table>
		<div class="">
		<!-- 검색 -->
		<div id="searchArea" align="center" style="margin-top: 50px;">
			<form action="blist.do" method="get" id="searchForm">
			
 				<input type="text" class="form-control input-sm" name="search" id="searchInput" placeholder="검색어를 입력해주세요" 
 						style="width: 300px; float: left;">
 				
					<select class="custom-select" name="type" id="selected-type" style="width: 100px; float: left; margin-left: 10px;">
							<option value="title">제목</option>
							<option value="writer">작성자</option>
							<option value="content">내용</option>	
					</select>
					
				<button class="btn btn-primary btn-sm" id="searchBtn" type="submit" 
						style="float: left; margin-left: 10px; height:38px;">검색하기</button>
			</form>
		</div>

		<div id="readBtn">
			<c:if test="${ !empty loginUser }">
			<button class="btn btn-primary btn-sm" id="write" type="submit"
					style="height: 38px;"
					onclick="location.href='binsertForm.do';">글쓰기</button>
			</c:if>
		</div>
		</div>
		
		<!-- 검색  -->
		<!-- <script type="text/javascript">
			$("searchBtn")on("click", function(){
				
				var searchType = ${"#selected-type"}
			});
		</script> -->
		
		
		<!-- 페이징  -->
		<br><br>
		
		<div class="pagingArea" style="margin-top: 50px; margin-bottom: 50px;">
			<ul class="pagination" style="justify-content: center;">
				<li class="page-item disabled">
				<!-- 이전 --> <!-- 수정중 -->
					<c:if test="${ pi.currentPage eq 1 }">
						<i class="fas fa-long-arrow-alt-left"></i>
					</c:if>
					<c:if test="${ pi.currentPage ne 1 }">
						<c:url value="blist.do" var="before">
							<c:param name="currentPage" value="${ pi.currentPage-1 }"/>
						</c:url>
						<a class="page-link" href="${ before }"><i class="fas fa-long-arrow-alt-left"></i></a>
					</c:if>
				</li>
				<!-- 페이지  -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<li class="page-item active">
						<c:if test="${ p eq pi.currentPage }">
							<a class="page-link" href="#a">${ p }</a>
						</c:if>
						<c:if test="${ p ne pi.currentPage }">
							<c:url value="blist.do" var="page">
								<c:param name="currentPage" value="${ p }"/>
							</c:url>
							<a class="page-link" href="${ page }">${ p }</a>
						</c:if>
					</li>
				</c:forEach>
				
				<!-- 다음 -->
				<li class="page-item">
					<c:if test="${ pi.currentPage eq pi.maxPage }">
						<i class="fas fa-long-arrow-alt-right"></i>
					</c:if>
					<c:if test="${ pi.currentPage ne pi.maxPage }">
						<c:url value="blist.do" var="last">
							<c:param name="currentPage" value="${ pi.currentPage+1 }"/>
						</c:url>
						<a class="page-link" href="${ last }"> <i class="fas fa-long-arrow-alt-right"></i></a>
					</c:if>
				</li>
			</ul>
		</div>
	</div>
	
	<jsp:include page="../includes/footer.jsp"/>
	
	
	<!-- <script type="text/javascript">
		$("#searchBtn").keydown(function(){
			location.href=""
		});
	</script> -->
	
</body>
</html>