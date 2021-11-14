<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<html>
	<title>모드선택</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			font {
				font-family: 'Jua', sans-serif;
			}
			.row {
				position: relative;
				top: 180px;
			}
			table {
				border: 3px solid;
			}
			#goMain {
				position: relative;
				width: 25%;
				top: 50px;
				left: 38%;
			}
		</style>
	</head>
	<body>
		<%
			PrintWriter script = response.getWriter();
			String login = (String)session.getAttribute("login");
			if(login == null){
				script.println("<script>");
				script.println("alert('로그인이 필요합니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
			// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String)session.getAttribute("userID");
			}
		%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="main.jsp"><font size="6">동국퀴즈</font></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
			  <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="main.jsp"><font size="4">Home</font>
		            <span class="visually-hidden"></span>
		          </a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link active" href="mypage.jsp"><font size="4"><%=userID %></font></a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link active" href="logoutAction.jsp"><font size="4">로그아웃</font></a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<div class="container">
			<div class="row">
				<table class="table table-hover" style="text-align: center">
				  <thead>
				    <tr>
				      <th scope="col"><font size="6">등수</font></th>
				      <th scope="col"><font size="6">유저</font></th>
				    </tr>
				  </thead>
				  <tbody>
					  <%
					  	for(int i = 0; i < 5; i++) { // 5등정도까지 출력
					  %>
					    <tr class="table-active">
					      <th scope="row"><font size="5">No.<%=i+1 %></font></th>
					      <td><font size="5"><%out.print("유저 닉네임부분"); %></font></td>
					    </tr>
					  <%
					    } 
					  %>
				  </tbody>
				</table>
				
				<table class="table table-hover" id="myrank" style="text-align: center">
				  <thead>
				    <tr>
				      <th scope="col"><font size="6">MY</font></th>
				    </tr>
				  </thead>
				  <tbody>
					    <tr class="table-active">
					      <th scope="row"><font size="5">No.<%=15 %></font></th>
					      <td><font size="5"><%out.print("유저 닉네임부분"); %></font></td>
					    </tr>
				  </tbody>
				</table>
				<button type="button" class="btn btn-outline-info" id="goMain" onclick="location.href='main.jsp'"><font size="5">메인페이지로</font></button>
			</div>
			
		</div>
	</body>
</html>