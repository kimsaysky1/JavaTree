<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<!-- Google font -->
<link href='../http://fonts.googleapis.com/css?family=Lato:300,400,700'
	rel='stylesheet' type='text/css'>
<link
	href='../http://fonts.googleapis.com/css?family=Raleway:300,400,700,900'
	rel='stylesheet' type='text/css'>
<!-- Css -->
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/library/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/md-font.css">
<link rel="stylesheet" type="text/css"
	href="../resources/javatree_view/html/css/style.css">
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
<title>Mega Course - Learning and Courses HTML5 Template</title>
</head>
<body>
<section id="quizz-intro-section"
			class="quizz-intro-section learn-section">
			<div class="container">
				<div class="title-ct">
					<h3>
						<strong></strong>
					</h3>
			
				</div>
				<div class="question-content-wrap">
					<div class="question-content">
						<h4 class="sm">QUESTION ?? </h4>
							<br><br><br>
						<form action="insertReply" method="post">	
						<table style='width: 600px;'>
							<tr>
								<td style='width: 100px; text-align:center;'><b>FIELD</b></td>
								<td>${question.typeno}</td>
							</tr>
							<tr>
								<td style='height: 20px;'></td>
								<td></td>
							</tr>
							<tr>
								<td style='width: 100px; text-align:center;'><b>QUESTION TITLE</b></td>
								<td><textarea style="height: 60px;">${question.title}</textarea></td>
							</tr>
							<tr>
								<td style='height: 20px;'></td>
								<td></td>
							</tr>
							<tr>
								<td style='width: 100px; text-align:center;'><b>QUESTION CONTENT</b></td>
								<td><textarea style="height: 180px;">${question.content}</textarea></td>
							</tr>
								<tr>
								<td style='height: 20px;'></td>
								<td></td>
							</tr>
							<tr>
								<td style='width: 100px; text-align:center;'><b>ANSWER CONTENT</b></td>
								<td><textarea name="reply.content" style="height: 280px;"></textarea></td>
							</tr>
								<tr>
								<td style='height: 20px;'></td>
								<td></td>
							</tr>
								<tr>
								<td ></td>
									<input type ="hidden" value="${question.questionno}" name="reply.questionno" />
									<td align="right"><input type="submit" value="등록" class="mc-btn-5">&nbsp;&nbsp;&nbsp;
									<input type="reset" value="취소" class="mc-btn-5"></td>
								</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</section>
	
	<!-- Load jQuery -->
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