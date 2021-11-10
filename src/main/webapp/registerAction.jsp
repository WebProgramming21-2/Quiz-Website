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
			// register.jsp���� �޾ƿ� ������ String�� ����
			String user_id = request.getParameter("userID").trim();
			String user_pw = request.getParameter("userPassword").trim();
			String user_name = request.getParameter("userName").trim();
			// ������ ������� register.jsp�� ������.
			if(user_id == "" || user_pw == "" || user_name == ""){
				script.println("<script>");
				script.println("alert('�Էµ��� ���� ������ �ֽ��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}
			// dao, dto ��ü ����
			MemberDAO dao = MemberDAO.getInstance();
			MemberDTO member = new MemberDTO(user_id, user_pw, user_name, 0);
			// ȸ������ ������ true, ���н� false ��ȯ
			boolean res_regist = dao.register(member);
			if(res_regist){ // ȸ������ ����
				script.println("<script>");
				script.println("alert('ȸ�������� ���ϵ帳�ϴ�.')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
			else{ // ȸ������ ����
				script.println("<script>");
				script.println("alert('ȸ�����Կ� �����߽��ϴ�.')");
				script.println("history.back()");
				script.println("</script>");
			}
	}catch(Exception e){
		out.println(e.getMessage()); 
	}
%>
</body>
</html>