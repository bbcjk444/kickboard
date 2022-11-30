<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.com_VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.com_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Community_board</title>

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
#header > .container {
    padding: 0em 0 5em 0;
    border-bottom: solid 1px white;
}
</style>
</head>
<body>
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


<!-- Main -->
			
	<section id="main">
		<div class="container">
			<div id="content">
			
				<div class="board_wrap" style="position:relative">
					<div class="board_title" style="display:block; position:relative">
					<strong style="display:inline-block;">Community_board</strong>
					<p>정보를 교환해요 :)</p>
					<p style="display:inline-block; width:59%"></p>
					<input type="text" class="rounded-pill" id="search" placeholder="	검색"
						style="border: 1px solid gray;
          	       		width:40%;
        	       		height:33px;
                   		border-radius:20px 20px;
                   		box-shadow: 1px 1px 5px gray;">
					</div>
			<div class="board_list_wrap">
				<div class="board_list" style="margin-left:0px;">
					<div class="top">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">글쓴이</div>
						<div class="date">작성일</div>
						<div class="count">조회</div>
					</div>
				<%
				
				
				com_DAO dao = new com_DAO();
				
				ArrayList<com_VO> arr = dao.select();
				
				int k = arr.size();
				
				for(int i=0; i< arr.size(); i++) {
				out.print("<div>");
				out.print("<div class='num'>" + k-- + "</div>");
				out.print("<div class='title'><a href='view.jsp?titleOrnum=" + arr.get(i).getCOM_NUM() + "'>" + arr.get(i).getCOM_TITLE() + "</a></div>");
				out.print("<div class='writer'>" + arr.get(i).getCOM_NAME() + "</div>");
				out.print("<div class='date'>" + arr.get(i).getCOM_DATE() + "</div>");
				out.print("<div class='count'>" + 0 + "</div>");				
				out.print("</div>");				
				}
				
				
				%>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			<div class="board_page">
				<a href="#" class="btn first"><<</a>
				<a href="#" class="btn pre"><</a>
				<a href="#" class="num on">1</a>
				<a href="#" class="num">2</a>
				<a href="#" class="num">3</a>
				<a href="#" class="num">4</a>
				<a href="#" class="num">5</a>
				<a href="#" class="btn next">></a>
				<a href="#" class="btn last">>></a>
			</div>
			<div class="btn_wrap">
				<a href="write.jsp" class="on">글쓰기</a>
				<!-- <a href="#">수정</a> -->
		
			</div>
		</div>
	</div>
	</div>
	</div>
	</section>
	
	</div>
	
</body>
</html>