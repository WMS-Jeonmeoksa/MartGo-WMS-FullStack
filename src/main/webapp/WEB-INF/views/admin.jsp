<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.domain.AdminVO" %>
<%
	AdminVO admin = (AdminVO) session.getAttribute("loginInfo");
	if (admin == null) {
		response.sendRedirect(request.getContextPath() + "/login");
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MartGo - 창고관리자 페이지</title>
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
			background-color: #343a40;
			color: white;
			padding: 2rem 1rem;
			display: flex;
			flex-direction: column;
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
	</style>
</head>
<body>

<aside>
	<h2>창고관리 메뉴</h2>
	<a href="#">입고 관리</a>
	<a href="#">출고 관리</a>
	<a href="#">재고 현황</a>
	<a href="#">창고 설정</a>
</aside>

<main>
	<header>
		<div class="logo">
			<a href="${pageContext.request.contextPath}/admin" style="text-decoration: none; font-weight: 700; color: #333;">MartGo</a>
		</div>
		<div class="auth-links">
			<%= admin.getAdminname() %> 관리자님 |
			<a href="${pageContext.request.contextPath}/admin/mypage">마이페이지</a> |
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
	</header>

	<div class="main-content">
		<div>
			<h1><%= admin.getAdminname() %> 창고관리자님, 환영합니다!</h1>
			<p>입출고 요청 및 재고를 효율적으로 관리할 수 있는 관리자 페이지입니다.</p>
		</div>
	</div>
</main>

</body>
</html>
