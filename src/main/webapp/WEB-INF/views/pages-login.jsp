<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<title>MartGo WMS - 로그인</title>
	<link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/margoLogo.css">
</head>
<body>

<!-- ✅ 상단 로고 추가 -->
<div class="header">
	<div class="logo">
		<a href="guest"><img src="/img/MartGo_Logo_Black.png" alt="a"></a>
	</div>
</div>

<div class="login-container">
	<h2>MartGo 로그인</h2>

	<form action="${pageContext.request.contextPath}/login" method="post">
		<input type="text" name="userid" placeholder="아이디" required />
		<input type="password" name="password" placeholder="비밀번호" required />
		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<button type="submit">로그인</button>
	</form>

	<div class="link">
		<a href="${pageContext.request.contextPath}/register">회원가입</a>
	</div>
</div>

<c:if test="${param.joined eq 'true'}">
	<script>
		alert("회원가입이 완료되었습니다.");
	</script>
</c:if>

</body>
</html>
