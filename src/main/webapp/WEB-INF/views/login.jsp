<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>MartGo WMS - 로그인</title>
	<style>
		body {
			font-family: 'Pretendard', sans-serif;
			background-color: #f6f6f6;
			margin: 0;
		}
		.login-container {
			width: 380px;
			margin: 100px auto;
			padding: 40px;
			background-color: white;
			border-radius: 10px;
			box-shadow: 0 8px 16px rgba(0,0,0,0.1);
		}
		.login-container h2 {
			text-align: center;
			margin-bottom: 25px;
		}
		.login-container input {
			width: 100%;
			padding: 12px;
			margin-bottom: 15px;
			border-radius: 6px;
			border: 1px solid #ccc;
		}
		.login-container button {
			width: 100%;
			padding: 12px;
			background-color: #1E90FF;
			color: white;
			border: none;
			border-radius: 6px;
			font-size: 16px;
			cursor: pointer;
		}
		.login-container .error {
			color: red;
			text-align: center;
			margin-top: -10px;
			margin-bottom: 15px;
		}
		.login-container .link {
			text-align: center;
			margin-top: 15px;
		}
	</style>
</head>
<body>
<div class="login-container">
	<h2>MartGo 로그인</h2>

	<form action="/login" method="post">
		<input type="text" name="userid" placeholder="아이디" required />
		<input type="password" name="password" placeholder="비밀번호" required />
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<button type="submit">로그인</button>
	</form>

	<div class="link">
		<a href="/register">회원가입</a>
	</div>
</div>
</body>
</html>