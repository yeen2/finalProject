<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <script src="//cdn.ckeditor.com/4.13.0/standard/ckeditor.js"></script>
 --><title>Insert title here</title>
<style>
invest_table .title .date {
	color: #cbcbcb;
	font-size: .7rem;
}

.invest_table .title {
	padding: 15px 40px 15px 15px;
	color: #4f4f4f;
	position: relative;
	line-height: 1.2rem;
}
</style>
</head>
<body>
	<jsp:include page="../includes/header.jsp" />

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

	<!-- 공지사항 리스트 -->
	<div class="container" style="margin: 200px;">	
		<h2>공지사항</h2>


		<div id="noticeDiv">
		
		
		</div>



		<!-- 	<div id=noticeDiv>
		<div class="title form-inline" style="margin: 15px;">
			<div class="col-11">
				[공지] 이달의 업데이트 안내<br> <span class="date"
					style="color: #cbcbcb; font-size: .7rem;">2019-09-24</span> 날짜
			</div>
			<div class="col-1">
				<a style="margin-left: 210px;" id="down"><i
					class="fa fa-chevron-down dn2" style="color: black; font-size: 30px;" id="www"></i></a>
			</div>
		</div>
		<div style="border:0.5px solid #e9e9e9; width:1250px;" id="notice" class="notice" >
		append div class="appendNotice"
			
		</div>
	</div>
		
		
		
	<div>
		<div class="title form-inline" style="margin: 15px;">
			<div class="col-11">
				[공지] style blending 관련 안내 <br> <span class="date"
					style="color: #cbcbcb; font-size: .7rem;">2019-09-24</span> 날짜
			</div>
			<div class="col-1">
				<a style="margin-left: 210px;"><i
					class="fa fa-chevron-down dn2" style="color: black; font-size: 30px;" id="asd"></i></a>
			</div>
		</div>
		<div style="border:0.5px solid #e9e9e9; width:1250px;" id="notice2" class="notice" >
		append div class="appendNotice"
		
		</div>

	</div>
	
	<div>
		<div class="title form-inline" style="margin: 15px;">
			<div class="col-11">
				[공지] 리뷰 사진 선택 기능 업데이트 안내 <br> 
				<span class="date" style="color: #cbcbcb; font-size: .7rem;">2019-09-24</span> 날짜
			</div>
			<div class="col-1">
				<a style="margin-left: 210px;"><i
					class="fa fa-chevron-down dn2" style="color: black; font-size: 30px;" id="asd"></i></a>
			</div>
		</div>
		<div style="border:0.5px solid #e9e9e9; width:1250px;" id="notice2" class="notice" >
			append div class="appendNotice"
			
			<div>asdasdasdas</div>
			
		</div>

	</div> -->



		<!-- 공지사항 등록 폼 -->
	 <c:if test='${loginUser.email eq "admin"}'>
		<div class="row">
			<div style="margin-left: 1215px; margin-top: 30px;">
				<a style="float: right" class="btn btn-dark mx-1 mt-2"
					data-toggle="modal" href="#registerNotice"><i
					class="fa fa-plus fa-3x"></i></a>
			</div>
		</div>
	</c:if>

		<!-- <hr style="height: 3px; color:gray; width:1250px;"/> -->

	</div>




	<script>	
	$(function(){
		noticeList();
		
	});
	function noticeList(){
		$.ajax({
			url:"aMainNotice.do",
			dataType:"json",
			success:function(data){
				
				var $noticeDiv = $("#noticeDiv");
				
				$noticeDiv.children().remove();
				
				$.each(data, function(index, value){
					
					var $div1 = $("<div class='title form-inline' style='margin: 15px;'></div>");
					var $div1_1 = $("<div class='col-11'>"+value.title+"<br> <span class='date'style='color: #cbcbcb; font-size: .7rem;'>"+value.enrollDate+"</span></div>");
					var $div1_2 = $("<div class='col-1'><a style='margin-left: 210px;'><i class='fa fa-chevron-down' style='color: black; font-size: 30px;' id='asd'></i><input type='hidden' value="+value.nno+"></a></div>");
					
					$div1.append($div1_1);
					$div1.append($div1_2);
									
					$noticeDiv.append($div1);
					
					//var $div2 = $("<div style='width:1250px; border:1px solid #e9e9e9; '></div>");
					var $div2 = $("<div style='width:1250px;' ></div>");
					$noticeDiv.append($div2);
					$noticeDiv.append("<hr style='margin:0px; width:1250px;'>");
					
					/* 
						
						
					//아이콘 class명으로 if 문 잡고 a태그 this값으로 $div2 어펜드 처리 해주면 됌.
					$div2.append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>"+value.content +"</div>");
					
					$noticeDiv.append($div2); */
				});
			
				
			}
		
		
		});
	}
	
	$(document).on("click", "#asd", function(){
		var iconClass = $(this).attr('class');
		var icon = $(this);
		var nno = $(this).parent().children().eq(1).val();
		console.log($(this));
		console.log(nno);
		if(iconClass == "fa fa-chevron-down"){
			$.ajax({
				url:"MainNoticeContent.do",
				dataType:"json",
				data:{nno:nno},
				success:function(data){
					
					console.log(data);
					$(icon).parent().parent().parent().next().append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'><span>"+data[0].content+"</span></div>");
					if("${loginUser.email}" == "admin"){
						$(icon).parent().parent().parent().next().append("<div class='appendNotice3' style='height:50px; color: #4f4f4f;background-color:white; font-size: .8rem; line-height: 1.2rem;'>");
					}
					icon.attr('class','fa fa-chevron-up');
					console.log("${loginUser.email}");
 					if("${loginUser.email}" == "admin"){
						$(".appendNotice3").append("<button class='btn btn-dark btn-sm' style='float:right; border-radius:50px; margin-top:10px;' onclick='noticeDelete(this);'>삭제</button><input type='button' onclick='noticeUpdate(this);' style='margin-top:10px;float:right;background-color: white;color: black;border-radius: 50px;' class='btn btn-dark btn-sm' value='수정'><input type='hidden' value="+data[0].nno+">");
 						$(".appendNotice3").attr('class','hidden');
 					}
 						
				},
				error:function(){
					console.log('공지사항 내용 실패');
				}
			});
		}else{
			$(this).attr('class','fa fa-chevron-down');
			$(icon).parent().parent().parent().next().children().remove();
			console.log($(icon).parent().parent().parent().next().children());
		}
			
		//if문으로 관리자계정이면 삭제 수정 버튼 생성
		/* if(userid == "admin"){
			
			$(icon).parent().parent().parent().next().append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>안녕하세요.<br> 공지사항 입니다. <br>수고하세요.<button class='btn btn-danger btn-sm' style='float:right'>삭제</button><button style='float:right' class='btn btn-dark btn-sm'>수정</button></div>");
				
		}else{
			$(icon).parent().parent().parent().next().append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>안녕하세요.<br> 공지사항 입니다. <br>수고하세요/</div>");
				
		} */
	 /* 	$.ajax({
			url:"aMainNotice.do",
			dataType:"json",
			success:function(data){
				$(icon).parent().parent().parent().next().append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>안녕하세요.<br> 공지사항 입니다. <br>수고하세요.<button class='btn btn-danger btn-sm' style='float:right'>삭제</button><button style='float:right' class='btn btn-dark btn-sm'>수정</button></div>");
				
			},
			error:function(){
				console.log('공지사항 ajax 실패');
			}
		
		console.log($(this).parent().parent().parent().parent().children().siblings().eq(1));
		//$(this).attr('class','fa fa-chevron-up');	
		}else{
			$(this).attr('class','fa fa-chevron-down');
			$(icon).parent().parent().parent().next().children().remove();
			
		} if(iconClass == "fa fa-chevron-down dn2"){
			$div2.append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>"+value.content +"</div>");				
			$noticeDiv.append($div2);
		}
		 
		 */													
	});

</script>


<script>
	//수정부분1
	function noticeUpdate(a){
		console.log($(a).parent().children().eq(2).val());
		//$(icon).parent().parent().parent().next().append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>"+data[0].content+"</div>");
		console.log($(a).parent().siblings().eq(0).children().remove());
		$(a).parent().siblings().eq(0).append("<textarea rows='3' cols='200' class='form-control'resize: none placeholder='수정내용입력'></textarea>");
		console.log($(a).parent().eq(0).append());
		console.log($(a).parent().children().eq(1).attr('value','등록'));
		console.log($(a).parent().children().eq(0).remove());
		console.log($(a).parent().children().eq(0).attr('onclick','noticeUpdateConfirm(this);'));
		//$(a).parent().eq(0).append("<button style='margin-top:10px;float:right;background-color: white;color: black;border-radius: 50px;' class='btn btn-dark btn-sm'>등록</button>");
//		$(a).parent().eq(0).append("<button>등록</button>");
	}
	//수정부분2
	function noticeUpdateConfirm(a){
		var content = $(a).parent().parent().children().eq(0).children().val();
		var nno = $(a).parent().children().eq(1).val();
		console.log(nno);
		 $.ajax({
			url:"noticeUpdateConfirm.do",
			data:{nno:nno,content:content},
			dataType:"json",
			type:"get",
			success:function(data){
				noticeList();
			},
			error:function(){
				console.log("서버통신실패");
			}
		});
	 	
	}
	function noticeDelete(a){
		var nno = $(a).parent().children().eq(2).val();
		console.log(nno);
		 $.ajax({
				url:"noticeDelete.do",
				data:{nno:nno},
				dataType:"json",
				type:"get",
				success:function(data){
					noticeList();	
				},
				error:function(){
					console.log("서버통신실패");
				}
			});
		 			
	}
</script>









	<script>
/* $(document).on("click", ".dn2", function(){
	console.log("ddd");
	console.log(this);
	// div 위치 : console.log($(this).parent().parent().parent().parent().children().eq(2));
	// icon 위치 : console.log($(this));
	var iconClass = $(this).attr('class');
	var notice = $(this).parent().parent().parent().siblings();
	console.log(notice);
	if(iconClass == "fa fa-chevron-down dn2"){
		$(notice).show('slow', function(){
			
			notice.append("<div class='appendNotice' style='height:100%; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>안녕하세요.<br> 공지사항 입니다. <br>수고하세요.</div>").show('slow');
			console.log($(this).parent().children().children().eq(1).children().children().attr('class','fa fa-chevron-up dn2'));
// 			$(this).attr('class','fa fa-chevron-up dn2');	
			console.log('성공');
 		});

	}else{
		$(this).attr('class','fa fa-chevron-down dn2');
		console.log('--------');
		$(this).parent().parent().parent().siblings().children().remove();
		console.log('--------');
		//	$(".appendNotice").remove();
	
	 }
	
});
 */
/*  	function openNotice(){
		var notice = $("#notice");
		var iconClass = $("#down2").attr('class');
		if(iconClass == "fa fa-chevron-down"){
			$(notice).show('slow', function(){
				
			notice.append("<div class='appendNotice' style='height:600px; color: #4f4f4f; padding: 20px 15px; background-color: #e9e9e9; font-size: .8rem; line-height: 1.2rem;'>안녕하세요.</div>").show('slow');
			$("#down2").attr('class','fa fa-chevron-up');	
			});

		}else{
				$("#down2").attr('class','fa fa-chevron-down');
				$(".appendNotice").remove();
			
			 }				
	}	
	 */

</script>
<script>
	

</script>


	<div class="modal fade" id="registerNotice" tabindex="-1" role="dialog"
		aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="border-radius:120px;">
				<!-- modal 1  -->

				<div class="modal-header">
					<!-- modal header -->
					<h5 class="modal-title" id="modal" style="margin-left: 450px;">공지사항
						등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true"> &times; </span>
					</button>
				</div>
				<div class="modal-body">
					<form action="mainInsertNotice.do" method="post" id="form1">
						<div class="form-row">
							<!-- form-row : 하나의 행을 여러 열로 나눌때 사용한다. -->
							<div class="form-group col-sm-12">
								<label>제목</label> <input type="text" name="title"
									class="form-control" maxlength="20" />
							</div>

						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>작성자</label> <input type="text" name="writer"
									class="form-control" maxlength="20" />
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-12">
								<label>내용</label>
								<textarea class="form-control" id="p_content" name='content'></textarea>
								<script type="text/javascript">
									CKEDITOR.replace('p_content',{
										height : 300
									});
								</script>
							</div>
						</div>
						<div class="modal-footer"style="margin:auto;">
							<button class="btn btn-dark btn-lg" type="button"
								data-dismiss="modal" id="reset1" style="background:white;
    color: black;
    border-radius: 50px;
    border: 1px solid black;"><span>취소</span></button>
							<button type="submit" class="btn btn-success btn-lg" style="background: white;
    color: black;
    border-radius: 50px;
    border: 1px solid black;
}">등록</button>
							<!-- 취소 눌렀을때 form 양식 초기화 스크립트 추가 -->
							<script type="text/javascript">
								$(document).ready(function() {
									$("#reset1").click(function() {
										$("#form1")[0].reset();
									});
								});
							</script>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<jsp:include page="../includes/footer.jsp" />

</body>
</html>