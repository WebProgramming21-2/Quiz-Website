<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//getConnection에 필요한 파라미터 각 mysql의 url, 사용자 아이디, 비밀번호를 받는다.
String url = "jdbc:mysql://db4free.net:3306/webquiz";
String id = "quizer";
String pw = "ehdrnrfhu057";

String sql = "SELECT * FROM QUIZ where seq = ";

//라이브러리로 받은 mysql connector의 Driver 클래스를 JVM에게 알려준다. 메모리에 올라감
Class.forName("com.mysql.cj.jdbc.Driver");

//java.sql.DriverManager 를 사용하여 mysql에 대한 정보를 주고 Connection 이 참조
Connection con = DriverManager.getConnection(url,id,pw);
Statement state = con.createStatement();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
	</head>
	<body>
		<%
			for (int i=0;i<3;i++) {
				ResultSet result = state.executeQuery(sql+(i+1));
				result.next();
				out.println("<p> No. " + result.getString("seq") + "<p>");
				out.println("<p> 퀴즈 제목 : " + result.getString("title") + "<p>");
				out.println("<p> 퀴즈 내용 : " + result.getString("content") + "<p>");
				for (int j=1;j<5;j++) {
					out.println("<p> 선택지" + j + " : " + result.getString("choice"+j) + "<p>");
				}
				out.println("<p> 정답 : " + result.getString("answer") + "<p>");
				out.println("<hr>");
			}
		%>
	</body>
</html>