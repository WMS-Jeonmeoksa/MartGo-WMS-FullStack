<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.domain.UserVO" %>
<%
	UserVO user = (UserVO) session.getAttribute("loginInfo");
	if (user == null) {
		response.sendRedirect(request.getContextPath() + "/login");
		return;
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MartGo - 거래처 마이페이지</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
	<style>
		body {
			margin: 0;
			font-family: 'Inter', sans-serif;
			background-color: #f4f6f8;
		}

		header {
			background-color: #ffffff;
			padding: 1rem 2rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-shadow: 0 2px 8px rgba(0,0,0,0.05);
		}

		.logo a {
			font-weight: bold;
			font-size: 1.5rem;
			color: #333;
			text-decoration: none;
		}

		.auth-links a {
			margin-left: 1rem;
			font-weight: 500;
			color: #1e90ff;
			text-decoration: none;
		}

		.container {
			max-width: 600px;
			margin: 3rem auto;
			padding: 2rem;
			background-color: #fff;
			border-radius: 16px;
			box-shadow: 0 8px 20px rgba(0,0,0,0.05);
		}

		h2 {
			text-align: center;
			margin-bottom: 2rem;
			font-size: 1.8rem;
		}

		.info-group {
			display: flex;
			flex-direction: column;
			gap: 1.2rem;
		}

		.info-item {
			display: flex;
			justify-content: space-between;
			border-bottom: 1px solid #eee;
			padding-bottom: 0.5rem;
		}

		.info-item strong {
			color: #555;
		}

		.info-value {
			color: #333;
			font-weight: bold;
		}

		.highlight {
			color: #dc3545;
		}

		.btn-wrap {
			text-align: center;
			margin-top: 2.5rem;
		}

		.btn-delete {
			padding: 10px 24px;
			background-color: #dc3545;
			color: white;
			border: none;
			border-radius: 8px;
			font-weight: bold;
			cursor: pointer;
		}

		.confirm-modal {
			position: fixed;
			top: 0; left: 0;
			width: 100%; height: 100%;
			background: rgba(0,0,0,0.4);
			display: none;
			justify-content: center;
			align-items: center;
		}

		.confirm-box {
			background: white;
			padding: 2rem 2.5rem;
			border-radius: 12px;
			text-align: center;
		}

		.confirm-box p {
			font-size: 1.1rem;
			font-weight: 600;
		}

		.confirm-box button {
			padding: 8px 18px;
			margin: 1rem 10px 0;
			border-radius: 6px;
			border: none;
			font-weight: bold;
			cursor: pointer;
		}

		.btn-confirm {
			background-color: #dc3545;
			color: white;
		}

		.btn-cancel {
			background-color: #6c757d;
			color: white;
		}
	</style>
</head>
<body>

<header>
	<div class="logo">
		<a href="${pageContext.request.contextPath}/customer">MartGo</a>
	</div>
	<div class="auth-links">
		<span><%= user.getUsername() %>님</span>
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</div>
</header>

<div class="container">
	<h2>거래처 마이페이지</h2>

	<div class="info-group">
		<div class="info-item">
			<strong>아이디</strong>
			<div class="info-value"><%= user.getUserid() %></div>
		</div>
		<div class="info-item">
			<strong>이름</strong>
			<div class="info-value"><%= user.getUsername() %></div>
		</div>
		<div class="info-item">
			<strong>이메일</strong>
			<div class="info-value"><%= user.getEmail() != null ? user.getEmail() : "없음" %></div>
		</div>
		<div class="info-item">
			<strong>전화번호</strong>
			<div class="info-value"><%= user.getPhone() %></div>
		</div>
		<div class="info-item">
			<strong>주소</strong>
			<div class="info-value"><%= user.getAddress() %></div>
		</div>
		<div class="info-item">
			<strong>권한</strong>
			<div class="info-value"><%= user.getRole() %></div>
		</div>

		<div class="info-item">
			<strong style="color: #495057;">담당 창고 관리자ID</strong>
			<div class="info-value" style="color: #1e90ff; font-weight: bold;">
				<%= user.getAdminid() != null ? user.getAdminid() : "없음" %>
			</div>
		</div>

	</div>

</div>


</body>
</html>
