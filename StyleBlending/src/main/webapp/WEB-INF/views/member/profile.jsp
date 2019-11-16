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
	
	
	#imgH:hover{cursor:pointer;}
	#imgL:hover{cursor:pointer;}
	#abc div, #abc i{float:left;}
	#abc div{width:45px;}
	#abc i{line-height:30px; margin-right:5px;}
</style>
</head>
<body class="profile" style="margin-bottom: 20px !important;">

	<jsp:include page="../includes/header.jsp" />

	<div class="container">
		<!-- 내 프로필 정보 -->
		<div class="info">
			<div class="row">
				<!-- 프로필 이미지 -->
				<div class="col-12 col-md-4 text-center">
					<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
						class="img-fluid rounded-circle shadow-lg" style="width: 180px;">
				</div>
				
				<!-- 프로필 -->
				<div class="col-12 col-md-8 d-flex flex-column align-items-center align-items-lg-start">
					<div class="d-flex flex-row align-items-start mt-3 mt-lg-0">
						<!-- 닉네임 -->
						<div class="name">
							<h2 class="mb-0">닉네임</h2>
						</div>
						
						<!-- 팔로워버튼  -->
						<a href="#a" class="btn btn-dark ml-3"><i class="fa fa-plus"></i> <b>Fan</b></a>
						<%--<c:if test="${ loginUser.mno == m.mno }"> --%>
							<button class="btn btn-info btn-pill" style="margin-left:400px;"onclick="location.href='mpUpdatePage.do';">
							    <i class="fa fa-edit mr-1"></i>
						    	프로필 관리
							</button>
						<%--</c:if> --%>
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
		
		<div class="navigation d-flex justify-content-center">
			<!-- 메뉴바 -->
			<ul id="tabMenu" class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#board" id="boardBtn"> 
					<i class="fas fa-th"></i>
						Board
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#like" id="likeBtn"> 
					<i class="far fa-heart"></i>
						Like
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#fan" id="fanBtn"> 
					<i class="far fa-id-badge"></i> 
						Fan
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#following" id="fwBtn"> 
					<i class="far fa-id-badge"></i> 
						Following
					</a>
				</li>
			</ul>
		</div>
		

		<div class="profile-tabs tab-content">
			<!-- 내 업로드 사진목록 -->
			<div class="tab-pane fade show active" id="board">
				<div class="row" id="postingList">
					
				</div>
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="pBtn" style="display:none;">더보기</button>
				</div>
			</div>
			
			<!-- 내 좋아요 사진목록-->
			<div class="tab-pane fade text-center" id="like">
				<div class="row" id="likeList">
					
				</div>
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="lBtn" style="display:none;">더보기</button>
				</div>
			</div>
			
			<!-- 나를 팔로우한 친구 목록 -->
			<div class="tab-pane fade text-center" id="fan">
				<div align="center">
					<div id="fanList" style="width:50%;">
						
					</div>
				</div>
				
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="fBtn" style="display:none;">더보기</button>
				</div>
				
			</div>
			
			<!-- 내가 팔로잉한 친구 목록 -->
			<div class="tab-pane fade text-center" id="following">
				<div align="center">
					<div id="fwList" style="width:50%;">
						
					</div>
				</div>
				
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-danger btn-pill" id="wBtn" style="display:none;">더보기</button>
				</div>
				
			</div>
		</div>

	</div>

	<div id="scrollTop1" style="position:fixed; border:1px solid lightgray; display:none; background:white; bottom:10px; right:10px;">
		<a href="#"><img style="width:60px; height:60px;"src="${pageContext.request.contextPath}/resources/assets/img/123a.png"></a>
	</div>
	
	
	<script>
		$(function(){
			selectPostingList();
			selectLikeList();
			selectFanList();
			selectFwList();
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
					console.log("ajax 통신 성공");
					if(list.length == 0){
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" 포스팅한 게시물이 없습니다.");
						
						$("#board").prepend($a1);
					}else{
						if(list.length > 6){
							$("#pBtn").css("display", "block");
						}
						for(var i=countP; i<countP+6; i++){
							if(i == list.length-1){
								$("#pBtn").css("display", "none");
							}
							var $copy1 = $("<div>").attr("class", "col-12 col-md-4");
							$copy1.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'resources/assets/img/" + list[i].renameImg + "');"}));
							
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
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" 좋아요한 게시물이 없습니다.");
						
						$("#like").prepend($a1);
					}else{
						if(list.length > 6){
							$("#lBtn").css("display", "block");
						}
						for(var i=countL; i<countL+6; i++){
							if(i == list.length-1){
								$("#lBtn").css("display", "none");
							}
							var $copy1 = $("<div>").attr("class", "col-12 col-md-4");
							$copy1.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'resources/assets/img/" + list[i].renameImg + "');"}));
							
							$("likeList").append($copy1);
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
				data:{mno:${m.mno}},
				dataType:"json",
				success:function(list){
					if(list.length == 0){
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" ${m.nickName}님을 팔로우한 팬이 없습니다.");
						
						$("#fan").prepend($a1);
					}else{
						if(list.length > 12){
							$("#fBtn").css("display", "block");
						}
						for(var i=countFan; i<countFan+12; i++){
							if(i == list.length-1){
								$("#fBtn").css("display", "none");
							}
							var $fan1 = "<div style='height:60px;'>"
							+"<div style='float:left;'>"
							+"<img src='resources/assets/img/lorde.png' alt='Raised circle image'"
							+"class='img-fluid rounded-circle shadow-lg' style='width: 50px;'>"
							+"</div>"
							+"<div style='float:left; margin-left:15px;'>"
							+"<div style='text-align:left;'>" + list[i].nickName + "</div>"
							+"<div id='abc' style='text-align:left;'>"
							+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
							+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
							+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
							+"</div>"
							+"</div>"
							+"<div style='float:left; margin-left:210px;'>"
							+"<button class='btn btn-dark'><i class='fa fa-plus'></i> Fan</button>"
							+"</div>"
							+"</div>"
							+"<hr>";
							
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
				data:{mno:${m.mno}},
				dataType:"json",
				success:function(list){
					if(list.length == 0){
						var $a1 = $("<p>").attr("class", "lead");
						var $a2 = $("<span>").attr("class", "text-danger");
						$a2.append($("<i>").attr("class", "far fa-frown-open"));
						$a1.append($a2);
						$a1.append(" 마음에 드는 사람의 팬이 되어주세요.");
						
						$("#following").prepend($a1);
					}else{
						if(list.length > 12){
							$("#wBtn").css("display", "block");
						}
						for(var i=countFw; i<countFw+12; i++){
							if(i == list.length-1){
								$("#wBtn").css("display", "none");
							}
							var $fan1 = "<div style='height:60px;'>"
							+"<div style='float:left;'>"
							+"<img src='resources/assets/img/lorde.png' alt='Raised circle image'"
							+"class='img-fluid rounded-circle shadow-lg' style='width: 50px;'>"
							+"</div>"
							+"<div style='float:left; margin-left:15px;'>"
							+"<div style='text-align:left;'>" + list[i].nickName + "</div>"
							+"<div id='abc' style='text-align:left;'>"
							+"<i class='fas fa-clipboard-list'></i><div>" + list[i].posCount + "</div>"
							+"<i class='fas fa-heart'></i><div>" + list[i].likeCount + "</div>"
							+"<i class='fas fa-comment'></i><div>" + list[i].replyCount + "</div>"
							+"</div>"
							+"</div>"
							+"<div style='float:left; margin-left:210px;'>"
							+"<button class='btn btn-dark'><i class='fa fa-plus'></i> Fan</button>"
							+"</div>"
							+"</div>"
							+"<hr>";
							
							$("#fwList").append($fan1);
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
		
		
	</script>
	<script>
		$(function(){
			$("#imgH").mouseenter(function(){
				$("#aaa").css("display", "block");
			}).mouseout(function(){
				$("#aaa").css("display", "none");
			});
			
			$("#imgL").mouseenter(function(){
				$("#aaa1").css("display", "block");
			}).mouseout(function(){
				$("#aaa1").css("display", "none");
			});
		});
	</script>
	<script>
		$(document).ready(function(){
			var url = document.location.href;
			var tab = url.split('/').pop();
			$(tab).trigger("click");
		});
	</script>
	
	<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>