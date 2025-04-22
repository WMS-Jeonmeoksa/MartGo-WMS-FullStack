<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%
    UserDTO user = (UserDTO) session.getAttribute("loginInfo");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MartGo - 회원 마이페이지</title>
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/user_mypage.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

</head>
<body>

<header>
    <div class="logo">
        <a href="${pageContext.request.contextPath}/user">MartGo</a>
    </div>
    <div class="auth-links">
        <span><%= user.getUsername() %>님</span>
        <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
    </div>
</header>

<div class="container">
    <h2>회원 마이페이지</h2>

    <div class="info-group">
        <div class="info-item">
            <strong>아이디</strong>
            <div class="info-value"><%= user.getUserid() %></div>
        </div>
        <div class="info-item">
            <strong>이름</strong>
            <div class="info-value"><%= user.getUsername() %></div>
        </div>
        <div class="info-item">
            <strong>이메일</strong>
            <div class="info-value"><%= user.getEmail() != null ? user.getEmail() : "없음" %></div>
        </div>
        <div class="info-item">
            <strong>전화번호</strong>
            <div class="info-value"><%= user.getPhone() %></div>
        </div>
        <div class="info-item">
            <strong>주소</strong>
            <div class="info-value"><%= user.getAddress() %></div>
        </div>
        <div class="info-item">
            <strong>권한</strong>
            <div class="info-value"><%= user.getRole() %></div>
        </div>
        <div class="info-item">
            <strong style="color: #495057;">담당 창고 관리자ID</strong>
            <div class="info-value" style="color: #1e90ff; font-weight: bold;">
                <%= user.getAdminid() != null ? user.getAdminid() : "없음" %>
            </div>
        </div>
    </div>

    <div class="btn-wrap">
        <button class="btn-delete" onclick="document.querySelector('.confirm-modal').style.display='flex'">회원 탈퇴</button>
    </div>

    <!-- 모달 안의 버튼은 form + POST 방식 -->
    <div class="confirm-modal">
        <div class="confirm-box">
            <p>정말 탈퇴하시겠습니까?</p>
            <form action="${pageContext.request.contextPath}/user/delete" method="post">
                <button class="btn-confirm" type="submit">확인</button>
                <button class="btn-cancel" type="button" onclick="document.querySelector('.confirm-modal').style.display='none'">취소</button>
            </form>
        </div>
    </div>
</div>

<!-- 탈퇴 확인 모달 -->
<div class="confirm-modal">
    <div class="confirm-box">
        <p>정말 탈퇴하시겠습니까?</p>
        <button class="btn-confirm" onclick="location.href='${pageContext.request.contextPath}/user/delete'">확인</button>
        <button class="btn-cancel" onclick="document.querySelector('.confirm-modal').style.display='none'">취소</button>
    </div>
</div>

</body>
</html>
