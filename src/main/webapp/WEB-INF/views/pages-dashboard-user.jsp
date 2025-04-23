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
    <title>MartGo - Dashboard</title>
    <link href="/css/app.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="/js/app.js"></script>
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

                <li class="sidebar-item active">
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


        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>Dashboard</strong></h1>
                <div class="row mb-4">
                    <div class="row mb-4">
                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header"><h5 class="card-title mb-0">담당 관리자 이름</h5></div>
                                <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                     style="height: 120px;">
                                    <h2 class="mb-1">${dashBoardList.userAdminList[0].admin_name}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header"><h5 class="card-title mb-0">담당 관리자 연락처</h5></div>
                                <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                     style="height: 120px;">
                                    <h2 class="mb-1">${dashBoardList.userAdminList[0].phone_num}</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 임대한 섹터 ID + 창고 이름 한 줄로 묶기 -->
                    <div class="row mb-4">
                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header"><h5 class="card-title mb-0">임대한 섹터 ID</h5></div>
                                <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                     style="height: 120px;">
                                    <h2 class="mb-1">${dashBoardList.rentSectorWarehouseList[0].sector_id}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-header"><h5 class="card-title mb-0">임대한 창고 이름</h5></div>
                                <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                     style="height: 120px;">
                                    <h2 class="mb-1">${dashBoardList.rentSectorWarehouseList[0].warehouse_name}</h2>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="row mb-4">
                    <div class="col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-header"><h5 class="card-title mb-0">임대 만료까지 남은 일수</h5></div>
                            <div class="card-body d-flex flex-column align-items-start justify-content-center"
                                 style="height: 180px;">
                                <h2 class="mb-1">${dashBoardList.remainingDays}</h2>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 d-flex">
                        <div class="card flex-fill w-100">
                            <div class="card-header">
                                <h5 class="card-title mb-0">${dashBoardList.userSectorUsage[0].sector_id} Usage</h5>
                            </div>
                            <div class="card-body d-flex flex-column align-items-center justify-content-center"
                                 style="height: 250px;">
                                <div class="chart chart-xs" style="height: 150px; width: 150px;">
                                    <canvas id="chart-sector-0"></canvas>
                                </div>
                                <div class="mt-3 text-center" style="font-weight: bold; font-size: 1.1rem;">
                                    ${dashBoardList.userSectorUsage[0].sector_id}
                                    - ${dashBoardList.userSectorUsage[0].FAR}%
                                </div>
                            </div>

                        </div>
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
        <c:forEach var="sector" items="${dashBoardList.userSectorUsage}" varStatus="loop">
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