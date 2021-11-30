<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Quiz.*" %>
<%
List<QuizDTO> totalQuizList = QuizDAO.getInstance().getQuizList();
Collections.shuffle(totalQuizList);

List<QuizDTO> quizList = new ArrayList();

int num = 0;
int max = 10;

for(int i=0; i<max; i++){
	quizList.add(totalQuizList.get(i));
}

session.setAttribute("quizList", quizList);

%>
<html>
	<title>퀴즈 모드</title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		
		<!--각 요소의 위치 조정 CSS-->
		<style type="text/css">
			/*퀴즈 시작 전 알림 문장*/
			#wait {
				position: absolute;
				top: 45%;
				left: 50%;
				transform: translate(-50%, -45%);
				font-family: 'Jua', sans-serif;
			}
			/*퀴즈 시작 버튼*/
			#quiz {
				position: absolute;
				top: 70%;
				left: 50%;
				transform: translate(-50%, -70%);
				font-size: 40px;
				font-family: 'Jua', sans-serif;
			}
			/*사용 폰트*/
			font {
				font-family: 'Jua', sans-serif;
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
		%>
		<!-- 네비게이션 바(홈, 마이페이지, 로그아웃) -->
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
		
		<!-- 퀴즈 시작 전 알림 문장 -->
		<div id="wait">
			<h1><font>준비되면 시작 버튼을 눌러 퀴즈를 시작하세요!</font></h1>
			<h1 align="center"><font>각 퀴즈 당 제한시간은 10초 입니다.</font></h1>
		</div>
		<!-- 퀴즈 시작 이동 버튼 -->
		<button type="button" class="btn btn-outline-info" id="quiz" onclick="goQuiz()">시작</button>
	
		<script type="text/javascript">
		// 퀴즈 시작
			function goQuiz(){
				sessionStorage.setItem("score", "0"); // score의 초기값은 0
				window.location = "quiz.jsp?num=0";
			}
		</script>
	</body>
</html>