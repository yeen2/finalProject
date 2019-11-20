<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script async src="https://www.youtube.com/iframe_api"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
@media ( min-aspect-ratio : 16/9) {
	.video-foreground {
		height: 300%;
		top: -100%;
	}
}

@media ( max-aspect-ratio : 16/9) {
	.video-foreground {
		width: 300%;
		left: -100%;
	}
}

h1 {
	color: white;
}

@charset "EUC-KR";

@import url(https://fonts.googleapis.com/earlyaccess/jejugothic.css);

@import url(https://fonts.googleapis.com/earlyaccess/nanumgothic.css);
/* /* p{
		font-family: 'Jeju Gothic';
	} */
p {
	font-family: 'Jeju Gothic';
	font-size: 18px;
}

body {
	font-family: 'Nanum Gothic';
}

p {
	margin: 0px;
}

li {
	font-weight: bold;
}

#aDrop:hover {
	cursor: pointer;
}

.imggg {
	background-size: cover;
	background-position: center center;
}

.card-caption {
	display: block;
	position: absolute;
	bottom: 0;
	left: 5px;
	right: 5px;
	color: #fff;
	background-color: rgba(0, 0, 0, .5);
}

.pop-user-card .pop-rank {
	line-height: 41px;
	font-size: 30px;
	padding: 7px 12px 6px;
}

.pop-user-card .photographer {
	padding-top: 7px;
	padding-bottom: 7px;
	line-height: 20px;
	font-size: 14px;
}

.card-body img:hover {
	transform: scale(1.5);
	transition: transform .5s;
}

.card-body img {
	transform: scale(1.0);
	transition: transform .5s;
}

.block {
	border: 0px solid #d81f25;
	padding: 0 5px;
	height: 20px;
	overflow: hidden;
	background: #fff;
	width: 100px;
	font-family: Gulim;
	font-size: 12px;
}

.block, #ticker, #ticker2, .block li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.block li a {
	display: block;
	height: 20px;
	line-height: 20px;
	color: #555;
	text-decoration: none;
	font-size: large;
}

.block li span {
	padding: 3px 5px;
	background: black;
	color: #fff;
	font-weight: bold;
	margin-right: 3px;
}

#player:hover {
	width: 1000px;
	height: 1000px;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<script type="text/javascript" src="resources/js/typeit.min.js"></script>
	
<body class="index">
	<jsp:include page="includes/header.jsp" />
	
	
	
	<div id="filter-drop"
		style="width: 100%; height: 50px; margin-top: 70px;"></div>
	<div class="container eee" style="margin-top: 18px;">


		<!-- <figure id="banner" style="margin-top: 0px; height:230px;">
		 -->
		<div style="padding: 0px; height: 230px;" class="form-inline">
			<div class="form-group col-9" style="padding: 0px;">
				<img style="width: 820px; height: 230px;"
					src="${pageContext.request.contextPath}/resources/assets/img/배너삼.jpg">
			</div>
			<div class="form-group col-2 block"
				style="margin-bottom: 191px; position: relative;">
				<ul id="ticker" style="height: 230px">

				</ul>
				<ul id="ticker2" style="height: 230px">
					<li
						style="font-family: Gulim; font-size: large; margin-bottom: 10px;"><i
						class="fa fa-search"></i>&nbsp;급상승 겁색어</li>
				</ul>


			</div>
			
 			<div id="player"
				style="z-index:1; position:absolute;margin-left: 840px; width:270px; height: 190px; margin-top: 15px;">
			</div> 
			
			<div class="form-group col-1" style="margin-bottom: 191px">
				<a href="" id="aDrop"><i class="fa fa-chevron-down"
					style="color: black;"></i></a>
			</div>

		</div>

<script>
	

	$(function(){
		topFour();
	});
	function topFour(){
		
		var $fourWrap = $("#fourWrap");
		
		$.ajax({
			url:"mainFourWrap.do",
			dataType:"json",
			success:function(data){
				console.log("성공 topFour");
				$.each(data,function(index, value){
					
					var $input =
								"<div class='col-3'>" +
								"<div class='component'>" +
								"<div class='card' style='overflow:hidden;'>" +
								"<div class='card-body' style='height: 400px; padding: 0px;'>" +
								"<img class='card-img' src="+value.imgPath+"/"+value.renameImg + " style='height:100%'>" +
								"<div>"+
								"<div class='card-footer' style='padding:0px;'>" +
								"<figcaption class='card-caption form-inline' style='left:0px; right:0px;'>"+
								"<b class='pop-rank pull-left'style='line-height: 41px; font-size: 30px; padding: 7px 12px 6px;'>"+(index+1)+"st"+"</b>" +
								"<div class='photographer'style='padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;'>"+
								"Inspired by"+
								"<b>StyleBlending</b>"+
								"</div>"+
								"</figcaption>"+
								"</div>"+
								"</div>"+
								"</div>"+
								"</div>";
								
								$fourWrap.append($input);
				
				});
			//	$fourWrap.append($inputWrap);
			},
			error:function(){
				console.log("실패");
			
			}
			
		});
	}
  	
	$(function(){
		postList();
	})
	
	function postList(){
		
		var $inputWrap = $("#inputWrap");
		//$("#fourWrap").append($inputWrap);
		
		$.ajax({
			url:"mainPostList.do",
			dataType:"json",
			success:function(data){
				console.log("성공 PostList");
				$.each(data,function(index, value){
					
					console.log("아ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ");
					var $input = "<div class='col-md-4'>"+
								 "<div class='component'>"+ 
								 "<div class='card' style='overflow:hidden;'>"+
								 "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
								 "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
								 "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
								 "</div>"+
								 "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
								 "<span style='margin-bottom: 0px; margin-top: 23px;'>"+value.nickName+"<br>"+value.enrollDate+"</span>"+
								 "</div>"+
								 "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
								 "<button class='btn btn-dark'>"+
							 	 "<span style='font-size: 1.2em'>+Fan</span>"+
								 "</button>"+
								 "</div>"+
								 "</div>"+
								 "<div class='card-body' style='height: 400px; padding: 0px;'>"+
								 "<a href='pInfo.do?id=1' style='border-bottom: 0px !important; text-decoration: none black;'>"+
								 "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
								 "</a>"+
								 "</div>"+
								 "<div class='card-footer row'>"+
								 "<div class='col-3 form-inline'>"+
								 "<a href=''><i class='far fa-heart'style='color: black; font-size: 30px;'></i> </a>"+
								 "<p style='margin: 0px;'>"+value.likeCount+"</p>"+
								 "</div>"+
								 "<div class='col-3 form-inline' style='padding: 0px;'>"+
								 "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: black; font-size: 30px;'></i></a>"+
								 "<p style='margin: 0px;'>"+value.replyCount+"</p>"+
								 "</div>"+
								 "</div>"+
								 "</div>"+
								 "</div>"+
								 "</div>";
								 $inputWrap.append($input);						
								 //$("#fourWrap").append($inputWrap);
								 //$("#fourWrap").append($input);
				});
				$("#fourWrap").append($inputWrap);
			},
			error:function(){
				console.log("실패");
			
			}
			
		});
	}
	 
			
</script>

		<div class="row" style="margin-top: 1rem !important" id="fourWrap">
		<%--	<div class="col-3">
				 <div class="component">
					<div class="card" style="overflow: hidden;">

						<div class="card-body" style="height: 400px; padding: 0px;">
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
								alt="dog" style="height: 100%;">
						</div>
						<div class="card-footer" style="padding: 0px">
							<figcaption class="card-caption form-inline"
								style="left: 0px; right: 0px;">
								<b class="pop-rank pull-left"
									style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">1st</b>
								<div class="photographer"
									style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
									<!-- react-text: 1729 -->
									Inspired by
									<!-- /react-text -->
									<b>StyleBlending</b>
								</div>
							</figcaption>
						</div>
					</div>
				</div> 
			</div>
--%>
	<%-- 		<div class="col-3">
				<div class="component">
					<div class="card" style="overflow: hidden;">

						<div class="card-body" style="height: 400px; padding: 0px;">
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
								alt="dog" style="height: 100%;">
						</div>
						<div class="card-footer" style="padding: 0px">
							<figcaption class="card-caption form-inline"
								style="left: 0px; right: 0px;">
								<b class="pop-rank pull-left"
									style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">2nd</b>
								<div class="photographer"
									style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
									<!-- react-text: 1729 -->
									Inspired by
									<!-- /react-text -->
									<b>StyleBlending</b>
								</div>
							</figcaption>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="component">
					<div class="card" style="overflow: hidden;">

						<div class="card-body" style="height: 400px; padding: 0px;">
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
								alt="dog" style="height: 100%;">
						</div>
						<div class="card-footer" style="padding: 0px">
							<figcaption class="card-caption form-inline"
								style="left: 0px; right: 0px;">
								<b class="pop-rank pull-left"
									style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">3rd</b>
								<div class="photographer"
									style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
									<!-- react-text: 1729 -->
									Inspired by
									<!-- /react-text -->
									<b>StyleBlending</b>
								</div>
							</figcaption>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="component">
					<div class="card" style="overflow: hidden;">

						<div class="card-body" style="height: 400px; padding: 0px;">
							<img class="card-img"
								src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
								alt="dog" style="height: 100%;">
						</div>
						<div class="card-footer" style="padding: 0px">
							<figcaption class="card-caption form-inline"
								style="left: 0px; right: 0px;">
								<b class="pop-rank pull-left"
									style="line-height: 41px; font-size: 30px; padding: 7px 12px 6px;">4th</b>
								<div class="photographer"
									style="padding-top: 7px; padding-bottom: 7px; line-height: 20px; font-size: 14px;">
									<!-- react-text: 1729 -->
									Inspired by
									<!-- /react-text -->
									<b>StyleBlending</b>
								</div>
							</figcaption>
						</div>
					</div>
				</div>
			</div>
 --%>
 
 
 
	 	<div class="row mt-3" id="inputWrap">
	 	<%-- 
 				<div class="col-md-4">
					<div class="component">
						<div class="card" style="overflow: hidden;">
							<div class="form-inline"
								style="width: 100%; height: 80px; margin: 0px; color: black;">

								<div class="col-2"
									style="width: 30%; height: 50px; padding: 0px;">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/배너일.png"
										alt="" style="width: 80px; height: 50px; margin-left: 20px;" />
								</div>
								<div class="col-6"
									style="width: 50%; height: 50px; margin-left: 30px;">
									<span style="margin-bottom: 0px; margin-top: 23px;">kimsh940607<br>30주전
									</span>

								</div>
								<div class="col-3"
									style="width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;">
									<button class="btn btn-dark">
										<span style="font-size: 1.2em">+Fan</span>
									</button>

								</div>
							</div>

							<div class="card-body" style="height: 400px; padding: 0px;">
								<a href="pInfo.do?id=1"
									style="border-bottom: 0px !important; text-decoration: none black;">
									<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
									alt="dog" style="height: 100%;">
								</a>
							</div>
							<div class="card-footer row">
								<div class="col-3 form-inline">
									<a href=""><i class="far fa-heart"
										style="color: black; font-size: 30px;"></i> </a>
									<p style="margin: 0px;">30</p>
								</div>
								<div class="col-3 form-inline" style="padding: 0px;">
									<a href=""><i class="far fa-comment" aria-hidden="true"
										style="color: black; font-size: 30px;"></i></a>
									<p style="margin: 0px;">30</p>
								</div>


							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="component">
						<div class="card" style="overflow: hidden;">
							<div class="form-inline"
								style="width: 100%; height: 80px; margin: 0px; color: black;">

								<div class="col-2"
									style="width: 30%; height: 50px; padding: 0px;">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/배너일.png"
										alt="" style="width: 80px; height: 50px; margin-left: 20px;" />
								</div>
								<div class="col-6"
									style="width: 50%; height: 50px; margin-left: 30px;">
									<span style="margin-bottom: 0px; margin-top: 23px;">kimsh940607<br>30주전
									</span>

								</div>
								<div class="col-3"
									style="width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;">
									<button class="btn btn-dark">
										<span style="font-size: 1.2em">+Fan</span>
									</button>

								</div>
							</div>

							<div class="card-body" style="height: 400px; padding: 0px;">
								<a href="pInfo.do?id=1"
									style="border-bottom: 0px !important; text-decoration: none black;">
									<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
									alt="dog" style="height: 100%;">
								</a>
							</div>
							<div class="card-footer row">
								<div class="col-3 form-inline">
									<a href=""><i class="far fa-heart"
										style="color: black; font-size: 30px;"></i> </a>
									<p style="margin: 0px;">30</p>
								</div>
								<div class="col-3 form-inline" style="padding: 0px;">
									<a href=""><i class="far fa-comment" aria-hidden="true"
										style="color: black; font-size: 30px;"></i></a>
									<p style="margin: 0px;">30</p>
								</div>


							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="component">
						<div class="card" style="overflow: hidden;">
							<div class="form-inline"
								style="width: 100%; height: 80px; margin: 0px; color: black;">

								<div class="col-2"
									style="width: 30%; height: 50px; padding: 0px;">
									<img
										src="${pageContext.request.contextPath}/resources/assets/img/배너일.png"
										alt="" style="width: 80px; height: 50px; margin-left: 20px;" />
								</div>
								<div class="col-6"
									style="width: 50%; height: 50px; margin-left: 30px;">
									<span style="margin-bottom: 0px; margin-top: 23px;">kimsh940607<br>30주전
									</span>

								</div>
								<div class="col-3"
									style="width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;">
									<button class="btn btn-dark">
										<span style="font-size: 1.2em">+Fan</span>
									</button>

								</div>
							</div>

							<div class="card-body" style="height: 400px; padding: 0px;">
								<a href="pInfo.do?id=1"
									style="border-bottom: 0px !important; text-decoration: none black;">
									<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
									alt="dog" style="height: 100%;">
								</a>
							</div>
							<div class="card-footer row">
								<div class="col-3 form-inline">
									<a href=""><i class="far fa-heart"
										style="color: black; font-size: 30px;"></i> </a>
									<p style="margin: 0px;">30</p>
								</div>
								<div class="col-3 form-inline" style="padding: 0px;">
									<a href=""><i class="far fa-comment" aria-hidden="true"
										style="color: black; font-size: 30px;"></i></a>
									<p style="margin: 0px;">30</p>
								</div>


							</div>
						</div>
					</div>
				</div>
			<div class="row mt-3">
				<div class="col-md-4">
					<div class="component">
						<div class="card">
							<a href="pInfo.do">
								<div class="card-header">
									<img class="card-img"
										src="${pageContext.request.contextPath}/resources/assets/img/dog-1.jpg"
										alt="dog">
								</div>
							</a>
							<div class="card-body">
								<span class="badge badge-success mb-2">Pets</span>
								<h4 class="card-title">How to look after and care for a dog</h4>
								<p class="card-text">Owning a dog is great fun and immensely
									rewarding. But, dogs have complex needs and each dog is unique.
								</p>
							</div>
							<div class="card-footer">
								<a href="#a" class="btn btn-primary">Read More</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="component">
						<div class="card">
							<div class="card-header">
								<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
									alt="dog">
							</div>
							<div class="card-body">
								<span class="badge badge-warning mb-2">Vacation</span>
								<h4 class="card-title">Woof! How to find dog-friendly
									beaches in Spain</h4>
								<p class="card-text">Considering Spain's abundant coastline,
									beaches that do allow you to take your pooch to feel sand...</p>
							</div>
							<div class="card-footer">
								<a href="#a" class="btn btn-outline-primary">Read More</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="component">
						<div class="card">
							<div class="card-header">
								<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-3.jpg"
									alt="dog">
							</div>
							<div class="card-body">
								<span class="badge badge-secondary mb-2">Hobby</span>
								<h4 class="card-title">Getting Started With Your Puppy</h4>
								<p class="card-text">This new addition to your family will
									require lots of love, attention and plenty of supplies.</p>
							</div>
							<div class="card-footer">
								<a href="#a" class="btn btn-outline-primary">Read More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-3" id="ttt">
				<div class="col-md-4">
					<div class="component">
						<div class="card">
							<a href="pInfo">
								<div class="card-header">
									<img class="card-img"
										src="${pageContext.request.contextPath}/resources/assets/img/dog-1.jpg"
										alt="dog">
								</div>
							</a>
							<div class="card-body">
								<span class="badge badge-success mb-2">Pets</span>
								<h4 class="card-title">How to look after and care for a dog</h4>
								<p class="card-text">Owning a dog is great fun and immensely
									rewarding. But, dogs have complex needs and each dog is unique.
								</p>
							</div>
							<div class="card-footer">
								<a href="#a" class="btn btn-primary">Read More</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="component">
						<div class="card">
							<div class="card-header">
								<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-2.jpg"
									alt="dog">
							</div>
							<div class="card-body">
								<span class="badge badge-warning mb-2">Vacation</span>
								<h4 class="card-title">Woof! How to find dog-friendly
									beaches in Spain</h4>
								<p class="card-text">Considering Spain's abundant coastline,
									beaches that do allow you to take your pooch to feel sand...</p>
							</div>
							<div class="card-footer">
								<a href="#a" class="btn btn-outline-primary">Read More</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-4" id="ddd">
					<div class="component">
						<div class="card">
							<div class="card-header">
								<img class="card-img"
									src="${pageContext.request.contextPath}/resources/assets/img/dog-3.jpg"
									alt="dog">
							</div>
							<div class="card-body">
								<span class="badge badge-secondary mb-2">Hobby</span>
								<h4 class="card-title">Getting Started With Your Puppy</h4>
								<p class="card-text">This new addition to your family will
									require lots of love, attention and plenty of supplies.</p>
							</div>
							<div class="card-footer">
								<a href="#a" class="btn btn-outline-primary">Read More</a>
							</div>
						</div>
					</div>
				</div>
			</div>
 --%>
		</div> 
	</div>
</div>
	<script>
		var page = 2;
		var flag = 0;

		$(window).scroll(
				function() {
					console.log($(window).scrollTop());
					console.log($(document).height());
					console.log($(window).height());
					
					var height = $(window).height() - 920;
					if ($(window).scrollTop() == height && flag == 0) {
						console.log(++page);
						var $inputWrap = $("#inputWrap");
						$.ajax({	
							url:"mainInfinityScroll.do",
							dataType:"json",
							success:function(data){
								console.log("성공 infinitylist");
								$.each(data,function(index, value){
									var $input = "<div class='col-md-4'>"+
									 "<div class='component'>"+ 
									 "<div class='card' style='overflow:hidden;'>"+
									 "<div class='form-inline' style='width:100%; height:80px; margin:0px; color:black;'>" +
									 "<div class='col-2'style='width: 30%; height: 50px; padding: 0px;'>"+
									 "<img src='${pageContext.request.contextPath}/resources/assets/img/배너일.png' style='width: 80px; height: 50px; margin-left: 20px;' />" +
									 "</div>"+
									 "<div class='col-6' style='width: 50%; height: 50px; margin-left: 30px;'>"+
									 "<span style='margin-bottom: 0px; margin-top: 23px;'><br>"+value.enrollDate+"</span>"+
									 "</div>"+
									 "<div class='col-3'style='width: 20%; height: 50px; margin-top: 5px; padding-right: 10px; padding-left: 10px; padding-bottom: 5px;'>"+
									 "<button class='btn btn-dark'>"+
								 	 "<span style='font-size: 1.2em'>+Fan</span>"+
									 "</button>"+
									 "</div>"+
									 "</div>"+
									 "<div class='card-body' style='height: 400px; padding: 0px;'>"+
									 "<a href='pInfo.do?id=1' style='border-bottom: 0px !important; text-decoration: none black;'>"+
									 "<img class='card-img' src="+value.imgPath+"/"+value.renameImg+" alt='dog' style='height: 100%;'>"+
									 "</a>"+
									 "</div>"+
									 "<div class='card-footer row'>"+
									 "<div class='col-3 form-inline'>"+
									 "<a href=''><i class='far fa-heart'style='color: black; font-size: 30px;'></i> </a>"+
									 "<p style='margin: 0px;'>"+value.likeCount+"</p>"+
									 "</div>"+
									 "<div class='col-3 form-inline' style='padding: 0px;'>"+
									 "<a href=''><i class='far fa-comment' aria-hidden='true' style='color: black; font-size: 30px;'></i></a>"+
									 "<p style='margin: 0px;'>30</p>"+
									 "</div>"+
									 "</div>"+
									 "</div>"+
									 "</div>"+
									 "</div>";
									 $inputWrap.append($input);	
						});
						$("#fourWrap").append($inputWrap);
							flag = 1;
							$("#loading").remove();
							},
							error:function(){
								console.log("실패");
							
							}
							
						});
					}
				});			 
		var sel;
		$(document).on("click", ".b", function() {
			console.log("ddd");

			$(".b").children().removeAttr('style');
			$(this).children().css('color', 'white');
			sel = $(this).attr('id');
		});

		var selectC
		$(document).on("click", ".bb", function() {

			var color = $("#selectColor");

			console.log(color);
			//	$(color).css("background",$(this).children().attr("id"))

			selectC = $(this).children().attr("id");
			//$(".bb").children().removeAttr('style');

			$(".bb").children().attr('class', 'fa fa-circle fa-5x');

			$(this).children().attr('class', 'fa fa-check fa-5x');

			// style="height:30px; width:500px; margin-bottom:10px; background:black;"
			color.css({
				"height" : "15px",
				"width" : "500px",
				"margin-top" : "30px",
				"background" : $(this).children().attr("id")
			});

		});

		function reset() {
			$(".b").children().removeAttr('style');
			$(".bb").children().attr('class', 'fa fa-circle fa-5x');
			$("#selectColor").removeAttr('style');
		}
		//AJAX 기능구현 할때사

		function select() {
			$(".b").children().removeAttr('style');
			$(".bb").children().attr('class', 'fa fa-circle fa-5x');
			$("#selectColor").removeAttr('style');
			var category = $("#category").val();
			console.log(sel);
			console.log(category);
			console.log(selectC);

			$.ajax({
				url : "index.jsp",
				data : sel,
				success : function() {
					man(category);
					console.log("성공");
				},
				error : function() {
					console.log("실패");
				}
			});
		}
		function man(category) {

			console.log("안녕하e");

			var filter = $("#filter-drop");
			/*filter.css("border: 1px solid black; width: 100%; height: 50px; margin-top: 50px") */
			filter
					.append("<i class='fa fa-sliders fa-md' style='color:white; margin-top:13px; margin-left:399px;'>"
							+ "<span style='margin-left:20px;'>"
							+ '필터 - '
							+ sel
							+ '   |   <i class="fa fa-circle" style="color:'+selectC+'"></i>   |   '
							+ category
							+ " </span>"
							+ "<a class='btn' onclick='on();' style='margin-left:960px;'><i class='fa fa-times fa-md'></i></a>"
							+ "</i>");
			filter.css({
				"border" : "1px solid black",
				"background" : "black"
			});

		}
		function on() {

			$("#filter-drop").html("");
			$("#filter-drop").css('background', 'white').css('border', '0px');

		}

		$(document)
				.ready(
						function() {
							$('#loading')
									.append(
											"<i class='fa fa-spinner fa-pulse fa-fw fa-5x'></i>");
						});
	</script>

	<script>
		$(function() {
			$("#ticker2").css("display", "none");
			console.log("ddd");
			topSearch();
		});

		function topSearch() {

			var $ul = $("#ticker");

			$
					.ajax({
						url : "topSearch.do",
						dataType : "json",
						success : function(data) {
							console.log("성공");
							$
									.each(
											data,
											function(index, value) {

												$ul
														.append("<li class='ddd'><a href='#'><span style='margin-right:9px;'>"
																+ value.liveno
																+ "</span>"
																+ value.keyword
																+ "</a></li>");

											});
						},
						error : function() {
							console.log("서버통신실패");
						}
					});

		}

		function topSearch2() {

			var $ul = $("#ticker2");

			$
					.ajax({
						url : "topSearch.do",
						dataType : "json",
						success : function(data) {
							$
									.each(
											data,
											function(index, value) {

												$ul
														.append("<li class='ddd' style='margin-bottom:10px;'><a href='#'><span style='margin-right:9px;'>"
																+ value.liveno
																+ "</span>"
																+ value.keyword
																+ "</a></li>");

											});
						},
						error : function() {
							console.log("서버통신실패");
						}
					});

		}

		$(function() {
			var ticker = function() {
				setTimeout(function() {
					$('#ticker li:first').animate(
							{
								marginTop : '-20px'
							},
							400,
							function() {
								$(this).detach().appendTo('ul#ticker')
										.removeAttr('style');
							});
					ticker();
				}, 3000);
			};
			ticker();
		});
	</script>
	<script>
		$('#aDrop').mouseenter(function() {
			console.log("asdasdasd");
			
			//$(".ddd").remove();
			$("#ticker").css("display", "none");
			$("#ticker2").css("display", "block");
			$(".block").css("overflow", "visible");
			$("#player").css("display", "none");
			$(".ddd").remove();
			
			topSearch2();
		});
		$('#aDrop').mouseleave(function() {
			$("#ticker").css("display", "block");
			$("#ticker2").css("display", "none");
			$(".block").css("overflow", "hidden");
			$("#player").css("display", "block");
			
			topSearch();
			

		});
      // 2. This code loads the IFrame Player API code asynchronously.
      var tag = document.createElement('script');

      tag.src = "https://www.youtube.com/iframe_api";
      var firstScriptTag = document.getElementsByTagName('script')[0];
      firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

      // 3. This function creates an <iframe> (and YouTube player)
      //    after the API code downloads.
      var player;
      function onYouTubeIframeAPIReady( ) {
    	  console.log("onyoutube");
       	  $.ajax({
       		 url:"youtubeUrl.do",
       		 success:function(data){
       			var url = data.url;
       			var idx = url.indexOf("="); 
       			var url2 = url.substring(idx+1);
       			console.log("dkdkdkdk"+data.imgPath);
       			window.open("${pageContext.request.contextPath}/resources/assets/ad.jsp?img="+data.imgPath+"&originalImg="+data.originalImg,'','width=345px, height=321px, left=700px, top=300px, toolbar=0, status=yes, menubars=0, scrollbars=0, resizable=0, location=0, directories=0');
       		
    	  player = new YT.Player('player', {
          height: '1000',
          width: '1000',
          videoId: url2,
          events: {
            'onReady': onPlayerReady
            //,'onStateChange': onPlayerStateChange
          }
        }); 
       		 },
       		 error:function(){
       			 
       		 }
       	  });
      }

      // 4. The API will call this function when the video player is ready.
      function onPlayerReady(event) {
        event.target.playVideo();
      }

      // 5. The API calls this function when the player's state changes.
      //    The function indicates that when playing a video (state=1),
      //    the player should play for six seconds and then stop.
      var done = false;
      function onPlayerStateChange(event) {
        if (event.data == YT.PlayerState.PLAYING && !done) {
          setTimeout(stopVideo, 6000);
          done = true;
        }
      }
      function stopVideo() {
        player.stopVideo();
      }
    </script>

	<div id="loading"
		style="width: 100%; height: 50px; margin-left: 900px;"></div>

	<jsp:include page="includes/footer.jsp" />
</body>
</html>
