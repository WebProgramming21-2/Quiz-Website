<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@page import="Member.MemberDAO" %>
<%@page import="Member.MemberDTO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	try{
			PrintWriter script = response.getWriter();
			// register.jsp에서 받아온 정보를 String에 저장
			String user_id = request.getParameter("userID").trim();
			String user_pw = request.getParameter("userPassword").trim();
			String user_name = request.getParameter("userName").trim();
			// 공란이 있을경우 register.jsp로 보낸다.
			if(user_id == "" || user_pw == "" || user_name == ""){
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			// dao, dto 객체 생성
			MemberDAO dao = MemberDAO.getInstance();
			MemberDTO member = new MemberDTO(user_id, user_pw, user_name, 0);
			// 회원가입 성공시 true, 실패시 false 반환
			boolean res_regist = dao.register(member);
			if(res_regist){ // 회원가입 성공
				script.println("<script>");
				script.println("alert('회원가입을 축하드립니다.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
			else{ // 회원가입 실패
				script.println("<script>");
				script.println("alert('회원가입에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
	}catch(Exception e){
		out.println(e.getMessage()); 
	}
%>
</body>
</html>