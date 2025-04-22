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
    <title>MartGo - Dashboard</title>
    <link href="/css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
            transition: transform 0.3s;
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
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/admin">
                <span class="align-middle">MartGo</span>
            </a>

            <ul class="sidebar-nav">
                <li class="sidebar-header">창고관리자 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="#" onclick="document.getElementById('AdminDashBoardForm').submit(); return false;">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>
                <form id="AdminDashBoardForm" action="${pageContext.request.contextPath}/dashboard/admin/" method="post" style="display: none;"></form>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/mypage">
                        <i class="align-middle" data-feather="user"></i>
                        <span class="align-middle">마이페이지</span>
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
                            <a class="sidebar-link" href="#" onclick="document.getElementById('StockForm').submit(); return false;">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 목록</span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-link" href="#" onclick="document.getElementById('StockHistoryForm').submit(); return false;">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 변경 이력</span>
                            </a>
                        </li>
                    </ul>
                    <form id="StockForm" action="${pageContext.request.contextPath}/stock/admin/" method="post" style="display: none;"></form>
                    <form id="StockHistoryForm" action="${pageContext.request.contextPath}/stock_history/admin/" method="post" style="display: none;"></form>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 메인 -->
    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle">
                <i class="hamburger align-self-center"></i>
            </a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align ms-auto">
                    <li class="nav-item">
                        <span class="nav-link"><i class="fas fa-user-circle"></i> <%= admin.getAdminname() %>님</span>
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
                <h1 class="h3 mb-3"><strong>Dashboard</strong></h1>

                <!-- 대시보드 카드 -->
                <div class="row mb-4">
                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header">
                                <h5 class="card-title mb-0">총 회원수</h5>
                            </div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center" style="height: 120px;">
                                <h2 class="mb-1">${dashBoardList.totalUserCount}</h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header">
                                <h5 class="card-title mb-0">담당 회원 수</h5>
                            </div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center" style="height: 120px;">
                                <h2 class="mb-1">${dashBoardList.adminUserCount}</h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header">
                                <h5 class="card-title mb-0">입고 승인 횟수</h5>
                            </div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center" style="height: 120px;">
                                <h2 class="mb-1">${dashBoardList.approvedIncomingCount}</h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header">
                                <h5 class="card-title mb-0">출고 승인 횟수</h5>
                            </div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center" style="height: 120px;">
                                <h2 class="mb-1">${dashBoardList.approvedOutgoingCount}</h2>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 섹터 사용량 -->
                <div class="row">
                    <c:forEach var="sector" items="${dashBoardList.sectorUsageList}" varStatus="loop">
                        <c:if test="${loop.index < 4}">
                            <div class="col-12 col-md-6 col-xl-3 d-flex mb-4">
                                <div class="card flex-fill w-100">
                                    <div class="card-header">
                                        <h5 class="card-title mb-0">${sector.sector_id} Usage</h5>
                                    </div>
                                    <div class="card-body d-flex">
                                        <div class="align-self-center w-100">
                                            <div class="chart chart-xs" style="height: 180px;">
                                                <canvas id="chart-sector-${loop.index}"></canvas>
                                            </div>
                                            <table class="table mb-0">
                                                <tbody>
                                                <tr>
                                                    <td>${sector.sector_id}</td>
                                                    <td class="text-end">${sector.FAR}%</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
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
        feather.replace();
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        <c:forEach var="sector" items="${dashBoardList.sectorUsageList}" varStatus="loop">
        <c:if test="${loop.index < 4}">
        (function () {
            var usage = ${sector.FAR};
            var usageFixed = usage > 100 ? 100 : usage;
            var remaining = usageFixed > 0 ? 100 - usageFixed : 100;

            var usageColor = '';
            if (usage >= 80) {
                usageColor = '#d12345';
            } else if (usage <= 30) {
                usageColor = '#5db261';
            } else {
                usageColor = '#f6c265';
            }

            new Chart(document.getElementById("chart-sector-${loop.index}"), {
                type: "pie",
                data: {
                    labels: ["Usage", "Remaining"],
                    datasets: [{
                        data: [usageFixed, remaining],
                        backgroundColor: [usageColor, "#E0E0E0"],
                        borderWidth: 5
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    cutoutPercentage: 75,
                    legend: { display: false }
                }
            });
        })();
        </c:if>
        </c:forEach>
    });
</script>

</body>
</html>