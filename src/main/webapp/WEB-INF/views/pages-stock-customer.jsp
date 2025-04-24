<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo - 재고 목록</title>
    <link href="/css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="/css/margoLogo.css">
    <script src="/js/app.js"></script>
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

                <form id="stockForm" action="${pageContext.request.contextPath}/stock/user" method="get"
                      style="display: none;">
                </form>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="/stock/user/">
                        <i class="align-middle" data-feather="list"></i> <span class="align-middle">재고 조회</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 메인 콘텐츠 영역 -->
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

        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>재고</strong> 목록</h1>
                <div class="card">
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>재고 번호</th>
                                <th>수량</th>
                                <th>총 가격</th>
                                <th>회원 ID</th>
                                <th>제품 ID</th>
                                <th>섹터 ID</th>
                                <th>창고 ID</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="stock" items="${stockList}">
                                <tr>
                                    <td>${stock.stock_num}</td>
                                    <td>${stock.count}</td>
                                    <td>${stock.total_price}</td>
                                    <td>${stock.user_id}</td>
                                    <td>${stock.product_id}</td>
                                    <td>${stock.sector_id}</td>
                                    <td>${stock.warehouse_id}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
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