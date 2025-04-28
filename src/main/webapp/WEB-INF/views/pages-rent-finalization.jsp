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
    <title>MartGo - 임대 최종 승인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/app.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_mypage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    <link rel="stylesheet" href="/css/margoLogo.css">
    <link rel="stylesheet" href="/css/rent_approve.css">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/dashboard/superadmin">
                <img src="/img/MartGo_Logo.png" alt="a">
            </a>
            <form id="AdminDashBoardForm" action="${pageContext.request.contextPath}/dashboard/superadmin/" method="post" style="display: none;"></form>
            <ul class="sidebar-nav">
                <li class="sidebar-header">창고관리자 메뉴</li>


                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/superadmin/">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/superadmin/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item open">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="clock"></i> 대기중</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li class="sidebar-item active"><a class="sidebar-link" href="${pageContext.request.contextPath}/rent/finalization">임대 신청 목록</a></li>
                        <li><a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/finalization">입고 신청 목록</a></li>
                        <li><a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/finalization">출고 신청 목록</a></li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link submenu-toggle" href="#">
                        <span><i class="align-middle" data-feather="package"></i> 담당 창고</span>
                        <i class="fas fa-chevron-down submenu-icon"></i>
                    </a>
                    <ul class="sidebar-submenu">
                        <li class="sidebar-item">
                            <a class="sidebar-link" href="/stock/superadmin/">
                                <i class="align-middle" data-feather="list"></i>
                                <span class="align-middle">재고 목록</span>
                            </a>
                        </li>
                        <li>
                            <a class="sidebar-link" href="/stock_history/superadmin">
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/superadmin/mypage">
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

        <form id="approveForm" action="/rent/finalization" method="post">
            <input type="hidden" name="rentNum" id="rentNumInput" />

            <div class="rent-container">
                <div class="header">
                    <h1 class="rent-h1">임대 승인</h1>
                </div>

                <div class="section-header">
                    <h3 class="rent-h3">임대 신청 목록</h3>
                </div>

                <table class="rent_table">
                    <thead>
                    <tr>
                        <th>임대 번호</th>
                        <th>섹터 ID</th>
                        <th>창고 ID</th>
                        <th>회원 ID</th>
                        <th>임대 시작일</th>
                        <th>임대 종료일</th>
                        <th>임대료</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="rentHistory" items="${pagedList.pageList}">
                        <tr onclick="selectRent(this, '${rentHistory.rentNum}')">
                            <td>${rentHistory.rentNum}</td>
                            <td>${rentHistory.sectorId}</td>
                            <td>${rentHistory.warehouseId}</td>
                            <td>${rentHistory.userId}</td>
                            <td><fmt:formatDate value="${rentHistory.rentStartDate}" pattern="yyyy-MM-dd"/></td>
                            <td><fmt:formatDate value="${rentHistory.rentEndDate}" pattern="yyyy-MM-dd"/></td>
                            <td>${rentHistory.rentPrice}</td>
                            <td>${rentHistory.status}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="pagination">
                    <c:if test="${!pagedList.firstPage}">
                        <a href="?page=${pagedList.page}&size=${pagedList.pageSize}">이전</a>
                    </c:if>

                    <c:forEach begin="1" end="${pagedList.pageCount}" var="i">
                        <a href="?page=${i}&size=${pagedList.pageSize}"
                           class="${(pagedList.page + 1) == i ? 'current' : ''}">
                                ${i}
                        </a>
                    </c:forEach>

                    <c:if test="${!pagedList.lastPage}">
                        <a href="?page=${pagedList.page + 2}&size=${pagedList.pageSize}">다음</a>
                    </c:if>
                </div>

                <div class="button-group-full">
                    <button type="button" class="rent_btn btn-back" onclick="window.location.href='/dashboard/superadmin'">
                        <i class="fas fa-arrow-left"></i> 홈으로
                    </button>
                    <button type="submit" class="rent_btn btn-next" id="approveBtn" disabled onclick="return confirmApproval()">
                        승인 <i class="fas fa-check"></i>
                    </button>
                </div>
            </div>
        </form>

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
    </div> <!-- /.main -->
</div> <!-- /.wrapper -->
<script src="https://unpkg.com/feather-icons"></script>

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

    let selectedRentId = null;
    function selectRent(row, rentNum) {
        document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
        row.classList.add('selected');
        selectedRentId = rentNum;
        document.getElementById("rentNumInput").value = rentNum;
        document.getElementById('approveBtn').disabled = false;

        window.scrollTo({
            top: document.body.scrollHeight,
            behavior: 'smooth'
        });

    }
    function confirmApproval() {
        return selectedRentId
            ? confirm(`${selectedRentId} 임대요청을 승인하겠습니까?`)
            : false;
    }
</script>



</body>
</html>
