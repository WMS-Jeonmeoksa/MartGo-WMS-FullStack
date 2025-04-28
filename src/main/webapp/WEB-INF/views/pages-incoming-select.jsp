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
    <link rel="stylesheet" href="/css/incoming_select.css">
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

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/select">
                        <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
                    </a>
                </li>

                <li class="sidebar-item">
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



        <form id="productForm" action="/incoming/detail" method="get">
            <input type="hidden" name="productId" id="productIdHidden" />

            <div class="incoming-container">
                <div class="header">
                    <h1 class="incoming-h1">
                        <i class="fas fa-box-open"></i> 입고 신청
                    </h1>
                </div>

                <div class="steps-container">
                    <div class="progress-bar">
                        <div class="step active">1
                            <div class="step-label">제품 선택</div>
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
                    <h3 class="incoming-h3">
                        <i class="fas fa-list-ul"></i>&nbsp;제품목록
                    </h3>
                </div>

                <!-- 제품 목록 테이블 -->
                <table id="product-table" class="incoming_table">
                    <thead>
                    <tr>
                        <th>제품 ID</th>
                        <th>제품명</th>
                        <th>카테고리</th>
                        <th>높이(cm)</th>
                        <th>넓이(cm)</th>
                        <th>가격(원)</th>
                        <th>제조사</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${productList}">
                        <tr onclick="selectProduct(this, '${product.productId}')">
                            <td>${product.productId}</td>
                            <td>${product.productName}</td>
                            <td>${product.category}</td>
                            <td>${product.height}</td>
                            <td>${product.width}</td>
                            <td><fmt:formatNumber value="${product.price}" type="number" /></td>
                            <td>${product.manufacturer}</td>
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
                    <button type="button" class="incoming_btn btn-back" onclick="history.back()">
                        <i class="fas fa-arrow-left"></i> 이전
                    </button>
                    <button type="submit" class="incoming_btn btn-next" id="nextBtn" disabled>
                        다음 <i class="fas fa-arrow-right"></i>
                    </button>
                </div>
            </div>
        </form>

        <script>
            function selectProduct(row, productId) {
                document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
                row.classList.add('selected');
                document.getElementById("productIdHidden").value = productId;
                document.getElementById("nextBtn").disabled = false;
            }
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const products = [...document.querySelectorAll("#product-table tbody tr")];
                const rowsPerPage = 7;  // 한 페이지에 10개씩
                let currentPage = 1;
                const totalPages = Math.ceil(products.length / rowsPerPage);

                function displayPage(page) {
                    products.forEach((row, index) => {
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