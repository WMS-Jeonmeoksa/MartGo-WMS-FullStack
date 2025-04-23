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
    <link rel="stylesheet" href="/css/incoming_approve.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/admin">
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
                        <li class="sidebar-item active"><a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/approve">입고 신청 목록</a></li>
                        <li><a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/approve">출고 신청 목록</a></li>
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


        <form id="approveForm" action="/incoming/approve" method="post">
            <input type="hidden" name="incomingNum" id="incomingNumInput" />

            <div class="incoming-container">
                <div class="header">
                    <h1 class="incoming-h1">
                        <i class="fas fa-check-circle"></i>&nbsp;입고 승인
                    </h1>
                </div>

                <div class="section-header">
                    <h3 class="incoming-h3">
                        <i class="fas fa-list-ul"></i>&nbsp;입고 신청 목록
                    </h3>
                </div>

                <table class="incoming_table">
                    <thead>
                    <tr>
                        <th>입고번호</th>
                        <th>제품 ID</th>
                        <th>수량</th>
                        <th>입고날짜</th>
                        <th>회원 ID</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="incoming" items="${incomingList}">
                        <tr onclick="selectIncoming(this, '${incoming.incomingNum}')">
                            <td>${incoming.incomingNum}</td>
                            <td>${incoming.productId}</td>
                            <td>${incoming.count}</td>
                            <td><fmt:formatDate value="${incoming.incomingDate}" pattern="yyyy-MM-dd"/></td>
                            <td>${incoming.userId}</td>
                            <td>${incoming.status}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="button-group-full">
                    <button type="button" class="incoming_btn btn-back" onclick="window.location.href='/dashboard/general'">
                        <i class="fas fa-arrow-left"></i> 홈으로
                    </button>
                    <button type="submit" class="incoming_btn btn-next" id="approveBtn" disabled onclick="return confirmApproval()">
                        승인 <i class="fas fa-check"></i>
                    </button>
                </div>
            </div>
        </form>

        <script>
            let selectedIncomingId = null;

            function selectIncoming(row, incomingId) {
                document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
                row.classList.add('selected');
                selectedIncomingId = incomingId;
                document.getElementById("incomingNumInput").value = incomingId;
                document.getElementById('approveBtn').disabled = false;
            }

            function confirmApproval() {
                if (selectedIncomingId) {
                    return confirm(`${selectedIncomingId} 입고요청을 승인하겠습니까?`);
                }
                return false;
            }
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
