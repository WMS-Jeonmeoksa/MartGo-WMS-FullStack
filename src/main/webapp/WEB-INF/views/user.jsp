<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.domain.UserVO" %>
<%
    UserVO user = (UserVO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MartGo - 회원 페이지</title>
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            display: flex;
            margin: 0;
            height: 100vh;
            font-family: 'Inter', sans-serif;
        }
        aside {
            width: 220px;
            background-color: #343a40;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 2rem 1rem;
        }
        aside h2 {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            text-align: center;
        }
        aside a {
            color: white;
            text-decoration: none;
            margin: 0.5rem 0;
            font-weight: 500;
            display: block;
            padding: 0.5rem 1rem;
            border-radius: 4px;
        }
        aside a:hover {
            background-color: #495057;
        }

        main {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #f8f9fa;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .main-content {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 2rem;
        }

        .main-content h1 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .main-content p {
            font-size: 1.1rem;
            color: #555;
        }
    </style>
</head>
<body>

<aside>
    <h2>회원 메뉴</h2>
    <a href="#">대시보드</a>
    <a href="#">내 창고 현황</a>
    <a href="#">예약 신청</a>
    <a href="#">문의 내역</a>
</aside>

<main>
    <header>
        <div class="logo"><a href="${pageContext.request.contextPath}/user"><strong>MartGo</strong></a></div>
        <div class="auth-links">
            <%= user.getUsername() %>님 |
            <a href="${pageContext.request.contextPath}/user/mypage">마이페이지</a> |
            <a href="${pageContext.request.contextPath}/logout">로그아웃</a>
        </div>
    </header>

    <div class="main-content">
        <div>
            <h1><%= user.getUsername() %>님, 환영합니다!</h1>
            <p>
                MartGo 회원 전용 페이지입니다.<br>
                왼쪽 메뉴를 통해 창고 현황 및 예약 기능을 이용할 수 있어요!
            </p>
        </div>
    </div>
</main>

</body>
</html>
