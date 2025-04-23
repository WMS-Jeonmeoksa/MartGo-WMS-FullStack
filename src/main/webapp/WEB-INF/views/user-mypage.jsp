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
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/user.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/user_mypage.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/margoLogo.css">
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
                <li class="sidebar-item active">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/user/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/rent/warehouse">
                        <i class="align-middle" data-feather="box"></i> <span class="align-middle">임대 신청</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- 메인 영역 -->
    <div class="main">
        <!-- 상단바 -->
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle js-sidebar-toggle"><i class="hamburger align-self-center"></i></a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user/mypage">
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

        <!-- ✅ 푸터 밀어내기 위한 wrapper 추가 -->
        <div class="content-wrapper">
            <div class="container">
                <h2>회원 마이페이지</h2>
                <div class="info-group">
                    <div class="info-item"><strong>아이디</strong><div class="info-value"><%= user.getUserid() %></div></div>
                    <div class="info-item"><strong>이름</strong><div class="info-value"><%= user.getUsername() %></div></div>
                    <div class="info-item"><strong>이메일</strong><div class="info-value"><%= user.getEmail() != null ? user.getEmail() : "없음" %></div></div>
                    <div class="info-item"><strong>전화번호</strong><div class="info-value"><%= user.getPhone() %></div></div>
                    <div class="info-item"><strong>주소</strong><div class="info-value"><%= user.getAddress() %></div></div>
                    <div class="info-item"><strong>권한</strong><div class="info-value"><%= user.getRole() %></div></div>
                    <div class="info-item"><strong>담당 창고 관리자ID</strong>
                        <div class="info-value" style="color:#1e90ff; font-weight:bold;">
                            <%= user.getAdminid() != null ? user.getAdminid() : "없음" %>
                        </div>
                    </div>
                </div>
                <button class="delete-account-btn" onclick="openDeleteModal()">
                    <i class="fas fa-user-minus"></i> 회원 탈퇴
                </button>
            </div>
        </div>

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
    </div> <!-- .main -->
</div> <!-- .wrapper -->

<!-- 모달 및 탈퇴 스크립트 -->
<div id="deleteAccountModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3>회원 탈퇴</h3>
            <span class="close-btn" onclick="closeDeleteModal()">&times;</span>
        </div>
        <div class="modal-body">
            <p><strong>정말로 탈퇴하시겠습니까?</strong></p>
            <p>탈퇴 시 모든 회원 정보와 활동 내역이 삭제되며, 이 작업은 되돌릴 수 없습니다.</p>
        </div>
        <div class="modal-footer">
            <button class="cancel-btn" onclick="closeDeleteModal()">취소</button>
            <button class="confirm-btn" onclick="deleteAccount()">탈퇴하기</button>
        </div>
    </div>
</div>

<script>
    function openDeleteModal() {
        document.getElementById("deleteAccountModal").style.display = "flex";
    }
    function closeDeleteModal() {
        document.getElementById("deleteAccountModal").style.display = "none";
    }
    function deleteAccount() {
        closeDeleteModal();
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/user/delete", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = xhr.responseText.trim();
                if (response === "success") {
                    alert("회원 탈퇴가 완료되었습니다.");
                    window.location.href = "${pageContext.request.contextPath}/login";
                } else {
                    alert("오류 발생: " + response);
                }
            }
        };
        xhr.send();
    }
    window.onclick = function (e) {
        if (e.target === document.getElementById("deleteAccountModal")) {
            closeDeleteModal();
        }
    };
    window.addEventListener("keydown", function (e) {
        if (e.key === "Escape") closeDeleteModal();
    });
</script>
</body>
</html>
