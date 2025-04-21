<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>MartGo - 가전 창고 플랫폼</title>
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background-color: #f8f9fa;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .logo {
            font-size: 1.5rem;
            font-weight: 700;
            color: #333;
        }
        .auth-links a {
            margin-left: 1rem;
            text-decoration: none;
            color: #0d6efd;
            font-weight: 500;
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
            font-weight: 600;
        }
        .main-content p {
            font-size: 1.2rem;
            color: #555;
            line-height: 1.6;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">MartGo</div>
    <div class="auth-links">
        <a href="${pageContext.request.contextPath}/login">로그인</a>
        <a href="${pageContext.request.contextPath}/register">회원가입</a>
    </div>
</header>

<div class="main-content">
    <div>
        <h1>가전제품 창고 보관 플랫폼</h1>
        <p>안전하게 보관하세요.<br>
            온라인으로 간편하게 창고를 임대하고,<br>
            관리할 수 있습니다.</p>
    </div>
</div>

</body>
</html>
