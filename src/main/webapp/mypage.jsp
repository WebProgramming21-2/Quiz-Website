<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="Member.*" %>
<%!
	// 유저의 랭킹
	public int userRank(String name, List<Rank>rank){ 
		int ranking = 1;
		for(int i=0; i<rank.size(); i++){
			if(rank.get(i).getName().equals(name)){
				return ranking;
			}
			ranking++;
		}
		return -1; // 이름을 못찾았다면 오류
	}
	
	// 유저의 점수
		public int userScore(String name, List<Rank>rank){ 
			for(int i=0; i<rank.size(); i++){
				if(rank.get(i).getName().equals(name)){
					return rank.get(i).getScore();
				}
			}
			return -1; // 이름을 못찾았다면 오류
		}
%>
<%
List<Rank> rank = MemberDAO.getInstance().getRankList();
%>
<html>
	<title>모드선택</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			font {
				font-family: 'Jua', sans-serif;
			}
			#all_inf {
				position: absolute;
				top: 46%;
				left: 50%;
				transform: translate(-50%, -46%);
			}
			#out {
				position: relative;
				left: 0%;
				top: 0%;
				width: 100%
			}
			#Pid, #Pnick {
				background-color: white;
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
			String userName = null;
			if(session.getAttribute("userName") != null){
				userName = (String)session.getAttribute("userName");
			}
			String userID = (String)session.getAttribute("userID");
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
		            <a class="nav-link active" href="mypage.jsp"><font size="4"><%=userName %></font></a>
		        </li>
		        <li class="nav-item">
		            <a class="nav-link active" href="logoutAction.jsp"><font size="4">로그아웃</font></a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
		<br>
		
		<div id="all_inf">
			<p id="inf" align="center"><font size="7">회원정보</font></p><br><br>
			
			<div id="Pid" style="border:1px solid; padding:10px;">
				<font size="5">ID: <%= userID %> </font>
			</div><br><br>
			<div id="Pnick" style="border:1px solid; padding:10px;">
				<font size="5">Nickname: <%= userName %> </font>
			</div><br><br>
			<div id="Pnick" style="border:1px solid; padding:10px;">
				<font size="5">Score: <%= userScore(userName, rank) %> </font>
			</div><br><br>
			<div id="Pnick" style="border:1px solid; padding:10px;">
				<font size="5">Ranking: <%= userRank(userName, rank) %> </font>
			</div><br><br>
			<button type="button" class="btn btn-outline-info" id="out" onclick="location.href='registerOut.jsp'"><font size="5">회원탈퇴</font></button>
		</div>
	</body>
</html>