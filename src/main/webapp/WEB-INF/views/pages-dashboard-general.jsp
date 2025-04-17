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
                    <a class="sidebar-link" href="/dashboard/general?admin_id=${admin_id}">
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
        <!-- 상단 네비게이션 -->
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
        </nav>

        <main class="content">
            <div class="container-fluid p-0">
                <h1 class="h3 mb-3"><strong>General Dashboard</strong></h1>

                <!-- 여기부터 기존 General 그래프 부분 유지 -->
                <div class="row">
                    <div class="col-xl-6 col-xxl-7">
                        <div class="card flex-fill w-100">
                            <div class="card-header">
                                <h5 class="card-title mb-0">Recent Movement</h5>
                            </div>
                            <div class="card-body py-3" style="height: 350px;">
                                <div class="chart chart-sm">
                                    <canvas id="chartjs-dashboard-line"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-6 col-xxl-5 d-flex">
                        <div class="card flex-fill w-100">
                            <div class="card-header">Monthly Sales</div>
                            <div class="card-body d-flex w-100" style="height: 350px;">
                                <div class="align-self-center chart chart-lg">
                                    <canvas id="chartjs-dashboard-bar"></canvas>
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

<!-- 기존 General 그래프용 JS 스크립트는 그대로 -->
<script src="js/app.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
        var gradient = ctx.createLinearGradient(0, 0, 0, 225);
        gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
        gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
        // Line chart
        new Chart(document.getElementById("chartjs-dashboard-line"), {
            type: "line",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "Sales ($)",
                    fill: true,
                    backgroundColor: gradient,
                    borderColor: window.theme.primary,
                    data: [
                        2115,
                        1562,
                        1584,
                        1892,
                        1587,
                        1923,
                        2566,
                        2448,
                        2805,
                        3438,
                        2917,
                        3327
                    ]
                }]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                tooltips: {
                    intersect: false
                },
                hover: {
                    intersect: true
                },
                plugins: {
                    filler: {
                        propagate: false
                    }
                },
                scales: {
                    xAxes: [{
                        reverse: true,
                        gridLines: {
                            color: "rgba(0,0,0,0.0)"
                        }
                    }],
                    yAxes: [{
                        ticks: {
                            stepSize: 1000
                        },
                        display: true,
                        borderDash: [3, 3],
                        gridLines: {
                            color: "rgba(0,0,0,0.0)"
                        }
                    }]
                }
            }
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var markers = [{
            coords: [31.230391, 121.473701],
            name: "Shanghai"
        },
            {
                coords: [28.704060, 77.102493],
                name: "Delhi"
            },
            {
                coords: [6.524379, 3.379206],
                name: "Lagos"
            },
            {
                coords: [35.689487, 139.691711],
                name: "Tokyo"
            },
            {
                coords: [23.129110, 113.264381],
                name: "Guangzhou"
            },
            {
                coords: [40.7127837, -74.0059413],
                name: "New York"
            },
            {
                coords: [34.052235, -118.243683],
                name: "Los Angeles"
            },
            {
                coords: [41.878113, -87.629799],
                name: "Chicago"
            },
            {
                coords: [51.507351, -0.127758],
                name: "London"
            },
            {
                coords: [40.416775, -3.703790],
                name: "Madrid "
            }
        ];
        var map = new jsVectorMap({
            map: "world",
            selector: "#world_map",
            zoomButtons: true,
            markers: markers,
            markerStyle: {
                initial: {
                    r: 9,
                    strokeWidth: 7,
                    stokeOpacity: .4,
                    fill: window.theme.primary
                },
                hover: {
                    fill: window.theme.primary,
                    stroke: window.theme.primary
                }
            },
            zoomOnScroll: false
        });
        window.addEventListener("resize", () => {
            map.updateSize();
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
        var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
        document.getElementById("datetimepicker-dashboard").flatpickr({
            inline: true,
            prevArrow: "<span title=\"Previous month\">&laquo;</span>",
            nextArrow: "<span title=\"Next month\">&raquo;</span>",
            defaultDate: defaultDate
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        new Chart(document.getElementById("chartjs-dashboard-bar"), {
            type: "bar",
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: "This year",
                    backgroundColor: window.theme.primary,
                    borderColor: window.theme.primary,
                    hoverBackgroundColor: window.theme.primary,
                    hoverBorderColor: window.theme.primary,
                    data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
                    barPercentage: .75,
                    categoryPercentage: .5
                }]
            },
            options: {
                maintainAspectRatio: false,
                legend: {
                    display: false
                },
                scales: {
                    yAxes: [{
                        gridLines: {
                            display: false
                        },
                        stacked: false,
                        ticks: {
                            stepSize: 20
                        }
                    }],
                    xAxes: [{
                        stacked: false,
                        gridLines: {
                            color: "transparent"
                        }
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
