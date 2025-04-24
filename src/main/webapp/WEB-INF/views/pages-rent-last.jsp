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
    <link href="/css/last.css" rel="stylesheet">
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
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/mypage">
                        <span class="nav-link"><i class="fas fa-user-circle"></i> <%= user.getUsername() %>님</span>
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
                <div class="step active">
                    3
                    <div class="step-label">가격/기간 선택</div>
                </div>
                <div class="step active">
                    4
                    <div class="step-label">신청 완료</div>
                </div>
            </div>

            <h2>임대 신청 확인</h2>
            <p>아래 정보를 확인하신 후 임대 신청 버튼을 클릭해주세요.</p>

            <div class="summary-box">
                <table class="summary-table">
                    <tr><th>창고</th><td>${rentSelectDTO.warehouseName}</td></tr>
                    <tr><th>섹터</th><td>${rentSelectDTO.sectorId}</td></tr>
                    <tr><th>기간</th><td>${rentSelectDTO.month}개월</td></tr>
                    <tr><th>시작일</th><td>${rentSelectDTO.rentStartDate}</td></tr>
                    <tr><th>종료일</th><td>${rentSelectDTO.rentEndDate}</td></tr>
                    <tr><th>월 임대료</th>
                        <td><fmt:formatNumber value="${rentSelectDTO.monthly}" type="number" groupingUsed="true"/>원</td>
                    </tr>
                    <tr><th>총 임대료</th>
                        <td><fmt:formatNumber value="${rentSelectDTO.rentPrice}" type="number" groupingUsed="true"/>원</td>
                    </tr>
                </table>
            </div>

            <h2>이용약관</h2>
            <div class="terms-box">
                <p>제1조 (목적) 본 약관은 창고 임대 서비스를 제공하는 회사와 이용 고객 간의 권리와 의무를 규정함을 목적으로 합니다.</p>
                <p>제2조 (정의) "임대인"은 서비스를 제공하는 자, "임차인"은 사용하는 자를 말합니다.</p>
                <p>제3조 (지불) 임대료는 매월 선불이며 지연 시 연체료가 발생할 수 있습니다.</p>
                <p>제4조 (이용) 임차인은 계약 목적에 맞게 공간을 사용해야 합니다.</p>
            </div>

            <div class="checkbox-container">
                <input type="checkbox" id="termsAgree" onchange="checkSubmitState()">
                <label for="termsAgree">(필수) 이용약관에 동의합니다.</label>
            </div>
            <div class="checkbox-container">
                <input type="checkbox" id="infoAgree" onchange="checkSubmitState()">
                <label for="infoAgree">(필수) 입력 정보가 정확함을 확인했습니다.</label>
            </div>
            <div class="button-group">
                <button class="btn btn-back" onclick="goToPreviousPage()">
                    ← 이전
                </button>
                <button class="btn btn-submit" id="submitBtn" disabled onclick="submitApplication()">
                    임대 신청
                </button>
            </div>

        </div>
        <script>
            // 모달 확인 버튼 핸들러: 바로 폼 제출
            function goToMainPage() {
                document.getElementById("rentForm").submit();
            }
        </script>

        <form id="rentForm" action="/rent/last" method="post">
            <input type="hidden" name="warehouseId"   value="${rentSelectDTO.warehouseId}" />
            <input type="hidden" name="sectorId"      value="${rentSelectDTO.sectorId}" />
            <input type="hidden" name="rentStartDate" value="${rentSelectDTO.rentStartDate}" />
            <input type="hidden" name="rentEndDate"   value="${rentSelectDTO.rentEndDate}" />
            <input type="hidden" name="rentPrice"     value="${rentSelectDTO.rentPrice}" />

            <div class="modal-overlay" id="confirmationModal" style="display:none;">
                <div class="modal">
                    <h2>임대 신청 완료</h2>
                    <p>신청이 정상적으로 접수되었습니다.<br>관리자가 확인 후 승인 절차가 진행됩니다.</p>
                    <button class="modal-btn" type="button" onclick="goToMainPage()">확인</button>
                </div>
            </div>
        </form>


        <script>
            function checkSubmitState() {
                const terms = document.getElementById('termsAgree')?.checked;
                const info  = document.getElementById('infoAgree')?.checked;
                document.getElementById('submitBtn').disabled = !(terms && info);
            }

            function goToPreviousPage() {
                const qs = new URLSearchParams({
                    warehouseId: document.getElementById('hiddenWarehouseId').value,
                    warehouseName: document.getElementById('hiddenWarehouseName').value,
                    sectorId: document.getElementById('hiddenSectorId').value
                });
                window.location.href = '/rent/period?' + qs;
            }

            function submitApplication() {
                document.getElementById('confirmationModal').style.display = 'flex';
            }
        </script>
        <input type="hidden" id="hiddenWarehouseId"   value="${rentSelectDTO.warehouseId}" />
        <input type="hidden" id="hiddenWarehouseName" value="${rentSelectDTO.warehouseName}" />
        <input type="hidden" id="hiddenSectorId"      value="${rentSelectDTO.sectorId}" />
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
