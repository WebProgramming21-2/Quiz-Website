<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="Quiz.*" %>
<%
List<QuizDTO> quizList = (List<QuizDTO>)session.getAttribute("quizList");
int num = Integer.parseInt(request.getParameter("num"));

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
			.row0 {
				position: absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%, -150%);
			}
			.row1 {
				position: absolute;
				top: 30%;
				left: 50%;
				transform: translate(-50%, -30%);
			}
			.row2 {
				position: absolute;
				top: 76%;
				left: 50%;
				transform: translate(-50%, -76%);
			}
			#tolist1 {
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
			
			// 최대 문제 개수를 넘으면 beforeRank로 넘어감
			if (num >= 10) {
				script.println("<script>");
				script.println("location.href='beforeRank.jsp?score=" + request.getParameter("score") + "'");
				script.println("</script>");
			} else {
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
		          <a class="nav-link active" href="quizStart.jsp"><font size="4">퀴즈모드</font></a>
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
			<%--여기부터 문제가 나오는 박스 부분. 이 박스 안에서 문제를 계속 갈아줘야함.문제가 보이는 화면을 예시로 들기 위해 문제 1번을 가져와봤음.--%>
			<div class="row0">
				<div class="card text-white bg-info mb-3" style="max-width: 40rem;">
			  	<div class="card-header"><font size="5"><b><span id="score">현재 점수 : <%= request.getParameter("score") %> 점</span></b></font></div>
			  </div>
			</div>
			<div class="row1">
				<br>
				<div class="card text-white bg-info mb-3" style="max-width: 40rem;">
				  <div class="card-header"><font size="5"><b><span id="leftTime">남은시간 : 10 초</span></b></font></div>
				  <div class="card-body">
				    <h4 class="card-title"></h4>
				    <h4 class="card-text" id="card-text"><font><%= quizList.get(num).getContent() %></font></h4>
				  </div>
				</div>
			</div>
			<%--여기부터 선지가 나오는 부분. 이 선지 버튼들의 내용도 문제에 따라 계속 갈아줘야 함. 예시로 1번 문제의 선지를 가져와봤음.--%>
			<div class="row2">
				<div class="d-grid gap-2">
					<%
						for (int i = 0; i < 4; i++) {
					%>
					<button class="btn btn-lg btn-primary" type="button" onclick="check_answer(<%=i+1 %>)"><font><%=i+1 %> <%=": " %> <%=quizList.get(num).getChoice()[i] %></font></button>
				  	<%
						}
				  	%>
				</div>
			</div>
			<%--이 버튼을 누르면 예를 들어 quizList.get(i)부분의 i 부분을 ++시킨다거나 해서 문제를 넘겨줘야 할 것임. onclick에 해당 내용을 작성하면 좋을 듯함.--%>
			<button type="button" class="btn btn-outline-info" id="tolist1" onclick="goNext()"><font size="5">다음으로</font></button>
		</div>
		
		<script type="text/javascript">
			var isSelect = false;
			var correctAnswer = <%=quizList.get(num).getAnswer()%>//정답, 이 부분도 모든 문제에 대체 가능하게 만들 수 있도록 정답list를 만드는 것도 좋을 것임.
			var leftTime = 10; // 10초
			
			function timerCallback() {
				$("#leftTime").text("남은시간 : " + leftTime + " 초");
				leftTime--;
				
				if (leftTime <= -2) { // 왜인지 2초 일찍 끝나서 일단 이렇게 해놓음
					clearInterval(timer);
					$("#leftTime").text("시간 초과");
				}
			}
			// 처음 시작 시 1초 지연을 막기 위해 이런 구조로 함수 작성
			function startInterval(callback) {
				callback();
				return setInterval(callback, 1000);
			}
			
			var timer = startInterval(timerCallback);
			var score = <%= request.getParameter("score") %>; // 문제를 맞출 때마다 값을 더해줘서 최종점수를 개인 ID db에 스코어를 저장해야할 것.
	
			function check_answer(answer){
				// 아직 선택하지 않은 경우만 텍스트 변경
				if (!isSelect) {
					if (correctAnswer==answer){
						document.getElementById("card-text").innerHTML="<font color=white><b>정답입니다.</b></font>";
						score += leftTime+1; // 현재 남은 시간을 점수로 함, 남은시간 초 수랑 1 차이나서 더해줌
						$("#score").text("현재 점수 : " + score + " 점");
					} else {
						document.getElementById("card-text").innerHTML="<font color=white><b>땡! 틀렸습니다. 정답은 </b></font>" + correctAnswer + "<font color=white><b>번 입니다.</b></font>";
						clock = 0; // 틀리면 바로 넘어가도록 하기 위해 0으로 변경
					}
					isSelect = true;
					clearInterval(timer); // 타이머 중지
				}
				
			}
			
			function goNext(){
				window.location = "quiz.jsp?num=<%=num+1%>&score=" + score;
			}
		</script>
		<% } %>
	</body>
</html>
