<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.AdminDTO" %>
<%
	AdminDTO admin = (AdminDTO) session.getAttribute("loginInfo");
	if (admin == null) {
		response.sendRedirect(request.getContextPath() + "/login");
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MartGo - 총관리자 마이페이지</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<style>
		body {
			margin: 0;
			font-family: 'Inter', sans-serif;
			background-color: #f6f6f6;
		}
		header {
			background-color: #fff;
			padding: 1rem 2rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-shadow: 0 2px 4px rgba(0,0,0,0.05);
		}
		.logo a {
			text-decoration: none;
			font-size: 1.5rem;
			font-weight: bold;
			color: #333;
		}
		.auth-links {
			font-size: 1rem;
		}
		.auth-links a {
			margin-left: 1rem;
			text-decoration: none;
			color: #0d6efd;
			font-weight: 500;
		}
		.profile-container {
			max-width: 640px;
			background: white;
			margin: 3rem auto;
			padding: 2.5rem;
			border-radius: 16px;
			box-shadow: 0 8px 24px rgba(0, 0, 0, 0.05);
		}
		.profile-container h2 {
			text-align: center;
			margin-bottom: 2rem;
			font-size: 1.8rem;
		}
		.profile-item {
			display: flex;
			justify-content: space-between;
			padding: 0.9rem 0;
			border-bottom: 1px solid #eee;
		}
		.profile-item span:first-child {
			font-weight: 600;
			color: #555;
		}
		.profile-item span:last-child {
			color: #333;
		}
		.warehouse-box {
			background-color: #fff8e1;
			border: 2px solid #ffc107;
			color: #856404;
			padding: 1rem 1.2rem;
			margin-top: 2rem;
			text-align: center;
			border-radius: 10px;
			font-size: 1.2rem;
			font-weight: bold;
		}
	</style>
</head>
<body>

<header>
	<div class="logo">
		<a href="${pageContext.request.contextPath}/superadmin">MartGo</a>
	</div>
	<div class="auth-links">
		<%= admin.getAdminname() %>님 |
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</div>
</header>

<div class="profile-container">
	<h2>총관리자 마이페이지</h2>

	<div class="profile-item">
		<span>아이디</span><span><%= admin.getAdminId() %></span>
	</div>
	<div class="profile-item">
		<span>이름</span><span><%= admin.getAdminname() %></span>
	</div>
	<div class="profile-item">
		<span>이메일</span><span><%= admin.getEmail() %></span>
	</div>
	<div class="profile-item">
		<span>전화번호</span><span><%= admin.getPhone() %></span>
	</div>
	<div class="profile-item">
		<span>권한</span><span><%= admin.getRole() %></span>
	</div>

	<div class="warehouse-box">
		담당 창고: <%= admin.getWarehouse() != null ? admin.getWarehouse() : "전체 관리" %>
	</div>
</div>

</body>
</html>
