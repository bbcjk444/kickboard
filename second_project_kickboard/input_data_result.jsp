
<%@page import="com.DAO.selectDAO"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<style>

.image.featured {
    display: block;
    width: 80%;
    margin: 0 0 3.5em 0;
}
#main {
    position: relative;
    overflow: hidden;
    background: #fff;
    padding: 6em 0;
}
 
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<section id="header">


</section>

	<%
	selectDAO dao = new selectDAO();
	String cluster_num = request.getParameter("cluster_num");
	String course_num0 = request.getParameter("course_num0");
	String course_num1 = request.getParameter("course_num1");
	String course_num2 = request.getParameter("course_num2");
	%>
	<%=cluster_num%>
	<br>
	<%=course_num0%>
	<%=course_num1%>
	<%=course_num2%>
	<br>


	<%
		String course0 = dao.select_course(cluster_num, course_num0);

	out.print(course0);
	%><br>
	<%
		String course1 = dao.select_course(cluster_num, course_num1);

	out.print(course1);
	%><br>
	<%
		String course2 = dao.select_course(cluster_num, course_num2);

	out.print(course2);
	%>
	<section id="main">
	<article class="box post">
	<span class="image featured"><img src="images/view.png"
		style="height: 300px; width: 300px; margin: 10px 40px; display: inline-block; float: left">
		<a onclick="location.href='A_D_map_movie_info.html'" href="#"
		class="num"
		style="display: inline-block; margin-top: 125px; margin-bottom: 125px">열정,
			젊음, 시원함이 있는 밤바다 여행<br>#해변#트레킹#탐방로#테마거리#드라이브#맛집탐방
	</a></span>
	css 에서 .image border 색깔을 변경해줌
	</article>
	<span class="image featured"><img src="course_image/<%=course_num0 %>.png" alt="" /></span>
</section>


	

</body>
</html>