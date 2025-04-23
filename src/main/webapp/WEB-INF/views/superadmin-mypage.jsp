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
	<title>MartGo - 총관리자 페이지</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/superadmin.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/superadmin_mypage.css">
	<link rel="stylesheet" href="/css/margoLogo.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
<div class="wrapper">
	<!-- 사이드바 -->
	<nav id="sidebar" class="sidebar js-sidebar">
		<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="${pageContext.request.contextPath}/superadmin">
				<img src="/img/MartGo_Logo.png" alt="a">
			</a>
			<ul class="sidebar-nav">
				<li class="sidebar-header">총관리자 메뉴</li>

				<form id="SuperAdminDashBoardForm" action="${pageContext.request.contextPath}/dashboard/superadmin/" method="post" style="display: none;"></form>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/dashboard/general/">
						<i class="align-middle" data-feather="list"></i>
						<span class="align-middle">대시 보드</span>
					</a>
				</li>

				<li class="sidebar-item active">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/superadmin/mypage">
						<i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link submenu-toggle" href="#">
						<span><i class="align-middle" data-feather="clock"></i> 진행중</span>
						<i class="fas fa-chevron-down submenu-icon"></i>
					</a>
					<ul class="sidebar-submenu">
						<li><a class="sidebar-link" href="#">임대 신청 목록</a></li>
						<li><a class="sidebar-link" href="#">입고 신청 목록</a></li>
						<li><a class="sidebar-link" href="#">출고 신청 목록</a></li>
					</ul>
				</li>

				<!-- 담당 창고 메뉴 -->
				<li class="sidebar-item">
					<a class="sidebar-link submenu-toggle" href="#">
						<span><i class="align-middle" data-feather="package"></i> 담당 창고</span>
						<i class="fas fa-chevron-down submenu-icon"></i>
					</a>
					<ul class="sidebar-submenu">
						<li class="sidebar-item">
							<a class="sidebar-link" href="#"
							   onclick="document.getElementById('GeneralStockForm').submit(); return false;">
								<i class="align-middle" data-feather="list"></i>
								<span class="align-middle">재고 목록</span>
							</a>
						</li>
						<form id="GeneralStockForm" action="${pageContext.request.contextPath}/stock/general/"
							  method="post" style="display: none;"></form>

						<li class="sidebar-item">
							<a class="sidebar-link" href="#"
							   onclick="document.getElementById('GeneralStockHistoryForm').submit(); return false;">
								<i class="align-middle" data-feather="list"></i>
								<span class="align-middle">재고 변경 이력</span>
							</a>
						</li>
						<form id="GeneralStockHistoryForm"
							  action="${pageContext.request.contextPath}/stock_history/general/" method="post"
							  style="display: none;"></form>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	<!-- 메인 -->
	<div class="main">
		<!-- 상단 네비게이션 -->
		<nav class="navbar navbar-expand navbar-light navbar-bg">
			<a class="sidebar-toggle js-sidebar-toggle">
				<i class="hamburger align-self-center"></i>
			</a>
			<div class="navbar-collapse collapse">
				<ul class="navbar-nav navbar-align ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/superadmin/mypage">
							<i class="fas fa-user-circle"></i> <%= admin.getAdminname() %> 총관리자님
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

		<!-- 마이페이지 컨텐츠 -->
		<main class="content">
			<div class="container-fluid p-0">
				<h2 class="h3 mb-4"><strong>총관리자 마이페이지</strong></h2>
				<div class="card">
					<div class="card-body">
						<div class="profile-item"><span>아이디</span><span><%= admin.getAdminId() %></span></div>
						<div class="profile-item"><span>이름</span><span><%= admin.getAdminname() %></span></div>
						<div class="profile-item"><span>이메일</span><span><%= admin.getEmail() %></span></div>
						<div class="profile-item"><span>전화번호</span><span><%= admin.getPhone() %></span></div>
						<div class="profile-item"><span>권한</span><span><%= admin.getRole() %></span></div>
						<div class="warehouse-box">담당 창고: <%= admin.getWarehouse() != null ? admin.getWarehouse() : "전체 관리" %></div>
					</div>
				</div>
			</div>
		</main>

		<!-- 푸터 -->
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
	</div>
</div>

<!-- Feather 아이콘 & 토글 스크립트 -->
<script src="https://unpkg.com/feather-icons"></script>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		feather.replace(); // 아이콘 초기화

		const toggles = document.querySelectorAll(".submenu-toggle");
		toggles.forEach(toggle => {
			toggle.addEventListener("click", function (e) {
				e.preventDefault();
				const item = this.closest(".sidebar-item");
				item.classList.toggle("open");
			});
		});
	});
</script>
</body>
</html>
