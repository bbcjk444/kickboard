<!DOCTYPE HTML>
<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
	pageEncoding="euc-kr"%>
<html>
<head>
<title>Login / Register</title>
<meta charset="euc-kr" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main1.css?alter" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
form { 
	margin: 0 auto; 
    width:300px;
    }
#main li {
	margin: 0 auto; 
    width:300px;
}
p {
    margin-bottom: 0;
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
form input[type="text"], input[type="submit"].button {
    padding: 0.95em 1em 0.75em 1em;
}
</style>
</head>
<body class="no-sidebar is-preload">
	<!-- �������� -->
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
	<!-- �����Ϸ� -->

	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container" style="padding-top: 80px;">

				<!-- Logo -->
				<h1 id="logo">
					<a href="login.jsp">�α��� & ȸ������</a>
				</h1>


			</div>
		</section>


		<!-- Main -->
		<section id="main">
			<div class="container" >
				<div id="content">

					<!-- Post -->
					<!-- �������� -->
					<nav id="menu">
						<ul class="links">
							<li style = "text-align: center;"><h5>�α���</h5></li>
							<br>
							<!--  LoginService ������ ����� ����ڰ� �Է��� email�� pw�� �����ÿ�. (post) -->
							<form action="LoginService.do" method="post">
								<li><input type="text" name="email"
									placeholder="Email�� �Է��ϼ���"></li>
								<li><input type="password" name="pw"
									placeholder="PW�� �Է��ϼ���"></li>
								<br>

								<input type="submit" value="LOGIN" class="button fit" style="width:300px">
							</form>
						</ul>
						<br>
						<hr>
						<br>
						<ul class="links">
							<li style = "text-align: center;"><h5>ȸ������</h5></li>
							<br>
							<form action="JoinService.do" method="post">
								<li><input type="email" id="in_email" required="required"
									name="email" placeholder="Email�� �Է��ϼ���"><p id="p1"></li>
								<br>
								<input type="button" value="id�ߺ�Ȯ��" style="width:300px"
									onclick="ajaxCall()">
									<br>

								<li><input type="password" name="pw"
									placeholder="PW�� �Է��ϼ���" required></li>
								<li><input type="text" name="name" placeholder="�̸��� �Է��ϼ���"
									required></li>
								<li><h5>������ �����ϼ���</h5></li>
									<td align=right>����:</td>
									<td>�� <input type="radio" name="sex" value="male">
										�� <input type="radio" name="sex" value="female">
									</td>
								<br>

								<li><h5>����� ������?</h5></li> <input type='date' name="birth" /><br>
								<li><input type="text" name="address"
									placeholder="���ּҸ� �Է��ϼ���" required></li> <br>


								<input type="submit" value="JoinUs" class="button fit" style="width:300px">
							</form>



							<script>
								function ajaxCall() {
									//alert("�Լ�ȣ��!");
									//1.����ڰ� ȸ�������� �̸��� ��������
									var email = document
											.getElementById("in_email");
									var p1 = document.getElementById("p1");
									//alert(email.value);
									//2. email���� ���� �������� ������
									$
											.ajax({//AJAX ���۹���
												type : "get", //������ �����ϴ� ��� GET/POST
												url : "IdCheckService", //������������ �̸�
												data : {
													email : email.value
												}, //������ ������ ������ ����
												dataType : "text", //�������� ����������� ����
												success : function(data) {
													//������ ����� �������� �� ���� �ൿ
													//alert(data);
													if (data == "true") {
														p1.style.cssText = "color : blue";
														p1.innerHTML = " ��밡���� �̸����Դϴ�."
													} else {
														p1.style.cssText = "color : red";
														p1.innerHTML = " ���Ұ����� �̸����Դϴ�."
													}

												},
												error : function() {
													//������ ����� �������� �� ���� �ൿ
												}
											});//�� 

								}
							</script>

						</ul>
					</nav>

					<!-- �����Ϸ� -->

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