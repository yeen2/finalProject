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
						<td>자유게시판</td>
						<td colspan="6">${ b.enrollDate }</td>
						<td><a href="#eexampleModal" data-toggle="modal">신고</a></td>
					</tr>
					<hr>
					<tr>
						<th><h4>${ b.title }</h4></th>
					</tr>
					<tr>
						<td colspan="1">작성자 &nbsp;${ b.nickName }</td>
						<!-- 작성자 -->
						<td>조회수 &nbsp;${ b.count }</td>
						<!-- 조회수 -->
						<td>추천수 &nbsp;${ b.likeCount }</td>
						<!-- 추천수 -->
					</tr>
				</table>
				<hr>

				<div id="writeviewArea"
					style="height: auto; width: 80%; padding-bottom: 80px;">
					<p style="height: auto; margin-left: 20px; margin-top: 40px;">${ b.content }</p>
				</div>

				<div id="best" align="center">
					<button type="button" class="btn btn-warning" id="likeBtn"
						style="text-align: center;">Like <b id="likeCnt">${ b.likeCount }</b>
					</button>
				</div>

				<div id="UDbtnArea">
					<c:if test="${ loginUser.mno eq b.mno }">
						<button type="button" class="btn btn-light detail" id="btnUpdate"
							style="float: right;"
							onclick="location.href='bupateView.do?bno=${ b.bno }';">수정</button>
						<button type="button" class="btn btn-light detail" id="btnDelete"
							style="float: right; margin-right: 5px;"
							onclick="location.href='bdelete.do?bno=${ b.bno }';">삭제</button>
					</c:if>
					<button type="button" class="btn btn-light detail" id="btnList"
						style="float: right; margin-right: 5px;"
						onclick="location.href='blist.do';">목록으로</button>
				</div>
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
						<span><strong style="font-size: 20px;">댓글</strong></span>&nbsp;<span
							id="rCnt" style="color: orange; font-size: 30px;"></span>
					</div>
					<table class="replylistArea">
						
						<tr>
							<td>
								<img alt="check"
								src="${pageContext.request.contextPath}/resources/assets/img/board/icons8-checkmark-40.png">
							</td>
							<td>
								<strong style="font-size: 15px;">댓글 쓰기</strong>
							</td>
						</tr>

						<tr>
							<td><img style="height: 62px; width: 60px; margin-right: 10px; border-radius: 2.5em;"
								src="${pageContext.request.contextPath}/resources/upload/member/profile.png"
								alt="member">
							</td>
							
							<td>
								<div id=replytextArea>
									<textarea rows="3" cols="80" id="comment" name="comment" 
								 		style="resize: none;" placeholder="댓글을 작성해주세요">
									</textarea>
								</div>
							</td>
							<td>
								<div class="replyBtn">
									<button class="btn btn-light" id="rBtn"
										style="width: 80px; height: 67px; margin-left: 10px;">등록</button>
								</div>
							</td>
						</tr>
					</table>
					<br>
					
					<!-- 댓글 달리는 div -->
					<div class="reply-comment" id="reply-comment">
						<%-- <img src="${pageContext.request.contextPath}/resources/assets/img/board/icons8-sun-64.png"
							alt="member">
						<textarea rows="3" cols="80" id="comment" name="commnet" style="resize: none;"></textarea> --%>
						<!-- <a href="" style="text-decoration: none; display: none;"
							id="a-update">수정</a> 
						<a href="" style="text-decoration: none; display: none;" 
						    id="a-delete">삭제</a> -->
					</div>
				</div>
			</form>
		</div>
	</div>
	<br>
	<br>
	
	<!-- the 신고 modal -->
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

								<form action="insertbDeclare.do" method="post" id="declare_form">
									<div class="modal-body">
										<div class="form-group">
											<label for="d_category">신고항목</label> <select
												name="d_category" class="form-control" id="d_category">
												<option value="0">----</option>
												<option value="1">불법광고</option>
												<option value="2">도배</option>
												<option value="3">음란물</option>
												<option value="4">욕설</option>
												<option value="5">개인정보침해</option>
												<option value="6">욕설</option>
												<option value="7">기타</option>
											</select>
										</div>
										<div class="form-group">
											<label for="content">신고내용</label>
											<textarea name="content" style="height: 180px"
												class="form-control" id="declare_content">
											</textarea>
										</div>

										<div>
											<input type="checkbox" name="declare_check" id="declare_check"> 
											<label for="declare_check">신고 동의시 체크해주세요.</label>
										</div>
										
										<input type="hidden" name="mno" value="${loginUser.mno }">
										<input type="hidden" name="bno" value="${b.bno}"> 
										<input type="hidden" name="dcategory" id="dcategory">
									</div>

									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
										<button type="submit" class="btn btn-success" id="declareBtn">신고</button>
									</div>
								</form>
							</div>
						</div>
					</div>
	
	
	<jsp:include page="../includes/footer.jsp"/>

	<script>
		// 삭제시 이벤트
		
		
		
		
		// 신고 이벤트
		$("#declareBtn").attr("disabled", true);

		// 신고동의 체크
		$("#declare_check").on("click", function() {
			if ($("input:checkbox[name='declare_check']").is(":checked")) {
				$("#declareBtn").removeAttr("disabled");
			} else {
				$("#declareBtn").attr("disabled", true);
			}
		});

		// 신고버튼	
		$("#declareBtn").click(function() {
			var d_category = $("#d_category").val();
			var content = $("#declare_content").val();
			var cate = $("#d_category option:selected").text();


			console.log("cate는 : " + cate);

			$("#dcategory").val(cate);

			return;
			
			console.log("category에는 : " + $("#dcategory").val());

			if (d_category == 0) {
				
				alert("신고유형을 선택해 주세요");
				$('#eexampleModal').modal();
				return false;
			}

			if (d_category == 7) {
				
				if (content.length == 0) {
					alert("신고내용을 입력해주세요");
					$('#eexampleModal').modal();
					return false;
				}
			}

		});

		

	/* ******************************************* 추천 ******************************************** */
		// 추천이벤트
		function getbLikeCount(){
		
			$.ajax({
				url:"blikeCount.do",
				data:{bno:${b.bno}},
				type:"get",
				success:function(data){
					$("#likeCnt").text(data);
					$("#tb_likeBtn").text(data);
				},
				error:function(){
					console.log("추천 ajax 통신 실패");
				}
			});
		};
		
		 $("#likeBtn").hover(function(){
			
			var loginLike;
			var mno = "${loginUser.mno}";
			
			if(mno == null || mno == ""){
				
				$(this).next().text("+1");
			
			}else{
				
				loginLike = blikeCheck(mno);
				
				if(loginLike == 0) {
					$(this).next().text("+1");
				}else{
					$(this).next().text("-1");
				}
			}
			
		}, function(){
			getbLikeCount();
		}); 
		
		
		// 버튼 클릭시 up,down
		$("#likeBtn").on("click", function(){
			
			var loginUser = "${loginUser.email}";
			
			if(loginUser == null || loginUser == ""){
				alert("로그인 후 이용 가능합니다.");
				
				return;
				
			}else{
				var mno = "${loginUser.mno}";
				//var loginLike = blikeCheck(mno);
				
				
				// 회원이 추천을 했는지 않했는지 체크
				$.ajax({
					url:"blikeCheck.do",
					data:{bno:${b.bno},
						 mno:mno},
					type:"get",
					success:function(data){
						
						console.log(data);
						check = data;
						
						loginLike = data;
						//return data;
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				}).done(function(){	
					
					console.log("loginLike" + loginLike);
					
					if(loginLike == '0'){	// *********************추천 up
						$.ajax({
							url:"binsertLike.do",
							data:{bno:${b.bno},
								  mno:mno},
							type:"get",
							success:function(like){
								if(like == 'success'){
									getbLikeCount();
									console.log("추천 up 성공");
								}else{
									console.log("추천 up 실패");
								}
							},
							erorr:function(){
								console.log("추천 ajax 서버 통신 실패");
							}
						});
						
					}else{	// *****************추천 down
						
						$.ajax({
							url:"bdeleteLike.do",
							data:{bno:${b.bno},
								  mno:mno},
							type:"get",
							success:function(like){
								
								if(like == 'success'){
									
									console.log("추천 down 성공");
									getbLikeCount();
									
								}else{
									console.log("추천 down 실패");
								}
							},
							error:function(){
								console.log("추천 ajax 서버 통신 실패");
							}
						});
					}
					
					
				});
				
				
			}
			
		});
		
		//var mno = ${ loginUser.mno };
		
		//로그인 추천 check
		function blikeCheck(mno){
			check = 0;
			
			$.ajax({
				url:"blikeCheck.do",
				data:{bno:${b.bno},
					 mno:mno},
				type:"get",
				success:function(data){
					
					console.log(data);
					check = data;
					
					return data;
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		};
		
/* *********************************************** 댓글 ********************************************* */
		//댓글 수정,삭제 이벤트
		$(".otherDiv").mouseover(function(){
			$(this).children('a').show();
			console.log("들어오나?");
		}).mouseleave(function(){
			$(this).children('a').hide();
		});
		
		//댓글 작성
		$(function(){
			getReplyList();
			
			 setInterval(function(){
				getReplyList();
			}, 50000 ); 
			
			//console.log("들어오나?");
			/* $("#rBtn").on("click", function(){
				var loginUser = "${loginUser.mno}";
				
				if(loginUser == null || loginUser == ""){
					alert("로그인 후 이용 가능합니다.");
					return;
					
				}else{
					$("#rBtn").attr("disabled", false);
				}
			}); */
			
			$("#rBtn").on("click", function(){
				
				var loginUser = "${loginUser.mno}";
				
				if(loginUser == null || loginUser == ""){
					alert("로그인 후 이용 가능합니다.");
					
					return;
					
				}/* else{
					$("#rBtn").attr("disabled", false);
				} */
				
				if($("#comment").val().length == 0){
					alert("댓글내용을 입력해 주세요");
				}else{
				
				var content = $("#comment").val();
				var bno = ${b.bno};
				var mno = "${loginUser.mno}";
				
				
				$.ajax({
					url:"rinsert.do",
					data:{content:content,
						  bno:bno,
						  mno:mno},
					success:function(data){
						
						if(data == "success"){
							getReplyList();
							$("#comment").val("");
						}else{
							alert("댓글 작성 실패");
						}
					},
					error:function(){
						console.log("댓글 ajax 실패");
					}
					
				});
				
			   }
			});
			
		});
		
		// 댓글 리스트
		function getReplyList(){
			//console.log("들어오나?");
			$.ajax({
				url:"replyList.do",
				data:{bno:${b.bno}},
				dataType:"json",
				success:function(data){
					
					$replyOuter = $("#reply-comment");
					$replyOuter.html("");
					//$replyDiv.html("");
					
					$("#rCnt").text(data.length);
					
					if(data.length > 0){	// 댓글이 있을때
						
						$.each(data, function(index, value){
							
							$replyOuter = $("#reply-comment");
							
							$replyDiv = $("<div class='form-inline replyDiv' style='margin-right:150px;'></div>");
							
							$imgDiv = $("<div class='form-group imgDiv'></div>");
							$img = $("<img class='reply_img' style='border-radius: 2.5em; height: 62px; width: 60px; margin-right: 10px;'>").attr("src","${pageContext.request.contextPath}/resources/upload/member/profile.png");
							
							$modifyDiv = $("<div class='form-inline modifyDiv' style='display:none;'></div>");
							$contentDiv = $("<div class='form-group contentDiv'></div>");
							$otherDiv = $("<div class'form-inline otherDiv' style='margin-right:150px;'></div>");
							
							$modify_textarea = $("<textarea class='modifyContent'></textarea>");
							$modify_a = $("<a class='modify_a' id='modify_a'>등록</a>");
							$nickname = $("<b class='nickname' style='margin-left:75px;'></b>").text(value.nickName);
							$rcontent = $("<span id='rcontent' class='rcontent' style='margin-left: 5px;'></span>").html(value.content);
							
							$update_a = $("<a id='a-update'style='text-decoration: none; float:right;' href='rupdate.do'>수정</a>");
							$delete_a = $("<a id='a-delete' style='text-decoration: none; margin-right:10px; float:right;' href='rdelete.do'>삭제</a>");
							$date = $("<span class='col-sm-2 date'></span>").text(value.enrollDate);
							
							$imgDiv.append($img);
							$contentDiv.append($rcontent).append('<br>');
							$otherDiv.append($update_a).append($delete_a);
							$modifyDiv.append($modify_textarea).append($modify_a);
							
							$replyDiv.append($imgDiv).append($contentDiv).append($modifyDiv).append("<br>");
							
							$replyOuter.append($nickname).append($date).append("<br>").append($replyDiv).append($otherDiv).append("<br><br>");
						
						});
						
					}else { // 댓글 없을때
						
						$replyOuter = $("#reply-comment");
						$replyOuter.append("<span>등록된 댓글이 없습니다.</span>");
						
					}
					
				},
				error:function(data){
					console.log("댓글 ajax 통신 실패");
				}
				
			});
		}
		/* 
		//댓글 수정폼
		
		$(document).("click","#a-update", function(){
			//var r_form = $(this).parents("#contentDiv").children("#rcontent").eq(0).text();
			
			//var r_modifyForm = $(this).parents("modifyDiv").children(".modifyContent").eq(0).text();
			$(this).parent().("")
			
		});
		
		$(document).("click","")
		
		
		//댓글 수정
		
		function rupdateProc(brno){
		    var updateContent = $('[name=content_'+brno+']').val();
		    
		    $.ajax({
		        url:'rupdate.do',
		        type:'post',
		        data:{'content' : content, 
		        		'brno' : brno},
		        success : function(data){
		            if(data == 1) 
		            	getReplyList(); //댓글 수정후 목록 출력 
		        }
		    });
		} */

	</script>
	
</body>
</html>