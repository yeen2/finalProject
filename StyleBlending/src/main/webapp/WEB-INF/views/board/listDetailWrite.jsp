<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
.writeOuter {
	width: 900px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}

</style>
</head>
<body>

	<jsp:include page="../includes/header.jsp"/>


	<div class="writeOuter">
		<h2>게시물 작성</h2>
		<br>

		<div class="writeArea">
			<form id="form1" name="form1" method="post" action="binsertForm.do">
				<h3>게시판</h3>
				<br>
				<div class="form-group">
					<select class="custom-select" style="width: 400px;">
						<option selected>분류</option>
						<option value="freeboard">자유게시판</option>
						<option value="fasionboard">패션 정보 게시판</option>
					</select>
				</div>
			</form>
		</div>
		<br>
		<div>
			<h3>제목</h3>
			<br>
				<input type="text" class="form-control" id="write-title" name="title" placeholder="제목을 입력하세요">
			<br><br>

		</div>
		<br>
		<br>

<form action="dlendud.do" method="post">
		<div class="write-inputArea" style="width:auto;">
			<h4>내용</h4>
			<textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">안녕하세요~</textarea>
			<br><br>

		</div>
			<div id="btnArea" style="margin-bottom: 30px; text-align:center;">
				<input type="hidden" name="member_bno" value="">
				<button type="submit" class="btn btn-light btn-lg" id="btncheck">작성</button>
				<button type="button" class="btn btn-light" 
					id="btnList" style="float: right;" onclick="location.href='blist.do';">목록</button>
			</div>
</form>
	</div>

	
		<jsp:include page="../includes/footer.jsp"/>

	<script type="text/javascript">

	//id가 content인 태그에 ckeditor를 적용
	CKEDITOR.replace("content", {
		height:300,
		filebrowserUploadUrl : "/styleblending/imageUpload.do",
	}); 
	
	
	</script>	
	
</body>
</html>