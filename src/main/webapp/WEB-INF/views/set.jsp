<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%
	UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<title>MartGo</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/customer_mypage.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/margoLogo.css">
	<link rel="stylesheet" href="">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
	<!-- 사이드바 -->
	<nav id="sidebar" class="sidebar js-sidebar">
		<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="${pageContext.request.contextPath}/dashboard/user">
				<img src="/img/MartGo_Logo.png" alt="MartGo_Logo">
			</a>
			<ul class="sidebar-nav">
				<li class="sidebar-header">거래처 메뉴</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/dashboard/user">
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
					<a class="sidebar-link" href="${pageContext.request.contextPath}/product/register">
						<i class="align-middle" data-feather="plus-square"></i> <span class="align-middle">제품 등록</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/select">
						<i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/select">
						<i class="align-middle" data-feather="log-out"></i> <span class="align-middle">출고 요청</span>
					</a>
				</li>

				<form id="stockForm" action="${pageContext.request.contextPath}/stock/user" method="post"
					  style="display: none;">
				</form>

				<li class="sidebar-item">
					<a class="sidebar-link" href="#"
					   onclick="document.getElementById('stockForm').submit(); return false;">
						<i class="align-middle" data-feather="list"></i> <span class="align-middle">재고 조회</span>
					</a>
				</li>


			</ul>
		</div>
	</nav>




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