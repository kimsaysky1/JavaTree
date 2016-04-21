<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='http://fonts.googleapis.com/css?family=Lato:300,400,700'rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>Mega Course - Learning and Courses HTML5 Template</title>
<script type="text/javascript" src="../resources/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="../resources/jquery-ui.min.js"></script>
</head>
<body>
	<!-- HEADER -->
		<header id="header" class="header">
			<div class="container">

				<!-- LOGO -->
				<div class="logo">
					<a href="index.html"><img
						src="resources/javatree_view/html/images/logo.png" alt=""></a>
				</div>
				<!-- END / LOGO -->

				<!-- NAVIGATION -->
				<nav class="navigation">

					<div class="open-menu">
						<span class="item item-1"></span> <span class="item item-2"></span>
						<span class="item item-3"></span>
					</div>

					<!-- MENU -->
					<ul class="menu">
						<li class="current-menu-item"><a href="index.html">HOME</a></li>
						<li class="menu-item-has-children megamenu col-4"><a href="#">COURSE</a></li>
						<li class="menu-item-has-children"><a href="/javatree/qna/qnaDefaultMain.action" id="jt">JAVATree</a></li>					
					<s:if test="%{#session.loginId != null}">
						<li><a href="/javatree/member/logout.action">LOGOUT</a></li>
					</s:if>
					<s:else>	
						<li class="menu-item-has-children"><a href="/javatree/member/loginFrom.action">LOGIN</a></li>
						<li><a href="/javatree/member/joinForm.action">JOIN IN</a></li>
					</s:else>
					</ul>
					<!-- END / MENU -->

					<!-- SEARCH BOX -->
					<div class="search-box">
						<i class="icon md-search"></i>
						<div class="search-inner">
							<form>
								<input type="text" placeholder="key words">
							</form>
						</div>
					</div>
					<!-- END / SEARCH BOX -->
										<!-- LIST ACCOUNT INFO -->
					<ul class="list-account-info">
					
					<!-- account 사진 및 로그아웃 -->
					<li class="list-item account">
							<div class="account-info item-click">
								<img src="../resources/javatree_view/html/images/team-13.jpg"
									alt="">
							</div>
							<div class="toggle-account toggle-list">
								<ul class="list-account">
									<li><a href="login.html"><i
											class="icon md-arrow-right"></i>Log Out</a></li>
								</ul>
							</div>
						</li>

						<!-- NOTIFICATION -->
						<li class="list-item notification">
							<div class="notification-info item-click">
								<i class="icon md-bell"></i> <span class="itemnew"></span>
							</div>
							<div class="toggle-notification toggle-list">
								<div class="list-profile-title">
									<h4>Notification</h4>
									<span class="count-value">2</span>
								</div>

								<ul class="list-notification">

									<!-- LIST ITEM -->
									<li class="ac-new"><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
											
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li class="ac-new"><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
												
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->

									<!-- LIST ITEM -->
									<li><a href="#">
											<div class="list-body">
												<div class="author">
													<span>Megacourse</span>
													<div class="div-x"></div>
												</div>
												<p>attend Salary for newbie course</p>
											
												<div class="time">
													<span>5 minutes ago</span>
												</div>
											</div>
									</a></li>
									<!-- END / LIST ITEM -->
								</ul>
							</div>
						</li>
						<!-- END / NOTIFICATION -->
					</ul>
					<!-- END / LIST ACCOUNT INFO -->
					<ul class="menu">
						<li class="menu-item-has-children"><a href="/javatree/course/selectAllCourseList.action" id="jt">MY PAGE</a>
							<s:if test="%{#session.loginId != null}">
								<ul class="sub-menu">
									<li><a href="/javatree/course/selectAllCourseListForTeach.action">Teach MYPAGE</a></li>
									<li><a href="/javatree/course/selectAllCourseListForStudy.action">Study MYPAGE</a></li>
								</ul>
							</s:if>
						</li>
					</ul>
				</nav>
				<!-- END / NAVIGATION -->
			</div>
		</header>
		<!-- END / HEADER -->
		
		
			<script type="text/javascript"
		src="../resources/javatree_view/html/js/library/jquery-1.11.0.min.js"></script>
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
	<script type="text/javascript"
		src="../resources/javatree_view/html/js/scripts.js"></script>
</body>
</html>