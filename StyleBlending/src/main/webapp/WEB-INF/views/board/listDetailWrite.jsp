<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
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
			<form id="form1" name="form1" method="post" action="">
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
				<input type="text" class="form-control" id="write-title"
					placeholder="제목을 입력하세요">
			<br><br>

		</div>
		<br>
		<br>

		<div class="write-inputArea" style="width:auto;">
			<h4>내용</h4>
			<textarea id="content" name="content" rows="3" cols="80"
				placeholder="내용을 입력하세요">안녕하세요~</textarea>
			<br><br>

		</div>
			<div id="btnArea" style="margin-bottom: 30px; text-align:center;">
				<input type="hidden" name="member_bno" value="">
				<button type="button" class="btn btn-light btn-lg" id="btncheck">작성</button>
				<button type="button" class="btn btn-light" id="btnList" style="float: right;">목록</button>
			</div>
	</div>
	
	
		<jsp:include page="../includes/footer.jsp"/>


		<script>
			//목록 버튼
			$(function() {
				$("#btnList").click(function() {
					location.href = "${pageContext.request.contextPath}/views/board/list.jsp";
				});
			});

			
			//수정 버튼
			
			$(function() {
				$("#btnUpdate").click(
					function() {
						//첨부파일 이름들을 폼에 추가
						var str = "";
						$("#uploadedList .file")
								.each(function(i) {
									str += "<input type='hidden' name='files["
											+ i
											+ "]' value='"
											+ $(this).val()
											+ "'>";
										});
						$("#form1").append(str);
						document.form1.action = "${path}/board/update.do";
						document.form1.submit();
					});
			});

			//삭제 버튼
			$(function() {
				$("#btnDelete").click(function() {
					if (confirm("삭제하시겠습니까?")) {
						document.form1.action = "${path}/board/delete.do";
						document.form1.submit();
					}
				});
			});

			listAttach();
		</script>

		<script type="text/javascript">
		$(function(){
			CKEDITOR.replace('content',{
				filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
			});
		});
		</script>

</body>
</html>