<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Quiz.*" %>
<%
	PrintWriter script = response.getWriter();
	String login = (String)session.getAttribute("login");
	if(login == null){
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
	}
%>
<%
List<QuizDTO> quizList = QuizDAO.getInstance().getQuizList();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>학습목록</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			.row1 {
				position: absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%, -30%);
			}
			.row2 {
				position: absolute;
				top: 70%;
				left: 50%;
				transform: translate(-50%, -70%);
			}
			#tolist {
				position: absolute;
				top: 90%;
				left: 90%;
				transform: translate(-90%, -90%);
			}
			font {
				font-family: 'Jua', sans-serif;
			}
		</style>
	</head>
	<body>
		<%
			// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
			String userName = null;
			if(session.getAttribute("userName") != null){
				userName = (String)session.getAttribute("userName");
			}
			
			int quizID = 0;
			if(request.getParameter("quizID") != null){
				quizID = Integer.parseInt(request.getParameter("quizID"));
			}
			
			// 데이터 없을 때
			if(quizID == 0){
				script.println("<script>");
				script.println("aleart('유효하지 않은 글입니다.')");
				script.println("location.href='studyView.jsp'");
				script.println("</script>");
			}
			// 유효 데이터
			QuizDTO quiz = quizList.get(quizID-1);
			int correct = quizList.get(quizID-1).getAnswer();
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
		          <a class="nav-link active" href="main.jsp"><font size="4">Home</font></a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="studyView.jsp"><font size="4">학습모드</font></a>
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
		
		<div class="container">
			<div class="row1">
			<div class="card text-white bg-info mb-3" style="max-width: 40rem;">
				<div class="card-header"><font size="5">No.<%=quiz.getId() %></font></div>
				  <div class="card-body">
				  <h4 class="card-title"></h4>
				    <h4 class="card-text" id="card-text"><font><%= quiz.getContent() %></font></h4>
				  </div>
				</div>
			</div>
			<div class="row2">
				<div class="d-grid gap-2">
					<%
						for (int i = 0; i < 4; i++) {
					%>
					<button class="btn btn-lg btn-primary" type="button" onclick="check_answer(<%=i+1 %>)"><font size="4"><%=i+1 %> <%=": " %> <%=quiz.getChoice()[i] %></font></button>
				  	<%
						}
				  	%>
				</div>
			</div>
			<button type="button" class="btn btn-outline-info" id="tolist" onclick="location='studyView.jsp'"><font size="5">목록으로</font></button>
		</div>
		
		<script type="text/javascript">
			var correctAnswer = "<%=correct %>";//정답
	
	
			function check_answer(answer){
				if (correctAnswer==answer){
					document.getElementById("card-text").innerHTML="<font color=white><b>정답입니다.</b></font>";
				} else {
					document.getElementById("card-text").innerHTML="<font color=white><b>땡! 틀렸습니다. 정답은 </b></font>" + correctAnswer + "<font color=white><b>번 입니다.</b></font>";
				}
			}
		</script>
	</body>
</html>