<%@page import="com.DAO.selectDAO"%>
<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main1.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>Insert title here</title>
<style>
#header h1{
		color:black; 
	}
	
	}
#header p {
    font-size: 1em;
}
#header > .container {
    padding: 0em 0 5em 0;
    border-bottom: solid 1px white;
}
</style>

</head>
<body class="no-sidebar is-preload">
	<%
		memberVO vo = (memberVO) session.getAttribute("vo");
	%>
		<!-- 고정 상단 메뉴 시작 -->
	<section class="mainpage" style="width: 100%; margin: 0 auto;">

		<header class="main_gnb">
			<div class="Main">
				<div></div>
				<div class="top_menu al" style="align: left;">
					<div class="inner" style="align: left;">

						<!-- logo -->
						<h1 style="align:left">
							<a href="login.jsp">
							<img src="images/submenu.png" style="width:40px; height:40px; align:left; onclick="ShowMenu()">
							</a>
							<a href="main.jsp" > <span class="pc"> 
							<img src="images/sccovy_logo.png" style="height:60px; width:200px;">
									
							</span>
							</a>
						</h1>
						<!-- //logo -->
						<!-- 검색 -->
						<div class="search" >
							<input style="width:570px;" type="text" placeholder="원하시는 검색어를 입력하세요!" title="검색"
								id="inp_search" onkeyup="completechk();"
								onkeydown="wordsListDelete();" autocomplete="off"> <a
								href="javascript:btnGnbSearch();" class="btn_search">검색</a>

							<div class="area_keyword" style="display: none;">
								<h2>어제의 인기 검색어</h2>
								<ul id="p_search_hd1">
								</ul>
								<ul id="p_search_hd2">
								</ul>
								<div class="close">
									<button type="button">닫기</button>
								</div>
							</div>
							<div class="words_list" style="display: none;">
								<ul>
								</ul>
								<div class="close">
									<button type="button" onclick="wordsListHide();">닫기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="btm_menu">
					<div class="slide_menu">
						
						<ul style="float: left;">
							<li><a href="thema_course.jsp">테마별 여행 코스</a></li>
							<li style="margin: 0px;"><a href="main.jsp">홈</a></li>
							<li style="margin: 0px;"><a href=",community_board/list.jsp">게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>
	</section>
	<!-- 고정 상단 메뉴 끝 -->

		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container" style="padding-top: 80px;">

						<!-- Logo -->
							<h1 id="logo"><a href="recommend.jsp">추천 코스</a></h1>

					</div>
				</section>

			<!-- Main -->
			
				<section id="main">
					<div class="container">
						<div id="content">

							<!-- Post -->
								<article class="box post">
									<header>
										<h3>추천코스</h3>
									</header>
	<%
	selectDAO dao = new selectDAO();
	String cluster_num = request.getParameter("cluster_num");
	String course_num0 = request.getParameter("course_num0");
	String course_num1 = request.getParameter("course_num1");
	String course_num2 = request.getParameter("course_num2");
	%>

	<%
		String course0 = dao.select_course(cluster_num, course_num0);
		String course1 = dao.select_course(cluster_num, course_num1);
		String course2 = dao.select_course(cluster_num, course_num2);
		String hashTag = dao.select_hashTag(cluster_num, course_num0);
	%>

									
		
	<span class="image featured"> <img src="images/recommend_course/<%=course_num0 %>.png" style="height: 300px; width: 300px; margin: 0px 0px; display: inline-block; float: left">	
		<a onclick="location.href='course_<%=course_num0 %>.jsp'" href="#" class="num" style="display: inline-block; margin-top: 125px; margin-bottom: 125px; font-size: 13px;
		margin-left: 5px;">
		<%=course0 %> <br><%=hashTag %>
	</a></span>
	<span class="image featured"><img src="images/course_image/<%=course_num0 %>.png" alt="" /></span>
	
	<span class="image featured"> <img src="images/recommend_course/<%=course_num1 %>.png" style="height: 300px; width: 300px; margin: 0px 0px; display: inline-block; float: left">	
		<a onclick="location.href='course_<%=course_num1 %>.jsp'" href="#" class="num" style="display: inline-block; margin-top: 125px; margin-bottom: 125px; font-size: 13px;
		margin-left: 5px;">
		<%=course1 %> <br><%=hashTag %>
	</a></span>
	
	</article>
	<span class="image featured"><img src="images/course_image/<%=course_num1 %>.png" alt="" /></span>
									
	</article>

						</div>
					</div>
				</section>
			
			<!-- 수정시작 -->
			
			
			<!-- 수정완료 -->

			<!-- Footer -->
				<section id="footer" style="padding-top: 0px; padding-bottom: 0px; border-top-width: 0px;">
					<div id="copyright" class="container" style="margin-top: 0px;">
						<ul class="links">
							<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
						</ul>
					</div>
				</section>

		</div>
		
		

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>