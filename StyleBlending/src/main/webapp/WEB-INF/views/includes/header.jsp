<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Style Blending</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description"
	content="A new design system for developing with less effort.">
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


#addSearch{width:100%; height:inherit; background:lightgray; border:2px solid white;}
#addSearchImg{padding:10px 0 10px 10px; width:10%; height:auto; display:inline-block;}
#addSearchImg img{width:50px; height:50px; border-radius:1.5em;}
#addSearchNick{display:inline-block; width:50%; margin-top:10px;}
#addSearchDate{display:inline-block; width:25%; text-align:right;}
#addSearchCon{padding:10px 10px 10px 10px;}
#fanAreaBtn:hover, #brandAreaBtn:hover, #hashtagAreaBtn:hover, #locationAreaBtn:hover{cursor:pointer}
#fanAreaBtn, #brandAreaBtn, #hashtagAreaBtn, #locationAreaBtn{width:24%;}

.addAlarm1{width:100%; height:inherit; background:rgba(0,0,0,0.05); border-top:1px solid lightgray; border-bottom:1px solid lightgray;}
.addAlarmImg1{padding:10px 0 0 10px; width:17%; height:auto; display:inline-block;}
.addAlarmImg1 img{width:50px; height:50px; border-radius:1.5em;}
.addAlarmNick1{display:inline-block; width:50%; margin-left:10px;}
.addAlarmDate1{display:inline-block; width:25%; text-align:right;}
.addAlarmCon1{padding:10px 10px 10px 10px;}
.addAlarm1 p{font-size:15px;}
#alarmDelete:hover{cursor:pointer; color:gray;}

</style>
<script type="text/javascript">
	$(function(){
		
		var msg = "${msg}";
		if(msg != null && msg != ""){
			alert(msg);
		}
	});
</script>	
	
</head>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
		<div class="container">

			<a class="navbar-brand d-flex align-items-center"
				href="${pageContext.request.contextPath}"> <img
				src="${pageContext.request.contextPath}/resources/assets/img/logo.svg"
				class="mr-2" height="30"> Stlye Blending
			</a>


			<!-- 검색창 -->

			<div style="width: 223px; padding-left: 10px;" id="searchDivOne">

				<i class="fa fa-search" style="font-size: x-large; color: gray;"></i>
				&nbsp;
					
					<form action="pNavSearch.do" method="get" style="display: inline;">
						<input type="text" id="nav_search" name="keyword" size="20px;" autocomplete="off"
							style="background: none; border: none; color: white;"
							placeholder="친구  위치 브랜드별 검색">
				
				
				
					<div style="position:relative; margin-left:100px;" id="displaySearch">
					
					<!-- 검색 결과 창 -->
						<div style="position:absolute; top:2px; left:-100px; width:400px; max-height:255px; box-shadow:0 5px 10px rgba(0, 0, 0, 0.5);
							overflow-y:auto; overflow-x:hidden; background:white; display:none; z-index:1000;" id="searchDiv">
							<div style="width:100%; height:50px;">
								<ul style="padding:7px 5px 5px 8px;">
									<input type="checkbox" id="fanCheckBox" name="type" value="0">
									<label for="fanCheckBox" class="btn btn-dark" id="fanAreaBtn">회원</label>
									<input type="checkbox" id="brandCheckBox" name="type" value="1">
									<label for="brandCheckBox" class="btn btn-light" id="brandAreaBtn">브랜드</label>
									<input type="checkbox" id="hashtagCheckBox" name="type" value="2">
									<label for="hashtagCheckBox" class="btn btn-light" id="hashtagAreaBtn">#태그</label>
									<input type="checkbox" id="locaCheckBox" name="type" value="3">
									<label for="locaCheckBox" class="btn btn-light" id="locationAreaBtn">위치</label>
								</ul>
							</div>
							
						    <!-- 알림 추가될 때마다 div 추가 -->
						    <!-- 회원 추가 -->
						    <div id="fanArea" style="display:block; padding:0 5px 5px 5px;">
						    	
						    </div>
						    
						    <!-- 브랜드 추가 -->
						    <div id="brandArea" style="display:none; padding:0 5px 5px 5px;">
						    	
							</div>
							
							<!-- 해시태그 추가 -->
						    <div id="hashtagArea" style="display:none; padding:0 5px 5px 5px;">
					
						    </div>
						    
						    <!-- 위치 추가 -->
						    <div id="locationArea" style="display:none; padding:0 5px 5px 5px;">
						    
						    </div>
						    
						    
						</div>
					</div>
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
               <li class="nav-item" style="margin-top:9px;"><a class="nav-link btn btn"
                  data-toggle="modal" href="#exampleModal"> <i
                     class="fas fa-sliders-h fa-lg"></i>
               </a></li>
               <li class="nav-item" style="margin-top:5px;"><a class="nav-link" href="mainNotice.do">Notice</a>
               </li>
               <li class="nav-item" style="margin-top:5px;"><a class="nav-link" href="blist.do">Free
                     board</a></li>
               <li class="nav-item" style="margin-top:5px;"><a class="nav-link" href="joinForm.do">Join</a>
               </li>
               <li class="nav-item" style="margin-top:5px;"><c:if test="${ empty loginUser }">
                     <a class="nav-link" href="loginForm.do">Sign In</a>
                  </c:if> <c:if test="${ !empty loginUser }">
                     <a class="nav-link" href="logout.do">LogOut</a>
                  </c:if></li>


					<!-- 알림창 -->
					<li class="nav-item" style="margin-top:5px;">
						<div style="position:relative;" id="display">
							<a class="nav-link" id="down" href="#"> 
								<i class="far fa-bell fa-lg" style="font-size: 25px;"></i>
							</a>
							<span id="count" class="badge badge-danger badge-pill" 
									style="display:none; pointer-events:none; position:absolute; bottom:19px; left:19px;"></span>
							
							<div style="position:absolute; width:400px; max-height:255px; background:white; display:none; box-shadow:0 5px 10px rgba(0, 0, 0, 0.5);
							overflow-y:auto; overflow-x:hidden; left:-175px; z-index:1000;" id="show" class="show">
								<div style="padding:10px 10px 10px 10px;" align="right">
									<i style="font-size:30px;" class="far fa-envelope-open" id="alarmDelete"></i>
								</div>
								<div id="contentPlus">
									
								</div>
							    
							</div>
						</div>
					</li>
					<!-- <li class="nav-item"><a class="nav-link" id="down" href="#">
							<i class="far fa-bell fa-lg" style="font-size: 25px;"></i>
					</a></li> -->

					<!-- 포스팅 등록 -->
					<li class="nav-item" style="margin-top:5px;"><a class="nav-link" href="pInsertForm.do">
	                     <i class="fas fa-camera fa-lg" style="font-size: 25px;"></i>
	               </a></li>
	               <li class="nav-item dropdown"><a
	                  class="nav-link dropdown-toggle" id="navbarDropdownMenuLink"
	                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	               <c:if test="${ empty loginUser }">
	                     <i class="fas fa-user-circle fa-lg" style="font-size: 30px;"></i>
	               </c:if>
	               <c:if test="${ !empty loginUser }">
	                  <img class="card-img" src="${pageContext.request.contextPath}/resources/assets/img/${loginUser.renameImg}" style='height:39px; width: 50px;'>
	               </c:if>
	               </a>
	               
						<div class="dropdown-menu"
							aria-labelledby="navbarDropdownMenuLink">
							<a class="dropdown-item" href="mProfile.do">myPage</a> <a
								class="dropdown-item" href="aPage.do">adminPage</a>
							<c:if test="${ empty loginUser }">
								<a class="dropdown-item" href="loginForm.do">Sign In</a>
							</c:if>
							<c:if test="${ !empty loginUser }">
								<a class="dropdown-item" href="logout.do">LogOut</a>
							</c:if>
						</div></li>

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
									</a> <br /> <br />
									<p style="color: white; margin: 0px;">남자</p>
								</div>
								<div class="col-3">
									<!-- <a class="btn" href="">
									<i class="fa fa-female fa-5x" aria-hidden="true"></i>
								</a> -->
									<a class="btn b" id="여자"> <i class="fa fa-female fa-5x"></i>
									</a> <br /> <br />
									<p style="color: white; margin: 0px;">여자</p>
								</div>
								<div class="col-3">
									<a class="btn b" id="전체"> <i class="fa fa-users fa-5x"
										aria-hidden="true"></i>
									</a> <br /> <br />
									<p style="color: white; margin: 0px;">전체</p>
								</div>
								<div class="col-3">
									<a class="btn b" id="기타"> <i class="fa fa-ellipsis-h fa-5x"
										aria-hidden="true"></i>
									</a> <br /> <br />
									<p style="color: white; margin: 0px;">기타</p>
								</div>

							</div>

							<div
								style="border: 1px solid gray; width: 500px; margin-bottom: 10px;"></div>

							<div class="modal-body row" style="padding-top: 0px;">
								<div class="btn col-2" style="padding: 0px;">
									<a id="red" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: red;" id="red"></i>
									</a> <br /> <br />
									<p style="color: white;">Red</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="orange" class="btn bb"> <i
										class="fa fa-circle fa-5x" aria-hidden="true"
										style="color: orange;" id="orange"></i>
									</a> <br /> <br />
									<p style="color: white;">Orange</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="yellow" class="btn bb"> <i
										class="fa fa-circle fa-5x" aria-hidden="true"
										style="color: yellow;" id="yellow"></i>
									</a> <br /> <br />
									<p style="color: white;">Yellow</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="green" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: green;" id="green"></i>
									</a> <br /> <br />
									<p style="color: white;">Green</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="blue" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: blue;" id="blue"></i>
									</a> <br /> <br />
									<p style="color: white;">Blue</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="navy" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: navy;" id="navy"></i>
									</a> <br /> <br />
									<p style="color: white;">Navy</p>
								</div>


							</div>
							<div class="modal-body row" style="padding-top: 0px;">
								<div class="col-2" style="padding: 0px;">
									<a id="Pupple" class="btn bb"> <i
										class="fa fa-circle fa-5x" aria-hidden="true"
										style="color: black;" id="black"></i>
									</a> <br /> <br />
									<p style="color: white; margin-bottom: 0px;">Black</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="white" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: white;" id="white"></i>
									</a> <br /> <br />
									<p style="color: white; margin-bottom: 0px;">White</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="pink" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: pink;" id="pink"></i>
									</a> <br /> <br />
									<p style="color: white; margin-bottom: 0px;">Pink</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="brown" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: brown;" id="brown"></i>
									</a> <br /> <br />
									<p style="color: white; margin-bottom: 0px;">Brown</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="beige" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: beige;" id="beige"></i>
									</a> <br /> <br />
									<p style="color: white; margin-bottom: 0px;">Beige</p>
								</div>
								<div class="col-2" style="padding: 0px;">
									<a id="aqua" class="btn bb"> <i class="fa fa-circle fa-5x"
										aria-hidden="true" style="color: aqua;" id="aqua"></i>
									</a> <br /> <br />
									<p style="color: white; margin-bottom: 0px;">Aqua</p>
								</div>
								<div id="selectColor"></div>

								<div class="modal-body form-row" style="padding: 0px;">
									<div class="form-group col-sm-12">
										<label for="">Category</label> <select name="category"
											id="category" class="form-control">
											<option value="" disabled="">상의</option>
											<option value="T-SHIRT">&nbsp;&nbsp;&nbsp;T-SHIRT</option>
											<option value="SWEATSHIRT">&nbsp;&nbsp;&nbsp;SWEATSHIRT</option>
											<option value="SHIRT">&nbsp;&nbsp;&nbsp;SHIRT</option>
											<option value="BLAZER">&nbsp;&nbsp;&nbsp;BLAZER</option>
											<option value="JACKET">&nbsp;&nbsp;&nbsp;JACKET</option>
											<option value="OUTER">&nbsp;&nbsp;&nbsp;OUTER</option>
											<option value="SLEEVELESS">&nbsp;&nbsp;&nbsp;SLEEVELESS</option>
											<option value="CROP TEE">&nbsp;&nbsp;&nbsp;CROP TEE</option>
											<option value="HOODIE">&nbsp;&nbsp;&nbsp;HOODIE</option>
											<option value="POLO">&nbsp;&nbsp;&nbsp;POLO</option>
											<option value="KNIT">&nbsp;&nbsp;&nbsp;KNIT</option>
											<option value="TANK TOP">&nbsp;&nbsp;&nbsp;TANK TOP</option>
											<option value="VEST">&nbsp;&nbsp;&nbsp;VEST</option>
											<option value="CARDIGAN">&nbsp;&nbsp;&nbsp;CARDIGAN</option>
											<option value="COAT">&nbsp;&nbsp;&nbsp;COAT</option>
											<option value="" disabled="">하의</option>
											<option value="JEANS">&nbsp;&nbsp;&nbsp;JEANS</option>
											<option value="PANTS">&nbsp;&nbsp;&nbsp;PANTS</option>
											<option value="SHORTS">&nbsp;&nbsp;&nbsp;SHORTS</option>
											<option value="SKIRT">&nbsp;&nbsp;&nbsp;SKIRT</option>
											<option value="" disabled="">신발</option>
											<option value="SNEAKERS">&nbsp;&nbsp;&nbsp;SNEAKERS</option>
											<option value="BOOTS">&nbsp;&nbsp;&nbsp;BOOTS</option>
											<option value="HEELS">&nbsp;&nbsp;&nbsp;HEELS</option>
											<option value="SANDALS">&nbsp;&nbsp;&nbsp;SANDALS</option>
											<option value="CASUAL SHOES">&nbsp;&nbsp;&nbsp;CASUAL
												SHOES</option>
											<option value="FORMAL SHOES">&nbsp;&nbsp;&nbsp;FORMAL
												SHOES</option>
											<option value="" disabled="">악세서리</option>
											<option value="BAG">&nbsp;&nbsp;&nbsp;BAG</option>
											<option value="JEWELRY">&nbsp;&nbsp;&nbsp;JEWELRY</option>
											<option value="BRACELET">&nbsp;&nbsp;&nbsp;BRACELET</option>
											<option value="WATCH">&nbsp;&nbsp;&nbsp;WATCH</option>
											<option value="HAT">&nbsp;&nbsp;&nbsp;HAT</option>
											<option value="EYEWEAR">&nbsp;&nbsp;&nbsp;EYEWEAR</option>
											<option value="GLOVES">&nbsp;&nbsp;&nbsp;GLOVES</option>
											<option value="SCARF">&nbsp;&nbsp;&nbsp;SCARF</option>
											<option value="SOCKS">&nbsp;&nbsp;&nbsp;SOCKS</option>
											<option value="WALLET">&nbsp;&nbsp;&nbsp;WALLET</option>
											<option value="TIE">&nbsp;&nbsp;&nbsp;TIE</option>
											<option value="" disabled="">기타</option>
											<option value="SWIMWEAR">&nbsp;&nbsp;&nbsp;SWIMWEAR</option>
											<option value="DRESS">&nbsp;&nbsp;&nbsp;DRESS</option>
											<option value="JUMPSUIT">&nbsp;&nbsp;&nbsp;JUMPSUIT</option>
											<option value="OVERALL">&nbsp;&nbsp;&nbsp;OVERALL</option>
											<option value="SUIT">&nbsp;&nbsp;&nbsp;SUIT</option>
											<option value="ONE-PIECE">&nbsp;&nbsp;&nbsp;ONE-PIECE</option>
											<option value="CAMERA">&nbsp;&nbsp;&nbsp;CAMERA</option>
											<option value="PHONE">&nbsp;&nbsp;&nbsp;PHONE</option>
											<option value="SNACK">&nbsp;&nbsp;&nbsp;SNACK</option>
											<option value="ETC.">&nbsp;&nbsp;&nbsp;ETC.</option>
											<option value="BIKE">&nbsp;&nbsp;&nbsp;BIKE</option>
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

	<!-- 검색창 스크립트 -->
	<script>
		$(function(){
			$("#nav_search").on("input", function(){
				var search = $("#nav_search").val();
				
				if(search != ""){
					$("#searchDiv").show();
					$.ajax({
						url:"mpSSearchFan.do",
						data:{search:search},
						dataType:"json",
						type:"get",
						success:function(list){
							$("#fanArea").html("");
							
							if(list == ""){
								var $fanNull = "<div id='addSearch'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-user-alt'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>검색 결과가 없습니다.</p>"
										    	+"</div>"
										    	+"</div>";
							    	
								$("#fanArea").append($fanNull);
							}else{
								$.each(list, function(index, value){
									var $fan = "<a style='color:black;' href='mpViewProfile.do?mno=" + value.mno + "'>"
												+"<div id='addSearch' class='fanFan'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-user-alt'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>" + value.nickName + "</p>"
										    	+"</div>"
										    	+"</div>"
										    	+"</a>";
										    	
									$("#fanArea").append($fan);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
					
					$.ajax({
						url:"mpSSearchBrand.do",
						data:{search:search},
						dataType:"json",
						type:"get",
						success:function(list){
							$("#brandArea").html("");
							
							if(list == ""){
								var $brandNull = "<div id='addSearch'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-search'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>검색 결과가 없습니다.</p>"
										    	+"</div>"
										    	+"</div>";
						
								$("#brandArea").append($brandNull);
							}else{
								$.each(list, function(index, value){
									var $brand = "<a style='color:black;' href='pNavSearch.do?type=1&keyword=" + value.brand + "'>"
												+"<div id='addSearch' class='brandBrand' value='" + value.pno + "'>"
										    	+"<div id='addSearchImg'>"
									    		+"<i class='fas fa-search'></i>"
										    	+"</div>"
										    	+"<div id='addSearchNick'>"
									    		+"<p>" + value.brand + "</p>"
										    	+"</div>"
										    	+"</div>"
										    	+"</a>";
									
									$("#brandArea").append($brand);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
					
					$.ajax({
						url:"mpSSearchHashtag.do",
						data:{search:search},
						dataType:"json",
						type:"get",
						success:function(list){
							$("#hashtagArea").html("");
							
							if(list == ""){
								var $hashtagNull = "<div id='addSearch'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-hashtag'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>검색 결과가 없습니다.</p>"
											    	+"</div>"
											    	+"</div>";
							    	
									$("#hashtagArea").append($hashtagNull);
							}else{
								$.each(list, function(index, value){
									var $hashtag = "<a style='color:black;' href='pNavSearch.do?type=2&keyword=" + value.hashtag + "'>"
													+"<div id='addSearch' class='hashHash' value='" + value.pno + "'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-hashtag'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>" + value.hashtag + "</p>"
											    	+"</div>"
											    	+"</div>"
											   		+"</a>";
											    	
									$("#hashtagArea").append($hashtag);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});

					$.ajax({
						url:"mpSSearchLoca.do",
						data:{search:search},
						dataType:"json",
						type:"get",
						success:function(list){
							$("#locationArea").html("");
							
							if(list == ""){
								var $locationNull = "<div id='addSearch'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-map-marker-alt'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>검색 결과가 없습니다.</p>"
											    	+"</div>"
												    +"</div>";
								    
								$("#locationArea").append($locationNull);
							}else{
								$.each(list, function(index, value){
									var $location = "<a style='color:black;' href='pNavSearch.do?type=3&keyword=" + value.location + "'>"
													+"<div id='addSearch' class='locaLoca' value='" + value.pno + "'>"
											    	+"<div id='addSearchImg'>"
										    		+"<i class='fas fa-map-marker-alt'></i>"
											    	+"</div>"
											    	+"<div id='addSearchNick'>"
										    		+"<p>" + value.location + "</p>"
											    	+"</div>"
												    +"</div>"
												    +"</a>";
												    
									$("#locationArea").append($location);
									
								});
							}
							
						},
						error:function(){
							console.log("ajax 통신 실패");
						}
					});
				}else{
					$("#searchDiv").hide();
					
				}
				
			});
			
			
			// 검색 메뉴 클릭 시
			$("#fanAreaBtn").click(function(){
				$("#fanArea").show();
				$("#fanAreaBtn").attr("class","btn btn-dark");
				$("#brandArea").hide();
				$("#brandAreaBtn").attr("class","btn btn-light");
				$("#hashtagArea").hide();
				$("#hashtagAreaBtn").attr("class","btn btn-light");
				$("#locationArea").hide();
				$("#locationAreaBtn").attr("class","btn btn-light");
			});
			$("#brandAreaBtn").click(function(){
				$("#fanArea").hide();
				$("#fanAreaBtn").attr("class","btn btn-light");
				$("#brandArea").show();
				$("#brandAreaBtn").attr("class","btn btn-dark");
				$("#hashtagArea").hide();
				$("#hashtagAreaBtn").attr("class","btn btn-light");
				$("#locationArea").hide();
				$("#locationAreaBtn").attr("class","btn btn-light");
			});
			$("#hashtagAreaBtn").click(function(){
				$("#fanArea").hide();
				$("#fanAreaBtn").attr("class","btn btn-light");
				$("#brandArea").hide();
				$("#brandAreaBtn").attr("class","btn btn-light");
				$("#hashtagArea").show();
				$("#hashtagAreaBtn").attr("class","btn btn-dark");
				$("#locationArea").hide();
				$("#locationAreaBtn").attr("class","btn btn-light");
			});
			$("#locationAreaBtn").click(function(){
				$("#fanArea").hide();
				$("#fanAreaBtn").attr("class","btn btn-light");
				$("#brandArea").hide();
				$("#brandAreaBtn").attr("class","btn btn-light");
				$("#hashtagArea").hide();
				$("#hashtagAreaBtn").attr("class","btn btn-light");
				$("#locationArea").show();
				$("#locationAreaBtn").attr("class","btn btn-dark");
			});
			
			// 검색 결과 뷰 영역 외 클릭 시
			$("html").click(function(e){
				if($("#searchDiv").css("display") == "block"){
					if(!$("#displaySearch").has(e.target).length){
						$("#searchDiv").hide();
					}
					if(!$("#searchDivOne").has(e.target).length){
						$("#searchDiv").hide();
					}
				}
			});
			
			$("#displaySearch input").css("display", "none");
			
		});
	</script>
	
	<!-- 웹소켓 알람 스크립트 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script>
	<script type="text/javascript">
		var sock = null;
		var mno = ${loginUser.mno}
		
	    $(document).ready(function() {
	        sock = new SockJS("/styleblending/count");
	        
	        // 연결 성공
	        sock.onopen = function() {
	        	console.log("연결 성공");
	        	sock.send(mno);
	        }
	        // 연결 해제
	        sock.onclose = function() {
	        	console.log("연결 해제");
	        }
	        // 메세지 보내고 받을 때
	        sock.onmessage = function(evt) {
	        	var alarmCountNo = 0;
	            var json = evt.data;
	            
	            var obj = JSON.parse(json);
	            console.log(obj);
	            
	            if(obj != ""){
	            	for(var i=0; i<obj.length; i++){
		            	alarmCountNo = obj[i].alarmCount;
		            	
		            	if(obj[i].type == 1){
		            		var $add = "<a class='dropdown-item' href='mpViewProfile.do?mno=" + obj[i].bmno + "'>"
			    				+ "<div class='addAlarm1'>"
			    				+ "<div class='addAlarmImg1'>"
			    				+ "<img src='resources/upload/member/" + obj[i].renameImg + "'>"
			    				+ "</div>"
			    				+ "<div class='addAlarmNick1' align='left'>"
			    				+ "<p>" + obj[i].nickName + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmDate1' align='right'>"
			    				+ "<p>" + obj[i].enrollDate + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmCon1'>"
			    				+ "<p>" + obj[i].nickName + "님이 게시글에 좋아요를 눌렀습니다.</p>"
			    				+ "</div>"
			    				+ "</div>"
			    				+ "</a>";
		    		
		    				$("#contentPlus").append($add);
		            	}else if(obj[i].type == 2){
		            		var $add = "<a class='dropdown-item' href='mpViewProfile.do?mno=" + obj[i].bmno + "'>"
			    				+ "<div class='addAlarm1'>"
			    				+ "<div class='addAlarmImg1'>"
			    				+ "<img src='resources/upload/member/" + obj[i].renameImg + "'>"
			    				+ "</div>"
			    				+ "<div class='addAlarmNick1' align='left'>"
			    				+ "<p>" + obj[i].nickName + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmDate1' align='right'>"
			    				+ "<p>" + obj[i].enrollDate + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmCon1'>"
			    				+ "<p>" + obj[i].nickName + "님이 게시글에 댓글을 작성하였습니다.</p>"
			    				+ "</div>"
			    				+ "</div>"
			    				+ "</a>";
		    		
		    				$("#contentPlus").append($add);
		            	}else{
		            		var $add = "<a class='dropdown-item' href='mpViewProfile.do?mno=" + obj[i].bmno + "'>"
			    				+ "<div class='addAlarm1'>"
			    				+ "<div class='addAlarmImg1'>"
			    				+ "<img src='resources/upload/member/" + obj[i].renameImg + "'>"
			    				+ "</div>"
			    				+ "<div class='addAlarmNick1' align='left'>"
			    				+ "<p>" + obj[i].nickName + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmDate1' align='right'>"
			    				+ "<p>" + obj[i].enrollDate + "</p>"
			    				+ "</div>"
			    				+ "<div class='addAlarmCon1'>"
			    				+ "<p>" + obj[i].nickName + "님이 팬이 되었습니다.</p>"
			    				+ "</div>"
			    				+ "</div>"
			    				+ "</a>";
		    		
		    				$("#contentPlus").append($add);
		            	}
		    			
		            }
	            }else{
	            	$("#show").html("");
					
					var $add = "<div style='padding:20px 10px 10px 10px' align='center'>"
	    				+ "<p><span class='text-danger'><i class='far fa-frown-open'></i></span> 알림이 없습니다.</p>"
	    				+ "</div>";
	    		
	    			$("#show").append($add);
	            }
	            
	            
	            if(alarmCountNo != 0){
	            	$("#count").css("display", "block");
					$("#count").html("");
					$("#count").append(alarmCountNo);
	            }
	            
	        }
		    
		});
	    
	    $("#down").on("click", function(){
			if($("#show").css("display") == "block"){
				$("#show").hide();
				
			}else{
				$("#show").show();
			}
				
			if(${ loginUser == null }){
				$("#show").html("");
				
				var $add = "<div style='padding:20px 10px 10px 10px' align='center'>"
					+ "<p><span class='text-danger'></span>로그인 후 이용해주세요.</p>"
    				+ "<button class='btn btn-dark' id='alarmLogin'>로그인</button>"
    				+ "</div>";
    		
    			$("#show").append($add);
			}
		});
		
		$("html").click(function(e){
			if($("#show").css("display") == "block"){
				if(!$("#display").has(e.target).length){
					$("#show").hide();
				}
			}
		});
		
		$(document).on("click", "#alarmLogin", function(){
			location.href="loginForm.do";
		});
		
		$("#alarmDelete").click(function(){
			$.ajax({
				url:"mpUpdateAlarm.do",
				data:{mno:mno},
				type:"post",
				success:function(result){
					if(result == 1){
						$("#show").html("");
						
						var $add = "<div style='padding:20px 10px 10px 10px' align='center'>"
		    				+ "<p><span class='text-danger'><i class='far fa-frown-open'></i></span> 알림이 없습니다.</p>"
		    				+ "</div>";
		    		
		    			$("#show").append($add);
		    			
		    			$("#count").html("");
		    			$("#count").css("display", "none");
						
					}else{
						console.log("알람 모두읽음 실패");
					}
					
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		});
	
		
	</script>

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
	<script
		src="${pageContext.request.contextPath}//resources/assets/js/lazy.js"></script>