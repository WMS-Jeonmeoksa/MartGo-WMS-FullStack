<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo - 총 관리자 재고 목록</title>
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
                <li class="sidebar-header">
                    Pages
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="index.html">
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-warehouse.html">
                        <i class="align-middle" data-feather="rent"></i> <span
                            class="align-middle">Warehouse Rent</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/pages-incoming.html">
                        <i class="align-middle" data-feather="package"></i> <span class="align-middle">입고신청</span>
                    </a>
                </li><li class="sidebar-item active">
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

    <!-- 메인 콘텐츠 영역 -->
    <div class="main">
        <!-- 상단 네비게이션 영역 -->
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <div class="position-relative"><i class="align-middle" data-feather="bell"></i><span class="indicator">4</span></div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0">
                            <div class="dropdown-menu-header">4 New Notifications</div>
                            <div class="list-group">
                                <a href="#" class="list-group-item"><i class="text-danger" data-feather="alert-circle"></i> Update completed</a>
                                <a href="#" class="list-group-item"><i class="text-warning" data-feather="bell"></i> Lorem ipsum</a>
                                <a href="#" class="list-group-item"><i class="text-primary" data-feather="home"></i> Login from 192.186.1.8</a>
                                <a href="#" class="list-group-item"><i class="text-success" data-feather="user-plus"></i> New connection</a>
                            </div>
                            <div class="dropdown-menu-footer"><a href="#" class="text-muted">Show all notifications</a></div>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="align-middle" data-feather="message-square"></i></a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0">
                            <div class="dropdown-menu-header">4 New Messages</div>
                            <div class="list-group">
                                <a href="#" class="list-group-item">Vanessa Tucker - Nam pretium turpis</a>
                                <a href="#" class="list-group-item">William Harris - Curabitur ligula</a>
                            </div>
                            <div class="dropdown-menu-footer"><a href="#" class="text-muted">Show all messages</a></div>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown">
                            <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="User" /> <span class="text-dark">Charles Hall</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end">
                            <a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
                            <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Analytics</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="settings"></i> Settings & Privacy</a>
                            <a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i> Help Center</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Log out</a>
                        </div>
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
</body>
</html>
