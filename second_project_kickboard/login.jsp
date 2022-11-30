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
	<!-- 수정시작 -->
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
	<!-- 수정완료 -->

	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container" style="padding-top: 80px;">

				<!-- Logo -->
				<h1 id="logo">
					<a href="login.jsp">로그인 & 회원가입</a>
				</h1>


			</div>
		</section>


		<!-- Main -->
		<section id="main">
			<div class="container" >
				<div id="content">

					<!-- Post -->
					<!-- 수정시작 -->
					<nav id="menu">
						<ul class="links">
							<li style = "text-align: center;"><h5>로그인</h5></li>
							<br>
							<!--  LoginService 파일을 만들고 사용자가 입력한 email과 pw를 보내시오. (post) -->
							<form action="LoginService.do" method="post">
								<li><input type="text" name="email"
									placeholder="Email을 입력하세요"></li>
								<li><input type="password" name="pw"
									placeholder="PW를 입력하세요"></li>
								<br>

								<input type="submit" value="LOGIN" class="button fit" style="width:300px">
							</form>
						</ul>
						<br>
						<hr>
						<br>
						<ul class="links">
							<li style = "text-align: center;"><h5>회원가입</h5></li>
							<br>
							<form action="JoinService.do" method="post">
								<li><input type="email" id="in_email" required="required"
									name="email" placeholder="Email을 입력하세요"><p id="p1"></li>
								<br>
								<input type="button" value="id중복확인" style="width:300px"
									onclick="ajaxCall()">
									<br>

								<li><input type="password" name="pw"
									placeholder="PW를 입력하세요" required></li>
								<li><input type="text" name="name" placeholder="이름을 입력하세요"
									required></li>
								<li><h5>성별을 선택하세요</h5></li>
									<td align=right>성별:</td>
									<td>남 <input type="radio" name="sex" value="male">
										여 <input type="radio" name="sex" value="female">
									</td>
								<br>

								<li><h5>당신의 생일은?</h5></li> <input type='date' name="birth" /><br>
								<li><input type="text" name="address"
									placeholder="집주소를 입력하세요" required></li> <br>


								<input type="submit" value="JoinUs" class="button fit" style="width:300px">
							</form>



							<script>
								function ajaxCall() {
									//alert("함수호출!");
									//1.사용자가 회원가입할 이메일 가져오기
									var email = document
											.getElementById("in_email");
									var p1 = document.getElementById("p1");
									//alert(email.value);
									//2. email값을 서버 페이지로 보내기
									$
											.ajax({//AJAX 시작문법
												type : "get", //서버에 전송하는 방식 GET/POST
												url : "IdCheckService", //서버페이지의 이름
												data : {
													email : email.value
												}, //서버에 보내는 데이터 지정
												dataType : "text", //서버에서 응답받을때의 형식
												success : function(data) {
													//서버와 통신이 성공했을 때 다음 행동
													//alert(data);
													if (data == "true") {
														p1.style.cssText = "color : blue";
														p1.innerHTML = " 사용가능한 이메일입니다."
													} else {
														p1.style.cssText = "color : red";
														p1.innerHTML = " 사용불가능한 이메일입니다."
													}

												},
												error : function() {
													//서버와 통신이 실패했을 때 다음 행동
												}
											});//끝 

								}
							</script>

						</ul>
					</nav>

					<!-- 수정완료 -->

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