<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.com_VO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.com_DAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css"/>

<meta charset="utf-8">

<style>
label {
	display: inline-block;
	width: 100px;
	height: 30px;
	background-repeat: no-repeat;
	background-size: 100px auto;
   
}

.f {
   background-image: url("images/hashTag_image/food_good.PNG");
}

input:checked+label.f {
   background-image: url('images/hashTag_image/food_good_check.PNG');
}

.r {
   background-image: url("images/hashTag_image/view.PNG");
}

input:checked+label.r {
   background-image: url('images/hashTag_image/view_check.PNG');
}

.t {
   background-image: url("images/hashTag_image/tour.PNG");
}

input:checked+label.t {
   background-image: url('images/hashTag_image/tour_check.PNG');
}

.l {
   background-image: url("images/hashTag_image/landmark.PNG");
}

input:checked+label.l {
   background-image: url('images/hashTag_image/landmark_check.PNG');
}

.h {
   background-image: url("images/hashTag_image/healing.PNG");
}

input:checked+label.h {
   background-image: url('images/hashTag_image/healing_check.PNG');
}

.history {
   background-image: url("images/hashTag_image/history.PNG");
}

input:checked+label.history {
   background-image: url('images/hashTag_image/history_check.PNG');
}
ul{
   list-style:none;
}
h4{
   margin:0;
}

form {
	margin: 0 auto;
	width: 70%;
}

#main li {
	margin: 0 auto;
	width: 300px;
}

.menu_bg {
	width: 100%;
	height: 2000px;
	position: fixed;
	top: 0px;
	left: 0px;
	overflow: hidden;
	display: none;
}

.menu {
	position: absolute;
	top: 0px;
	left: 0px;
	width: 30%;
	height: 70%;
	background-color: #A9A9A9;
}

.menu>div {
	padding: 2%;
}

form label {
		display: inline-block;
		margin: 0;
}

li{
	font-size:1.3em;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	var giMenuDuration = 700;

	// 전체 메뉴를 오른쪽으로 슬라이드하여서 보여준다.
	function ShowMenu() {
		$('.menu_bg').css({
			'display' : 'block'
		});
		$('.menu').css({
			'left' : '-100%'
		});
		$('.menu').animate({
			left : '0px'
		}, {
			duration : giMenuDuration
		});
	}

	// 전체 메뉴를 왼쪽으로 슬라이드하여서 닫는다.
	function HideMenu() {
		$('.menu').animate({
			left : '-100%'
		}, {
			duration : giMenuDuration,
			complete : function() {
				$('.menu_bg').css({
				
					'display' : 'none'
				});
			}
		});
	}

	// 확장 메뉴를 보여주거나 닫는다.
	function ShowSubMenu(strId) {
		var lySubMenu = $(strId);

		if (lySubMenu.first().is(":hidden")) {
			$(strId).slideDown(300);
		} else {
			$(strId).slideUp(300);
		}
	}

	$(document).ready(function() {
		$('.menu_2').hide();
	});
</script>
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

	<!-- Banner 시작 -->
	<section id="mainbanner">
		<div class="maincontainer">
			<div id="slider-wrap">
				<ul id="slider">
					<li>
						<div>
							<p style="font-size:50px; margin-top:450px; color:white; font-weight:1500;">스쿠터타고 해보러 떠나자!(Feat.부산 경치 맛집)</p>
							<span style="margin-top:500px; color:white; font-weight:bold;">해운대해수욕장~송정해수욕장~해동용궁사까지 완벽한 코스!</span>
						</div> <img src="images/banner1.jpg">
					</li>

					<li>
						<div>
							<p style="font-size:50px; margin-top:450px; color:white; font-weight:1500;">스쿠터타고 태종대 여행!(Feat.분위기 맛집)</p>
							<span style="margin-top:500px; color:white; font-weight:bold;">태종대 전망대/태종대/태종사/영도등대까지!</span>
						</div> <img src="images/banner2.jpg">
					</li>

					<li>
						<div>
							<p style="font-size:50px; margin-top:450px; color:white; font-weight:1500;">광안대교 야경보러가자!</p>
							<span style="margin-top:500px; color:white; font-weight:bold;">광안리해변테마거리/해운대해수욕장/동백공원해안산책로/달맞이고개!</span>
						</div> <img src="images/banner3.jpg">
					</li>

					<li>
						<div>
							<h3>Slide #4</h3>
							<span>Sub-title #4</span>
						</div> <img src="images/ad1.png">
					</li>
					
				</ul>

				<div class="slider-btns" id="next">
					<span>▶</span>
				</div>
				<div class="slider-btns" id="previous">
					<span>◀</span>
				</div>
				<br> <br> <br>
			</div>
		</div>

		<script>
			//slide-wrap
			var slideWrapper = document.getElementById('slider-wrap');
			//current slideIndexition
			var slideIndex = 0;
			//items
			var slides = document.querySelectorAll('#slider-wrap ul li');
			//number of slides
			var totalSlides = slides.length;
			//get the slide width
			var sliderWidth = slideWrapper.clientWidth;
			//set width of items
			slides.forEach(function(element) {
				element.style.width = sliderWidth + 'px';
			})
			//set width to be 'x' times the number of slides
			var slider = document.querySelector('#slider-wrap ul#slider');
			slider.style.width = sliderWidth * totalSlides + 'px';

			// next, prev
			var nextBtn = document.getElementById('next');
			var prevBtn = document.getElementById('previous');
			nextBtn.addEventListener('click', function() {
				plusSlides(1);
			});
			prevBtn.addEventListener('click', function() {
				plusSlides(-1);
			});

			// hover
			slideWrapper.addEventListener('mouseover', function() {
				this.classList.add('active');
				clearInterval(autoSlider);
			});
			slideWrapper.addEventListener('mouseleave', function() {
				this.classList.remove('active');
				autoSlider = setInterval(function() {
					plusSlides(1);
				}, 3000);
			});

			function plusSlides(n) {
				showSlides(slideIndex += n);
			}

			function currentSlides(n) {
				showSlides(slideIndex = n);
			}

			function showSlides(n) {
				slideIndex = n;
				if (slideIndex == -1) {
					slideIndex = totalSlides - 1;
				} else if (slideIndex === totalSlides) {
					slideIndex = 0;
				}

				slider.style.left = -(sliderWidth * slideIndex) + 'px';
				pagination();
			}

			//pagination
			slides.forEach(function() {
				var li = document.createElement('li');
				document.querySelector('#slider-pagination-wrap ul')
						.appendChild(li);
			})

			function pagination() {
				var dots = document
						.querySelectorAll('#slider-pagination-wrap ul li');
				dots.forEach(function(element) {
					element.classList.remove('active');
				});
				dots[slideIndex].classList.add('active');
			}

			pagination();
			var autoSlider = setInterval(function() {
				plusSlides(1);
			}, 3000);
		</script>
	</section>
	<!-- Banner 끝 -->


	<!-- 추천 시스템 입력창 시작 -->
	<section id="command">
	<br>
	
		<form action="http://127.0.0.1:9000/trip/cluster" method="post">

		<div style="background: #f0f1fc; border-radius: 15px;
		padding: 20px 35px; padding-top: 20px; padding-right: 35px; padding-bottom: 20px; padding-left: 35px;">
		<img src="images/search.PNG">
   		<div style="background:white;
   		padding-left: 15px;padding-top: 15px;padding-right: 15px;padding-bottom: 15px;border-left-width: 15px;">
   		<ul>
      	<li>
      	<h4>성별</h4>
     	<input type="radio" name="성별" value="남자">남  
      	<input type="radio" name="성별" value="여자">여  <br>
      	</li> 
     	<br>
      	<li>
     	<h4> 킥보드 이용시간 </h4>
     	<table>
        <tr>
        	<td><select name="여행에서얼마나이용">
        		<option>30분 이하</option>
                <option>30분 이상 1시간 이하</option>
                <option>1시간 이상 2시간 이하</option>
                <option>2시간 이상</option>
            </select></td>
        <tr>
      	</table>
      	</li>
      	<br>
      	<li>
      <h4>여행 동반유형</h4>
      <input type="radio" name="누구와여행" value="홀로"> 홀로      
      <input type="radio" name="누구와여행" value="가족"> 가족      
      <input type="radio" name="누구와여행" value="친구/모임"> 친구/모임      
      <input type="radio" name="누구와여행" value="부부/연인"> 부부/연인      <br>
      </li>
      <br>
      <li>
      <h4>여행 목적</h4>
      <input type="radio" name="여행우선순위" value="휴식/힐링여행"> 휴식/힐링여행
      <input type="radio" name="여행우선순위" value="맛_여행"> 맛_여행
      <input type="radio" name="여행우선순위" value="축제/공연/문화예술여행"> 축제/공연/문화예술여행
      <input type="radio" name="여행우선순위" value="액티비티/레저여행"> 액티비티/레저여행 
      <input type="radio" name="여행우선순위" value="체험/관광/역사"> 체험/관광/역사 
      </li>
      <br>
      <li>
      <h4>해시태그 </h4>
      <input type="radio" id="rd1" value="맛집탐방" name="해시태그" style="display: none">
      <label for="rd1" class="f"></label>
      <input type="radio" id="rd2" value="풍경감상" name="해시태그" style="display: none">
      <label for="rd2" class="r"></label>
      <input type="radio" id="rd3" value="체험" name="해시태그" style="display: none">
      <label for="rd3" class="t"></label>
      <input type="radio" id="rd4" value="랜드마크" name="해시태그" style="display: none">
      <label for="rd4" class="l"></label>
      <input type="radio" id="rd5" value="힐링" name="해시태그" style="display: none">
      <label for="rd5" class="h"></label>
      <input type="radio" id="rd6" value="역사탐방" name="해시태그" style="display: none">
      <label for="rd6" class="history"></label>
      </li>
      </ul>
	</div>
	<input type="submit" value="추천받기">
   </div>

	
	</form>
	</section>

<br>
<hr style="border:3px solid#878787; height: 3px !important; display: block !important; width: 100% !important;">
<br>
	<!-- 커뮤니티 preview 시작 -->
	<section id="compreview" style="margin-left: 100px;">
		<a style="margin-left:250px"><img src="images/community.PNG"></a>
			<div class="board_list_wrap">
				<div class="board_list" style="float:left; width: 630px;">
					<div class="top">
						<div class="num">번호</div>
						<div class="title" style="width: 250px">제목</div>
						<div class="writer" style="width: 80px">글쓴이</div>
						<div style="width:10px"></div>
						<div class="date" style="width: 150px">작성일</div>
					</div>
					<%
						com_DAO dao = new com_DAO();
						ArrayList<com_VO> arr = dao.select_5();

						for (int i = 0; i < arr.size(); i++) {
							out.print("<div>");
							out.print("<div class='num'>" + arr.get(i).getCOM_NUM() + "</div>");
							out.print("<div class='title' style='width: 250px'><a href=',community_board/view.jsp?titleOrnum=" + arr.get(i).getCOM_NUM() + "'>"
							+ arr.get(i).getCOM_TITLE() + "</a></div>");
							out.print("<div class='writer' style='width: 80px'>" + arr.get(i).getCOM_NAME() + "</div>");
							out.print("<div style='width: 10px'>" + ""+"</div>");
							out.print("<div class='date' style='width: 150px'>" + arr.get(i).getCOM_DATE() + "</div>");
							out.print("</div>");
						}
					%>
			</div>
		</div>
	</section>
	<br>
	<br>
	<br>
	<br>
	
	<section style="background:#f0f1fc;float:right;margin-right: 450px; margin-top: -120px;
		padding: 10px 15px; padding-top: 10px; padding-right: 15px; padding-bottom: 10px; padding-left: 15px;
		width: 300px; font-size: 20px;">
		<div><b>부산 날씨</b></div>
		<div style="background:white">
			<div class="CurrIcon"></div>
			<div class="cprobability" style="padding-left: 13px;"> 강수확률: </div>
			<div class="ctype" style="padding-left: 13px;"> 강수형태: </div>
			<div class="csky" style="padding-left: 13px;"> 하늘상태: </div>
			<div class="chumidity" style="padding-left: 13px;"> 습도: </div>
			<div class="chightemp" style="padding-left: 13px;"> 낮 최고기온: </div>
			<div class="clowtemp" style="padding-left: 13px;"> 아침 최저기온: </div>
		</div>
	
	<script>

   $.getJSON('http://api.openweathermap.org/data/2.5/forecast?id=1838524&APPID='서비스키'&units=metric'
         ,function(data){
      var $Icon = data.list[0].icon;
      var $minTemp = data.list[0].main.temp_min;
      var $maxTemp = data.list[0].main.temp_max;
      var $humidity = data.list[0].main.humidity;
      var $type = data.list[0].weather[0].description;
      var $sky = data.list[0].weather[0].main;
      var $probability = data.list[0].clouds.all;
      
      if($type == "Clouds")
         $type = "구름";
      else if($type == "Rain")
         $type = "비";
      else
         $type = "맑음";
      
      $('.CurrIcon').append("<img src='http://openweathermap.org/img/wn/02d@2x.png'>");
      $('.clowtemp').append($minTemp + "°C");
      $('.chightemp').append($maxTemp + "°C");
      $('.chumidity').append($humidity + "%");
      $('.csky').append($sky);
      $('.ctype').append($type);
      $('.cprobability').append($probability + "%");
      
   });
	</script>
	
</section>


	<!-- 커뮤니티 preview 끝 -->
	
		<script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>


</body>
</html>