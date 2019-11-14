<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <title>Style Blending</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="A new design system for developing with less effort.">
    <meta name="author" content="BootstrapBay">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/lazy.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/demo.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.0/css/all.css"
	integrity="sha384-aOkxzJ5uQz7WBObEZcHvV5JvRW3TUc2rNPA7pe3AwnsUohiw1Vj2Rgx2KSOkF5+h"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

<style>
.contact-title {
	margin-bottom: 15px !important;
}

.icons-container ul li {
	display: inline-block;
	width: 4.2em;
	height: 4.2em;
	border: 1px solid #ccc;
	padding: 10px;
	border-radius: 50%;
	margin: 0.25em;
	line-height: 3.5em;
	color: #999;
	transition: 1s 0s linear;
	text-decoration: none;
}

.icon-list {
	padding: 0px;
}

#facebook-circle {
	border: 1px solid #3B5998;
}

#facebook-icon {
	color: #3B5998;
}

#twitter-circle {
	border: 1px solid #42ACC4;
}

#twitter-icon {
	color: #42ACC4;
}

#youtube-circle {
	border: 1px solid #E62117;
}

#youtube-icon {
	color: #E62117;
}

#btn-send-message {
	width: 100%;
}

.line-separator {
	border-bottom: 1px solid #CDC1C5;
}

.box-separator {
	margin-top: 20px;
	padding-bottom: 20px;
}

.icon-separator {
	border-bottom: 2px solid orange;
}

.modal-body {
	
}

.modal-body a:hover {
	transform: scale(1.5);
	transition: transform .5s;
}

.modal-body .btn {
	padding: 0px;
}

</style>


</head>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">

			<a class="navbar-brand d-flex align-items-center" href="${pageContext.request.contextPath}"> 
				<img src="${pageContext.request.contextPath}/resources/assets/img/logo.svg" class="mr-2" height="30"> Stlye Blending
			</a>


			<!-- 검색창 -->

			<div style="width: 223px; padding-left: 10px;">

				<i class="fa fa-search" style="font-size: x-large; color: gray;"></i>
				&nbsp;

				<form action="nav_search.ca" method="get" style="display: inline;">
					<input type="text" id="nav_search" name="nav_search" size="20px;"
						style="background: none; border: none; color: white;"
						placeholder="친구  위치 브랜드별 검색">
				</form>
			</div>



			<!-- 좁아질때 생기는 버튼 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown-1"
				aria-controls="navbarNavDropdown-1" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- 메인 리스트 -->
			<div class="collapse navbar-collapse text-center"
				id="navbarNavDropdown-1">
				<ul class="navbar-nav ml-auto" style="margin-left: 10px;">
					<li class="nav-item">
						<a class="nav-link btn btn" data-toggle="modal" href="#exampleModal"> 
						<i class="fas fa-sliders-h fa-lg"></i>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="mainNotice.do">Notice</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="blist.do">Free board</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="joinForm.do">Join</a>
					</li>
					<li class="nav-item">
						<c:if test="${ empty loginUser }">
							<a class="nav-link" href="loginForm.do">Sign In</a>
						</c:if>
						<c:if test="${ !empty loginUser }">
							<a class="nav-link" href="logout.do">LogOut</a>
						</c:if>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="mPage.do"> 
							<i class="far fa-bell fa-lg" style="font-size: 25px;"></i>
						</a>
					</li>
					<!-- 포스팅 등록 -->
					<li class="nav-item">
						<a class="nav-link" href="pInsertForm.do"> 
							<i class="fas fa-camera fa-lg" style="font-size: 25px;"></i>
						</a>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-user-circle fa-lg" style="font-size: 30px;"></i>
						</a>
							<div class="dropdown-menu"
								aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="mProfile.do">myPage</a> 
								<a class="dropdown-item" href="aPage.do">adminPage</a> 
								<c:if test="${ empty loginUser }">
									<a class="dropdown-item" href="loginForm.do">Sign In</a>
								</c:if>
								<c:if test="${ !empty loginUser }">
									<a class="dropdown-item" href="logout.do">LogOut</a>
								</c:if>
							</div>
					</li>

					<!-- <li class="nav-item active">
						<a class="nav-link" href="#">Home
							<span class="sr-only">(current)</span>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Features</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">Pricing</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#a" id="navbarDropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 
							Services 
						</a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="#">Design</a> 
							<a class="dropdown-item" href="#">Development</a> 
							<a class="dropdown-item" href="#">Marketing</a>
						</div>
					</li> -->

				</ul>
			</div>
			
		</div>
	</nav>
	

<!-----------------------------------------------검색 필터 ---------------------------------  -->

	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">

				<div aria-labelledby="exampleModalLabel" class="modal fade"
					id="exampleModal" role="dialog" tabindex="-1">
					<div class="modal-dialog" role="document" style="">
						<div class="modal-content"
							style="padding: 0px; background-color: #000; background-color: rgba(93, 93, 93, .7); text-align: center;">
							<div class="modal-header" style="padding-bottom: 0px;">
								<button aria-label="Close" class="close" data-dismiss="modal"
									data-toggle="tooltip" title="Exit" type="button">
									<span aria-hidden="true"> × </span>
								</button>
								<h4 class="modal-title" id="exampleModalLabel">
									<i class="fa fa-envelope-o"> </i>
								</h4>
							</div>
							<div class="modal-body row" style="padding-top: 0px;">
								<div class="col-3">
									<!-- 								<a class="btn" href="index.jsp" id="man" onclick="man();">
									<i class="fa fa-male fa-5x" aria-hidden="true"
									aria-label="Close" class="close" data-dismiss="modal"
				 					data-toggle="tooltip" title="Exit"></i>
								</a> -->
									<a class="btn b" id="남자"> <i class="fa fa-male fa-5x"></i>
									</a> <br />
									<br />
									<p style="color: white; margin:0px;">남자</p>
								</div>
								<div class="col-3">
									<!-- <a class="btn" href="">
									<i class="fa fa-female fa-5x" aria-hidden="true"></i>
								</a> -->
									<a class="btn b" id="여자"> <i class="fa fa-female fa-5x"></i>
									</a> <br />
									<br />
									<p style="color: white; margin:0px;">여자</p>
								</div>
								<div class="col-3">
									<a class="btn b" id="전체"> <i class="fa fa-users fa-5x"
										aria-hidden="true"></i>
									</a> <br />
									<br />
									<p style="color: white; margin:0px;">전체</p>
								</div>
								<div class="col-3">
									<a class="btn b" id="기타"> <i class="fa fa-ellipsis-h fa-5x"
										aria-hidden="true"></i>
									</a> <br />
									<br />
									<p style="color: white; margin:0px;">기타</p>
								</div>

							</div>
					
							<div style="border: 1px solid gray; width: 500px; margin-bottom:10px; "></div>		
							
							<div class="modal-body row" style="padding-top: 0px;">
								<div class="btn col-2" style="padding:0px;">
									<a id="red" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: red; " id="red"></i>
									</a> <br />
									<br />
									<p style="color: white;">Red</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="orange" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: orange;" id="orange"></i>
									</a> <br />
									<br />
									<p style="color: white;">Orange</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="yellow" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: yellow;" id="yellow"></i>
									</a> <br />
									<br />
									<p style="color: white;">Yellow</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="green" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: green;" id="green"></i>
									</a> <br />
									<br />
									<p style="color: white;">Green</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="blue" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: blue;" id="blue"></i>
									</a> <br />
									<br />
									<p style="color: white;">Blue</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="navy" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: navy;" id="navy"></i>
									</a> <br />
									<br />
									<p style="color: white;">Navy</p>
								</div>


							</div>
							<div class="modal-body row" style="padding-top: 0px;">
								<div class="col-2" style="padding:0px;">
									<a id="Pupple" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: black;" id="black"></i>
									</a> <br />
									<br />
									<p style="color: white;  margin-bottom: 0px;">Black</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="white" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: white;" id="white"></i>
									</a> <br />
									<br />
									<p style="color: white; margin-bottom: 0px;">White</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="pink" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: pink;" id="pink"></i>
									</a> <br />
									<br />
									<p style="color: white; margin-bottom: 0px;">Pink</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="brown" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: brown;" id="brown"></i>
									</a> <br />
									<br />
									<p style="color: white; margin-bottom: 0px;">Brown</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="beige" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: beige;" id="beige"></i>
									</a> <br />
									<br />
									<p style="color: white; margin-bottom: 0px;">Beige</p>
								</div>
								<div class="col-2"  style="padding:0px;">
									<a id="aqua" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: aqua;" id="aqua"></i>
									</a> <br />
									<br />
									<p style="color: white; margin-bottom: 0px;">Aqua</p>
								</div>
								<div id="selectColor"></div>		
							
								<div class="modal-body form-row" style="padding:0px;">
									<div class="form-group col-sm-12">
										<label for="">Category</label> <select name="category" id="category"
											class="form-control">
											<option value="T-SHIRT" selected="selected">T-SHIRT</option>
											<option value="SWEATSHIRT">SWEATSHIRT</option>
											<option value="SHIRT">SHIRT</option>
											<option value="BRAZER">BRAZER</option>
											<option value="JACKET">JACKET</option>
											<option value="JACKET">JACKET</option>
											<option value="JACKET">JACKET</option>
										</select>
									</div>

								</div>

							</div>
							

							<div class="modal-footer inline"
								style="margin: auto; width: 230px;">
								=
								<div class="col-6 pull-right">
									<a onclick="reset();"
										style="text-decoration: none; color: white; cursor: pointer;">원래대로</a>

								</div>
								<div class="col-6 pull-left">
									<a onclick="select();"
										style="text-decoration: none; color: white; cursor: pointer;"
										data-dismiss="modal">적용</a>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- <script>
var sel;
$(document).on("click", ".btn", function(){
	console.log("ddd");

	$(".btn").children().removeAttr('style');
	$(this).children().css('color','white');
    sel = $(this).attr('id');
});
function reset(){
	$(".btn").children().removeAttr('style');
}
function select(){
	console.log(sel);
	$.ajax({
		url:"index.jsp",
		data:sel,
		success:function(){
			man();
			console.log("성공");
		},
		error:function(){
			console.log("실패");	
		}
	});
}
</script> -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/popper/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/bootstrap.min.js"></script>

	<!-- optional plugins -->
	<script
		src="${pageContext.request.contextPath}//resources/assets/vendor/nouislider/js/nouislider.min.js"></script>

	<!--   lazy javascript -->
	<script src="${pageContext.request.contextPath}//resources/assets/js/lazy.js"></script>