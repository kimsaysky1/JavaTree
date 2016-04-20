<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css" href="../resources/javatree_view/html/css/style.css">
<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
<script type="text/javascript"
		src="../resources/javatree_view/html/js/scripts.js"></script>
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>Mega Course - Learning and Courses HTML5 Template</title>

<style type="text/css">
#join_self_css{
	display: none; 
}
#join_interest_css{
	display: none;
}
</style> 


		
<script type="text/javascript">

$(function(){
	
	$('#join_nextstep').click(function(){
		var cssid = $(this).attr("id");
		if(cssid == 'join_nextstep'){
			$('#join_self_css').css('display','block');
		}
		
	});
	
	$('#join_nextstep2').click(function(){
		
		var cssid = $(this).attr("id");
		
		if(cssid == 'join_nextstep2'){
			$('#join_interest_css').css('display','block');
		}
		
	});
	
	$('#submit_btn').click(function(){
		
		alert("조인 폼 시작 ! ");
		
		var form = document.getElementById("join");
		var id= document.getElementById("id");
		var password= document.getElementById("password");
		var username= document.getElementById("username");
		var email= document.getElementById("email");
		
		alert(id+password+username+email);
		
		/*  if(idck == 0){
				custid.value="";
				custid.setAttribute("placeholder", "아이디 중복확인 필수!");
				return false;
			
			}else  */
		
		/* if(pwd.value =="") {
			pwd.setAttribute('placeholder', '비밀번호를 입력하세요!');
			return false;
		} else if(pwd.value.length <3 || pwd.value.length > 15) {
			alert("비밀번호는 3~15자리 입니다.");
			return false;
		}else if (name.value == ""){
			name.setAttribute('placeholder', '이름을 입력하세요!');
			return false;
		}else if (email.value == ""){
			email.setAttribute('placeholder', '이메일을 입력하세요!');
			return false;
		} 
		  */
		/* 
		var rd = document.getElementsByName("interest_purejava");
		
		 
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked==""){
		 	alert("흥미도를 선택해주세요");
		 	break;																	
		 	}
		 }
		
		var rd = document.getElementsByName("interest_web");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	var interest_web=rd[i].value;
		 	break;
		 	}
		 }
		 
		var rd = document.getElementsByName("interest_mobile");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	var interest_mobile=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("interest_iot");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_iot=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("interest_swing");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_swing=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_jdbc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_jdbc=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_api");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_api=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_spring");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_spring=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_struts");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_struts=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_etcframework");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_etcframework=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_etc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_etc=rd[i].value;
		 	break;
		 	}
		 }
		 
	
		var rd = document.getElementsByName("ability_purejava");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_purejava=rd[i].value;
		 	break;
		 	}
		 }
		
		var rd = document.getElementsByName("ability_web");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_web=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_mobile");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_mobile=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("ability_iot");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_iot=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("ability_swing");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_swing=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_jdbc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_jdbc=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_api");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_api=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_spring");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_spring=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_struts");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_struts=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_etcframework");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_etcframework=rd[i].value;
		 	alert(ability_etcframework+"프레임워크");
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_etc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_etc=rd[i].value;
		 	alert(ability_etc+"어빌리티");
		 	break;
		 	}
		 }  */
		 
		/*  if (i == rd.length){
		 	alert("선택하세요!");
		 	return;
		 } */
		
		 /* member_jt
		 interest ability_purejava
		 ability */
		 
		 document.getElementById('joinForm').submit();
		/*  $('#join').attr('action', 'join').submit(); */
		
		
	});
		

});

</script>

<script type="text/javascript">
function idCheck() { 
	
	var id = document.getElementById("id");

	if(id.value == "") {
		id.setAttribute("placeholder", "아이디를 입력해주세요!");
		return false;
	} else if(id.value.length < 3 || id.value.length > 15) {
		alert("아이디는 3~15자리 입니다.");
		return false;
	} else {
		idck=1;
		window.open('idCheck.action?id='+id.value,'pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');	
	}	
}

</script>
<%-- <script type="text/javascript">

	var idck = 0;  
	
	// 아이디 중복 체크
	function idCheck() { 
		
		var id = document.getElementById("id");
	
		if(id.value == "") {
			id.setAttribute("placeholder", "아이디를 입력해주세요!");
			return false;
		} else if(id.value.length < 3 || id.value.length > 15) {
			alert("아이디는 3~15자리 입니다.");
			return false;
		} else {
			idck=1;
			window.open('idCheck.action?id='+id.value,'pop','resizable=no scrollbars=yes top=300 left=500 width=300 height=180');	
		}	
	}


	function joinForm(){
		
		alert("조인 폼 시작 ! ");
		
		var form = document.getElementById("join");
		var id= document.getElementById("id");
		var password= document.getElementById("password");
		var username= document.getElementById("username");
		var email= document.getElementById("email");
		
		alert(id+password+username+email);
		
		
		/* if(idck == 0){
			custid.value="";
			custid.setAttribute("placeholder", "아이디 중복확인 필수!");
			return false;
		
		}else if(pwd.value =="") {
			pwd.setAttribute('placeholder', '비밀번호를 입력하세요!');
			return false;
		} else if(pwd.value.length <3 || pwd.value.length > 15) {
			alert("비밀번호는 3~15자리 입니다.");
			return false;
		}else if (name.value == ""){
			name.setAttribute('placeholder', '이름을 입력하세요!');
			return false;
		}else if (email.value == ""){
			email.setAttribute('placeholder', '이메일을 입력하세요!');
			return false;
		} 
		 */
		
		/* var rd = document.getElementsByName("interest_purejava");
		
		 
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked==""){
		 	alert("흥미도를 선택해주세요");
		 	break;																	
		 	}
		 }
		
		var rd = document.getElementsByName("interest_web");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	var interest_web=rd[i].value;
		 	break;
		 	}
		 }
		 
		var rd = document.getElementsByName("interest_mobile");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	var interest_mobile=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("interest_iot");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_iot=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("interest_swing");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_swing=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_jdbc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_jdbc=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_api");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_api=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_spring");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_spring=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_struts");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_struts=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_etcframework");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_etcframework=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("interest_etc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	interest_etc=rd[i].value;
		 	break;
		 	}
		 }
		 
	
		var rd = document.getElementsByName("ability_purejava");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_purejava=rd[i].value;
		 	break;
		 	}
		 }
		
		var rd = document.getElementsByName("ability_web");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_web=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_mobile");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_mobile=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("ability_iot");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_iot=rd[i].value;
		 	break;
		 	}
		 }
		
		 var rd = document.getElementsByName("ability_swing");
		
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_swing=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_jdbc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_jdbc=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_api");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_api=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_spring");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_spring=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_struts");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_struts=rd[i].value;
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_etcframework");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_etcframework=rd[i].value;
		 	alert(ability_etcframework+"프레임워크");
		 	break;
		 	}
		 }
		 
		 var rd = document.getElementsByName("ability_etc");
			
		 for(var i=0;i<rd.length;i++){
		 	if (rd[i].checked){
		 	alert("선택한 값:" + rd[i].value);
		 	ability_etc=rd[i].value;
		 	alert(ability_etc+"어빌리티");
		 	break;
		 	}
		 } */
		 
		/*  if (i == rd.length){
		 	alert("선택하세요!");
		 	return;
		 } */
		
		 /* member_jt
		 interest ability_purejava
		 ability */
		 
		 document.getElementById('joinForm').submit();
		/*  $('#join').attr('action', 'join').submit(); */
		
	}
	


	
</script> 
 --%>
</head>
<body>
	<header id="header" class="header">
	<div class="container">

		<!-- LOGO -->
		<div class="logo">
			<a href="index.html"><img src="../resources/javatree_view/html/images/logo.png" alt=""></a>
		</div>
		<!-- END / LOGO -->

		<!-- NAVIGATION -->
		<nav class="navigation">

		<div class="open-menu">
			<span class="item item-1"></span> 
			<span class="item item-2"></span> 
			<span class="item item-3"></span>
		</div>

		<!-- MENU -->
		<ul class="menu">
			<li class="current-menu-item"><a href="index.html">HOME</a></li>
			<li class="menu-item-has-children megamenu col-4"><a href="#">COURSE</a>
				<ul class="sub-menu">
					<li class="menu-item-has-children"><a href="#">Account 1</a>
						<ul class="sub-menu">
							<li><a href="account-assignment.html">Account Assignment</a></li>
							<li><a href="account-inbox.html">Account Inbox</a></li>
							<li><a href="account-learning.html">Account Learning</a></li>
							<li><a href="account-profile-owner-view.html">Account Profile Owner</a></li>
							<li><a href="account-profile-guest-view.html">Account Profile Guest</a></li>
							<li><a href="account-teaching.html">Account Teaching</a></li>
							<li><a href="setting.html">Setting</a></li>
						</ul></li>

					<li class="menu-item-has-children"><a href="#">Asignment 2</a>
						<ul class="sub-menu">
							<li><a href="asignment-after-submit.html">Asignment After Submit</a></li>
							<li><a href="asignment-list.html">Asignment List</a></li>
							<li><a href="asignment-marking.html">Asignment Marking</a></li>
							<li><a href="asignment-received.html">Asignment Received</a></li>
							<li><a href="asignment-submit.html">Asignment Submit</a></li>
							<li><a href="become-teacher.html">Become Teacher</a></li>
							<li><a href="categories.html">Categories</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="#">Course 3</a>
						<ul class="sub-menu">
							<li><a href="course-intro.html">Course Intro</a></li>
							<li><a href="course-learn.html">Course Learn</a></li>
							<li><a href="create-basic-information.html">Create Basic Information</a></li>
							<li><a href="create-design-course.html">Create Design Course</a></li>
							<li><a href="create-publish-course.html">Create Publish Course</a></li>
							<li><a href="request-teacher.html">Request Teacher</a></li>
							<li><a href="search-result-found.html">Search Result Found</a></li>
							<li><a href="search-result-not-found.html">Search Result Found</a></li>
						</ul></li>
					<li class="menu-item-has-children"><a href="#">Learn 3</a>
						<ul class="sub-menu">
							<li><a href="learning.html">Learning</a></li>
							<li><a href="quizz-1.html">Quizz 1</a></li>
							<li><a href="quizz-2.html">Quizz 2</a></li>
							<li><a href="quizz-3.html">Quizz 3</a></li>
							<li><a href="quizz-5.html">Quizz 5</a></li>
							<li><a href="quizz-20.html">Quizz 20</a></li>
							<li><a href="quizz-finish.html">Quizz Finish</a></li>
							<li><a href="quizz-intro.html">Quizz Intro</a></li>
						</ul></li>
				</ul></li>
			<li class="menu-item-has-children"><a href="blog-list.html"
				id="jt">JAVATree</a>
				<ul class="sub-menu">
					<li><a href="blog-list.html">Blog list</a></li>
					<li><a href="blog-single.html">Blog single</a></li>
				</ul></li>
			<li class="menu-item-has-children"><a href="WEB-INF/views/login.jsp">LOGIN</a></li>
			<li><a href="register.html">JOIN IN</a></li>
		</ul>
		<!-- END / MENU --> <!-- SEARCH BOX -->
		<div class="search-box">
			<i class="icon md-search"></i>
			<div class="search-inner">
				<form>
					<input type="text" placeholder="key words">
				</form>
			</div>
		</div>

		</nav>
		<!-- END / NAVIGATION -->

	</div>
	</header>



	<section id="login-content" class="login-content">

	<div class="awe-parallax bg-login-content"></div>
	<div class="awe-overlay"></div>
	<div class="container">
	<div id="mid-join" class="mid-join">

	<form method="post" id="joinForm" name="joinForm" action="join">

		<!-- 로그인(1) -->
		<div class="form-login2" id = "join_login_css">
				<h2 class="text-uppercase">JOIN</h2>

				<div id="id-part">
					<div class="form-ID">
						<input type="text" placeholder="ID" id="id" name="id">
					</div>

					<div class="form-btn" align="right">
						<input type="button" value="Check" onclick="javascript:idCheck();">
					</div>
				</div>

				<div class="form-datebirth">
					<input type="text" placeholder="NAME" id="username" name="username">
				</div>
				<div class="form-password">
					<input type="password" placeholder="Password" id="password" name="password">
				</div>
				<div class="form-email">
					<input type="text" placeholder="Email" id="email" name="email">
				</div>

				<div class="form-submit-1" >
					<input type="button" id = "join_nextstep" value="Next Step" class="mc-btn btn-style-1">
				</div> 
			<!-- </form> -->
		</div>
		<!-- 로그인 (1) 끝 -->

		<!-- 흥미도(2) -->
		<div class="form-login3" id="join_self_css">
			<!--  <form method="post" id="join_self" name="join_self">  --><!-- action="join" -->
				<h2 class="text-uppercase">INTEREST</h2>

				<table height="500px" width="300px">
					<tr>
						<td align="center"><label>PURE JAVA</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_purejava.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_purejava.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_purejava.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>WEB</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_web.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_web.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_web.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>MOBILE</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_mobile.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_mobile.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_mobile.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>IOT</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_iot.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_iot.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_iot.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SWING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_swing.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_swing.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_swing.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>JDBC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_jdbc.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_jdbc.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_jdbc.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>API</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_api.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_api.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_api.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SPRING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_spring.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_spring.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio"name="interest_spring.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>STRUTS</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_struts.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_struts.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_struts.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>etcFramework</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etcframework.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etcframework.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etcframework.value" value="1"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>ETC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etc.value" value="3"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etc.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="interest_etc.value" value="1"> <label>하</label>
						</td>
					</tr>
				</table>

				 <div class="form-submit-1" >
					<input type="button" id = "join_nextstep2" value="Next Step" class="mc-btn btn-style-1">
				</div> 

			<!-- </form> -->
		</div>
		<!-- 흥미도 (2) 끝 -->
		
		<!-- 자가진단(3) -->
		<div class="form-login3" id="join_interest_css">
	
				<h2 class="text-uppercase">SELF CHECK</h2>

				<table height="500px" width="300px">
					<tr>
						<td align="center"><label>PURE JAVA</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_purejava.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_purejava.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_purejava.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>WEB</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_web.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_web.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_web.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>MOBILE</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_mobile.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_mobile.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_mobile.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>IOT</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_iot.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_iot.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_iot.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SWING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_swing.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_swing.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_swing.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>JDBC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_jdbc.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_jdbc.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_jdbc.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>API</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_api.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_api.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_api.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>SPRING</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_spring.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_spring.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_spring.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>STRUTS</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_struts.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_struts.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_struts.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>etcFramework</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etcframework.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etcframework.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etcframework.value" value="3"> <label>하</label>
						</td>
					</tr>

					<tr>
						<td align="center"><label>ETC</label> &nbsp;</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etc.value" value="1"> <label>상</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio"name="ability_etc.value" value="2"> <label>중</label>
						</td>

						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" name="ability_etc.value" value="3"> <label>하</label>
						</td>
					</tr>
				</table>

				<div class="form-submit-1">
					<input type="button" value="JOIN IN" class="mc-btn btn-style-1" id = "submit_btn">
				</div>
	
		</div>
		<!-- 자가진단 (3) 끝 -->
		</form>
		</div><!-- mid-join -->

	</div> <!-- container -->

	</section>

	<!-- FOOTER -->
	<footer id="footer" class="footer">
	<div class="second-footer">
		<div class="container">
			<div class="contact">
				<div class="email">
					<i class="icon md-email"></i> <a href="#">course@megadrupal.com</a>
				</div>
				<div class="phone">
					<i class="fa fa-mobile"></i> <span>+84 989 999 888</span>
				</div>
				<div class="address">
					<i class="fa fa-map-marker"></i> <span>Maecenas sodales, nisl eget</span>
				</div>
			</div>
			<p class="copyright">Copyright © 2014 Megadrupal. All rights reserved.</p>
		</div>
	</div>
	</footer>
	<!-- END / FOOTER -->
	
	<!-- Load jQuery -->
		<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.owl.carousel.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.appear.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/perfect-scrollbar.min.js"></script>
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery.easing.min.js"></script>
	
	
	

</body>
</html>