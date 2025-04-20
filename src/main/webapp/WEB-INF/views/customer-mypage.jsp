<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.ssg.martgowmsfullstack.domain.UserVO" %>
<%
	UserVO user = (UserVO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>MartGo - 거래처 마이페이지</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
	<style>
		body {
			margin: 0;
			font-family: 'Inter', sans-serif;
			background-color: #f6f6f6;
			display: flex;
			flex-direction: column;
			min-height: 100vh;
		}

		header {
			background-color: #f8f9fa;
			padding: 1rem 2rem;
			display: flex;
			justify-content: space-between;
			align-items: center;
			box-shadow: 0 2px 4px rgba(0,0,0,0.05);
		}

		.logo a {
			text-decoration: none;
			font-size: 1.3rem;
			font-weight: 700;
			color: #333;
		}

		.auth-links a {
			margin-left: 1rem;
			text-decoration: none;
			color: #0d6efd;
			font-weight: 500;
		}

		.container {
			width: 450px;
			background-color: white;
			border-radius: 12px;
			padding: 2rem;
			box-shadow: 0 8px 20px rgba(0,0,0,0.05);
			margin: 2rem auto;
		}

		h2 {
			text-align: center;
			margin-bottom: 1rem;
		}
		label {
			display: block;
			margin-top: 1rem;
			font-weight: 600;
		}
		input {
			width: 100%;
			padding: 10px;
			border: 1px solid #ddd;
			border-radius: 6px;
			margin-top: 5px;
		}
		.btn-wrap {
			display: flex;
			justify-content: space-between;
			margin-top: 2rem;
		}
		.btn-wrap a, .btn-wrap button {
			padding: 10px 20px;
			border: none;
			border-radius: 6px;
			font-weight: 600;
			cursor: pointer;
		}
		.btn-edit {
			background-color: #0d6efd;
			color: white;
			text-decoration: none;
		}
		.btn-delete {
			background-color: #dc3545;
			color: white;
		}
		.confirm-modal {
			position: fixed;
			top: 0; left: 0;
			width: 100%; height: 100%;
			background: rgba(0,0,0,0.4);
			display: none;
			justify-content: center;
			align-items: center;
		}
		.confirm-box {
			background: white;
			padding: 2rem;
			border-radius: 12px;
			text-align: center;
		}
		.confirm-box p {
			margin-bottom: 1rem;
			font-weight: 600;
		}
		.confirm-box button {
			padding: 8px 18px;
			margin: 0 10px;
			border-radius: 6px;
			border: none;
			font-weight: bold;
			cursor: pointer;
		}
		.btn-confirm {
			background-color: #dc3545;
			color: white;
		}
		.btn-cancel {
			background-color: #6c757d;
			color: white;
		}
	</style>
</head>
<body>

<!-- ✅ 상단 헤더 -->
<header>
	<div class="logo">
		<a href="${pageContext.request.contextPath}/customer">MartGo</a>
	</div>
	<div class="auth-links">
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</div>
</header>

<!-- ✅ 마이페이지 본문 -->
<div class="container">
	<h2>거래처 마이페이지</h2>

	<form>
		<label>아이디</label>
		<input type="text" value="<%= user.getUserid() %>" readonly />

		<label>이름</label>
		<input type="text" value="<%= user.getUsername() %>" readonly />

		<label>이메일</label>
		<input type="email" value="<%= user.getEmail() %>" readonly />

		<label>전화번호</label>
		<input type="text" value="<%= user.getPhone() %>" readonly />

		<label>주소</label>
		<input type="text" value="<%= user.getAddress() %>" readonly />

		<label>담당 창고 관리자 ID</label>
		<input type="text" value="<%= user.getAdminid() != null ? user.getAdminid() : "없음" %>" readonly />

		<div class="btn-wrap">
			<a href="${pageContext.request.contextPath}/customer/edit" class="btn-edit">정보 수정</a>
			<button type="button" class="btn-delete" onclick="document.querySelector('.confirm-modal').style.display='flex'">회원 탈퇴</button>
		</div>
	</form>
</div>

<!-- 탈퇴 확인 모달 -->
<div class="confirm-modal">
	<div class="confirm-box">
		<p>정말 탈퇴하시겠습니까?</p>
		<button class="btn-confirm" onclick="location.href='${pageContext.request.contextPath}/customer/delete'">확인</button>
		<button class="btn-cancel" onclick="document.querySelector('.confirm-modal').style.display='none'">취소</button>
	</div>
</div>

</body>
</html>
