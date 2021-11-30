<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
		<script src="https://code.jquery.com/jquery-1.10.1.js"></script>
		<link href="resources/css/bootstrap.css" rel="stylesheet">
		<style type="text/css">
			.container {
				position: absolute;
				left: 50%;
				top: 50%;
				transform: translate(-50%, -50%);
			}
			font {
				font-family: 'Jua', sans-serif;
			}
		</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
		    <a class="navbar-brand" href="index.jsp"><font size="6">동국퀴즈</font></a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		
		    <div class="collapse navbar-collapse" id="navbarColor03">
		      <ul class="navbar-nav me-auto">
		        <li class="nav-item">
		          <a class="nav-link active" href="index.jsp"><font size="4">Home</font>
		            <span class="visually-hidden"></span>
		          </a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="login.jsp"><font size="4">로그인</font></a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link active" href="register.jsp"><font size="4">회원가입</font></a>
		        </li>
		      </ul>
		    </div>
		 </div>
	</nav>

	<!-- 회원가입 양식 -->
	<div class="container">		<!-- 하나의 영역 생성 -->
		<div class="col-lg-15">	<!-- 영역 크기 -->
			<form method="post" action="registerAction.jsp">
				<h1 style="text-align: center;"><font size="7">회원가입</font></h1>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디는 4~16자를 입력하세요" name="userID" maxlength="16">
				</div><br>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호는 영문 및 숫자 포함 8~16자를 입력하세요" name="userPassword" maxlength="16">
				</div><br>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="닉네임은 2~10자를 입력하세요" name="userName" maxlength="10">
				</div><br>
				<input type="submit" class="btn btn-primary form-control" value="회원가입">
				<input type="reset" class="btn btn-primary form-control" value="취소">
			</form>
		</div>	
	</div>
</body>
</html>