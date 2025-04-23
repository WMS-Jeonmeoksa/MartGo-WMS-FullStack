<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>

<%
    UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo - 회원 전용 페이지</title>
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/sector.css" rel="stylesheet">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="/js/app.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/user">
                <span class="align-middle">MartGo</span>
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">회원 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/user">
                        <i class="align-middle" data-feather="home"></i> <span class="align-middle">홈</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/user/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/rent/warehouse">
                        <i class="align-middle" data-feather="box"></i> <span class="align-middle">임대 신청</span>
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
                        <span class="nav-link"><i class="fas fa-user-circle"></i> <%= user.getUsername() %>님</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i> 로그아웃
                        </a>
                    </li>
                </ul>
            </div>
        </nav>


        <div class="container">
            <h1>창고 임대 신청</h1>

            <div class="progress-bar">
                <div class="step active">
                    1
                    <div class="step-label">창고 선택</div>
                </div>
                <div class="step active">
                    2
                    <div class="step-label">섹터 선택</div>
                </div>
                <div class="step">
                    3
                    <div class="step-label">가격/기간 선택</div>
                </div>
                <div class="step">
                    4
                    <div class="step-label">신청 완료</div>
                </div>
            </div>

            <div class="section-header">
                <h3><i class="fas fa-th-large"></i> 선택한 창고 정보</h3>
            </div>
            <div class="summary-box">
                <div><strong>창고 ID:</strong> ${warehouseId}</div>
                <div><strong>창고 이름:</strong>
                    <c:out value="${warehouseName}" default="-"/>
                </div>
            </div>


            <!-- 섹터 목록 -->
            <div class="section-header">
                <h3><i class="fas fa-layer-group"></i> 섹터 목록</h3>
            </div>
            <table id="sector-table">
                <thead>
                <tr>
                    <th>섹터 ID</th>
                    <th>크기 (㎡)</th>
                    <th>용적률</th>
                    <th>상태</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="sec" items="${sectors}" varStatus="loop">
                    <tr onclick="selectSector('${sec.sectorId}', this)">
                        <td>${sec.sectorId}</td>
                        <td>${sec.height * sec.width}㎡</td>
                        <td>${sec.FAR}</td>
                        <td>${sec.status}</td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>

            <div class="button-group">
                <button class="btn btn-back" id="prev-btn">
                    ← 이전
                </button>
                <button class="btn btn-next" id="next-btn" disabled>
                    다음 →
                </button>
            </div>
        </div>

<script>
    // 테이블 행 클릭 시
    function selectSector(sectorId, row) {
        // 선택 표시
        document.querySelectorAll('#sector-table tbody tr').forEach(tr => tr.classList.remove('selected'));
        row.classList.add('selected');

        // 세션에 저장
        sessionStorage.setItem('selectedSectorId', sectorId);

        // 다음 버튼 활성화
        document.getElementById('next-btn').disabled = false;
    }

    // 이전 버튼
    document.getElementById('prev-btn').addEventListener('click', () => {
        // 창고 선택 페이지로 돌아가기
        window.location.href = '/rent/warehouse';
    });

    // 다음 버튼: 선택한 창고·섹터를 쿼리스트링으로 넘겨요
    document.getElementById('next-btn').addEventListener('click', () => {
        const sectorId = sessionStorage.getItem('selectedSectorId');
        const params = new URLSearchParams({
            warehouseId: sessionStorage.getItem('selectedWarehouseId'),  // ← 이 이름이 컨트롤러와 동일해야 함
            warehouseName: sessionStorage.getItem('selectedWarehouseName'),
            sectorId
        });
        window.location.href = '/rent/period?' + params.toString();
    });
</script>
        <!-- 푸터 -->
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
