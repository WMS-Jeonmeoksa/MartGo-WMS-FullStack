<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo - Dashboard</title>
    <link href="/css/app.css" rel="stylesheet">
    <script src="/js/app.js"></script>
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="index.html">
                <span class="align-middle">AdminKit</span>
            </a>

            <ul class="sidebar-nav">
                <li class="sidebar-header">
                    Pages
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="/dashboard/admin?admin_id=${admin_id}">
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-warehouse.jsp">
                        <i class="align-middle" data-feather="rent"></i> <span
                            class="align-middle">Warehouse Rent</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/pages-incoming.html">
                        <i class="align-middle" data-feather="package"></i> <span class="align-middle">입고신청</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/stock/admin?admin_id=${admin_id}">
                        <i class="align-middle" data-feather="package"></i> <span class="align-middle">재고 목록</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/stock_history/admin?admin_id=${admin_id}">
                        <i class="align-middle" data-feather="package"></i> <span class="align-middle">재고 변경 이력</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-profile.html">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-sign-in.html">
                        <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Sign In</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-sign-up.html">
                        <i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Sign Up</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-blank.html">
                        <i class="align-middle" data-feather="book"></i> <span class="align-middle">Blank</span>
                    </a>
                </li>

                <li class="sidebar-header">
                    Tools & Components
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="ui-buttons.html">
                        <i class="align-middle" data-feather="square"></i> <span class="align-middle">Buttons</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="ui-forms.html">
                        <i class="align-middle" data-feather="check-square"></i> <span class="align-middle">Forms</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="ui-cards.html">
                        <i class="align-middle" data-feather="grid"></i> <span class="align-middle">Cards</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="ui-typography.html">
                        <i class="align-middle" data-feather="align-left"></i> <span
                            class="align-middle">Typography</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="icons-feather.html">
                        <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">Icons</span>
                    </a>
                </li>

                <li class="sidebar-header">
                    Plugins & Addons
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="charts-chartjs.html">
                        <i class="align-middle" data-feather="bar-chart-2"></i> <span class="align-middle">Charts</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="maps-google.html">
                        <i class="align-middle" data-feather="map"></i> <span class="align-middle">Maps</span>
                    </a>
                </li>
            </ul>

            <div class="sidebar-cta">
                <div class="sidebar-cta-content">
                    <strong class="d-inline-block mb-2">Upgrade to Pro</strong>
                    <div class="mb-3 text-sm">
                        Are you looking for more components? Check out our premium version.
                    </div>
                    <div class="d-grid">
                        <a href="upgrade-to-pro.html" class="btn btn-primary">Upgrade to Pro</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- 메인 -->
    <div class="main">
        <!-- 네비게이션 -->
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
        </nav>

        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>Dashboard</strong></h1>
                <div class="row mb-4">
                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header"><h5 class="card-title mb-0">총 회원수</h5></div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                 style="height: 120px;"><h2 class="mb-1">${dashBoardList.totalUserCount}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header"><h5 class="card-title mb-0">담당 회원 수</h5></div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                 style="height: 120px;"><h2 class="mb-1">${dashBoardList.adminUserCount}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header"><h5 class="card-title mb-0">입고 승인 횟수</h5></div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                 style="height: 120px;"><h2 class="mb-1">${dashBoardList.approvedIncomingCount}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header"><h5 class="card-title mb-0">출고 승인 횟수</h5></div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                 style="height: 120px;"><h2 class="mb-1">${dashBoardList.approvedOutgoingCount}</h2>
                            </div>
                        </div>
                    </div>
                </div>
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
        <c:forEach var="sector" items="${dashBoardList.sectorUsageList}" varStatus="loop">
        <c:if test="${loop.index < 4}">
        (function () {
            var usage = ${sector.FAR};
            var usageFixed = usage > 100 ? 100 : usage;
            var remaining = usageFixed > 0 ? 100 - usageFixed : 100;

            var usageColor = '';
            if (usage >= 80) {
                usageColor = '#d12345'; // 빨간색
            } else if (usage <= 30) {
                usageColor = '#5db261'; // 연두색
            } else {
                usageColor = '#f6c265'; // 파란색
            }

            new Chart(document.getElementById("chart-sector-${loop.index}"), {
                type: "pie",
                data: {
                    labels: ["Usage", "Remaining"],
                    datasets: [{
                        data: [usageFixed, remaining],
                        backgroundColor: [usageColor, '#E0E0E0'],
                        borderWidth: 5
                    }]
                },
                options: {
                    maintainAspectRatio: false,
                    cutoutPercentage: 75,
                    legend: {display: false}
                }
            });
        })();
        </c:if>
        </c:forEach>
    });
</script>


</body>
</html>