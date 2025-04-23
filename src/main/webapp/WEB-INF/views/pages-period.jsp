<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%
    UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <title>MartGo - 창고 임대 신청</title>
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/period.css" rel="stylesheet">
    <link href="/css/margoLogo.css" rel="stylesheet">


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
                <img src="/img/MartGo_Logo.png" alt="a">
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
                <div class="step active">1<div class="step-label">창고 선택</div></div>
                <div class="step active">2<div class="step-label">섹터 선택</div></div>
                <div class="step active">3<div class="step-label">가격/기간 선택</div></div>
                <div class="step">4<div class="step-label">신청 완료</div></div>
            </div>

            <div class="summary-box">
                <h2>선택한 창고 및 섹터 정보</h2>
                <p><strong>창고:</strong> ${warehouseName} (ID: ${warehouseId})</p>
                <p><strong>섹터:</strong> ${sectorId}</p>
            </div>

            <h2>임대 가격표</h2>
            <p>원하시는 기간을 선택해주세요</p>
            <table>
                <thead>
                <tr>
                    <th>번호</th><th>기간</th><th>총 임대료</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="info" items="${costInfo}" varStatus="loop">
                    <tr onclick="selectPrice(this, '${info.period}', '${info.price}')">
                        <td>${loop.count}</td>
                        <td>${info.period}</td>
                        <td><fmt:formatNumber value="${info.price}" type="number" groupingUsed="true"/>원</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

            <div id="calendarSection" class="calendar-section">
                <h2>임대 시작일 선택</h2>
                <input type="date" id="startDate" class="date-picker">
                <div class="final-summary">
                    <h2>선택 요약</h2>
                    <p><strong>기간:</strong> <span id="selectedPeriod">-</span></p>
                    <p><strong>시작일:</strong> <span id="selectedStartDate">-</span></p>
                    <p><strong>종료일:</strong> <span id="selectedEndDate">-</span></p>
                    <p><strong>총 임대료:</strong> <span id="totalPrice">-</span></p>
                </div>
            </div>

            <input type="hidden" id="hiddenWarehouseId"   value="${warehouseId}" />
            <input type="hidden" id="hiddenWarehouseName" value="${warehouseName}" />
            <input type="hidden" id="hiddenSectorId"      value="${sectorId}" />

            <div class="button-group">
                <button class="btn btn-back" onclick="goToPreviousPage()">← 이전</button>
                <button class="btn btn-next" id="nextBtn" disabled onclick="goToNextPage()">다음 →</button>
            </div>
        </div>

        <script>
            // 최소 선택일 오늘 날짜로 설정
            document.getElementById('startDate').min = new Date().toISOString().slice(0, 10);

            let selectedPeriodMonths = 0;
            let selectedPriceTotal = 0;
            let calculatedEndDate = "";
            let calculatedMonth = 0;

            function selectPrice(row, periodStr, priceStr) {
                console.log('selectPrice:', periodStr, priceStr);

                // 값 설정
                selectedPeriodMonths = parseInt(periodStr, 10);
                selectedPriceTotal = parseInt(priceStr.replace(/,/g, ''), 10);

                // UI 강조 표시
                document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
                row.classList.add('selected');

                // 달력 섹션 보여주기 + 요약 갱신
                document.getElementById('calendarSection').classList.add('show');
                updateSummary();
                checkNextButton();
            }

            // 시작일 변경 시 요약 다시 계산
            document.getElementById('startDate').addEventListener('change', () => {
                updateSummary();
                checkNextButton();
            });

            function updateSummary() {
                const start = document.getElementById('startDate').value;
                if (!start || selectedPeriodMonths === 0 || selectedPriceTotal === 0) return;

                const sd = new Date(start);
                const ed = new Date(sd);
                ed.setMonth(ed.getMonth() + selectedPeriodMonths);
                ed.setDate(ed.getDate() - 1); // 종료일: 마지막 날

                // 계산 결과 전역에 저장
                calculatedEndDate = ed.toISOString().slice(0, 10);
                calculatedMonth = Math.floor(selectedPriceTotal / selectedPeriodMonths);

                // 화면에 출력
                document.getElementById('selectedPeriod').innerText = selectedPeriodMonths + "개월";
                document.getElementById('selectedStartDate').innerText = start;
                document.getElementById('selectedEndDate').innerText = calculatedEndDate;
                document.getElementById('totalPrice').innerText = calculatedMonth.toLocaleString() + '원';
            }

            function checkNextButton() {
                const valid = selectedPeriodMonths > 0 && document.getElementById('startDate').value;
                document.getElementById('nextBtn').disabled = !valid;
            }

            function goToPreviousPage() {
                const qs = new URLSearchParams({
                    warehouseId: document.getElementById('hiddenWarehouseId').value,
                    warehouseName: document.getElementById('hiddenWarehouseName').value,
                });
                window.location.href = '/rent/sector?' + qs;
            }

            function goToNextPage() {
                const qs = new URLSearchParams({
                    warehouseId: document.getElementById('hiddenWarehouseId').value,
                    warehouseName: document.getElementById('hiddenWarehouseName').value,
                    sectorId: document.getElementById('hiddenSectorId').value,
                    month: selectedPeriodMonths,
                    rentStartDate: document.getElementById('startDate').value,
                    rentEndDate: calculatedEndDate,
                    monthly: calculatedMonth,
                    rentPrice: selectedPriceTotal
                });
                window.location.href = '/rent/last?' + qs;
            }
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
