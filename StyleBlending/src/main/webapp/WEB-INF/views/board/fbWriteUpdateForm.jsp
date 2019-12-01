<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패션정보게시판 수정하기</title>
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
		<h2>게시물 수정</h2>
		<br>

		<form id="form1" name="form1" method="post" action="fbupdate.do">
			<div class="writeArea">
				<h4>게시판 분류</h4>
				<br>
				<div class="form-group">
					<select name="bcategory" class="custom-select" style="width: 400px;">
						<option selected>분류</option>
						<option value="freeboard">자유게시판</option>
						<option value="fashionboard ">패션 정보 게시판</option>
					</select>
				</div>
			</div>
			<br>
			<div>
				<h4>제목</h4>
				<br> <input type="text" class="form-control" id="write-title"
					name="title" placeholder="제목을 입력하세요" value="${ fb.title }"> <br> <br>
				<input type="hidden" name="bno" value="${ fb.fbno }">
			</div>
			<br> <br>
			<div class="write-inputArea" style="width: auto;">
				<input type="hidden" name="mno" value="${ loginUser.mno }">
				<h5>내용</h5>
				
				<textarea id="content" name="content" rows="3" cols="80" placeholder="내용을 입력하세요">${ fb.content }</textarea>
				<br> <br>

			</div>
			<div id="btnArea" style="margin-bottom: 30px; text-align: center;">
				<button type="submit" class="btn btn-light btn-lg" id="btncheck">수정</button>
				<button type="button" class="btn btn-light" id="btnList"
					style="float: right;" onclick="location.href='fblist.do';">목록</button>
			</div>
		</form>
	</div>


	<jsp:include page="../includes/footer.jsp"/>

	<script type="text/javascript">

	//id가 content인 태그에 ckeditor를 적용
	CKEDITOR.replace("content", {
		height:500,
		filebrowserUploadUrl : "/styleblending/imageUpload.do",
	}); 
	
	
	</script>	

</body>
</html>