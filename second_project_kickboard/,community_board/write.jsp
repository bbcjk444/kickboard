<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="euc-kr">
<title>��������</title>
<link rel="stylesheet" href="../assets/css/main1.css?alter" />
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="css/css.css">


<style>
#main {
    padding: 0;
}
#on>input{
	padding:0;
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
<!-- ���� ��� �޴� ���� -->
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
							<li><a href="../thema_course.jsp">�׸��� ���� �ڽ�</a></li>
							<li style="margin: 0px;"><a href="../main.jsp">Ȩ</a></li>
							<li style="margin: 0px;"><a href="list.jsp">�Խ���</a></li>
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
							<h1 id="logo"><a href="list.jsp">Ŀ�´�Ƽ �Խ���</a></h1>

					</div>
				</section>


<section id="main">
		<div class="container">
			<div id="content">

<form action="../write" method="get"> 
	<div class="board_wrap">
		<div class="board_title">
			<strong>Community_board</strong>
			<p>������ ��ȯ�ؿ� :)</p>		
		</div>
		<div class="board_write_wrap">
			<div class="board_write">
				<div class="title">
					<dl>
						<dt>����</dt>
						<dd><input type="text" placeholder="���� �Է�  " name="title_serv"></dd>
					</dl>
				</div>
				<div class="info">
					<dl>
						<dt>�۾���</dt>
						<dd><input type="text" placeholder="�۾��� �Է�" name="name_serv"></dd>
					</dl>
					<dl>
						<dt>��й�ȣ</dt>
						<dd><input type="password" placeholder="��й�ȣ" name="password_serv"></dd>
					</dl>
				</div>
				<div class="content">
					<textarea placeholder="���� �Է�" name="content_serv"></textarea>
				</div>
			</div>		
			 	
			<div class="btn_wrap">
				<a class="on"><input type="submit" value="���" style="background: #000; color: #fff; border:0px transparent solid;
				padding-top: 0px;padding-bottom: 0px;padding-left: 0px;padding-right: 0px;"></a>
				<a href="list.jsp">���</a>		
			</div>
			
		</div>
	</div>
	</form>
	</div>
	</div>
	</section>
	
	
	</div>
</body>
</html>