<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<meta charset="UTF-8">
<style>
.form-group{

margin:0px;

}

</style>
<title>Insert title here</title>
</head>
<body style="margin:0px;">
<div style="height: 250px; width:300px;" class="row">
	<div class="form-group" style="height: 303px;">
		<img style="height:303px; width:360px; " src="${pageContext.request.contextPath}${param.img}${param.originalImg}"></img>
	</div>
	<div class="form-group">
		<div style="width: 360px; height: 21px;background: #e3e3e3; border-top: 1px solid #e3e3e3;">
		<a href="" onclick="javascript:window.close();" style="text-decoration:none; color:black" id="">
			<i class="fa fa-times fa-lg pull-right" style="margin-right:10px; margin-top: 3px;"></i>
			<span class="pull-right" style="font-weight: 800; margin-left: 10px; color:black;">닫기</span>
		</a>
		</div>
	</div>
</div>
<script>

</script>
</body>
</html>