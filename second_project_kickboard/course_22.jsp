<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
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
                     <h1 id="logo"><a href="food4_3.jsp">�̽��ڽ�(4-3)</a></h1>

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
                              <h2><b>4-3 �ڽ�</b></h2>
                           </header>
         
         <!-- ���� ���� ���� -->
         <div align="center" id="map" style="width: 900px; height: 400px; margin-left:55px" ></div>
         <!-- ���� ���� �׸��� api �ҷ����� -->
         <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=657ba03912ce1f507121382af03c0b02&libraries=services"></script>
         
         <script>
         /* ���� ���� �ڵ� */
         
         var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
             mapOption = { 
                 center: new kakao.maps.LatLng(35.1007009, 129.0302481), // ������ �߽���ǥ
                 level: 5 // ������ Ȯ�� ����
             };

         var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
         
         // ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
         var positions = [
            {
                 content: '<div>�ڰ�ġ����</div>', 
                 latlng: new kakao.maps.LatLng(35.0967055, 129.0304885)
             },
             {
                content: '<div>BIFF����</div>', 
                 latlng: new kakao.maps.LatLng(35.097755, 129.0271317)
             },
             {
                content: '<div>����������ڰ��</div>', 
                 latlng: new kakao.maps.LatLng(35.1015788, 129.0282481)
             },
             {
                content: '<div>��λ����</div>',
                 latlng: new kakao.maps.LatLng(35.1007009, 129.0323127)
             },
             {
                content: '<div>40��ܹ�ȭ�����׸��Ÿ�</div>',
                 latlng: new kakao.maps.LatLng(35.10496597597615,
                            129.03479956806243)
             },
             {
                content: '<div>������å����</div>',
                 latlng: new kakao.maps.LatLng(35.1031773, 129.0273006)
             }
         ];
         
          // ���ٹ߱��� ǥ�� �ڽ� red����, yellow����, green��ȣ
            var linePath1 = [
                  new kakao.maps.LatLng(35.0967055,
                        129.0304885),
                  new kakao.maps.LatLng(35.09686165249157,
                        129.03041469545047),
                  new kakao.maps.LatLng(35.09674753669676,
                        129.02971732107602) ];
            var linePath2 = [
                  new kakao.maps.LatLng(35.09674753669676,
                        129.02971732107602),
                  new kakao.maps.LatLng(35.09674753669676,
                        129.02971732107602),
                  new kakao.maps.LatLng(35.09651930462802,
                        129.02863907300474),
                  new kakao.maps.LatLng(35.09618474991473,
                        129.0271457150837),
                  new kakao.maps.LatLng(35.097948923900226,
                        129.02652320811828)];
            var linePath3 = [
               new kakao.maps.LatLng(35.097948923900226,
                     129.02652320811828),
                  new kakao.maps.LatLng(35.09618474991473,
                        129.0271457150837),
                  new kakao.maps.LatLng(35.097948923900226,
                        129.02652320811828),
                  new kakao.maps.LatLng(35.098277395608164,
                        129.02802985543704),
                  new kakao.maps.LatLng(35.0994362627149,
                        129.0278133312582)

            ];
            var linePath4 = [
                  new kakao.maps.LatLng(35.0994362627149,
                        129.0278133312582),
                  new kakao.maps.LatLng(35.10266079581559,
                        129.02791055177062) ];

            var linePath5 = [
                  new kakao.maps.LatLng(35.10266079581559,
                        129.02791055177062),
                  new kakao.maps.LatLng(35.103082115087616,
                        129.02791055177062),
                  new kakao.maps.LatLng(35.102845123271386,
                        129.03256686674658),
                  new kakao.maps.LatLng(35.102230696818886,
                        129.03256686674658),
                  new kakao.maps.LatLng(35.102063923125534,
                        129.03238447652558),
                  new kakao.maps.LatLng(35.10182692834274,
                        129.03164418680498),
                  new kakao.maps.LatLng(35.10110716218603,
                        129.0315798137858),
                  new kakao.maps.LatLng(35.10032594538494,
                        129.03181584818947),
                  new kakao.maps.LatLng(35.09984316721458,
                        129.03222354397715),
                  new kakao.maps.LatLng(35.09985194502012,
                        129.03303893550316),
                  new kakao.maps.LatLng(35.10042250067103,
                        129.0328458164456),
                  new kakao.maps.LatLng(35.10065072181099,
                        129.03275998568702),
                  new kakao.maps.LatLng(35.10089649771125,
                        129.03386505584962),
                  new kakao.maps.LatLng(35.10106327379297,
                        129.0347126339355),
                  new kakao.maps.LatLng(35.101849606764276,
                        129.0343636305509),
                  new kakao.maps.LatLng(35.102832691461174,
                        129.03405249429153),
                  new kakao.maps.LatLng(35.10356999720335,
                        129.03412759614727),
                  new kakao.maps.LatLng(35.1035875520207,
                        129.03413832498376),
                  new kakao.maps.LatLng(35.10407030801598,
                        129.03453529193538),
                  new kakao.maps.LatLng(35.104596947659104,
                        129.03465330913724),
                  new kakao.maps.LatLng(35.104939261602475,
                        129.0347176821564)

            ];

            var polyline1 = new kakao.maps.Polyline({
               path : linePath1,
               strokeWeight : 5,
               strokeColor : 'green',
               strokeOpacity : 0.7,
               strokeStyle : 'solid'
            });

            var polyline2 = new kakao.maps.Polyline({
               path : linePath2,
               strokeWeight : 5,
               strokeColor : 'orange',
               strokeOpacity : 0.7,
               strokeStyle : 'solid'
            });

            var polyline3 = new kakao.maps.Polyline({
               path : linePath3,
               strokeWeight : 5,
               strokeColor : 'red',
               strokeOpacity : 0.7,
               strokeStyle : 'solid'
            });

            var polyline4 = new kakao.maps.Polyline({
               path : linePath4,
               strokeWeight : 5,
               strokeColor : 'green',
               strokeOpacity : 0.7,
               strokeStyle : 'solid'
            });

            var polyline5 = new kakao.maps.Polyline({
               path : linePath5,
               strokeWeight : 5,
               strokeColor : 'green',
               strokeOpacity : 0.7,
               strokeStyle : 'solid'
            });

            polyline1.setMap(map);
            polyline2.setMap(map);
            polyline3.setMap(map);
            polyline4.setMap(map);
            polyline5.setMap(map);


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

			<br><br>
					
						<a><img src="images/course_B/e.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
							<span class="detailcourse"><img src="images/course_B/final5.PNG"
							style="height: 450px; width: 920px;  display: inline-block; float: left; margin-left:50px; margin-right:20px">
							
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;" >
							
						</a><h style="margin-left:70px;">@visitbusan.kr</h><br><br><br><br><br><br></span> 
						
						
						<a><img src="images/course_B/f.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/course_B/final6.PNG"
							style="height: 450px; width: 920px;  display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@turista_coreano_</h><br><br><br><br><br><br></span> 
			
						
						<a><img src="images/course_B/g.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/course_B/final7.PNG"
							style="height: 450px; width: 920px;  display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@ssuk0125___</h><br><br><br><br><br><br></span> 
						
						
						<a><img src="images/course_B/h.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/course_B/final8.PNG"
							style="height: 450px; width: 920px; display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@kimddubuck</h><br><br><br><br><br><br></span> 
						
								<a><img src="images/course_B/i.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/course_B/final9.PNG"
							style="height: 450px; width: 920px; display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@ps2030pc</h><br><br><br><br><br><br></span> 
						
								<a><img src="images/course_B/j.PNG"
							style="height: 100px; width: 1000px;  float: left; ">
						</a>
						
						<span class="detailcourse"><img src="images/course_B/final10.PNG"
							style="height: 450px; width: 920px; display: inline-block; float: left; margin-left:50px;">
							<a onclick="location.href='A_D_map_movie_info.html'" href="#"
							class="num"
							style="display: inline-block; margin-top: 550px;">
						</a><h style="margin-left:70px;">@ryang_8318</h></span> 
						
			
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