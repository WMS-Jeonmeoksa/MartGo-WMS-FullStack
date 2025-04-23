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
    <meta charset="UTF-8"/>
    <title>MartGo - 총 관리자 재고 목록</title>
    <link href="/css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="/css/margoLogo.css">
    <script src="/js/app.js"></script>
    <style>
        .sidebar-submenu {
            display: none;
            padding-left: 1.5rem;
        }

        .sidebar-item.open > .sidebar-submenu {
            display: block;
        }

        .submenu-toggle {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .submenu-icon {
            font-size: 0.8rem;
            transition: transform 0.3s ease;
        }

        .sidebar-item.open .submenu-icon {
            transform: rotate(180deg);
        }
    </style>
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

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/general">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/superadmin/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <!-- 진행중 메뉴 -->
                <li class="sidebar-item">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="clock"></i> 진행중</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li><a class="sidebar-link" href="${pageContext.request.contextPath}/rent/confirm">임대 신청 목록</a></li>
                        <li><a class="sidebar-link" href="/incoming/approve">입고 신청 목록</a></li>
                        <li><a class="sidebar-link" href="/outgoing/approve">출고 신청 목록</a></li>
                    </ul>
                </li>

                <!-- 담당 창고 메뉴 -->
                <li class="sidebar-item open">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="package"></i> 담당 창고</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li class="sidebar-item active">
                            <a class="sidebar-link" href="/stock/general">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 목록</span>
                            </a>
                        </li>

                        <li class="sidebar-item">
                            <a class="sidebar-link" href="/stock_history/general">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 변경 이력</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 메인 콘텐츠 영역 -->
    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle">
                <i class="hamburger align-self-center"></i>
            </a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align ms-auto">
                    <li class="nav-item">
                        <span class="nav-link"><i
                                class="fas fa-user-circle"></i> <%= admin.getAdminname() %> 총관리자님</span>
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
                <h1 class="h3 mb-3"><strong>총 관리자</strong> - 유저 재고 목록</h1>
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
