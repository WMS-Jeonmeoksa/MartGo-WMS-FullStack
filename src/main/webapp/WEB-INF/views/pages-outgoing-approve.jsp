<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <meta charset="UTF-8">
    <title>MartGo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="/css/margoLogo.css">
    <link rel="stylesheet" href="/css/outgoing_approve.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/dashboard/admin">
                <img src="/img/MartGo_Logo.png" alt="a">
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">창고관리자 메뉴</li>

                <form id="AdminDashBoardForm" action="${pageContext.request.contextPath}/dashboard/admin/" method="post" style="display: none;"></form>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/admin/">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/admin/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item open">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="clock"></i> 대기중</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li><a class="sidebar-link" href="${pageContext.request.contextPath}/rent/approve">임대 신청 목록</a></li>
                        <li><a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/approve">입고 신청 목록</a></li>
                        <li class="sidebar-item active"><a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/approve">출고 신청 목록</a></li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="package"></i> 담당 창고</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="/stock/admin/">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 목록</span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-link" href="/stock_history/admin">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 변경 이력</span>
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 메인 -->
    <div class="main">
        <!-- 상단 네비게이션 -->
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle">
                <i class="hamburger align-self-center"></i>
            </a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/admin/mypage">
                            <i class="fas fa-user-circle"></i> <%= admin.getAdminname() %>님
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


        <form id="approveForm" action="/outgoing/approve" method="post">
            <input type="hidden" name="outgoingNum" id="selectedOutgoingNum" />

            <div class="outgoing-container">
                <div class="header">
                    <h1 class="outgoing-h1">
                        <i class="fas fa-check-circle"></i>&nbsp;출고 승인
                    </h1>
                </div>

                <div class="section-header">
                    <h3 class="outgoing-h3">
                        <i class="fas fa-list-ul"></i>&nbsp;출고 신청 목록
                    </h3>
                </div>

                <!-- 출고 신청 목록 테이블 -->
                <table id="outgoing-table" class="outgoing_table">
                    <thead>
                    <tr>
                        <th>출고번호</th>
                        <th>재고번호</th>
                        <th>수량</th>
                        <th>출고날짜</th>
                        <th>회원 ID</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="outgoing" items="${outgoingList}">
                        <tr onclick="selectOutgoing(this, '${outgoing.outgoingNum}')">
                            <td>${outgoing.outgoingNum}</td>
                            <td>${outgoing.stockNum}</td>
                            <td>${outgoing.count}</td>
                            <td><fmt:formatDate value="${outgoing.outgoingDate}" pattern="yyyy-MM-dd"/></td>
                            <td>${outgoing.userId}</td>
                            <td>${outgoing.status}</td>
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
                    <button type="button" class="outgoing_btn btn-back" onclick="window.location.href='/dashboard/admin'">
                        <i class="fas fa-arrow-left"></i> 홈으로
                    </button>
                    <button type="button" class="outgoing_btn btn-next" id="approveBtn" disabled onclick="approveOutgoing()">
                        승인 <i class="fas fa-check"></i>
                    </button>
                </div>
            </div>
        </form>

        <script>
            let selectedOutgoingId = null;

            function selectOutgoing(row, outgoingId) {
                document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
                row.classList.add('selected');
                selectedOutgoingId = outgoingId;
                document.getElementById('selectedOutgoingNum').value = outgoingId;
                document.getElementById('approveBtn').disabled = false;
            }

            function approveOutgoing() {
                if (selectedOutgoingId) {
                    const confirmMsg = `해당 출고요청을 승인하겠습니까?`;
                    if (confirm(confirmMsg)) {
                        document.getElementById('approveForm').submit();
                    }
                }
            }
        </script>

        <script>
            document.addEventListener('DOMContentLoaded', function() {
                const outgoings = [...document.querySelectorAll("#outgoing-table tbody tr")];
                const rowsPerPage = 10;
                let currentPage = 1;
                const totalPages = Math.ceil(outgoings.length / rowsPerPage);

                function displayPage(page) {
                    outgoings.forEach((row, index) => {
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

        <!-- Feather 아이콘 & 토글 스크립트 -->
        <script src="https://unpkg.com/feather-icons"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                feather.replace(); // 아이콘 활성화

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
