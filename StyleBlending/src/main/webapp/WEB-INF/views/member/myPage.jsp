<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						
						<div style="position:relative; margin-left:100px;">
							<button class="btn btn-warning dropdown-toggle" type="button" id="alarmBtn">
							    검색창 테스트
							</button>
							
							
							<!-------------------------------------- 알림창 테스트 --------------------------------------->
							
							<div style="position:absolute; top:45px; right:-135px; width:400px; max-height:255px;
										overflow-y:auto; overflow-x:hidden; background:lightgray; display:none; z-index:1000;" id="alarmDiv">
								<div style="width:100%; height:40px;">
									<ul>
										<li class="btn btn-dark" style="width:30%;"><a href="#">브랜드</a></li>
										<li class="btn btn-dark" style="width:30%;"><a href="#">위치</a></li>
										<li class="btn btn-dark" style="width:30%;"><a href="#">#태그</a></li>
									</ul>
								</div>
							    <!-- 알림 추가될 때마다 div 추가 -->
							    <div id="addAlarm">
							    	<div id="addAlarmImg">
							    		<i class="fas fa-search"></i>
							    	</div>
							    	<div id="addAlarmNick">
							    		<p>브랜드명</p>
							    	</div>
							    </div>
							    <div id="addAlarm">
							    	<div id="addAlarmImg">
							    		<i class="fas fa-map-marker-alt"></i>
							    	</div>
							    	<div id="addAlarmNick">
							    		<p>위치</p>
							    	</div>
							    </div>
							    <div id="addAlarm">
							    	<div id="addAlarmImg">
							    		<i class="fas fa-hashtag"></i>
							    	</div>
							    	<div id="addAlarmNick">
							    		<p>#태그</p>
							    	</div>
							    </div>
							    <div id="addAlarm">
							    	<div id="addAlarmImg">
							    		<i class="fas fa-search"></i>
							    	</div>
							    	<div id="addAlarmNick">
							    		<p>브랜드명</p>
							    	</div>
							    </div>
							    <div id="addAlarm">
							    	<div id="addAlarmImg">
							    		<i class="fas fa-map-marker-alt"></i>
							    	</div>
							    	<div id="addAlarmNick">
							    		<p>위치</p>
							    	</div>
							    </div>
							    <div id="addAlarm">
							    	<div id="addAlarmImg">
							    		<i class="fas fa-hashtag"></i>
							    	</div>
							    	<div id="addAlarmNick">
							    		<p>#태그</p>
							    	</div>
							    </div>
							    
							</div>
							
						</div>
						
						<!-------------------------------------- 알림창 테스트 --------------------------------------->
						<!-------------------------------------- 알림창 테스트 --------------------------------------->
						<!-------------------------------------- 알림창 테스트 --------------------------------------->
						<div style="position:relative;">
							<button class="btn btn-secondary dropdown-toggle" type="button" id="alarmBtn1">
								알림창 테스트
							</button>
							
							<div style="position:absolute; top:45px; right:-135px; width:400px; max-height:255px;
										overflow-y:auto; overflow-x:hidden; display:none; background:skyblue; z-index:1000;" id="alarmDiv1">
								<div align="right">
									<button type="button" class="btn btn-danger">알림 전체 삭제</button>
								</div>
								
							    <!-- 알림 추가될 때마다 div 추가 -->
							    <div id="addAlarm1">
							    	<div id="addAlarmImg1">
							    		<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png">
							    	</div>
							    	<div id="addAlarmNick1">
							    		<p>닉네임</p>
							    	</div>
							    	<div id="addAlarmDate1">
							    		<p>30초전</p>
							    	</div>
							    	<div id="addAlarmCon1">
							    		~~~님이 팬이 되었습니다.
							    	</div>
							    </div>
							    <div id="addAlarm1">
							    	<div id="addAlarmImg1">
							    		<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png">
							    	</div>
							    	<div id="addAlarmNick1">
							    		<p>닉네임</p>
							    	</div>
							    	<div id="addAlarmDate1">
							    		<p>10분전</p>
							    	</div>
							    	<div id="addAlarmCon1">
							    		나의 게시물이 신고되었습니다.
							    	</div>
							    </div>
							    <div id="addAlarm1">
							    	<div id="addAlarmImg1">
							    		<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png">
							    	</div>
							    	<div id="addAlarmNick1">
							    		<p>닉네임</p>
							    	</div>
							    	<div id="addAlarmDate1">
							    		<p>2시간전</p>
							    	</div>
							    	<div id="addAlarmCon1">
							    		나의 게시물이 좋아요되었습니다.
							    	</div>
							    </div>
							    <div id="addAlarm1">
							    	<div id="addAlarmImg1">
							    		<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png">
							    	</div>
							    	<div id="addAlarmNick1">
							    		<p>닉네임</p>
							    	</div>
							    	<div id="addAlarmDate1">
							    		<p>2일전</p>
							    	</div>
							    	<div id="addAlarmCon1">
							    		~~~님이 팬이 되었습니다.
							    	</div>
							    </div>
							    <div id="addAlarm1">
							    	<div id="addAlarmImg1">
							    		<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png">
							    	</div>
							    	<div id="addAlarmNick1">
							    		<p>닉네임</p>
							    	</div>
							    	<div id="addAlarmDate1">
							    		<p>30일전</p>
							    	</div>
							    	<div id="addAlarmCon1">
							    		~~~님이 팬이 되었습니다.
							    	</div>
							    </div>
							    <div id="addAlarm1">
							    	<div id="addAlarmImg1">
							    		<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png">
							    	</div>
							    	<div id="addAlarmNick1">
							    		<p>닉네임</p>
							    	</div>
							    	<div id="addAlarmDate1">
							    		<p>320일전</p>
							    	</div>
							    	<div id="addAlarmCon1">
							    		~~~님이 팬이 되었습니다.
							    	</div>
							    </div>
							    
							</div>
							
						</div>
						<!-------------------------------------- 알림창 테스트 --------------------------------------->
						<!-------------------------------------- 알림창 테스트 --------------------------------------->
						<!-------------------------------------- 알림창 테스트 --------------------------------------->	
				
						<button class="btn btn-info btn-pill" onclick="location.href='${pageContext.request.contextPath}/views/myPage/profileUpdate.jsp';">
						    <i class="fa fa-edit mr-1"></i>
					    	프로필 관리
						</button>
					</div>
						
					<div class="stats d-flex flex-row align-items-center align-items-lg-start text-center text-lg-left">
						<div class="posts ml-2 ml-lg-0">
							<p class="lead">
								<b>134</b> Board
							</p>
						</div>
						<div class="posts">
							<p class="lead">
								<b>6.6m</b> Fan
							</p>
						</div>
						<div class="posts">
							<p class="lead">
								<b>201</b> Following
							</p>
						</div>
					</div>
					<p class="lead mb-0 mt-2">
						<b>About Me</b>
					</p>
					<p class="lead text-center text-lg-left">자기소개 내용</p>
				</div>
			</div>
		</div>
		
		<div class="navigation d-flex justify-content-center">
			<!-- 메뉴바 -->
			<ul id="tabMenu" class="nav nav-primary nav-tabs mt-3 d-flex flex-column flex-md-row">
				<li class="nav-item">
					<a class="nav-link active" data-toggle="tab" href="#photos"> 
					<i class="fas fa-th"></i>
						Board
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#like"> 
					<i class="far fa-heart"></i>
						Like
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#fan"> 
					<i class="far fa-id-badge"></i> 
						Fan
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-toggle="tab" href="#following"> 
					<i class="far fa-id-badge"></i> 
						Following
					</a>
				</li>
			</ul>
		</div>
		

		<div class="profile-tabs tab-content">
			<!-- 내 업로드 사진목록 -->
			<div class="tab-pane fade show active" id="photos">
				<div class="row" id="plus">
					<div class="col-12 col-md-4" style="position:relative;">
						<div id="imgH" class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile1.jpg');">
						</div>
						<div id="aaa" style="position:absolute; display:none; bottom:16px; width:350px; height:300px; background:rgba(0,0,0,0.6);">
							<div style="margin-left:48px; margin-top:135px; color:white; position:relative;">
								<div style="float:left;"><i class="fas fa-heart"></i></div>
								<div style="float:left; left:30px; position:absolute;">100</div>
								<div style="float:left; left:100px; position:absolute;"><i class="fas fa-thumbs-down"></i></div>
								<div style="float:left; left:130px; position:absolute;">400</div>
								<div style="float:left; left:200px; position:absolute;"><i class="fas fa-comment"></i></div>
								<div style="float:left; left:230px; position:absolute;">700</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile2.jpg');">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile3.jpg');">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile4.jpg');">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile5.jpg');">
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile6.jpg');">
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-center my-5">
					<button id="btn1" class="btn btn-outline-primary btn-pill" onclick="plus();">더보기</button>
				</div>
			</div>
			
			<!-- 내 좋아요 사진목록-->
			<div class="tab-pane fade text-center" id="like">
				<!-- <p class="lead">
					<span class="text-danger"><i class="far fa-frown-open"></i></span>
					좋아요한 게시물이 없습니다.
				</p> -->
				<div class="row" id="plus2">
					<div class="col-12 col-md-4">
						<div id="imgL" class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile1.jpg');"></div>
						<div id="aaa1" style="position:absolute; display:none; bottom:16px; width:350px; height:300px; background:rgba(0,0,0,0.6);">
							<div style="margin-left:48px; margin-top:135px; color:white; position:relative;">
								<div style="float:left;"><i class="fas fa-heart"></i></div>
								<div style="float:left; left:30px; position:absolute;">100</div>
								<div style="float:left; left:100px; position:absolute;"><i class="fas fa-thumbs-down"></i></div>
								<div style="float:left; left:130px; position:absolute;">400</div>
								<div style="float:left; left:200px; position:absolute;"><i class="fas fa-comment"></i></div>
								<div style="float:left; left:230px; position:absolute;">700</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile2.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile3.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile4.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile5.jpg');"></div>
					</div>
					<div class="col-12 col-md-4">
						<div class="square"
							style="background-image: url('${pageContext.request.contextPath}/resources/assets/img/profile6.jpg');"></div>
					</div>
				</div>
				<div class="d-flex justify-content-center my-5">
					<button class="btn btn-outline-primary btn-pill" onclick="plus2();">더보기</button>
				</div>
			</div>
			
			<!-- 내가 팔로우한 친구 목록 -->
			<div class="tab-pane fade text-center" id="fan">
				<!-- <p class="lead">
					<span class="text-danger"><i class="far fa-frown-open"></i></span>
					팔로우한 친구가 없습니다.
				</p>
				<a href="#header" class="btn btn-info btn-pill">Find Friend</a> -->
				<div align="center">
					<div style="width:50%;">
						<hr>
						<div style="height:60px;">
							<div style="float:left;">
								<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
								class="img-fluid rounded-circle shadow-lg" style="width: 50px;">
							</div>
							<div style="float:left; margin-left:15px;">
								<div style="text-align:left;">닉네임</div>
								<div id="abc" style="text-align:left;">
									<i class="fas fa-clipboard-list"></i><div>123</div>
									<i class="fas fa-heart"></i><div>123</div>
									<i class="fas fa-comment"></i><div>123</div>
								</div>
							</div>
							<div style="float:left; margin-left:210px;">
								<button class="btn btn-dark"><i class="fa fa-plus"></i> Fan</button>
							</div>
						</div>
						<hr>
						<div style="height:60px;">
							<div style="float:left;">
								<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
								class="img-fluid rounded-circle shadow-lg" style="width: 50px;">
							</div>
							<div style="float:left; margin-left:15px;">
								<div style="text-align:left;">닉네임</div>
								<div id="abc" style="text-align:left;">
									<i class="fas fa-clipboard-list"></i><div>123</div>
									<i class="fas fa-heart"></i><div>123</div>
									<i class="fas fa-comment"></i><div>123</div>
								</div>
							</div>
							<div style="float:left; margin-left:210px;">
								<button class="btn btn-dark"><i class="fa fa-plus"></i> Fan</button>
							</div>
						</div>
						<hr>
						<div style="height:60px;">
							<div style="float:left;">
								<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
								class="img-fluid rounded-circle shadow-lg" style="width: 50px;">
							</div>
							<div style="float:left; margin-left:15px;">
								<div style="text-align:left;">닉네임</div>
								<div id="abc" style="text-align:left;">
									<i class="fas fa-clipboard-list"></i><div>123</div>
									<i class="fas fa-heart"></i><div>123</div>
									<i class="fas fa-comment"></i><div>123</div>
								</div>
							</div>
							<div style="float:left; margin-left:210px;">
								<button class="btn btn-dark"><i class="fa fa-plus"></i> Fan</button>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
			
			<div class="tab-pane fade text-center" id="following">
				<div align="center">
					<div style="width:50%;">
						<hr>
						<div style="height:60px;">
							<div style="float:left;">
								<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
								class="img-fluid rounded-circle shadow-lg" style="width: 50px;">
							</div>
							<div style="float:left; margin-left:15px;">
								<div style="text-align:left;">닉네임</div>
								<div id="abc" style="text-align:left;">
									<i class="fas fa-clipboard-list"></i><div>123</div>
									<i class="fas fa-heart"></i><div>123</div>
									<i class="fas fa-comment"></i><div>123</div>
								</div>
							</div>
							<div style="float:left; margin-left:210px;">
								<button class="btn btn-dark"><i class="fa fa-plus"></i> Fan</button>
							</div>
						</div>
						<hr>
						<div style="height:60px;">
							<div style="float:left;">
								<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
								class="img-fluid rounded-circle shadow-lg" style="width: 50px;">
							</div>
							<div style="float:left; margin-left:15px;">
								<div style="text-align:left;">닉네임</div>
								<div id="abc" style="text-align:left;">
									<i class="fas fa-clipboard-list"></i><div>123</div>
									<i class="fas fa-heart"></i><div>123</div>
									<i class="fas fa-comment"></i><div>123</div>
								</div>
							</div>
							<div style="float:left; margin-left:210px;">
								<button class="btn btn-dark"><i class="fa fa-plus"></i> Fan</button>
							</div>
						</div>
						<hr>
						<div style="height:60px;">
							<div style="float:left;">
								<img src="${pageContext.request.contextPath}/resources/assets/img/lorde.png" alt="Raised circle image"
								class="img-fluid rounded-circle shadow-lg" style="width: 50px;">
							</div>
							<div style="float:left; margin-left:15px;">
								<div style="text-align:left;">닉네임</div>
								<div id="abc" style="text-align:left;">
									<i class="fas fa-clipboard-list"></i><div>123</div>
									<i class="fas fa-heart"></i><div>123</div>
									<i class="fas fa-comment"></i><div>123</div>
								</div>
							</div>
							<div style="float:left; margin-left:210px;">
								<button class="btn btn-dark"><i class="fa fa-plus"></i> Fan</button>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>

	</div>

	<div id="scrollTop1" style="position:fixed; border:1px solid lightgray; display:none; background:white; bottom:10px; right:10px;">
		<a href="#"><img style="width:60px; height:60px;"src="${pageContext.request.contextPath}/resources/assets/img/123a.png"></a>
	</div>
	
	
	<script>
		function plus(){
			var $copy1 = $("<div>").attr("class", "col-12 col-md-4");
			$copy1.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile1.jpg'" + ");"}));
			var $copy2 = $("<div>").attr("class", "col-12 col-md-4");
			$copy2.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile2.jpg'" + ");"}));
			var $copy3 = $("<div>").attr("class", "col-12 col-md-4");
			$copy3.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile3.jpg'" + ");"}));
			var $copy4 = $("<div>").attr("class", "col-12 col-md-4");
			$copy4.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile4.jpg'" + ");"}));
			var $copy5 = $("<div>").attr("class", "col-12 col-md-4");
			$copy5.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile5.jpg'" + ");"}));
			var $copy6 = $("<div>").attr("class", "col-12 col-md-4");
			$copy6.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile6.jpg'" + ");"}));
			
			$("#plus").append($copy1);
			$("#plus").append($copy2);
			$("#plus").append($copy3);
			$("#plus").append($copy4);
			$("#plus").append($copy5);
			$("#plus").append($copy6);
		}
		
		function plus2(){
			var $copy1 = $("<div>").attr("class", "col-12 col-md-4");
			$copy1.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile1.jpg'" + ");"}));
			var $copy2 = $("<div>").attr("class", "col-12 col-md-4");
			$copy2.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile2.jpg'" + ");"}));
			var $copy3 = $("<div>").attr("class", "col-12 col-md-4");
			$copy3.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile3.jpg'" + ");"}));
			var $copy4 = $("<div>").attr("class", "col-12 col-md-4");
			$copy4.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile4.jpg'" + ");"}));
			var $copy5 = $("<div>").attr("class", "col-12 col-md-4");
			$copy5.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile5.jpg'" + ");"}));
			var $copy6 = $("<div>").attr("class", "col-12 col-md-4");
			$copy6.append($("<div>").attr({"class":"square", "style":"background-image: url(" + "'${pageContext.request.contextPath}/resources/assets/img/profile6.jpg'" + ");"}));
			
			$("#plus2").append($copy1);
			$("#plus2").append($copy2);
			$("#plus2").append($copy3);
			$("#plus2").append($copy4);
			$("#plus2").append($copy5);
			$("#plus2").append($copy6);
		}
		
		$(function(){
			$("#alarmBtn").click(function(){
				if($("#alarmDiv").css("display") == "block"){
					$("#alarmDiv").css("display", "none");
				}else{
					$("#alarmDiv").css("display", "block");
				}
				
			});
			
			$("#alarmBtn1").click(function(){
				if($("#alarmDiv1").css("display") == "block"){
					$("#alarmDiv1").css("display", "none");
				}else{
					$("#alarmDiv1").css("display", "block");
				}
				
			});
		});
		
		$(document).ready(function(){
			console.log(123);
			var url = document.location.href;
			var tab = url.split('/').pop();
			$(tab).trigger("click");
			console.log(33);
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
	
	<jsp:include page="../includes/footer.jsp" />
	
</body>
</html>