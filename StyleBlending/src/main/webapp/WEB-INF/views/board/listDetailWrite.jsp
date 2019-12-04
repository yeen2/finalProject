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

		<form id="form1" name="form1" method="post" action="binsert.do" enctype="multipart/form-data" >
			<div class="writeArea">
				<h4>게시판 분류</h4>
				<br>
				<div class="form-group">
					<select id="bcategorys" name="bcategory" class="custom-select" style="width: 400px;">
						<option value="none" selected>분류</option>
						<option value="freeboard">자유게시판</option>
						<option value="fashionboard">패션 정보 게시판</option>
					</select>
				</div>
			</div>
			<br>
			<div>
				<h4>제목</h4>
				<br> <input type="text" class="form-control" id="write-title"
					name="title" placeholder="제목을 입력하세요"> <br> <br>

			</div>
			<br> <br>
			<div class="write-inputArea" style="width: auto;">
				<input type="hidden" name="mno" value="${ loginUser.mno }">
				
				<h5>내용</h5>
				
				<textarea id="content" class="free-board-content" name="content" rows="3" cols="80">${ b.content }</textarea>
				
				<script>
				CKEDITOR.replace("content", {
					height:500,
					filebrowserUploadUrl : "/styleblending/imageUpload.do",
				});
				</script>
				<br> <br>

			</div>
			<div id="btnArea" style="margin-bottom: 30px; text-align: center;">
				<button type="submit" class="btn btn-light btn-lg" id="btncheck">작성</button>
				<button type="button" class="btn btn-light" id="btnList"
					style="float: right;" onclick="location.href='blist.do';">목록</button>
			</div>
		</form>
	</div>


	<jsp:include page="../includes/footer.jsp"/>

	<script>

	//id가 content인 태그에 ckeditor를 적용
	 CKEDITOR.replace("content", {
		height:500,
		filebrowserUploadUrl : "/styleblending/imageUpload.do",
	});
	
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btncheck").click(function() {
			if(CKEDITOR.instances.content.getData().length < 10){
				alert("내용을 10자이상 적으세요",function(){
					setTimeout(function(){
						CKEDITOR.instances.content.setDate("");
					}, 100);
					CKEDITOR.instances.content.focus();
				},"warning");
				return false;
			}
			
		}); 
	});
	
	</script>
	
	
</body>
</html>