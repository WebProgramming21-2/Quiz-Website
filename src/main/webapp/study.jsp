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
		<title>학습 모드</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		
		<!--각 요소의 위치 조정 CSS-->
		<style type="text/css">
			/*문제출력부*/
			.row1 {
				position: absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%, -30%);
			}
			/*선지출력부*/
			.row2 {
				position: absolute;
				top: 76%;
				left: 50%;
				transform: translate(-50%, -76%);
			}
			/*학습모드 목록으로 이동하는 버튼*/
			#tolist {
				position: absolute;
				top: 90%;
				left: 90%;
				transform: translate(-90%, -90%);
			}
			/*사용 폰트*/
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
		<!-- 네비게이션 바(홈, 학습모드, 마이페이지, 로그아웃) -->
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
		
		<!-- div 구성 순서 : 1. row1문제출력부(문제 번호, 문제), 2. row2선지출력부, 3. 학습모드 목록으로 이동하는 버튼 -->
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
			var correctAnswer = "<%=correct %>";// 문제에 대한 정답
	
	
			function check_answer(answer){
				if (correctAnswer==answer){
					document.getElementById("card-text").innerHTML="<font color=white><b>정답입니다.</b></font>"; // 정답일 경우
				} else {
					document.getElementById("card-text").innerHTML="<font color=white><b>땡! 틀렸습니다. 정답은 </b></font>" + correctAnswer + "<font color=white><b>번 입니다.</b></font>"; // 오답일 경우
				}
			}
		</script>
	</body>
</html>