<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>MartGo - 창고관리자 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
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
			<a class="sidebar-brand" href="${pageContext.request.contextPath}/admin">
                <img src="/img/MartGo_Logo.png" alt="a">
			</a>
			<ul class="sidebar-nav">
				<li class="sidebar-header">창고관리자 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/admin/">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="clock"></i> 대기중</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li><a class="sidebar-link" href="#">임대 신청 목록</a></li>
                        <li><a class="sidebar-link" href="#">입고 신청 목록</a></li>
                        <li><a class="sidebar-link" href="#">출고 신청 목록</a></li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="package"></i> 담당 창고</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li>
                            <a class="sidebar-link" href="/stock/admin/">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 목록</span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-link" href="/stock_history/admin/">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 변경 이력</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

	<!-- 메인 -->
	<div class="main">
		<!-- 상단 네비가이션 -->
		<nav class="navbar navbar-expand navbar-light navbar-bg">
			<a class="sidebar-toggle js-sidebar-toggle">
				<i class="hamburger align-self-center"></i>
			</a>
			<div class="navbar-collapse collapse">
				<ul class="navbar-nav navbar-align ms-auto">
					<li class="nav-item">
						<a class="nav-link" href="${pageContext.request.contextPath}/admin/mypage">
							<i class="fas fa-user-circle"></i> <%= admin.getAdminname() %>님
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

        <!-- 컨텐츠 -->
        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>MartGo 창고관리자 페이지</strong></h1>
                <div class="card">
                    <div class="card-body">
                        <h4><%= admin.getAdminname() %> 관리자님 환영합니다!</h4>
                        <p class="text-muted">MartGo의 입출고 요청 및 재고 내역을 왼칸 메뉴를 통해 관리할 수 있습니다.</p>
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

<!-- 토글 동작 스크립트 -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
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
