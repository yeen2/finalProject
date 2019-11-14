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
	#addAlarmNick1{display:inline-block; width:50%;}
	#addAlarmDate1{display:inline-block; width:25%; text-align:right;}
	#addAlarmCon1{padding:10px 10px 10px 10px;}
</style>
</head>
<body>
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
	</script>
</body>
</html>