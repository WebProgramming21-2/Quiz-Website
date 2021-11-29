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
		
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
	</head>
	<body>
		<%
		try{
			PrintWriter script = response.getWriter();
			// id는 세션에서, pw는 registerOut에서
			String user_id = (String)session.getAttribute("userID");
			String user_pw = request.getParameter("userPassword");
			if(user_pw == ""){ // 공란 체크
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("location.href='mypage.jsp'");
				script.println("</script>");
			}
			else{ // 공란이 없다면 DB에서 삭제 시도
				MemberDAO dao = MemberDAO.getInstance();
				boolean res = dao.delete(user_id, user_pw); // DAO의 delete 메소드 실행
				if(res){ // 삭제 성공
					script.println("<script>");
					script.println("alert('회원 탈퇴 완료')");
					script.println("location.href='index.jsp'");
					script.println("</script>");
				}
				else{ // 삭제 실패
					script.println("<script>");
					script.println("alert('회원 탈퇴 실패.')");
					script.println("location.href='mypage.jsp'");
					script.println("</script>");
				}
			}
		}catch(Exception e){
			out.println(e.getMessage());  
		}
		%>
	</body>
</html>