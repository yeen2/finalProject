<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패션 게시판</title>
<style>
.detailOuter {
	width: 1000px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
	overflow: auto;
}

#titleArea {
	width: 100%;
	border-collapse: separate;
	border-spacing: 20px;
}

.btn btn-warning {
	margin: 0 auto;
}
/* .reply-comment{
	display: none;
} */
.detailOuter{font-size: 13px;}
#UDbtnArea{margin-top: 20px;}
</style>
</head>
<body>

	<jsp:include page="../includes/header.jsp"/>

	<div class="detailOuter">

		<div class="detail content">
				<table id="titleArea">
					<tr>
						<td>패션정보게시판</td>
						<td colspan="6">${ fb.enrollDate }</td>
					</tr>
					<hr>
					<tr>
						<th colspan="3"><h4>${ fb.title }</h4></th>
					</tr>
					<tr>
						<!-- 작성자 -->
						<td>${ fb.nickName }</td>
						<td> ㅣ </td>
						<td>조회수 &nbsp;${ fb.count }</td>
					</tr>
				</table>
				<hr>

				<div id="writeviewArea"
					style="height: auto; width: 80%; padding-bottom: 80px;">
					<div style="height: auto; margin-top: 40px;"><p style="margin: auto;">${ fb.content }<p></div>
				</div>


			<div id="UDbtnArea">
				<c:if test="${ loginUser.mno eq fb.mno }">
					<button type="button" class="btn btn-light detail" id="btnUpdate"
						style="float: right;"
						onclick="location.href='fbupateView.do?fbno=${ fb.fbno }';">수정</button>
					<button type="button" class="btn btn-light detail" id="btnDelete"
						style="float: right; margin-right: 5px;"
						onclick="location.href='fbdelete.do?fbno=${ fb.fbno }';">삭제</button>
				</c:if>
				<button type="button" class="btn btn-light detail" id="btnList"
					style="float: right; margin-right: 5px;"
					onclick="location.href='fblist.do';">목록으로</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="../includes/footer.jsp"/>
</body>
</html>