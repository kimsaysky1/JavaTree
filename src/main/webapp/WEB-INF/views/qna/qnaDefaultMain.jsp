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

		<%@include file="/resources/header.jsp" %>
		
		 <section class="sub-banner sub-banner-course">
        <div class="awe-static bg-sub-banner-course"></div>
        <div class="container">
            <div class="sub-banner-content">
                <h2 class="text-center">JAVATree</h2>
            </div>
        </div>
    </section>
		
		<!-- 가운데 영역 -->
		<section class="blog">
		<div id="mid-qna" class="mid-qna">
			<div class="container">
		 <div class="qna-list">
		 
		 <h2>JAVATreeBoard</h2>
		 
		 <div class = "qna-list-option">
		 <div class="qna-list-field">
			 <fieldset>
			 <legend>Field</legend>
			 <input type="checkbox" name="interest" value="1" />&nbsp;<label>PUREJAVA</label>
			 &nbsp;<input type="checkbox" name="interest" value="2" />&nbsp;<label>WEB</label>
			 &nbsp;<input type="checkbox" name="interest" value="3" />&nbsp;<label>MOBILE</label>
			 &nbsp;<input type="checkbox" name="interest" value="4" />&nbsp;<label>IOT</label>
			 &nbsp;<input type="checkbox" name="interest" value="5" />&nbsp;<label>SWING</label>
			 &nbsp;<input type="checkbox" name="interest" value="6" />&nbsp;<label>JDBC</label>
			 &nbsp;<input type="checkbox" name="interest" value="7" />&nbsp;<label>API</label>
			 <br>
			 <input type="checkbox" name="interest" value="8" />&nbsp;<label>SPRING</label>
			 &nbsp;<input type="checkbox" name="interest" value="9" />&nbsp;<label>STRUTS</label>
			 <input type="checkbox" name="interest" value="10" />&nbsp;<label>etcFramework</label>
			 &nbsp;<input type="checkbox" name="interest" value="11" />&nbsp;<label>ETC</label>
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" value = "SEARCH" class = "mc-btn-7 btn-style-1" id="searchByCheckBox" />
       </fieldset>
       </div>
       
       <div class = "course-list-list">
       <fieldset>
       <legend>List</legend>
       <br>
       <select name="listoption" style="width: 120px; height: 30px;">
       <option value="new">최신순</option>
       <option value="old">오래된 순</option>
       </select>
		 </fieldset>
		 </div>
		 </div>
			<div class="blog-list-content">
					<s:iterator value="questionList" status="incr">
						<!-- POST -->
                        <div class="post" id = "<s:property value="%{#incr.index+1}"/>">                      
                            <!-- POST BODY -->
                            <div class="post-body">
                                <div class="post-title">
                                    <h3 class="md"><a href="qnaDetail.action?questionno=<s:property value="questionno"/>"><s:property value="title"/></a></h3>
                                </div>
                                <div class="post-meta">
                                    by <a href="#"><s:property value="username"/></a> <s:property value="regdate"/>
                                </div>                                           
                            </div>
                            <!-- END / POST BODY -->
                        </div>
                        <!-- END / POST -->
					</s:iterator>
                        <ul class="pager">
							<%-- <s:iterator var="counter" begin="pagenavi.startPageGroup" end="pagenavi.endPageGroup" > 
								<li><a href="qnaDefaultMain.action?currentPage=<s:property value="#counter"/>&type=${type}&keyword=${keyword}" >
								<s:property value="#counter"/></a></li>
							</s:iterator>
                        	<li><a href="qnaDefaultMain.action?currentPage=${pagenavi.currentPage - 1}&type=${type}&keyword=${keyword}">이전</a></li>
							<li><a href="qnaDefaultMain.action?currentPage=${pagenavi.currentPage + 1}&type=${type}&keyword=${keyword}">다음</a></li> --%>
                            <!-- <li class="pager-current">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">next ›</a></li>
                            <li><a href="#">last »</a></li> -->
                            
                            <li><a href="#" id= "watchMore">더보기</a></li>
                        </ul>
                    </div>
                </div>
                
                 <!-- SIDEBAR -->
                <div class = "qna-side">
                    <aside class="blog-sidebar">
                    
                    	<!-- 질문 버튼 -->
                    	
                    	<div class="form-submit-1">
                    		<form action="insertQuestionReady" name="insertQuestion" method="get">
								<input type="button" value="WRITE QUESTION" id = "insertQuestionReady" class="mc-btn btn-style-1">
                    		</form>
						</div>
                    	
                    	<!-- 질문 버튼 끝 -->
                    	<br><br>

                        <!-- WIDGET SEARCH -->
                        <div class="widget widget_search">
                            <h4 class="sm">Search in JAVATree</h4>
                            <form>
                                <div class="form-item">
                                    <input type="text">
                                </div>
                                <div class="form-actions">
                                    <input type="submit">
                                </div>
                            </form>
                        </div>
                        <!-- END / WIDGET SEARCH -->
                        
                        <!-- 베스트 랭킹 탭 1 -->
						
						<h4 class="sm">BEST RANKING</h4>
						<!-- 탭ㅂㅂㅂㅂㅂ -->
						<div class="tab-content">
                            <ul class="design-course-tabs" role="tablist">
                            <li>
                                <a href="#design-question" role="tab" data-toggle="tab">Total RANK</a>
                            </li>
                            <li>
                                <a href="#design-assignment" role="tab" data-toggle="tab">Recent RANK</a>
                            </li>
                        </ul>
                        <!-- 탭 끝 -->
                        <!--  탭 내용  -->
                        
                        <!-- 궁금도 랭킹 -->
                            <div class="tab-pane fade in active" id="design-question">                               
                                <table class="table-quest">
                                    <tbody>
                                    	<s:iterator value="bestAllQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>">답변자: <s:property value="id"/> - <s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <div class="tab-pane fade" id="design-assignment">
                                
                                <table class="table-assignment">
                                    <tbody>
                                        <s:iterator value="bestRecentQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>">답변자: <s:property value="id"/> - <s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 베스트 랭킹 탭 끝 -->
                        
                       
                        <!-- 궁금 랭킹 탭 -->
						
						<h4 class="sm">GUNGGUM RANKING</h4>
						<!-- 탭ㅂㅂㅂㅂㅂ -->
						<div class="tab-content">
                            <ul class="design-course-tabs" role="tablist">
                            <li>
                                <a href="#design-question1" role="tab" data-toggle="tab">Total RANK</a>
                            </li>
                            <li>
                                <a href="#design-assignment1" role="tab" data-toggle="tab">Recent RANK</a>
                            </li>
                        </ul>
                        <!-- 탭 끝 -->
                        <!--  탭 내용  -->
                        
                        <!-- 궁금 랭킹 -->
                            <div class="tab-pane fade in active" id="design-question1">                               
                                <table class="table-quest">
                                    <tbody>
 										<s:iterator value="gunggumAllQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>">질문자: <s:property value="id"/> -<s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN QUESTION -->

                            <!-- DESIGN ASSIGNMENT -->
                            <div class="tab-pane fade" id="design-assignment1">
                                
                                <table class="table-assignment">
                                    <tbody>
                                        <s:iterator value="gunggumRecentQuestionList">
	                                        <tr>
	                                         <td class="count">1</td>
	                                            <td><a href="qnaDetail?questionno=<s:property value="questionno"/>"><s:property value="title"/></a></td>                                          
	                                        </tr>
                                    	</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 궁금도 랭킹 탭 끝 -->
                       
                    </aside>
                    </div>
                <!-- END / SIDEBAR -->
                
	</div>
		</div>
		 
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
						<i class="fa fa-map-marker"></i> <span>Maecenas sodales,nisl eget</span>
					</div>
				</div>
				<p class="copyright">Copyright © 2014 Megadrupal. All rights reserved.</p>
			</div>
		</div>
	</footer>
	<!-- END / FOOTER -->
	
	<!-- Load jQuery -->
	<script type="text/javascript">
	
	$(function(){
		
		$('#insertQuestionReady').on('click', function(){
			insertQuestion.submit();
		});
		
		$("body").on('click', "#searchByCheckBox", function(){
			
			var stringForTokenizer = '';
			var test = $("[name=interest]");
			for(var i = 0; i < test.length; i++){
				if(test[i].checked){
					stringForTokenizer += test[i].value + ',';
				}
			}
			$.ajax({
				type: 'GET'
					, url: 'searchListByInterest'
					, data : 'stringForTokenizer='+stringForTokenizer
					, dataType : 'json'
					, success : function(response){
						var list = response.questionList;
						var indexNum = 1;
						$('.blog-list-content').html('');
						list.forEach(function(question){
							var divTag = $('<div class="post" id='+(indexNum++)+'><div class="post-body"></div></div>');
							divTag.html('<div class="post-title"><h3 class="md"><a href="qnaDetail.action?questionno='+question.questionno+'">'
							+question.title+'</a></h3></div><div class="post-meta">by'
							+question.username+' '+question.regdate+'</div>').appendTo(".blog-list-content");
						});
						$('<ul class="pager"><li><a href="#" id= "watchMore">더보기</a></li></ul>').appendTo('.blog-list-content');
					}	
			});
		});
		
		
		$("body").on('click', '#watchMore', function(){
			var start = $(".blog-list-content > div:last").attr('id');
			start = parseInt(start) + 1;
			var end = start + 4;
			var stringForTokenizer = '';
			var test = $("[name=interest]");
			for(var i = 0; i < test.length; i++){
				if(test[i].checked){
					stringForTokenizer += test[i].value + ',';
				}
			}
			$.ajax({
				type: 'GET'
				, url: 'plusQnaDefaultMain'
				, data : 'start='+start+'&end='+end+'&stringForTokenizer='+stringForTokenizer
				, dataType : 'json'
				, success : function(response){
					var indexNum = start;
					var list = response.questionList;
					list.forEach(function(question){
						var divTag = $('<div class="post" id='+(indexNum++)+'><div class="post-body"></div></div>');
						divTag.html('<div class="post-title"><h3 class="md"><a href="qnaDetail.action?questionno='+question.questionno+'">'
						+question.title+'</a></h3></div><div class="post-meta">by'
						+question.username+' '+question.regdate+'</div>').insertAfter(".blog-list-content > div:last");
					});
				}
			});
			//event.preventDefault(); 
		});
	});
	</script>
	
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