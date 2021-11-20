<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Member.MemberDAO" %>
<%@page import="Member.MemberDTO" %>
<%@ page import="java.io.PrintWriter" %>
<html>
	<title></title>
	<head>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		
		<script src="http://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
	</head>
	<body>
		<%
		try{
			PrintWriter script = response.getWriter();
			String user_id = request.getParameter("userID");
			String user_pw = request.getParameter("userPassword");
			if(user_id == "" || user_pw == ""){
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("location.href='index.jsp'");
				script.println("</script>");
			}
			else{
				MemberDAO dao = MemberDAO.getInstance();
				boolean res = dao.delete(user_id, user_pw);
				if(res){
					script.println("<script>");
					script.println("alert('회원 탈퇴 완료')");
					script.println("location.href='index.jsp'");
					script.println("</script>");
				}
				else{
					script.println("<script>");
					script.println("alert('회원 탈퇴 실패.')");
					script.println("location.href='index.jsp'");
					script.println("</script>");
				}
			}
		}catch(Exception e){
			out.println(e.getMessage());  
		}
		%>
	</body>
</html>