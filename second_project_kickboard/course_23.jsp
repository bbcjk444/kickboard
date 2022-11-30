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
							<h1 id="logo"><a href="A_map_moontanroad_info.jsp">활동성코스(1-3)</a></h1>


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
						
						</header>
							

						<!-- 지도 담을 영역 -->
						<div align="center" id="map" style="width: 900px; height: 400px; margin-left:55px" ></div>
						<!-- 실제 지도 그리는 api 불러오기 -->
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=657ba03912ce1f507121382af03c0b02&libraries=services"></script>

						<script>
			 	<!-- 지도 담을 영역 -->
	         <div id="map" style="width:800px;height:450px;"></div>
	         <!-- 실제 지도 그리는 api 불러오기 -->
	         	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=657ba03912ce1f507121382af03c0b02&libraries=services"></script>

						<script>
	         /* 지도 띄우는 코드 */
	         var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	             mapOption = { 
	                 center: new kakao.maps.LatLng(35.1703631, 129.189652), // 지도의 중심좌표
	                 level: 7 // 지도의 확대 레벨
	             };

	         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	         
	         // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	         var positions = [
	            {
	                 content: '<div>누리마루 APEC하우스</div>', 
	                 latlng: new kakao.maps.LatLng(35.1523745, 129.151312)
	             },
	             {
	                content: '<div>해운대해수욕장</div>', 
	                 latlng: new kakao.maps.LatLng(35.1583631, 129.159652)
	             },
	             {
	                content: '<div>송정해수욕장</div>', 
	                 latlng: new kakao.maps.LatLng(35.1791254, 129.199086)
	             },
	             {
	                content: '<div>해동용궁사</div>',
	                 latlng: new kakao.maps.LatLng(35.1883478, 129.2233114)
	             }
	         ];
	         
	            // 사고다발구역 표시 코스 red위험, yellow주의, green양호
	            var linePath1 = [
	               new kakao.maps.LatLng(35.1523745, 129.151312),
	               new kakao.maps.LatLng(35.15387128912691, 129.15069592631272),
	               new kakao.maps.LatLng(35.1545028699378, 129.15064228215238),
	               new kakao.maps.LatLng(35.15509058656209, 129.1512860122869),
	               new kakao.maps.LatLng(35.155748473271835, 129.1519404712765),
	               new kakao.maps.LatLng(35.15655547370364, 129.1533244911069),
	               new kakao.maps.LatLng(35.15809927836351, 129.15213359036534)
	            ];
	            var linePath2 = [
	               new kakao.maps.LatLng(35.15809927836351, 129.15213359036534),
	               new kakao.maps.LatLng(35.1585641683495, 129.15676844747912),
	               new kakao.maps.LatLng(35.15937114085784, 129.15942919886731),
	               new kakao.maps.LatLng(35.159779701418834, 129.16199535510248)
	            ];
	            
	            var linePath3 = [
	               new kakao.maps.LatLng(35.159779701418834, 129.16199535510248),
	               new kakao.maps.LatLng(35.16222001278392, 129.16518513784482)
	            ];

	            var linePath4 = [
	               new kakao.maps.LatLng(35.16222001278392, 129.16518513784482),
	               new kakao.maps.LatLng(35.1620061207498, 129.16564525166078),
	               new kakao.maps.LatLng(35.162124130218885, 129.167034614979),
	               new kakao.maps.LatLng(35.16182910622957, 129.1694795335403),
	               new kakao.maps.LatLng(35.16129068468609, 129.17024638993712),
	               new kakao.maps.LatLng(35.16134231431001, 129.17155455671843),
	               new kakao.maps.LatLng(35.16216100815756, 129.17563242826552),
	               new kakao.maps.LatLng(35.16325791403674, 129.1790589561474),
	               new kakao.maps.LatLng(35.1645910917023, 129.180625366188),
	               new kakao.maps.LatLng(35.16485468037292, 129.183133913982),
	               new kakao.maps.LatLng(35.16455966633472, 129.18558785441988),
	            ];

	            var linePath5 = [
	               new kakao.maps.LatLng(35.16455966633472, 129.18558785441988),
	               new kakao.maps.LatLng(35.164777572723125, 129.18721369489631)
	            ];

	            var linePath6 = [
	               new kakao.maps.LatLng(35.164777572723125, 129.18721369489631),
	               new kakao.maps.LatLng(35.16555900860958, 129.18835165980494),
	               new kakao.maps.LatLng(35.165434971677485, 129.18917099454418),
	               new kakao.maps.LatLng(35.16554660493163, 129.1898689463448),
	               new kakao.maps.LatLng(35.165335741989594, 129.19071862679772),
	               new kakao.maps.LatLng(35.16630322628185, 129.19152278865494),
	               new kakao.maps.LatLng(35.16679936760809, 129.19085518258478),
	               new kakao.maps.LatLng(35.16794048117126, 129.19115863988938),
	               new kakao.maps.LatLng(35.169218013258245, 129.19062758961456),
	               new kakao.maps.LatLng(35.16994979445839, 129.19165934447895),
	               new kakao.maps.LatLng(35.170371495917394, 129.19332835969215),
	               new kakao.maps.LatLng(35.17204587705495, 129.19454218892716),
	               new kakao.maps.LatLng(35.1754689488279, 129.1945118431967),
	               new kakao.maps.LatLng(35.176684352683026, 129.19417804016163),
	               new kakao.maps.LatLng(35.17817257758348, 129.19304007524684),
	               new kakao.maps.LatLng(35.179053097821594, 129.1957408452873),
	               new kakao.maps.LatLng(35.18097532714859, 129.19915473998515),
	               new kakao.maps.LatLng(35.17935846618083, 129.19973945717692),
	               new kakao.maps.LatLng(35.180594919748685, 129.20223927594037),
	               new kakao.maps.LatLng(35.180840454394485, 129.2039558897283),
	               new kakao.maps.LatLng(35.18091937608822, 129.20497512917802)
	            ];

	            var linePath7 = [
	               new kakao.maps.LatLng(35.18091937608822, 129.20497512917802),
	               new kakao.maps.LatLng(35.18173489574792, 129.2064664373697)
	            ];

	            var linePath8 = [
	               new kakao.maps.LatLng(35.18173489574792, 129.2064664373697),
	               new kakao.maps.LatLng(35.18226103313157, 129.2080757627719),
	               new kakao.maps.LatLng(35.18283978031312, 129.2090520868609),
	               new kakao.maps.LatLng(35.1837605059944, 129.21026444536756),
	               new kakao.maps.LatLng(35.18407618095742, 129.21129441361342),
	               new kakao.maps.LatLng(35.18460230317098, 129.21163773636206),
	               new kakao.maps.LatLng(35.1848215197547, 129.21244239905417),
	               new kakao.maps.LatLng(35.185812371336226, 129.21330070592575),
	               new kakao.maps.LatLng(35.18673306333849, 129.21459889509956),
	               new kakao.maps.LatLng(35.186715526475425, 129.2154464731501),
	               new kakao.maps.LatLng(35.186987347882706, 129.2156932363757),
	               new kakao.maps.LatLng(35.1878378799635, 129.21591854193412),
	               new kakao.maps.LatLng(35.18799298212048, 129.21661216859664),
	               new kakao.maps.LatLng(35.188949743805345, 129.21823658677943),
	               new kakao.maps.LatLng(35.18995630537671, 129.21838726307854),
	               new kakao.maps.LatLng(35.19041509579797, 129.21979073200745),
	               new kakao.maps.LatLng(35.189626402167704, 129.2208043729559),
	               new kakao.maps.LatLng(35.1884019793547, 129.2232241847348)

	            ];

	            
	            var polyline1 = new kakao.maps.Polyline({
	                path: linePath1, 
	                strokeWeight: 5, 
	                strokeColor: 'green', 
	                strokeOpacity: 0.7, 
	                strokeStyle: 'solid' 
	            });

	            var polyline2 = new kakao.maps.Polyline({
	                path: linePath2, 
	                strokeWeight: 5, 
	                strokeColor: 'red',
	                strokeOpacity: 0.7,
	                strokeStyle: 'solid' 
	            });

	            var polyline3 = new kakao.maps.Polyline({
	                path: linePath3,
	                strokeWeight: 5,
	                strokeColor: 'orange', 
	                strokeOpacity: 0.7, 
	                strokeStyle: 'solid' 
	            });

	            var polyline4 = new kakao.maps.Polyline({
	                path: linePath4, 
	                strokeWeight: 5, 
	                strokeColor: 'green',
	                strokeOpacity: 0.7,
	                strokeStyle: 'solid' 
	            });

	            var polyline5 = new kakao.maps.Polyline({
	                path: linePath5, 
	                strokeWeight: 5, 
	                strokeColor: 'red', 
	                strokeOpacity: 0.7,
	                strokeStyle: 'solid' 
	            });

	            var polyline6 = new kakao.maps.Polyline({
	                path: linePath6, 
	                strokeWeight: 5, 
	                strokeColor: 'green', 
	                strokeOpacity: 0.7, 
	                strokeStyle: 'solid'
	            });

	            var polyline7 = new kakao.maps.Polyline({
	                path: linePath7,
	                strokeWeight: 5,
	                strokeColor: 'orange', 
	                strokeOpacity: 0.7, 
	                strokeStyle: 'solid' 
	            });

	            var polyline8 = new kakao.maps.Polyline({
	                path: linePath8,
	                strokeWeight: 5,
	                strokeColor: 'green', 
	                strokeOpacity: 0.7, 
	                strokeStyle: 'solid' 
	            });

	            
	            polyline1.setMap(map);  
	            polyline2.setMap(map);
	            polyline3.setMap(map);
	            polyline4.setMap(map);
	            polyline5.setMap(map);
	            polyline6.setMap(map);
	            polyline7.setMap(map);
	            polyline8.setMap(map);

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
					<br><br>
					
						<a><img src="images/a.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
							<span class="detailcourse"><img src="images/final1.PNG"
							style="height: 450px; width: 920px;  display: inline-block; float: left; margin-left:50px; margin-right:20px">
							
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;" >
							
						</a><h style="margin-left:70px;">@crazypooh_jin</h><br><br><br><br><br><br></span> 
						
						
						<a><img src="images/b.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/final2.PNG"
							style="height: 450px; width: 920px;  display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@yoorim_p</h><br><br><br><br><br><br></span> 
			
						
						<a><img src="images/c.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/final3.PNG"
							style="height: 450px; width: 920px;  display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@stone.water_</h><br><br><br><br><br><br></span> 
						
						
						<a><img src="images/d.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/final4.PNG"
							style="height: 450px; width: 920px; display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@kimhakjaelandscape</h></span> 
						
						
			
			
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