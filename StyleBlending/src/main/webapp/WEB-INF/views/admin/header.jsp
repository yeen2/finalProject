<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Style Blending</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/datatables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/dataTables.buttons.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/jszip.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/vfs_fonts.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.html5.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.print.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin_temp/js/lib/data-table/buttons.colVis.min.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/admin_temp/js/init/datatables-init.js"></script> --%>
<!-- <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png"> -->
<link rel="shortcut icon" href="/styleblending/resources/admin_temp/images/logo.svg">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_temp/css/cs-skin-elastic.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_temp/css/lib/datatable/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin_temp/css/style.css">
<script type="text/javascript">
	$(function(){
		
		var msg = "${msg}";
		if(msg != null && msg != ""){
			alert(msg);
			//sessionStorage.removeItem("msg");
			<%session.removeAttribute("msg");%>
		}
	});
</script>	
</head>
<body>
	 <!-- Right Panel -->
     <div id="right-panel" class="right-panel">

	 <!-- Header-->
     <header id="header" class="header" >
         <div class="top-left">
             <div class="navbar-header" >
                 <a class="navbar-brand" href="./"><img class="mr-2" height="30" width="50" src ="${pageContext.request.contextPath}/resources/assets/img/logo5.PNG" alt="Logo"><b style="color:white;">Style Blending</b></a>
                 <a class="navbar-brand hidden" href="./"><img src="${pageContext.request.contextPath}/resources/admin_temp/images/logo.svg" alt="Logo"></a>
                 <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
             </div>
         </div>
         <div class="top-right">
             <div class="header-menu">

                 <div class="user-area dropdown float-right">
                     <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                         <img class="user-avatar rounded-circle" src="${pageContext.request.contextPath}/resources/upload/member/${loginUser.renameImg}" alt="User Avatar">
                     </a>

                     <div class="user-menu dropdown-menu">
                         <a class="nav-link" href="mProfile.do"><i class="fa fa-user"></i>My Profile</a>

                         <a class="nav-link" href="#"><i class="fa fa-bell-o"></i>Notifications <span class="count">13</span></a>

				<c:if test="${ empty loginUser}">
					<a class="nav-link" href="loginForm.do"><i class="fa fa-power-off"></i>Sign In</a>
				</c:if>
				<c:if test="${ !empty loginUser && loginUser.email eq 'admin'  }">
					<a class="nav-link" href="logout.do"><i class="fa fa-power-off"></i>Logout</a>
				</c:if>
                         
                     </div>
                 </div>
             </div>
         </div>
     </header><!-- /header -->
     <!-- Header-->
