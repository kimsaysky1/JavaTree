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
<title>courseDefaultMain</title>
</head>
<body>

	<%@include file="/resources/header.jsp" %>
		<!-- 가운데 영역 -->
		<section class="blog">
		<div id="mid-course" class="mid-course">
			<div class="container">
		 <div class="course-list">
		 
		 <h2>COURSE-Board</h2>
		  <br>
		 <div class = "course-list-option">
		 <div class="course-list-field">
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
		 <input type="button" value = "SEARCH" class = "mc-btn-7 btn-style-1" id="searchByField">
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
			
<!-- 강좌 리스트 뿌리기 시작 -->			
<div class="blog-list-content">
     
     <s:iterator value="courseList">
     	
		<!-- start post -->
     				<div class="post">
                            <div class="post-body">
                                <div class="post-title">
                                    <h3 class="md"><a href="blog-single.jsp?courseno=<s:property value="courseno" />">
                                    <s:property value="coursename" /></a></h3>
                                </div>
                                	<div class="post-meta">
                                    	by <a href="#"><s:property value="username" /></a> on <s:property value="regdate" />
                                	</div>  
                                   <div class="post-link">
                                    <a href="blog-single.jsp?courseno=<s:property value="courseno" />">
                                        <i class="fa fa-play-circle-o"></i>
                                        Read More
                                    </a>
                                	</div>                           
                            </div>
                     </div>
		<!-- end post -->     
     </s:iterator>
     
     	
     
     
         
<!-- 
                        POST
                        <div class="post">
                            POST BODY
                            <div class="post-body">
                                <div class="post-title">
                                    <h3 class="md"><a href="blog-single.html">Top 10 Design courses of October 2013</a></h3>
                                </div>
                                <div class="post-meta">
                                    by <a href="#">Brett Todd</a> on October 7, 2014
                                </div>  
                                   <div class="post-link">
                                    <a href="blog-single.html">
                                        <i class="fa fa-play-circle-o"></i>
                                        Read More
                                    </a>
                                	</div>                           
                            </div>
                            END / POST BODY
                        </div>
                        END / POST
 -->
                        <ul class="pager">
                            
           <%--   <a href = "getAllCourseList.action?currentPage=${pagenavi.currentPage - 1}&searchText=${searchText}">&lt</a> --%>
				
		<%-- 		<s:iterator var = "counter" begin = "pagenavi.startPageGroup" end="pagenavi.endPageGroup">
					<s:if test="#session.currentPage == #counter">
					 <li class="pager-current">
					 <a href = "getAllCourseList.action?currentPage=<s:property value="#counter"/>&searchText=${searchText}">
						<s:property value="#counter"/>
					</a>
					 </li>
					
					</s:if>
					<s:else>
					<li><a href = "getAllCourseList.action?currentPage=<s:property value="#counter"/>&searchText=${searchText}">
						<s:property value="#counter"/>
					</a></li>
					
					</s:else>			
				</s:iterator> --%>
				<%-- ...
				<a href = "getAllCourseList.action?currentPage=${pagenavi.currentPage + 1}&&searchText=${searchText}">&gt 
				</a> --%>
                            
                          <li class="pager-current">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">next ›</a></li>
                            <li><a href="#">last »</a></li> 
                            
                    </div>
                </div>
                
                 <!-- SIDEBAR -->
                <div class = "course-side">
                    <aside class="blog-sidebar">
  
                        <!-- WIDGET SEARCH -->
                        <div class="widget widget_search">
                            <h4 class="sm">Search Course</h4>
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
                        
                        <!-- 베스트 최근 랭킹 -->
                            <div class="tab-pane fade in active" id="design-question">                               
                                <table class="table-quest">
                                    <tbody>
										
                                        <s:iterator value="allRank" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><s:property value="coursename" /> &nbsp;[ &nbsp;ID: &nbsp; <s:property value="id" /> &nbsp; ]</td>                                          
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
                                        <s:iterator value="recentRank" status="counter" >
                                        <tr>
                                         <td class="count"> <s:property value="#counter.index + 1" /> </td>
                                            <td><s:property value="coursename" />[ID: <s:property value="id" /> ]</td>                                          
                                        </tr>
										</s:iterator>
                                    </tbody>
                                </table>
                            </div>
                            <!-- END / DESIGN ASSIGNMENT -->
    
                        </div>
                        <!-- 내용 끝 -->
                        <!-- 베스트 랭킹 탭 끝 -->

                       
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
	<script src="../resources/jquery-2.2.3.min.js"></script>
	<script src="../resources/jquery-ui.min.js"></script> --%>
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
		
<script>
	
$(document).ready(function() {
	 
	 $("#searchByField").click(function(){
		 var str = '';
		 var cnt;
		 
		 cnt = $(":checkbox:checked").length;
		 $(":checkbox:checked").each(function(index){
		        if(index == cnt-1){
		        	str += $(this).val();
		        }else{
		        	str += $(this).val()+",";
		        }
		    });
	 
		 $.ajax({
		        type : 'get', 
		        url : 'selectListbyField',
		        data : "str="+str,
		        dataType : "json",
		        success : function(response){
		        	 var data = response.courseList;
		        	 alert(data);
		        }
		 
		 });
		 str = '';
	 });
});
	
</script>
		
</body>
</html>