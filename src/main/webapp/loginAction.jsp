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
	
		// login.jsp�κ��� ���� ������ String�� ����
		String user_id = request.getParameter("userID").trim();
		String user_pw = request.getParameter("userPassword").trim();
		// �Է¶��� ��� ���
		if(user_id == "" || user_pw == "" ){
			script.println("<script>");
			script.println("alert('�Է����� ���� ������ �ֽ��ϴ�.')");
			script.println("history.back()"); // login.jsp�� �̵�
			script.println("</script>");
		}
		// dao ��ü�� getInstance �޼ҵ带 �̿��� ������
		MemberDAO dao = MemberDAO.getInstance();
		// dto ��ü ����
		MemberDTO member = new MemberDTO(user_id, user_pw, null, 0);
		// ��ü ���� ������ session�� login�� ���¿� userID ����
		if(member != null && !member.getId().equals("")){
			session.setAttribute("login", member);
			session.setAttribute("userID", user_id);
		}
		// �α��� ������ true, ���н� false ��ȯ
		boolean res_login = dao.login(member);
	
		if(res_login){ // �α��� ���� -> main.jsp�� �̵�
			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else{ // �α��� ���� -> login.jsp�� �̵�
			script.println("<script>");
			script.println("alert('�α��ο� �����߽��ϴ�.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
	}catch(Exception e){
		out.println(e.getMessage());
	}
%>
</body>
</html>