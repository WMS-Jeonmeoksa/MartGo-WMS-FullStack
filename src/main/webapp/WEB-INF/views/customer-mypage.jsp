<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%
	UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<title>MartGo - 거래처 마이페이지</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/customer_mypage.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/margoLogo.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
	<!-- 사이드바 -->
	<nav id="sidebar" class="sidebar js-sidebar">
		<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="${pageContext.request.contextPath}/customer/">
				<img src="/img/MartGo_Logo.png" alt="a">
			</a>
			<ul class="sidebar-nav">
				<li class="sidebar-header">거래처 메뉴</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/dashboard/customer">
						<i class="align-middle" data-feather="list"></i>
						<span class="align-middle">대시 보드</span>
					</a>
				</li>

				<li class="sidebar-item active">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/customer/mypage">
						<i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/product/register">
						<i class="align-middle" data-feather="plus-square"></i> <span class="align-middle">제품 등록</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/incoming/select">
						<i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/outgoing/select">
						<i class="align-middle" data-feather="log-out"></i> <span class="align-middle">출고 요청</span>
					</a>
				</li>

				<form id="stockForm" action="${pageContext.request.contextPath}/stock/user" method="post"
					  style="display: none;">
				</form>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/stock/customer">
						<i class="align-middle" data-feather="list"></i> <span class="align-middle">재고 조회</span>
					</a>
				</li>


			</ul>
		</div>
	</nav>

	<div class="main">
		<nav class="navbar navbar-expand navbar-light navbar-bg">
			<a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
			<div class="navbar-collapse collapse">
				<ul class="navbar-nav navbar-align ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/customer/mypage">
							<i class="fas fa-user-circle"></i> <%= user.getUsername() %>님
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/logout">
							<i class="fas fa-sign-out-alt"></i> 로그아웃
						</a>
					</li>
				</ul>
			</div>
		</nav>

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

		<footer class="footer">
			<div class="container-fluid">
				<div class="row text-muted">
					<div class="col-6 text-start">
						<p class="mb-0"><strong>MartGo</strong> &copy;</p>
					</div>
					<div class="col-6 text-end">
						<a class="text-muted" href="#">Support</a>
					</div>
				</div>
			</div>
		</footer>
	</div> <!-- .main -->
</div> <!-- .wrapper -->
</body>
</html>