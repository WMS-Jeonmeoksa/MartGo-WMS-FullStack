<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%
	UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"/>
	<title>MartGo</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/customer.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/margoLogo.css">
	<link rel="stylesheet" href="/css/incoming_detail.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<script src="${pageContext.request.contextPath}/js/app.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
	<!-- 사이드바 -->
	<nav id="sidebar" class="sidebar js-sidebar">
		<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="${pageContext.request.contextPath}/dashboard/user">
				<img src="/img/MartGo_Logo.png" alt="MartGo_Logo">
			</a>
			<ul class="sidebar-nav">
				<li class="sidebar-header">거래처 메뉴</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="/dashboard/user">
						<i class="align-middle" data-feather="list"></i>
						<span class="align-middle">대시 보드</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/customer/mypage">
						<i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/product/register">
						<i class="align-middle" data-feather="plus-square"></i> <span class="align-middle">제품 등록</span>
					</a>
				</li>

				<li class="sidebar-item active">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/select">
						<i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/select">
						<i class="align-middle" data-feather="log-out"></i> <span class="align-middle">출고 요청</span>
					</a>
				</li>

				<form id="stockForm" action="${pageContext.request.contextPath}/stock/user" method="post"
					  style="display: none;">
				</form>

				<li class="sidebar-item">
					<a class="sidebar-link" href="#"
					   onclick="document.getElementById('stockForm').submit(); return false;">
						<i class="align-middle" data-feather="list"></i> <span class="align-middle">재고 조회</span>
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
						<a class="nav-link" href="${pageContext.request.contextPath}/customer/mypage">
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



		<form action="/incoming/confirm" method="post">
			<!-- 컨테이너 전체 form 안에 들어감 -->
			<div class="incoming-container">
				<div class="header">
					<h1 class="incoming-h1">
						<i class="fas fa-box-open"></i> 입고 신청
					</h1>
				</div>

				<div class="steps-container">
					<div class="progress-bar">
						<div class="step active">1<div class="step-label">제품 선택</div></div>
						<div class="step active">2<div class="step-label">세부 정보 입력</div></div>
						<div class="step">3<div class="step-label">신청 내역 확인</div></div>
					</div>
				</div>

				<div class="selected-product">
					<strong>선택한 제품:</strong> <span>${param.productId} 제품</span>
				</div>

				<!-- ✅ 이전 단계에서 전달받은 productId 유지 -->
				<input type="hidden" name="productId" value="${param.productId}" />

				<div class="incoming-form-group">
					<label for="count">
						<i class="fas fa-hashtag"></i></i>&nbsp;입고 수량
					</label>
					<input type="number" name="count" id="count" placeholder="입고할 수량을 입력하세요" min="1" required>
				</div>

				<div class="incoming-form-group">
					<label for="incomingDate">
						<i class="fas fa-calendar-alt"></i>&nbsp;입고 희망일
					</label>
					<input type="date" name="incomingDate" id="incomingDate" required>
				</div>

				<div class="button-group-full">
					<button type="button" class="incoming_btn btn-back" onclick="history.back()">
						<i class="fas fa-arrow-left"></i> 이전
					</button>
					<button type="submit" class="incoming_btn btn-next">
						다음 <i class="fas fa-arrow-right"></i>
					</button>
				</div>
			</div>
		</form>

		<script>
			const today = new Date();
			document.getElementById("incomingDate").min = today.toISOString().split("T")[0];
		</script>



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
</body>
</html>