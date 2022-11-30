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
		<div id="page-wrapper">

			<!-- Header -->
				<section id="header">
					<div class="container"  style="padding-top: 80px;">

						<!-- Logo -->
							<h1 id="logo"><a href="B_D_map_movieromantic_info.jsp">�������ڽ�(2-1)</a></h1>

					</div>
				</section>

<!-- �������� -->
			<!-- Main -->
			<section id="main">
					<div class="container">
						<div id="content">

							<!-- Post -->
								<article class="box post">
									<header>
										<h2><b>2-1 �ڽ�</b></h2>
									</header>
			
			<!-- ���� ���� ���� -->
			<div id="map" style="width:700px;height:350px;"></div>
			<!-- ���� ���� �׸��� api �ҷ����� -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d13aee7a1ddd0e861fa0185a83085a1&libraries=services"></script>
			
			<script>
			/* ���� ���� �ڵ� */
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    			mapOption = { 
        			center: new kakao.maps.LatLng(35.1629981, 129.163735), // ������ �߽���ǥ
        			level: 6 // ������ Ȯ�� ����
    			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
			
			// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
			var positions = [
				{
			        content: '<div>�λ꿵ȭ�Կ���Ʃ���</div>', 
			        latlng: new kakao.maps.LatLng(35.1617550, 129.137816)
			    },
			    {
			    	content: '<div>������ ��Ʈ �����</div>', 
			        latlng: new kakao.maps.LatLng(35.1615950, 129.139816)
			    },
			    {
			    	content: '<div>SEA LIFE �λ����Ƹ���</div>', 
			        latlng: new kakao.maps.LatLng(35.1592631, 129.161452)
			    },
			    {
			    	content: '<div>���ķε�</div>',
			        latlng: new kakao.maps.LatLng(35.1566509, 129.180004)
			    },
			    {
			    	content: '<div>û����</div>',
			        latlng: new kakao.maps.LatLng(35.1603820, 129.192470)
			    }
			];

			for (var i = 0; i < positions.length; i ++) {
			    // ��Ŀ�� �����մϴ�
			    var marker = new kakao.maps.Marker({
			        map: map, // ��Ŀ�� ǥ���� ����
			        position: positions[i].latlng // ��Ŀ�� ��ġ
			    });

			    // ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // ���������쿡 ǥ���� ����
			    });

			    // ��Ŀ�� mouseover �̺�Ʈ�� mouseout �̺�Ʈ�� ����մϴ�
			    // �̺�Ʈ �����ʷδ� Ŭ������ ����� ����մϴ� 
			    // for������ Ŭ������ ����� ���� ������ ������ ��Ŀ���� �̺�Ʈ�� ��ϵ˴ϴ�
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}

			// ���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// ���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			</script>

			<p></p>

					<h3>��õ�ڽ�</h3>
					<p> </p>
					<p>#9��#ü��#��ȭ����#������#Ž���#�Կ���#�׸�����#Ʈ��ŷ#����Ž��#ǳ�氨��#���ð���#����</p>
					<p>7.7km 32�� �ڽ�</p>
					<h3 style = "text-align: left;">1.�λ꿵ȭ�Կ���Ʃ���</h3>
					<h3 style = "text-align: left;">2.������ ��Ʈ �����</h3>
					<h3 style = "text-align: left;">3.SEA LIFE �λ����Ƹ���</h3>
					<h3 style = "text-align: left;">4.���ķε�</h3>
					<h3 style = "text-align: left;">5.û����</h3>
					<p>B_D_map_movieromantic</p>
					</article>

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