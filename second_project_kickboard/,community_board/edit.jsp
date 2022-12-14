<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.com_VO"%>
<%@page import="com.DAO.com_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>공지사항</title>
<link rel="stylesheet" href="../assets/css/main1.css?alter" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="css/css.css">
<style>
#main {
    padding: 0;
}
#header h1{
		color:black; 
	}
	
	}
#header p {
    font-size: 1em;
}
input[type="button"], input[type="submit"], input[type="reset"], button, .button {
    background: black;
}
.on{
	background:black;
}
#header > .container {
    padding: 0em 0 5em 0;
    border-bottom: solid 1px white;
}
</style>
</head>
<body>
<%
String tit = request.getParameter("tit");
String con = request.getParameter("con");
/*  */
String num = request.getParameter("num");
String pw = request.getParameter("pw");

com_DAO dao = new com_DAO();

com_VO vo = dao.selectOne(num);

memberVO Mvo = (memberVO) session.getAttribute("vo");

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
							<a href="../login.jsp">
							<img src="../images/submenu.png" style="width:40px; height:40px; align:left; onclick="ShowMenu()">
							</a>
							<a href="../main.jsp" > <span class="pc"> 
							<img src="../images/sccovy_logo.png" style="height:60px; width:200px;">
									
							</span>
							</a>
						</h1>
						<!-- //logo -->
						<!-- 검색 -->
						<div class="search" >
							<input style="width:570px;" type="text" placeholder="원하시는 검색어를 입력하세요!" title="검색"
								id="inp_search" onkeyup="completechk();"
								onkeydown="wordsListDelete();" autocomplete="off">
								<a href="javascript:btnGnbSearch();" class="btn_search">검색</a>

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
							<li><a href="../thema_course.jsp">테마별 여행 코스</a></li>
							<li style="margin: 0px;"><a href="../main.jsp">홈</a></li>
							<li style="margin: 0px;"><a href="list.jsp">게시판</a></li>
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
							<h1 id="logo"><a href="list.jsp">커뮤니티 게시판</a></h1>
					</div>
				</section>
	
	<div class="board_wrap">
		<div class="board_title">
			<strong>Community_board</strong>
			<p>정보를 교환해요 :)</p>		
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>제목</dt>
						<dd><input type="text" placeholder="제목 입력" id="tit" name="title" value="<%=vo.getCOM_TITLE()%>"></dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>글쓴이</dt>
						<dd><%=vo.getCOM_NAME()%></dd>
					</dl>
					<dl>
						<dt>비밀번호</dt>
						<dd><input type="password" placeholder="비밀번호 입력" name="PW1" id="pw"></dd>
					</dl>
				</div>
				<div class="content">
					<textarea placeholder="내용 입력" name="con" id="con"><%=vo.getCOM_CON()%></textarea>
				</div>
			</div>			
			<div class="btn_wrap">	
				<form action="../edit" method="get" style="display: inline-block;margin-right:10px">
				<input type="hidden" name="num" value=<%=num %>>
				<a class="on"><input onclick="update(<%=num %>,<%=pw %>)" type="button" value="수정" style="width:60px;height:20px; background: #000; color: #fff; border:0px transparent solid;
									padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 0px;"></a>				
				<!-- <a href="view.jsp" class="on">수정</a> -->
				</form>	
				<form style="display: inline-block;">			
				<a href="view.jsp?titleOrnum=<%=num %>">취소</a>
				</form>
				<form action="../delete" method="get" style="display: inline-block;">				
				<input type="hidden" name="num" value=<%=num %>>			
				<a class="on"><input onclick="pwcheck(<%=pw %>,<%=num %>)" type="button" value="삭제"
				style="color:black;width:60px;height:20px; border:0px transparent solid;padding-left: 0px;padding-right: 0px;padding-top: 0px;padding-bottom: 0px;"></a>
				</form>				
			</div>
		</div>
	</div>
	
	<script>
	
	
		function update(num, pw1){
			var pw = document.getElementById("pw");
			var con = document.getElementById("con");
			var tit = document.getElementById("tit");
						
			if(pw1!=pw.value){
				alert("비밀번호가 일치하지 않습니다.");
			}else{
				/* alert("일치"); */
				location.href="../edit?num="+num+"&con="+con.value+"&tit="+tit.value;				
			}
		}
	
	
		
		function pwcheck(pw1, num){
			var pw = document.getElementById("pw");

			if(pw1!=pw.value){
				alert("비밀번호가 일치하지 않습니다.");
			}else{
				/* alert("일치"); */
				location.href="../delete?num="+num;				
			}
		}
	
	</script>
	<br>
</body>
</html>