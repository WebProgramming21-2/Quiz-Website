<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter" %>
<%@page import="Member.MemberDAO"%>
<%@page import="Member.MemberDTO"%>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	try{
		PrintWriter script = response.getWriter();
	
		// login.jsp로부터 받은 정보를 String에 저장
		String user_id = request.getParameter("userID").trim();
		String user_pw = request.getParameter("userPassword").trim();
		// 입력란을 비운 경우
		if(user_id == "" || user_pw == "" ){
			script.println("<script>");
			script.println("alert('입력하지 않은 사항이 있습니다.')");
			script.println("history.back()"); // login.jsp로 이동
			script.println("</script>");
		}
		// dao 객체를 getInstance 메소드를 이용해 가져옴
		MemberDAO dao = MemberDAO.getInstance();
		// dto 객체 생성
		MemberDTO member = new MemberDTO(user_id, user_pw, null, 0);
		// 객체 생성 성공시 session에 login된 상태와 userID 설정
		if(member != null && !member.getId().equals("")){
			session.setAttribute("login", member);
			session.setAttribute("userID", user_id);
		}
		// 로그인 성공시 true, 실패시 false 반환
		boolean res_login = dao.login(member);
	
		if(res_login){ // 로그인 성공 -> main.jsp로 이동
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else{ // 로그인 실패 -> login.jsp로 이동
			script.println("<script>");
			script.println("alert('로그인에 실패했습니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	}catch(Exception e){
		out.println(e.getMessage());
	}
%>
</body>
</html>