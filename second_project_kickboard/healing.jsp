<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>Left Sidebar - Strongly Typed by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main1.css" />
	<link rel="stylesheet" href="assets/css/main.css" />
		<style>
	h3,h2{
		text-align: center;
	}
	#header h1{
		color:black; 
	}
	#header > .container {
    padding: 0em 0 5em 0;
    border-bottom: solid 1px white;
}
#header p {
    font-size: 1em;
}
	</style>
		
	</head>
	<body class="left-sidebar is-preload">
		<%
		memberVO vo = (memberVO) session.getAttribute("vo");
		%>
		<!-- ���� ��� �޴� ���� -->
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
						<!-- �˻� -->
						<div class="search" >
							<input style="width:570px;" type="text" placeholder="���Ͻô� �˻�� �Է��ϼ���!" title="�˻�"
								id="inp_search" onkeyup="completechk();"
								onkeydown="wordsListDelete();" autocomplete="off"> <a
								href="javascript:btnGnbSearch();" class="btn_search">�˻�</a>

							<div class="area_keyword" style="display: none;">
								<h2>������ �α� �˻���</h2>
								<ul id="p_search_hd1">
								</ul>
								<ul id="p_search_hd2">
								</ul>
								<div class="close">
									<button type="button">�ݱ�</button>
								</div>
							</div>
							<div class="words_list" style="display: none;">
								<ul>
								</ul>
								<div class="close">
									<button type="button" onclick="wordsListHide();">�ݱ�</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="btm_menu">
					<div class="slide_menu">
						
						<ul style="float: left;">
							<li><a href="thema_course.jsp">�׸��� ���� �ڽ�</a></li>
							<li style="margin: 0px;"><a href="main.jsp">Ȩ</a></li>
							<li style="margin: 0px;"><a href=",community_board/list.jsp">�Խ���</a></li>
						</ul>
					</div>
				</div>
			</div>
		</header>
	</section>
	<!-- ���� ��� �޴� �� -->
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container" style="padding-top: 80px;">

						<!-- Logo -->
							<h1 id="logo"><a href="thema_course.jsp">�׸��� ��õ �����ڽ�</a></h1>


					</div>
				</section>
				<!-- Main -->
				<section id="main">
					<div class="container">
						<section class="course-section spad pb-0">
						<div class="course-warp">
								<h3><a href="activity.jsp" class="num">����ü��</a>  
								<a href="activity.jsp" class="num">����Ƽ��Ƽ��</a>  
								<a href="healing.jsp" class="num">��������</a>  
								<a href="Eat.jsp" class="num">������Ž�榢</a>  
								<a href="experience.jsp" class="num">��ü��/���� ���ঢ</a>  
								<a href="culture.jsp" class="num">����ȭ/���� ���ঢ</a> </h3>
							<div style="float:center;""class="row course-items-area">
				

							<!-- Content -->
								<div "id="content" class="col-8 col-12-medium imp-medium">
									
									<!-- Post -->
										<article class="box post">
											<header>			
											</header>
											<br>
											<span class="image featured"><img src="images/p2.png" style="height:300px; width:300px; margin:10px 40px; display:inline-block; float:left">
											<a onclick="location.href='course_2.jsp'" href="#" class="num" style="display:inline-block; margin-top:125px; margin-bottom:125px;font-size: 17px;">��ȭ���� �� ��ȭ ���� ����, �λ�<br>#������#����#����#���帶ũ#ǳ�氨��#�޾�#����</a></span>
											<span class="image featured"><img src="images/picbusan.png" alt="" /></span>
											
											<span class="image featured"><img src="images/p5.png" style="height:300px; width:300px; margin:10px 40px; display:inline-block; float:left">
											<a onclick="location.href='course_22.jsp'" href="#" class="num" style="display:inline-block; margin-top:125px; margin-bottom:125px;font-size: 17px;">�볪�� ��â�� ��ȩ�� ������<br>#����#�޾縲#������#�������#���<br>#ǳ�氨��#���ð���#���屸��#�޾�#����</a></span>
											<span class="image featured"><img src="images/bamboo.png" alt="" /></span>
																			
											<span class="image featured"><img src="images/p1.png" style="height:300px; width:300px; margin:10px 40px; display:inline-block; float:left">
											<a onclick="location.href='course_1.jsp'" href="#" class="num" style="display:inline-block; margin-top:125px; margin-bottom:125px;font-size: 17px;">����, ����, �ÿ����� �ִ� ��ٴ� ����<br>#�غ�#Ʈ��ŷ#Ž���#�׸��Ÿ�#����̺�#����Ž��</a></span>
											<span class="image featured"><img src="images/pic11-1.png" alt="" /></span>
										
											<span class="image featured"><img src="images/p3.png" style="height:300px; width:300px; margin:10px 40px; display:inline-block; float:left;">
											<a onclick="location.href='course_3.jsp'" href="#" class="num" style="display:inline-block; margin-top:125px; margin-bottom:125px;font-size: 17px;">�ؿ�븦 ���� ���ķε带 �ȴ�<br>#�غ�#����#���帶ũ#ǳ�氨��<br>#�޾�#������#���繮ȭŽ��#����</a></span>
											<span class="image featured"><img src="images/road.png" alt="" /></span>
											
											<span class="image featured"><img src="images/p4.png" style="height:300px; width:300px; margin:10px 40px; display:inline-block; float:left">
											<a onclick="location.href='course_4.jsps'" href="#" class="num" style="display:inline-block; margin-top:125px; margin-bottom:125px;font-size: 17px;">��ȭ ���ϾƸ� ���� �θ��� ����<br>#ü��#��ȭ����#������#Ž���#�Կ���#�׸�����<br>#Ʈ��ŷ#����Ž��#ǳ�氨��#���ð���#����</a></span>
											<span class="image featured"><img src="images/romantic.png" alt="" /></span>
									
										</article>
									
						            		<h2><a href="#" class="btn first"><<</a>
						            			<a href="#" class="btn pre"><</a>
						            			<a href="#" class="num on"> 1 </a>
						            			<a onclick="location.href='no-sidebar12.html'" href="#" class="num"> 2 </a>
						            			<a href="#" class="num"> 3 </a>
						            			<a href="#" class="btn next">></a>
						            			<a href="#" class="btn last">>></a></h2>
						         
								</div>

						</div>
						
					</div>
				</section>

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