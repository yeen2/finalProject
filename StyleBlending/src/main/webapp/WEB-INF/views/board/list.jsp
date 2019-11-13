<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Free Board</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.detailOuter{width: 900px; height:auto; margin-left: auto; margin-right: auto; margin-top: 100px;}
	#readBtn{float: right;}
	.detailOuter{font-size: 13px !important;}
</style>
</head>
<body>

	<jsp:include page="../includes/header.jsp"/>
	
	<div class="detailOuter">
		<h4>자유게시판</h4>

		<br><br>
		
		<table class="table table-hover">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>조회수</th>
				<th>날짜</th>
				<th>추천수</th>
			</tr>
			<tr>
				<td>1</td>
				<td>xx 욕설,비방,분탕 절대금지  블랙처리!!</td>
				<td>관리자</td>
				<td>10</td>
				<td>2019.10.20</td>
				<td>2</td>
			</tr>
			<tr>
				<td>2</td>
				<td>xx 자유게시판 이용규칙 필수 지침!!</td>
				<td>관리자</td>
				<td>20</td>
				<td>2019.10.24</td>
				<td>4</td>
			</tr>
			<tr>
				<td>3</td>
				<td><a href="${pageContext.request.contextPath}/views/board/listDetail.jsp">오늘 입고온 데일리룩인데 어떤가요?</a></td>
				<td>누구냐</td>
				<td>15</td>
				<td>2019.11.01</td>
				<td>20</td>
			</tr>
		</table>
		<div class="">
		<!-- 검색 -->
		<div id="searchArea" align="center" style="margin-top: 50px;">
			<form action="" method="get">
 				<input type="text" class="form-control input-sm" id="searchInput" placeholder="내용을 입력해주세요" style="width: 300px; float: left; height: 32px;">
 				
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
			<button class="btn btn-primary btn-sm" id="write" type="submit" onclick="location.href='${pageContext.request.contextPath}/views/board/listDetailWrite.jsp';">글쓰기</button>
		</div>
		</div>
		<!-- 페이징  -->
		<br><br>
		<div class="pagingArea" style="margin-top: 50px; margin-bottom: 50px;">
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
	$(function() {
		$("#btnList").click(function() {
			location.href = "${pageContext.request.contextPath}/views/board/listDetail.jsp";
		});
	});
	</script>
</body>
</html>