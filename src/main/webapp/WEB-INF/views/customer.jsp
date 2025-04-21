<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.domain.UserVO" %>
<%
	UserVO user = (UserVO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MartGo - 거래처 페이지</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<style>
		body {
			display: flex;
			margin: 0;
			height: 100vh;
			font-family: 'Inter', sans-serif;
		}
		aside {
			width: 220px;
			background-color: #212529;
			color: white;
			display: flex;
			flex-direction: column;
			padding: 2rem 1rem;
		}
		aside h2 {
			font-size: 1.3rem;
			margin-bottom: 2rem;
			text-align: center;
		}
		aside a {
			color: white;
			text-decoration: none;
			margin: 0.5rem 0;
			font-weight: 500;
			display: block;
			padding: 0.5rem 1rem;
			border-radius: 4px;
		}
		aside a:hover {
			background-color: #495057;
		}

		main {
			flex-grow: 1;
			display: flex;
			flex-direction: column;
		}

		header {
			background-color: #f8f9fa;
			padding: 1rem 2rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-shadow: 0 2px 4px rgba(0,0,0,0.05);
		}

		.main-content {
			flex-grow: 1;
			display: flex;
			justify-content: center;
			align-items: center;
			text-align: center;
			padding: 2rem;
		}

		.main-content h1 {
			font-size: 2rem;
			margin-bottom: 1rem;
		}

		.main-content p {
			font-size: 1.1rem;
			color: #555;
		}
		.auth-links a {
			margin-left: 1rem;
			text-decoration: none;
			color: #0d6efd;
			font-weight: 500;
		}
	</style>
</head>
<body>

<aside>
	<h2>거래처 메뉴</h2>
	<a href="#">입고 요청</a>
	<a href="#">출고 요청</a>
	<a href="#">의뢰 현황</a>
	<a href="#">정산 내역</a>
</aside>

<main>
	<header>
		<div class="logo"><strong>MartGo</strong></div>
		<div class="auth-links">
			<%= user.getUsername() %>님 |
			<a href="${pageContext.request.contextPath}/customer/mypage">마이페이지</a> |
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
	</header>

	<div class="main-content">
		<div>
			<h1><%= user.getUsername() %> 거래처님, 반갑습니다!</h1>
			<p>
				입출고 요청과 거래 내역을 이 페이지에서 확인하고 관리할 수 있습니다.<br>
				정확하고 빠른 의뢰 처리를 위해 항상 노력하겠습니다.
			</p>
		</div>
	</div>
</main>

</body>
</html>
