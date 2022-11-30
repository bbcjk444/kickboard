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
							<h1 id="logo"><a href="A_D_map_movie_info.jsp">활동성코스(1-1)</a></h1>

					</div>
				</section>
<!-- 수정시작 -->
			<!-- Main -->
			<section id="main">
					<div class="container">
						<div id="content">

							<!-- Post -->
								<article class="box post">
									<header>
										<h2><b>1-1 코스</b></h2>
									</header>
			
			<!-- 지도 담을 영역 -->
			<div id="map" style="width:700px;height:350px;"></div>
			<!-- 실제 지도 그리는 api 불러오기 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d13aee7a1ddd0e861fa0185a83085a1&libraries=services"></script>
			
			<script>
			/* 지도 띄우는 코드 */
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    			mapOption = { 
        			center: new kakao.maps.LatLng(35.1583631, 129.152952), // 지도의 중심좌표
        			level: 6 // 지도의 확대 레벨
    			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
				{
			        content: '<div>광안리해변테마거리</div>', 
			        latlng: new kakao.maps.LatLng(35.1599071, 129.1268533)
			    },
			    {
			    	content: '<div>해운대해수욕장</div>', 
			        latlng: new kakao.maps.LatLng(35.1583631, 129.159652)
			    },
			    {
			    	content: '<div>동백공원 해안산책로</div>', 
			        latlng: new kakao.maps.LatLng(35.1532631, 129.150952)
			    },
			    {
			    	content: '<div>달맞이고개</div>',
			        latlng: new kakao.maps.LatLng(35.1566509, 129.180004)
			    }
			];

			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			</script>

			<p></p>

					<h3>추천코스</h3>
					<p> </p>
					<p>#8월#해변#트레킹#탐방로#테마거리#드라이브#맛집탐방</p>
					<p>7km 27분 코스</p>
					<h3 style = "text-align: left;">1.광안리해변테마파크</h3>
					<h3 style = "text-align: left;">2.해운대해수욕장</h3>
					<h3 style = "text-align: left;">3.동백공원해안산책로</h3>
					<h3 style = "text-align: left;">4.달맞이고개</h3>
					<p>A_D_map_movie</p>
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