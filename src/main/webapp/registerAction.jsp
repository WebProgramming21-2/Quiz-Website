<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="Member.MemberDAO" %>
<%@page import="Member.MemberDTO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%!
	private boolean id_validCheck(String id){
		if(id.contains(" ")) // 공백 검사
			return false;
		if((id.length()<4) || (id.length()>16)) // 아이디는 4~16자만 유효
			return false;
		if(id.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) // 아이디에 한글은 넣을 수 없음.
			return false;
		return true;
	}

	private boolean pw_validCheck(String pw){
		if(pw.contains(" ")) // 공백 검사
			return false;
		if(!(pw.matches(".*[a-zA-Z].*") && pw.matches(".*[0-9].*"))) // 비밀번호는 영문, 숫자만 유효. 영문과 숫자 필수 포함
			return false;
		if((pw.length() < 8) || (pw.length()>16)) // 비밀번호는 8~16자만 유효
			return false;
		return true;
	}
	
	private boolean name_validCheck(String name){
		if(name.contains(" ")) // 공백 검사
			return false;
		if((name.length() < 2) || (name.length()>10)) // 닉네임 길이는 2~10자
			return false;
		return true;
	}
	
	// 추가 구현?(닉네임에 욕설 필터링)
	private boolean filtering_curse(String name){
		return true;
	}
%>
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
			// register.jsp에서 받아온 정보를 String에 저장
			String user_id = request.getParameter("userID");
			String user_pw = request.getParameter("userPassword");
			String user_name = request.getParameter("userName");
			// 공란이 있을경우 register.jsp로 보낸다.
			if(user_id == "" || user_pw == "" || user_name == ""){
				script.println("<script>");
				script.println("alert('입력되지 않은 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(!id_validCheck(user_id)){
				script.println("<script>");
				script.println("alert('유효하지 않은 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(!pw_validCheck(user_pw)){
				script.println("<script>");
				script.println("alert('유효하지 않은 비밀번호입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else if(!name_validCheck(user_name)){
				script.println("<script>");
				script.println("alert('유효하지 않은 닉네임입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
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
			}
	}catch(Exception e){
		out.println(e.getMessage());  
	}
%>
</body>
</html>