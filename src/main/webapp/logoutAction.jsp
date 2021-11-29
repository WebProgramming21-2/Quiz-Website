<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 로그인한 상태인지 체크
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
	session.invalidate(); // 모든 세션에 저장된 값을 삭제
%>
	<script>
	alert('로그아웃 되었습니다.')
	</script> 
<%
	response.sendRedirect("index.jsp"); // 초기화면으로 돌아간다.
%>
</body>
</html>