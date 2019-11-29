<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	#addAlarm{width:100%; height:inherit; background:lightgray; border:2px solid white;}
	#addAlarmImg{padding:10px 0 10px 10px; width:10%; height:auto; display:inline-block;}
	#addAlarmImg img{width:50px; height:50px; border-radius:1.5em;}
	#addAlarmNick{display:inline-block; width:50%;}
	#addAlarmDate{display:inline-block; width:25%; text-align:right;}
	#addAlarmCon{padding:10px 10px 10px 10px;}
	
	#addAlarm1{width:100%; height:inherit; background:lightgray; border:2px solid white;}
	#addAlarmImg1{padding:10px 0 0 10px; width:17%; height:auto; display:inline-block;}
	#addAlarmImg1 img{width:50px; height:50px; border-radius:1.5em;}
	#addAlarmNick1{display:inline-block; width:50%;}
	#addAlarmDate1{display:inline-block; width:25%; text-align:right;}
	#addAlarmCon1{padding:10px 10px 10px 10px;}
	
	
	#abc div, #abc i{float:left;}
	#abc div{width:45px;}
	#abc i{line-height:30px; margin-right:5px;}
	#scrollTop1:hover{cursor:pointer;}
	.fanImg:hover{cursor:pointer;}
	.fanNickName:hover{cursor:pointer;}
</style>
</head>
<body class="profile" style="margin-bottom: 20px !important;">

	<jsp:include page="../includes/header.jsp" />

	<div class="container">
		<input type="hidden" id="loginMno" value="${ loginUser.mno }">
		<!-- 내 프로필 정보 -->
		<div class="info">
			<div class="row">
				<!-- 프로필 이미지 -->
				<div class="col-12 col-md-4 text-center">
					<img id="imgClick" src="resources/upload/member/${ m.renameImg }"
						class="img-fluid rounded-circle shadow-lg" style="width: 180px; height:180px;">
				</div>
				<div id="fileArea">
					<input type="file" id="uploadImg" name="uploadImg">
				</div>
				<div style="display:none;">
					<a href="#updateProfileImg" data-toggle="modal" id="imgModal"></a>
				</div>
				
				<!-- 프로필 -->
				<div class="col-12 col-md-8 d-flex flex-column align-items-center align-items-lg-start">
					<div class="d-flex flex-row align-items-start mt-3 mt-lg-0">
						<!-- 닉네임 -->
						<div class="name">
							<h2 class="mb-0">${ m.nickName }</h2>
						</div>
						
						<!-- 팬 버튼  -->
						<c:if test="${ loginUser.mno != m.mno }">
							<button class="btn btn-light ml-3" id="fanA" class="fanClassA" style="display:block;" value="${ m.mno }">
							<i class="fa fa-plus"></i><b> Fan</b></button>
								
							<button class="btn btn-dark ml-3" id="fanB" class="fanClassB" style="display:none;" value="${ m.mno }">
							<i style="width:40px;"class="fas fa-check"></i></button>
						</c:if>
						
						<!-- 프로필 관리 버튼 -->
						<c:if test="${ !empty loginUser && loginUser.mno == m.mno }">
							<button class="btn btn-info btn-pill" style="margin-left:500px;"onclick="location.href='mpProfileUpdate.do';">
							    <i class="fa fa-edit mr-1"></i>
						    	프로필 관리
							</button>
						</c:if>
						
					</div>
						
					<div class="stats d-flex flex-row align-items-center align-items-lg-start text-center text-lg-left">
						<div class="posts ml-2 ml-lg-0">
							<p class="lead">
								<b>${ m.posCount }</b> Board
							</p>
						</div>
						<div class="posts">
							<p class="lead">
								<b>${ m.fanCount }</b> Fan
							</p>
						</div>
						<div class="posts">
							<p class="lead">
								<b>${ m.fwCount }</b> Following
							</p>
						</div>
					</div>
					<p class="lead mb-0 mt-2">
						<c:if test="${ m.profile != null }">
							<b>About Me</b>
						</c:if>
					</p>
					<p class="lead text-center text-lg-left">${ m.profile }</p>
				</div>
			</div>
		</div>
		
		<div class="navigation d-flex justify-content-center" id="tabMenu">
			<!-- 메뉴바 -->
			<ul class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#postingL" id="postingTabBtn"> 
					<i class="fas fa-th"></i>
						Board
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#likeL" id="likeTabBtn"> 
					<i class="far fa-heart"></i>
						Like
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#fanL" id="fanTabBtn"> 
					<i class="far fa-id-badge"></i> 
						Fan
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#followingL" id="followingTabBtn"> 
					<i class="far fa-id-badge"></i> 
						Following
					</a>
				</li>
			</ul>
		</div>
		

		<div class="profile-tabs tab-content">
			<!-- 내 업로드 사진목록 -->
			<div class="tab-pane fade show active text-center" id="postingL">
				<div id="postingEmpty">
				
				</div>
				<div class="row" id="postingList">
					
				</div>
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="pBtn" style="display:none;">더보기</button>
				</div>
			</div>
			
			<!-- 내 좋아요 사진목록-->
			<div class="tab-pane fade text-center" id="likeL">
				<div id="likeEmpty">
				
				</div>
				<div class="row" id="likeList">
					
				</div>
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="lBtn" style="display:none;">더보기</button>
				</div>
			</div>
			
			<!-- 나를 팔로우한 친구 목록 -->
			<div class="tab-pane fade text-center" id="fanL">
				<div id="fanEmpty">
				
				</div>
				<div align="center">
					<div id="fanList" style="width:555px;">
						
					</div>
				</div>
				
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="fBtn" style="display:none;">더보기</button>
				</div>
				
			</div>
			
			<!-- 내가 팔로잉한 친구 목록 -->
			<div class="tab-pane fade text-center" id="followingL">
				<div id="followingEmpty">
					
				</div>
				<div align="center">
					<div id="followingList" style="width:555px;">
						
					</div>
				</div>
				
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="wBtn" style="display:none;">더보기</button>
				</div>
				
			</div>
		</div>

	</div>

	<!-- 프로필 이미지 있을 때 클릭 시 모달창 -->
	<div class="modal fade" id="updateProfileImg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">프로필 이미지 변경</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modalClose">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body" align="center">
	        <div style="width:70%; height:50px;">
	        	<button style="width:100%; height:100%;" class="btn btn-success" id="updateImg1">프로필 이미지 변경</button>
	        </div>
	        <br>
	        <div style="width:70%; height:50px;">
	        	<button style="width:100%; height:100%;" class="btn btn-info" id="updateImg2">기본 이미지로 변경</button>
	        </div>
	      </div>
	     
	    </div>
	  </div>
	</div>
	
	<div id="scrollTop1" align="center" style="position:fixed; border:1px solid gray; display:none; background:white; 
								width:60px; height:58px; bottom:30px; right:20px; z-index:1000;">
		<span style="font-size:35px; color:gray;"><i class="fas fa-arrow-up"></i></span>
	</div>
	
	
	<script type="text/javascript">
		$(function(){
			selectPostingList();
			selectLikeList();
			selectFanCheck();
			
			/* selectFanCheckTab(); */
		});
		
		
		var countP = 0;
		var countL = 0;
		var countFan = 0;
		var countFw = 0;
		
		function selectPostingList(){
			$.ajax({
				url:"mpSPostingList.do",
				data:{mno:${m.mno}},
				dataType:"json",
				success:function(list){
					if(list.length == 0){
						$("#postingEmpty").html("");
						
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" 포스팅한 게시물이 없습니다.");
						
						$("#postingEmpty").append($a1);
					}else{
						$("#postingEmpty").html("");
						if(list.length > 6){
							$("#pBtn").css("display", "block");
						}
						for(var i=countP; i<countP+6; i++){
							if(i == list.length-1){
								$("#pBtn").css("display", "none");
							}
							var $copy1 = $("<div>").attr({"class":"col-12 col-md-4", "style":"position:relative;"});
							$copy1.append($("<div>").attr({"class":"square imgP", "style":"background-image: url(" + "'resources/upload/posting/" + list[i].renameImg + "');"}));
							var $copy2 = 
								"<div class='square imgJ' value='" + list[i].pno + "' style='position:absolute; width:92%; bottom:0; opacity:0; background:rgba(0,0,0,0.6);'>"
								+ "<div style='margin-left:48px; margin-top:135px; font-size:22px; color:white; position:relative;'>"
								+ "<div style='float:left; left:40px; position:absolute;'><i class='fas fa-heart'></i></div>"
								+ "<div style='float:left; left:70px; position:absolute;'>" + list[i].likeCount + "</div>"
								+ "<div style='float:left; left:160px; position:absolute;'><i class='fas fa-comment'></i></div>"
								+ "<div style='float:left; left:190px; position:absolute;'>" + list[i].replyCount + "</div>"
								+ "</div>"
								+ "</div>";
							$copy1.append($copy2);
							
							$("#postingList").append($copy1);
						}
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
		}
		$("#pBtn").on("click", function(){
			countP += 6;
			selectPostingList();
		});
		
		function selectLikeList(){
			
			$.ajax({
				url:"mpSLikeList.do",
				data:{mno:${m.mno}},
				dataType:"json",
				success:function(list){
					if(list.length == 0){
						$("#likeEmpty").html("");
						
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" 좋아요한 게시물이 없습니다.");
						
						$("#likeEmpty").append($a1);
					}else{
						$("#likeEmpty").html("");
						if(list.length > 6){
							$("#lBtn").css("display", "block");
						}
						for(var i=countL; i<countL+6; i++){
							if(i == list.length-1){
								$("#lBtn").css("display", "none");
							}
							var $copy1 = $("<div>").attr({"class":"col-12 col-md-4", "style":"position:relative;"});
							$copy1.append($("<div>").attr({"class":"square imgP", "style":"background-image: url(" + "'resources/upload/posting/" + list[i].renameImg + "');"}));
							var $copy2 = 
								"<div class='square imgJ' value='" + list[i].pno + "' style='position:absolute; width:92%; bottom:0; opacity:0; background:rgba(0,0,0,0.6);'>"
								+ "<div style='margin-left:48px; margin-top:135px; font-size:22px; color:white; position:relative;'>"
								+ "<div style='float:left; left:40px; position:absolute;'><i class='fas fa-heart'></i></div>"
								+ "<div style='float:left; left:70px; position:absolute;'>" + list[i].likeCount + "</div>"
								+ "<div style='float:left; left:160px; position:absolute;'><i class='fas fa-comment'></i></div>"
								+ "<div style='float:left; left:190px; position:absolute;'>" + list[i].replyCount + "</div>"
								+ "</div>"
								+ "</div>";
							$copy1.append($copy2);
							
							$("#likeList").append($copy1);
						}
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
		}
		$("#lBtn").on("click", function(){
			countL += 6;
			selectLikeList();
		});
		
		function selectFanList(){
			$.ajax({
				url:"mpSFanList.do",
				data:{mno:${m.mno}, loginMno:$("#loginMno").val()},
				dataType:"json",
				success:function(list){
					if(list.length == 0){
						$("#fanEmpty").html("");
						
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" ${m.nickName}님을 팔로우한 팬이 없습니다.");
						
						$("#fanEmpty").append($a1);
					}else{
						$("#fanEmpty").html("");
						if(list.length > 12){
							$("#fBtn").css("display", "block");
						}
						for(var i=countFan; i<countFan+12; i++){
							if(i == list.length-1){
								$("#fBtn").css("display", "none");
							}
							
							if(list[i].mno == $("#loginMno").val()){
								var $fan1 = "<div style='height:60px;'>"
									+"<input type='hidden' class='fanCheckClass' value='" + list[i].fanCheck + "'>"
									+"<div style='float:left;'>"
									+"<img src='resources/assets/img/lorde.png' value='" + list[i].mno + "' alt='Raised circle image'"
									+"class='img-fluid rounded-circle shadow-lg fanImg' style='width: 50px;'>"
									+"</div>"
									+"<div style='float:left; margin-left:15px;'>"
									+"<div class='fanNickName' value='" + list[i].mno + "' style='text-align:left;'>" + list[i].nickName + "</div>"
									+"<div id='abc' style='text-align:left;'>"
									+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
									+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
									+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
									+"</div>"
									+"</div>"
									+"<div style='float:left; margin-left:210px;'>"
									+"<button class='btn btn-light fanClassA' name='fanNameA' style='display:none; margin-top:9px;'"
									+"value='" + list[i].mno + "'>"
									+"<i class='fa fa-plus'></i> Fan</button>"
									+"<button class='btn btn-dark fanClassB' name='fanNameB' style='display:none; margin-top:9px;'"
									+"value='" + list[i].mno + "'>"
									+"<i style='width:40px;' class='fas fa-check'></i></button>"
									+"</div>"
									+"</div>"
									+"<hr>";
							}else if(list[i].fanCheck == 1){
								var $fan1 = "<div style='height:60px;'>"
									+"<input type='hidden' class='fanCheckClass' value='" + list[i].fanCheck + "'>"
									+"<div style='float:left;'>"
									+"<img src='resources/assets/img/lorde.png' value='" + list[i].mno + "' alt='Raised circle image'"
									+"class='img-fluid rounded-circle shadow-lg fanImg' style='width: 50px;'>"
									+"</div>"
									+"<div style='float:left; margin-left:15px;'>"
									+"<div class='fanNickName' value='" + list[i].mno + "' style='text-align:left;'>" + list[i].nickName + "</div>"
									+"<div id='abc' style='text-align:left;'>"
									+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
									+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
									+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
									+"</div>"
									+"</div>"
									+"<div style='float:left; margin-left:210px;'>"
									+"<button class='btn btn-light fanClassA' name='fanNameA' style='display:none; margin-top:9px;'"
									+"value='" + list[i].mno + "'>"
									+"<i class='fa fa-plus'></i> Fan</button>"
									+"<button class='btn btn-dark fanClassB' name='fanNameB' style='display:block; margin-top:9px;'"
									+"value='" + list[i].mno + "'>"
									+"<i style='width:40px;' class='fas fa-check'></i></button>"
									+"</div>"
									+"</div>"
									+"<hr>";
							}else{
								var $fan1 = "<div style='height:60px;'>"
									+"<input type='hidden' class='fanCheckClass' value='" + list[i].fanCheck + "'>"
									+"<div style='float:left;'>"
									+"<img src='resources/assets/img/lorde.png' value='" + list[i].mno + "' alt='Raised circle image'"
									+"class='img-fluid rounded-circle shadow-lg fanImg' style='width: 50px;'>"
									+"</div>"
									+"<div style='float:left; margin-left:15px;'>"
									+"<div class='fanNickName' value='" + list[i].mno + "' style='text-align:left;'>" + list[i].nickName + "</div>"
									+"<div id='abc' style='text-align:left;'>"
									+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
									+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
									+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
									+"</div>"
									+"</div>"
									+"<div style='float:left; margin-left:210px;'>"
									+"<button class='btn btn-light fanClassA' name='fanNameA' style='display:block; margin-top:9px;'"
									+"value='" + list[i].mno + "'>"
									+"<i class='fa fa-plus'></i> Fan</button>"
									+"<button class='btn btn-dark fanClassB' name='fanNameB' style='display:none; margin-top:9px;'"
									+"value='" + list[i].mno + "'>"
									+"<i style='width:40px;' class='fas fa-check'></i></button>"
									+"</div>"
									+"</div>"
									+"<hr>";
							}
							
							$("#fanList").append($fan1);
						}
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
		}
		$("#fBtn").on("click", function(){
			countFan += 12;
			selectFanList();
		});
		
		function selectFwList(){
			$.ajax({
				url:"mpSFwList.do",
				data:{mno:${m.mno}, loginMno:$("#loginMno").val()},
				dataType:"json",
				success:function(list){
					if(list.length == 0){
						$("#followingEmpty").html("");
						
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" 마음에 드는 사람의 팬이 되어주세요.");
						
						$("#followingEmpty").append($a1);
					}else{
						$("#followingEmpty").html("");
						if(list.length > 12){
							$("#wBtn").css("display", "block");
						}
						for(var i=countFw; i<countFw+12; i++){
							if(i == list.length-1){
								$("#wBtn").css("display", "none");
							}
							if(list[i].mno == $("#loginMno").val()){
								var $fan1 = "<div style='height:60px;'>"
									+"<input type='hidden' class='fanCheckCount' value='" + list[i].fanCheck + "'>"
									+"<div style='float:left;'>"
									+"<img src='resources/assets/img/lorde.png' value='" + list[i].mno + "' alt='Raised circle image'"
									+"class='img-fluid rounded-circle shadow-lg fanImg' style='width: 50px;'>"
									+"</div>"
									+"<div style='float:left; margin-left:15px;'>"
									+"<div class='fanNickName' value='" + list[i].mno + "' style='text-align:left;'>" + list[i].nickName + "</div>"
									+"<div id='abc' style='text-align:left;'>"
									+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
									+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
									+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
									+"</div>"
									+"</div>"
									+"<div style='float:left; margin-left:210px;'>"
									+"<button class='btn btn-light fanClassA' name='fanNameA' style='display:none; margin-top:9px;' value='" + list[i].mno + "'>"
									+"<i class='fa fa-plus'></i> Fan</button>"
									+"<button class='btn btn-dark fanClassB' name='fanNameB' style='display:none; margin-top:9px;' value='" + list[i].mno + "'>"
									+"<i style='width:40px;' class='fas fa-check'></i></button>"
									+"</div>"
									+"</div>"
									+"<hr>";
							}else if(list[i].fanCheck == 1){
								var $fan1 = "<div style='height:60px;'>"
									+"<input type='hidden' class='fanCheckCount' value='" + list[i].fanCheck + "'>"
									+"<div style='float:left;'>"
									+"<img src='resources/assets/img/lorde.png' value='" + list[i].mno + "' alt='Raised circle image'"
									+"class='img-fluid rounded-circle shadow-lg fanImg' style='width: 50px;'>"
									+"</div>"
									+"<div style='float:left; margin-left:15px;'>"
									+"<div class='fanNickName' value='" + list[i].mno + "' style='text-align:left;'>" + list[i].nickName + "</div>"
									+"<div id='abc' style='text-align:left;'>"
									+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
									+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
									+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
									+"</div>"
									+"</div>"
									+"<div style='float:left; margin-left:210px;'>"
									+"<button class='btn btn-light fanClassA' name='fanNameA' style='display:none; margin-top:9px;' value='" + list[i].mno + "'>"
									+"<i class='fa fa-plus'></i> Fan</button>"
									+"<button class='btn btn-dark fanClassB' name='fanNameB' style='display:block; margin-top:9px;' value='" + list[i].mno + "'>"
									+"<i style='width:40px;' class='fas fa-check'></i></button>"
									+"</div>"
									+"</div>"
									+"<hr>";
							}else{
								var $fan1 = "<div style='height:60px;'>"
									+"<input type='hidden' class='fanCheckCount' value='" + list[i].fanCheck + "'>"
									+"<div style='float:left;'>"
									+"<img src='resources/assets/img/lorde.png' value='" + list[i].mno + "' alt='Raised circle image'"
									+"class='img-fluid rounded-circle shadow-lg fanImg' style='width: 50px;'>"
									+"</div>"
									+"<div style='float:left; margin-left:15px;'>"
									+"<div class='fanNickName' value='" + list[i].mno + "' style='text-align:left;'>" + list[i].nickName + "</div>"
									+"<div id='abc' style='text-align:left;'>"
									+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
									+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
									+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
									+"</div>"
									+"</div>"
									+"<div style='float:left; margin-left:210px;'>"
									+"<button class='btn btn-light fanClassA' name='fanNameA' style='display:block; margin-top:9px;' value='" + list[i].mno + "'>"
									+"<i class='fa fa-plus'></i> Fan</button>"
									+"<button class='btn btn-dark fanClassB' name='fanNameB' style='display:none; margin-top:9px;' value='" + list[i].mno + "'>"
									+"<i style='width:40px;' class='fas fa-check'></i></button>"
									+"</div>"
									+"</div>"
									+"<hr>";
							}
							
							$("#followingList").append($fan1);
						}
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			
		}
		$("#wBtn").on("click", function(){
			countFw += 12;
			selectFwList();
		});
		
		
		function selectFanCheck(){
			if(${loginUser != null}){
				$.ajax({
					url:"mpSFanCheck.do",
					data:{meNo:${m.mno}, youNo:$("#loginMno").val()},
					type:"post",
					success:function(result){
						if(result == 1){
							$("#fanA").hide();
							$("#fanB").show();
						}else{
							$("#fanA").show();
							$("#fanB").hide();
						}
						
					},
					error:function(){
						console.log("실패");
					}
				});
				
			}
				
		}
		
		
		// 팬, 팔로잉 탭버튼 클릭 시
		$(function(){
			$("#fanTabBtn").click(function(){
				if(${loginUser == null}){
					alert("로그인 후 이용해주세요.");
					return false;
				}else{
					$("#fanList").html("");
					selectFanList();
					
				}
			});
			
			$("#followingTabBtn").click(function(){
				if(${loginUser == null}){
					alert("로그인 후 이용해주세요.");
					return false;
				}else{
					$("#followingList").html("");
					selectFwList();
					
				}
			});
			
		});
		
		
		// 팬 버튼 클릭 시 insert into fan
		$("#fanA").on("click", function(){
			var fanA = $("#fanA").attr("value");
			if(${loginUser == null}){
				alert("로그인 후 이용해주세요.");
			}else{
				insertFan(fanA);
			}
			
		});
		// 팬 버튼 클릭 시 delete from fan
		$("#fanB").on("click", function(){
			var fanB = $("#fanB").attr("value");
			
			deleteFan(fanB);
			
		});
		
		
		// 팬, 팔로잉 리스트에서 버튼 클릭 시
		$(document).on("click", ".fanClassA", function(){
			var fanClassA = $(this);
			
			if(${loginUser == null}){
				alert("로그인 후 이용해주세요.");
			}else{
				insertFanList(fanClassA);
				
			}
			
		});
		$(document).on("click", ".fanClassB", function(){
			var fanClassB = $(this);
			deleteFanList(fanClassB);
		});
		
		// insert 팬
		function insertFan(value){
			var meNo = value;
			$.ajax({
				url:"mpInsertFan.do",
				data:{meNo:meNo, youNo:$("#loginMno").val()},
				type:"post",
				success:function(result){
					if(result == 1){
						$("#fanA").hide();
						$("#fanB").show();
						sock.send(meNo);
						
					}else{
						console.log("실패");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		// insert 팬 리스트
		function insertFanList(value){
			var meNo = value.attr("value");
			$.ajax({
				url:"mpInsertFan.do",
				data:{meNo:meNo, youNo:$("#loginMno").val()},
				type:"post",
				success:function(result){
					if(result == 1){
						value.hide();
						value.siblings("button").show();
						sock.send(meNo);
						
					}else{
						console.log("실패");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		// delete 팬
		function deleteFan(value){
			var meNo = value;
			$.ajax({
				url:"mpDeleteFan.do",
				data:{meNo:meNo, youNo:$("#loginMno").val()},
				type:"post",
				success:function(result){
					if(result == 1){
						$("#fanA").show();
						$("#fanB").hide();
						
					}else{
						console.log("실패");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		// delete 팬 리스트
		function deleteFanList(value){
			var meNo = value.attr("value");
			$.ajax({
				url:"mpDeleteFan.do",
				data:{meNo:meNo, youNo:$("#loginMno").val()},
				type:"post",
				success:function(result){
					if(result == 1){
						value.hide();
						value.siblings("button").show();
						
					}else{
						console.log("실패");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		}
		
		// 포스팅 hover 좋아요, 댓글 표시
		
		$(document).on("mouseenter", ".imgJ", function(){
			$(this).css({"opacity":"1", "cursor":"pointer"});
		});
		$(document).on("mouseleave", ".imgJ", function(){
			$(this).css("opacity", "0");
		});
		
		// 포스팅 클릭 시 포스팅 상세페이지로 이동
		$(document).on("click", ".imgJ", function(){
			var postingNo = $(this).attr("value");
			location.href="pInfo.do?id=" + postingNo;
		});
		
		// 팬 이미지 or 팬 닉네임 클릭 시 해당 멤버의 프로필 페이지로 이동
		$(document).on("click", ".fanImg", function(){
			var postingMno1 = $(this).attr("value");
			location.href="mpViewProfile.do?mno=" + postingMno1;
		});
		$(document).on("click", ".fanNickName", function(){
			var postingMno2 = $(this).attr("value");
			location.href="mpViewProfile.do?mno=" + postingMno2;
		});
			
	</script>
	
	<script>
		// input 파일
		$(function(){
			$("#fileArea").hide();
			
			// 이미지 변경 시 이미지 존재 여부 확인
			if(${m.mno} == $("#loginMno").val()){
				$("#imgClick").css("cursor", "pointer");
				
				$("#imgClick").click(function(){
					if($("#imgClick").attr("src") != "resources/upload/member/profile.png"){
						$("#imgModal").click();
					}else{
						$("#uploadImg").click();
					}
					
				});
			
				// 모달창 버튼 클릭 시 발생 이벤트
				// 프로필 이미지 있을 때 이미지 변경
				$("#updateImg1").click(function(){
					$("#uploadImg").click();
					$("#modalClose").click();
				});
				// 프로필 이미지 있을 때 기본 이미지로 변경
				$("#updateImg2").click(function(){
					updateBasic();
					$("#modalClose").click();
				});
			
			}
			
		});
		
		// 기본 이미지로 변경하는 ajax구문 호출
		function updateBasic(){
			$.ajax({
				url:"mpUpdateBasic.do",
				success:function(result){
					$("#imgClick").attr("src", "resources/upload/member/" + result);
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
		}
		
		// 이미지 파일 input 시 수행될 ajax구문
		$("#uploadImg").on("input", function(){
			var data = new FormData();
			data.append("uploadImg", $("#uploadImg")[0].files[0]);
			
			$.ajax({
				url:"mpUpdateImg.do",
				type:"post",
				data:data,
				processData:false,
				contentType:false,
				success:function(result){
					$("#imgClick").attr("src", "resources/upload/member/" + result);
				},
				error:function(){
					console.log("ajax 실패");
				}
				
			});
				
			
		});
		
	</script>
	
	<script type="text/javascript">
	
		// 스크롤 맨 위로 가는 버튼
		$(function() {
	        $(window).scroll(function() {
	            if ($(this).scrollTop() > 300) {
	                $('#scrollTop1').fadeIn();
	            } else {
	                $('#scrollTop1').fadeOut();
	            }
	        });
	        
	        $("#scrollTop1").click(function() {
	            $('html, body').animate({
	                scrollTop : 0
	            }, 400);
	            return false;
	        });
	    });

		/*
		// 탭 클릭 시 새로고침 해도 탭 페이지 유지 (수정 필요)
		$(document).ready(function(){
			var url = document.location.href;
			var tab = url.split('/').pop();
			$('a[href=' + tab + ']').trigger("click");
			$("#postingTabBtn").click(function(){
				console.log(url);
				console.log(tab);
			});
		});
		*/
		
	</script>
	
	<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>