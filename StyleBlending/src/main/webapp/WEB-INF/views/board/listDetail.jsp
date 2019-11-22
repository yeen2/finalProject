<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
<style>
.detailOuter {
	width: 900px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
	overflow: auto;
}

#titleArea {
	border-collapse: separate;
	border-spacing: 20px;
}

.btn btn-warning {
	margin: 0 auto;
}
.reply-comment{
	display: none;
}
.detailOuter{font-size: 13px;}
#UDbtnArea{margin-top: 20px;}
</style>
</head>
<body>

	<jsp:include page="../includes/header.jsp"/>

	<div class="detailOuter">

		<div class="detail content">
			<form action="" method="GET">
				<table id="titleArea">
					<tr>
						<td>자유게시판</td>
						<td colspan="6">${ b.enrollDate }</td>
						<td><a href="#eexampleModal" data-toggle="modal">신고</a></td>
					</tr>
					<hr>
					<tr>
						<th><h4>${ b.title }</h4></th>
					</tr>
					<tr>
						<td colspan="2">작성자 ${ b.mno }</td>
						<!-- 작성자 -->
						<td>조회수 ${ b.count }</td>
						<!-- 조회수 -->
						<td>추천수 ${ b.likeCount }</td>
						<!-- 추천수 -->
						<td>댓글수 ${ r.brno }</td>
						<!-- 댓글 -->
					</tr>
				</table>
				<hr>

				<div id="writeviewArea"
					style="height: auto; width: 80%; padding-bottom: 80px;">
					<p style="height: auto; margin-left: 20px; margin-top: 40px;">${ b.content }</p>
				</div>

				<div id="best" align="center">

					<c:choose>
						<c:when test="${ mno ne null }">
							<button type="button" class="btn btn-warning" id="lickUp"
								style="text-align: center;" onclick="location.href='like';">추천
								${ b.likeCount }</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btn-warning" id="likeDown"
								style="text-align: center;"
								onclick="location.href='login_need';">추천 ${ b.likeCount }</button>
						</c:otherwise>
					</c:choose>
				</div>

				<div id="UDbtnArea">
					<c:if test="${ loginUser.mno eq b.mno }">
						<button type="button" class="btn btn-light detail" id="btnUpdate"
							style="float: right;"
							onclick="location.href='bupdate.do?bno=${ b.bno }';">수정</button>
						<button type="button" class="btn btn-light detail" id="btnDelete"
							style="float: right; margin-right: 5px;"
							onclick="location.href='bdelete.do?bno=${ b.bno }';">삭제</button>
					</c:if>
					<button type="button" class="btn btn-light detail" id="btnList"
						style="float: right; margin-right: 5px;"
						onclick="location.href='blist.do';">목록으로</button>
				</div>
			</form>
		</div>
		<br><br>
		<hr>
		<br>

		<!-- 로그인시 댓글 사용가능 -->
		<div class="replyArea">
			<form id="replylistForm" name="replylistForm" method="post">
				<div class="replylist">
					<br>
					<div>
						<span><strong style="font-size: 20px;">댓글</strong></span>&nbsp; <span
							id="rCnt" style="color: yellow; font-size: 30px;">1</span>
					</div>
					<table class="replylistArea">
						<tr>
							<td><img alt="check"
								src="${pageContext.request.contextPath}/resources/assets/img/board/icons8-checkmark-40.png"></td>
							<td><strong style="font-size: 15px;">댓글 쓰기</strong></td>
						</tr>

						<tr>
							<td><img
								src="${pageContext.request.contextPath}/resources/assets/img/board/icons8-sun-64.png"
								alt="member"></td>
							<td><textarea rows="3" cols="80" id="comment" name="comment"
									style="resize: none;"></textarea></td>
							<td>
								<div class="replyBtn">
									<button class="btn btn-light"
										style="width: 80px; height: 67px; margin-left: 10px;">등록</button>
								</div>
							</td>
						</tr>
					</table>
					<br>

					<!-- the modal -->
					<div aria-labelledby="eexampleModal" class="modal fade"
						id="eexampleModal" role="dialog" tabindex="-1">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModal">신고창</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">신고합니다~</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">닫기</button>
									<button type="button" class="btn btn-success declare">신고</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 댓글 달리는 div -->
					<div class="reply-comment">
						<img
							src="${pageContext.request.contextPath}/resources/assets/img/board/icons8-sun-64.png"
							alt="member">
						<textarea rows="3" cols="80" id="comment" name="commnet"
							style="resize: none;"></textarea>
						<a href="" style="text-decoration: none; display: none;"
							id="a-update">수정</a> <a href=""
							style="text-decoration: none; display: none;" id="a-delete">삭제</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<br>
	<br>
	
	<jsp:include page="../includes/footer.jsp"/>
	
	<script>
		// 삭제시 이벤트
		
		
		//댓글 수정,삭제 이벤트
		$(".reply-comment").mouseover(function(){
			$(this).children('a').show();
		}).mouseleave(function(){
			$(this).children('a').hide();
		});
		
		//댓글 ajax
		$(function(){
			getReplyList();
			
			$("#rBtn").on("click", function(){
				
				var content = $("#comment").val();
				var bno = ${ b.bno };
				var mno = "${loginUser.mno}";
				
				$.ajax({
					url:"rinsert.do",
					data:{content:content,
						  bno:bno,
						  mno:mno},
					success:function(data){
						
						if(data== 'success'){
							getReplyList();
							$("#comment").val("");
						}else{
							alert("댓글 작성 실패");
						}
					},
					error:function(data){
						console.log("댓글 ajax 실패");
					}
					
				});
				
			});
			
		});
		
		
		function getReplyList(){
			
			$.ajax({
				url:"replyList.do",
				data:{mno:${b.mno}},
				dataType:"json",
				success:function(data){
					
					$div1 = $(".reply-comment")
					$div1.html("");
					
					$("#rCnt").text(data.length);
					
					if(data.length > 0){
						
						$each(data, function(index, value){
							$div2 = $("<div></div>")
							
							$img = $("<img src='${pageContext.request.contextPath}/resources/upload/member/${ b.renameImg }';");
							$textarea = $("<textarea></textarea>").text(value.content);
							$date = $("<p></p>").text(value.enrollDate);
							
							$div2.append($img);
							$div2.append($textarea);
							$div2.append($date);
							
							$div1.append($div2);
							
						});
					}else {
						
						$div = $("<div></div>");
						
						$h5 = $("<h5></h5>").text("등록된 댓글이 없습니다.");
						
						$div.append($h5);
					}
					
				},
				error:function(data){
					console.log("댓글 ajax 통신 실패")
				}
				
			});
		}
	</script>
	
</body>
</html>