<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%
	UserDTO user = (UserDTO)session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo - 거래처 전용 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/customer.css">
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
                <span class="align-middle">MartGo</span>
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">거래처 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/user/">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/customer/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="#">
                        <i class="align-middle" data-feather="plus-square"></i> <span class="align-middle">제품 등록</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="#">
                        <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="#">
                        <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">출고 요청</span>
                    </a>
                </li>


                <li class="sidebar-item">
                    <a class="sidebar-link" href="/stock/user/">
                        <i class="align-middle" data-feather="list"></i> <span class="align-middle">재고 조회</span>
                    </a>
                </li>


            </ul>
        </div>
    </nav>

    <!-- 메인 -->
    <div class="main">
        <!-- 상단 네비게이션 -->
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align ms-auto">
                    <li class="nav-item">
                        <span class="nav-link"><i class="fas fa-user-circle"></i> <%= user.getUsername() %>님</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i> 로그아웃
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- 콘텐츠 -->
        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>MartGo 거래처 페이지</strong></h1>

                <div class="card">
                    <div class="card-body">
                        <h4><%= user.getUsername() %>님 환영합니다!</h4>
                        <p class="text-muted">
                            MartGo의 재고 요청 및 거래 내역을 좌측 메뉴를 통해 확인할 수 있습니다.
                        </p>
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
</body>
</html>
