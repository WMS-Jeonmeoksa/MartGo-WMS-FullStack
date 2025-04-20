<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<main class="d-flex w-100">
	<div class="container d-flex flex-column">
		<div class="row vh-100">
			<div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 mx-auto d-table h-100">
				<div class="d-table-cell align-middle">

					<div class="text-center mt-4">
						<h1 class="h2">회원가입</h1>
						<p class="lead">계정을 생성하고 시작해보세요!</p>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="m-sm-3">
								<form action="${pageContext.request.contextPath}/register" method="post">
									<div class="mb-3">
										<label class="form-label">아이디</label>
										<input class="form-control form-control-lg" type="text" name="userid" id="userid" placeholder="아이디를 입력하세요" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">이름</label>
										<input class="form-control form-control-lg" type="text" name="username" id="username" placeholder="이름을 입력하세요" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">비밀번호</label>
										<input class="form-control form-control-lg" type="password" name="password" id="password" placeholder="비밀번호를 입력하세요" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">비밀번호 확인</label>
										<input class="form-control form-control-lg" type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호를 다시 입력하세요" required/>
									</div>
									
									<div class="mb-3">
										<label class="form-label">전화번호</label>
										<input class="form-control form-control-lg" type="tel" name="phone" id="phone" placeholder="전화번호를 입력하세요" />
									</div>

									<div class="mb-3">
										<label class="form-label">이메일</label>
										<input class="form-control form-control-lg" type="email" name="email" id="email" placeholder="이메일을 입력하세요" />
									</div>

									<div class="mb-3">
										<label class="form-label">주소</label>
										<input class="form-control form-control-lg" type="text" name="address" id="address" placeholder="주소를 입력하세요" />
									</div>


									<c:if test="${not empty error}">
										<div class="alert alert-danger">${error}</div>
									</c:if>

									<div class="d-grid gap-2 mt-3">
										<button type="submit" class="btn btn-lg btn-primary">회원가입</button>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="text-center mb-3">
						이미 계정이 있으신가요? <a href="${pageContext.request.contextPath}/login">로그인</a>
					</div>

				</div>
			</div>
		</div>
	</div>
</main>

<script src="${pageContext.request.contextPath}/js/app.js"></script>
</body>
</html>
