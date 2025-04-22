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
	<title>MartGo - 창고 관리자 마이페이지</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/admin_mypage.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

</head>
<body>

<header>
	<div class="logo">
		<a href="${pageContext.request.contextPath}/admin">MartGo</a>
	</div>
	<div class="auth-links">
		<%= admin.getAdminname() %>님 |
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</div>
</header>

<div class="profile-container">
	<h2>창고 관리자 마이페이지</h2>

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
		담당 창고: <%= admin.getWarehouse() != null ? admin.getWarehouse() : "미지정" %>
	</div>
</div>

</body>
</html>
