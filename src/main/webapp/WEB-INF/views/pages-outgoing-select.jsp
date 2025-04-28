<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%
    UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo</title>
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/margoLogo.css">
    <link rel="stylesheet" href="/css/outgoing_select.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/dashboard/customer">
                <img src="/img/MartGo_Logo.png" alt="MartGo_Logo">
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">거래처 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/customer">
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
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/product/register">
                        <i class="align-middle" data-feather="plus-square"></i> <span class="align-middle">제품 등록</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/select">
                        <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
                    </a>
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/select">
                        <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">출고 요청</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/stock/customer/">
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


        <form id="outgoingForm" action="/outgoing/detail" method="get">
            <input type="hidden" name="stockNum" id="stockNumHidden" />
            <input type="hidden" name="productId" id="productIdHidden" />

            <div class="outgoing-container">
                <div class="header">
                    <h1 class="outgoing-h1">
                        <i class="fas fa-truck"></i>&nbsp;출고 신청
                    </h1>
                </div>

                <div class="steps-container">
                    <div class="progress-bar">
                        <div class="step active">1
                            <div class="step-label">재고 선택</div>
                        </div>
                        <div class="step">2
                            <div class="step-label">세부 정보 입력</div>
                        </div>
                        <div class="step">3
                            <div class="step-label">신청 내역 확인</div>
                        </div>
                    </div>
                </div>

                <div class="section-header">
                    <h3 class="outgoing-h3">
                        <i class="fas fa-list-ul"></i>&nbsp;재고 목록
                    </h3>
                </div>

                <!-- 재고 목록 테이블 -->
                <table id="stock-table" class="outgoing_table">
                    <thead>
                    <tr>
                        <th>재고번호</th>
                        <th>제품 ID</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>창고 ID</th>
                        <th>섹터 ID</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="stock" items="${stockList}">
                        <tr onclick="selectStock(this, '${stock.stock_num}', '${stock.product_id}')">
                            <td>${stock.stock_num}</td>
                            <td>${stock.product_id}</td>
                            <td>${stock.count}</td>
                            <td><fmt:formatNumber value="${stock.total_price}" type="number"/></td>
                            <td>${stock.warehouse_id}</td>
                            <td>${stock.sector_id}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- 🔵 페이징 버튼 영역 추가 -->
                <div class="d-flex justify-content-center align-items-center mt-3">
                    <button id="prev-btn" class="btn btn-primary me-2" type="button">이전</button>
                    <span id="current-page">1</span> / <span id="total-pages">1</span>
                    <button id="next-btn" class="btn btn-primary ms-2" type="button">다음</button>
                </div>

                <div class="button-group-full">
                    <button type="button" class="outgoing_btn btn-back" onclick="window.location.href='/index'">
                        <i class="fas fa-arrow-left"></i> 이전
                    </button>
                    <button type="submit" class="outgoing_btn btn-next" id="nextBtn" disabled>
                        다음 <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </form>

        <script>
            function selectStock(row, stockNum, productId) {
                document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
                row.classList.add('selected');

                document.getElementById("stockNumHidden").value = stockNum;
                document.getElementById("productIdHidden").value = productId;

                document.getElementById("nextBtn").disabled = false;
            }
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const stocks = [...document.querySelectorAll("#stock-table tbody tr")];
                const rowsPerPage = 7;  // ✅ 7개씩 보여주기
                let currentPage = 1;
                const totalPages = Math.ceil(stocks.length / rowsPerPage);

                function displayPage(page) {
                    stocks.forEach((row, index) => {
                        row.style.display = (index >= (page - 1) * rowsPerPage && index < page * rowsPerPage) ? '' : 'none';
                    });
                    updatePagination();
                }

                function updatePagination() {
                    document.getElementById('current-page').innerText = currentPage;
                    document.getElementById('total-pages').innerText = totalPages;
                    document.getElementById('prev-btn').disabled = (currentPage === 1);
                    document.getElementById('next-btn').disabled = (currentPage === totalPages);
                }

                document.getElementById('prev-btn').addEventListener('click', function() {
                    if (currentPage > 1) {
                        currentPage--;
                        displayPage(currentPage);
                    }
                });

                document.getElementById('next-btn').addEventListener('click', function() {
                    if (currentPage < totalPages) {
                        currentPage++;
                        displayPage(currentPage);
                    }
                });

                // 페이지 처음 로딩 시 초기 표시
                displayPage(currentPage);
            });
        </script>

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
    </div> <!-- .main -->
</div> <!-- .wrapper -->
</body>
</html>