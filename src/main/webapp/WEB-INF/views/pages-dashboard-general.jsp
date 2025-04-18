<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MartGo - General Dashboard</title>
    <link href="/css/app.css" rel="stylesheet">
    <script src="/js/app.js"></script>
</head>
<body>
<div class="wrapper">
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="index.html">
                <span class="align-middle">AdminKit</span>
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">Pages</li>
                <li class="sidebar-item active">
                    <a class="sidebar-link" href="/dashboard/general?admin_id=${admin_id}">
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-warehouse.jsp">
                        <i class="align-middle" data-feather="rent"></i> <span class="align-middle">Warehouse Rent</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/pages-incoming.html">
                        <i class="align-middle" data-feather="package"></i> <span class="align-middle">입고신청</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/stock/general?admin_id=${admin_id}">
                        <i class="align-middle" data-feather="package"></i> <span class="align-middle">재고 목록</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/stock_history/general?admin_id=${admin_id}">
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
                <li class="sidebar-header">Tools & Components</li>
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
                        <i class="align-middle" data-feather="align-left"></i> <span class="align-middle">Typography</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="icons-feather.html">
                        <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">Icons</span>
                    </a>
                </li>
                <li class="sidebar-header">Plugins & Addons</li>
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
                    <div class="mb-3 text-sm">Are you looking for more components? Check out our premium version.</div>
                    <div class="d-grid">
                        <a href="upgrade-to-pro.html" class="btn btn-primary">Upgrade to Pro</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
        </nav>

        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>General Dashboard</strong></h1>

                <div class="row">
                    <div class="col-xl-6 col-xxl-7">
                        <div class="card flex-fill w-100">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Monthly Rent</h5>
                            </div>
                            <div class="card-body py-3" style="height: 370px; padding-bottom: 20px;">
                                <div class="chart chart-sm">
                                    <canvas id="chartjs-dashboard-line"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 col-xxl-5">
                        <div class="card flex-fill w-100">
                            <div class="card-header">
                                <h5 class="card-title mb-0">FAR by WareHouse</h5>
                            </div>
                            <div class="card-body w-100" style="height: 370px; padding-bottom: 20px;">
                                <div class="chart chart-lg" style="height: 100%;">
                                    <canvas id="chartjs-dashboard-bar" style="height: 100%;"></canvas>
                                </div>
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
        var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
        var gradient = ctx.createLinearGradient(0, 0, 0, 225);
        gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
        gradient.addColorStop(1, "rgba(215, 227, 244, 0)");

        var dtoList = [
            <c:forEach var="dto" items="${monthlyRentTotals}" varStatus="st">
            {
                month: "${dto.month}",
                totalRent: ${dto.total_rent}
            }<c:if test="${!st.last}">,</c:if>
            </c:forEach>
        ];

        var labels = dtoList.map(function (item) {
            return item.month.slice(-12);
        });
        var dataValues = dtoList.map(function (item) {
            return item.totalRent;
        });

        new Chart(ctx, {
            type: "line",
            data: {
                labels: labels,
                datasets: [{
                    label: "Monthly Rent Total",
                    fill: true,
                    backgroundColor: gradient,
                    borderColor: window.theme.primary,
                    data: dataValues
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true,
                layout: {
                    padding: {
                        top: 0,
                        bottom: 0
                    }
                },
                scales: {
                    y: {
                        ticks: {
                            stepSize: 1000000,
                            maxTicksLimit: 5,
                            callback: function(value) {
                                return value / 10000 + '만';
                            }
                        },
                        beginAtZero: true
                    }
                }
            }
        });
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        var warehouseLabels = [
            <c:forEach var="warehouse" items="${dashBoardList.wareHouseUsageList}" varStatus="loop">
            "${warehouse.warehouse_name}"<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];
        var warehouseData = [
            <c:forEach var="warehouse" items="${dashBoardList.wareHouseUsageList}" varStatus="loop">
            ${warehouse.FAR}<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
        ];

        var barColors = warehouseData.map(function (far) {
            if (far > 100) {
                return '#d12345';
            } else if (far <= 30) {
                return '#5db261';
            } else {
                return '#f6c265';
            }
        });

        new Chart(document.getElementById("chartjs-dashboard-bar"), {
            type: "bar",
            data: {
                labels: warehouseLabels,
                datasets: [{
                    label: "Warehouse Usage",
                    backgroundColor: barColors,
                    borderColor: barColors,
                    hoverBackgroundColor: barColors,
                    hoverBorderColor: barColors,
                    data: warehouseData,
                    barPercentage: 0.8,
                    categoryPercentage: 0.5
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true,
                layout: { padding: 0 },
                plugins: {
                    legend: { display: true, position: 'top' }
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,
                            max: 100,
                            stepSize: 10,
                            callback: function(value) {
                                return value + '%';
                            }
                        },
                        gridLines: {
                            display: true,
                            drawBorder: false,
                            color: "rgba(0,0,0,0.1)",
                            lineWidth: 1
                        }
                    }],
                    xAxes: [{
                        ticks: { fontSize: 10, padding: 5 },
                        gridLines: { drawBorder: false, color: "transparent" }
                    }]
                }
            }
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
                        backgroundColor: [usageColor, '#E0E0E0'],
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
