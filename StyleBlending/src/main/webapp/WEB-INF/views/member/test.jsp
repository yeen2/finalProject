<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	#addAlarmNick1{display:inline-block; width:50%; margin-left:10px;}
	#addAlarmDate1{display:inline-block; width:25%; text-align:right;}
	#addAlarmCon1{padding:10px 10px 10px 10px;}
</style>
</head>
<body style="margin-top:300px;">
	<jsp:include page="../includes/header.jsp"/>
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	
	<!-- 알람창!!! -->
	<div>
	<li class="nav-item">
		<div style="position:relative; margin-left:700px; margin-top:-100px;" id="display">
			<a class="nav-link" id="down"> 
				<i class="far fa-bell fa-lg" style="font-size: 25px;"></i>
			</a>
			<span id="count" class="badge badge-danger badge-pill" 
					style="display:none; pointer-events:none; position:absolute; bottom:19px; left:26px;"></span>
			
			<div style="position:absolute; width:400px; max-height:255px; background:white; display:none; box-shadow:0 5px 10px rgba(0, 0, 0, 0.5);
			overflow-y:auto; overflow-x:hidden; left:-180px; z-index:1000;" id="show" class="show">
				<div style="padding:10px 10px 10px 10px;" align="right">
					<a id="allDelete" data-toggle="tooltip" data-placement="bottom" title="모두 읽음으로 표시"><i style="font-size:30px;" class="far fa-envelope-open"></i></a>
				</div>
				<div id="contentPlus">
					<a class="dropdown-item" href="#">
				    	<div id="addAlarm1">
					    	<div id="addAlarmImg1">
					    		<img src="resources/assets/img/lorde.png">
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
				    </a>
				    <a class="dropdown-item" href="#">
				    	<div id="addAlarm1">
					    	<div id="addAlarmImg1">
					    		<img src="resources/assets/img/lorde.png">
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
				    </a>
				    <a class="dropdown-item" href="#">
				    	<div id="addAlarm1">
					    	<div id="addAlarmImg1">
					    		<img src="resources/assets/img/lorde.png">
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
				    </a>
				</div>
			    
			</div>
		</div>
	</li>
	</div>
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	<!-------------------------------------- 알림창 테스트 --------------------------------------->
	
	
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
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
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	<!-------------------------------------- 검색창 테스트 --------------------------------------->
	
	<!-- 포스팅리스트 -->
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
			style="background-image: url('resources/assets/img/profile2.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile3.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile4.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile5.jpg');">
		</div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile6.jpg');">
		</div>
	</div>
	<!-- 포스팅리스트 -->
	
	<!-- 좋아요리스트 -->
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
			style="background-image: url('resources/assets/img/profile2.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile3.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile4.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile5.jpg');"></div>
	</div>
	<div class="col-12 col-md-4">
		<div class="square"
			style="background-image: url('resources/assets/img/profile6.jpg');"></div>
	</div>
	<!-- 좋아요리스트 -->
	<script>
	/* $(function(){
		$("#alarmBtn").click(function(){
			if($("#alarmDiv").css("display") == "block"){
				$("#alarmDiv").css("display", "none");
			}else{
				$("#alarmDiv").css("display", "block");
			}
			
		});
		
	}); */
	</script>
	
	
	<script>
		$(function(){
			if(${loginUser != null}){
				alarmCheck();
				
				setInterval(function(){
					alarmCheck();
				}, 5000);
				
			}
		});
		
		function alarmCheck(){
			$.ajax({
				url:"mpSAlarmCount.do",
				dataType:"json",
				success:function(result){
					if(result > 0){
						$("#count").css("display", "block");
						$("#count").html("");
						$("#count").append(result);
					}else{
						$("#count").css("display", "none");
					}
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
				
			});
			
			$.ajax({
				url:"mpSAlarmList.do",
				dataType:"json",
				success:function(list){
					console.log("111");
					$("#contentPlus").html("");
					
					$.each(list, function(index, value){
						var $add = "<a class='dropdown-item' href='#'>"
			    				+ "<div id='addAlarm1'>"
			    				+ "<div id='addAlarmImg1'>"
			    				+ "<img src='resources/assets/img/lorde.png'>"
			    				+ "</div>"
			    				+ "<div id='addAlarmNick1'>"
			    				+ "<p>닉네임</p>"
			    				+ "</div>"
			    				+ "<div id='addAlarmDate1'>"
			    				+ "<p>320일전</p>"
			    				+ "</div>"
			    				+ "<div id='addAlarmCon1'>"
			    				+ "<p>~~~님이 팬이 되었습니다.</p>"
			    				+ "</div>"
			    				+ "</div>"
			    				+ "</a>";
			    		
			    		$("#contentPlus").append($add);
						
					});
						
				},
				error:function(){
					console.log("실패");
				}
				
			});
		}
		
		$("#down").on("click", function(){
			if($("#show").css("display") == "block"){
				$("#show").hide();
				
			}else{
				$("#show").show();
			}
		});
		
		$("html").click(function(e){
			if($("#show").css("display") == "block"){
				if(!$("#display").has(e.target).length){
					$("#show").hide();
				}
			}
		});
		
		
	</script>
</body>
</html>