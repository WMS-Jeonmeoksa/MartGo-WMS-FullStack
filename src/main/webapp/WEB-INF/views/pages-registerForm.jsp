<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/registerForm.css" rel="stylesheet">
	<link rel="stylesheet" href="/css/margoLogo.css">
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

</head>
<body>

<!-- ✅ 상단 로고 추가 -->
<div class="header">
	<div class="logo">
		<a href="guest"><img src="/img/MartGo_Logo_Black.png" alt="a"></a>
	</div>
</div>

<main class="d-flex w-100">
	<div class="container d-flex flex-column">
		<div class="row vh-100">
			<div class="col-sm-10 col-md-8 col-lg-6 col-xl-5 mx-auto d-table h-100">
				<div class="d-table-cell align-middle">

					<div class="text-center mt-4">
						<h1 class="h2">회원가입</h1>
						<p class="lead">계정을 생성하고 시작해보세요!</p>
						<p class="text-muted" style="font-size: 0.9rem;"> <span style="color: red;">*</span> : 필수 작성 항목입니다.</p>
					</div>

					<div class="card">
						<div class="card-body">
							<div class="m-sm-3">
								<form action="${pageContext.request.contextPath}/register" method="post" onsubmit="return validateForm()">
									<div class="mb-3">
										<label class="form-label">아이디<span style="color: red;">*</span></label>
										<input class="form-control form-control-lg" type="text" name="userid" id="userid" placeholder="아이디를 입력하세요 (영문 시작, 영문/숫자 4자 이상)" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">이름<span style="color: red;">*</span></label>
										<input class="form-control form-control-lg" type="text" name="username" id="username" placeholder="이름을 입력하세요 (한글)" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">비밀번호<span style="color: red;">*</span></label>
										<input class="form-control form-control-lg" type="password" name="password" id="password" placeholder="비밀번호를 입력하세요 (4자 이상)" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">비밀번호 확인<span style="color: red;">*</span></label>
										<input class="form-control form-control-lg" type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호를 다시 입력하세요" required/>
									</div>

									<div class="mb-3">
										<label class="form-label">전화번호<span style="color: red;">*</span></label>
										<div style="display: flex; gap: 10px;">
											<!-- 앞자리 선택 -->
											<div style="position: relative; flex: 1;">
												<select id="phone1" name="phone1" class="form-control form-control-lg" style="width: 100%;">
													<option value="010" selected>010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
												</select>
												<span style="position: absolute; right: 15px; top: 50%; transform: translateY(-50%); pointer-events: none;">▼</span>
											</div>


											<!-- 가운데 -->
											<input type="text" id="phone2" name="phone2" maxlength="4"
												   class="form-control form-control-lg" placeholder="1234"
												   style="flex: 1;" required
												   oninput="this.value = this.value.replace(/[^0-9]/g, '')">

											<!-- 끝자리 -->
											<input type="text" id="phone3" name="phone3" maxlength="4"
												   class="form-control form-control-lg" placeholder="5678"
												   style="flex: 1;" required
												   oninput="this.value = this.value.replace(/[^0-9]/g, '')">
										</div>
									</div>


									<div class="mb-3">
										<label class="form-label">이메일</label>
										<input class="form-control form-control-lg" type="email" name="email" id="email" placeholder="이메일을 입력하세요" />
									</div>

									<!-- 주소 -->
									<div class="mb-3">
										<label class="form-label">주소<span style="color: red;">*</span></label>
										<div style="display: flex; gap: 10px;">
											<input type="text" name="address" id="address" class="form-control form-control-lg" placeholder="주소 찾기 클릭" readonly required />
											<button type="button" onclick="execDaumPostcode()" class="btn btn-outline-secondary" style="white-space: nowrap;">주소 찾기</button>
										</div>
									</div>

									<!-- 상세 주소 -->
									<div class="mb-3">
										<input type="text" name="addressDetail" id="addressDetail" class="form-control form-control-lg" placeholder="상세 주소를 입력하세요" required/>
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

<script>
	function validateForm() {
		const userid = document.getElementById("userid").value.trim();
		const username = document.getElementById("username").value.trim();
		const password = document.getElementById("password").value.trim();
		const confirmPassword = document.getElementById("confirmPassword").value.trim();
		const phone1 = document.getElementById("phone1").value.trim();
		const phone2 = document.getElementById("phone2").value.trim();
		const phone3 = document.getElementById("phone3").value.trim();
		const email = document.getElementById("email").value.trim();
		const address = document.getElementById("address").value.trim();
		const addressDetail = document.getElementById("addressDetail").value.trim();

		const useridRegex = /^[a-zA-Z][a-zA-Z0-9]{3,}$/;
		const usernameRegex = /^[가-힣]+$/;
		const emailRegex = /^[\w-]+@([\w-]+\.)+[\w-]{2,4}$/;
		const phoneRegex = /^[0-9]+$/;

		if (!useridRegex.test(userid)) {
			alert("아이디는 영문자로 시작하며, 영문자 또는 숫자로 4자 이상 입력하세요.");
			return false;
		}

		if (!usernameRegex.test(username)) {
			alert("이름은 한글만 입력 가능합니다.");
			return false;
		}

		if (password.length < 4) {
			alert("비밀번호는 4자 이상 입력해야 합니다.");
			return false;
		}

		if (password !== confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}

		if (!phoneRegex.test(phone2) || !phoneRegex.test(phone3)) {
			alert("전화번호는 숫자만 입력 가능합니다.");
			return false;
		}

		if (phone2.length < 3 || phone3.length < 4) {
			alert("전화번호 형식이 올바르지 않습니다.");
			return false;
		}

		const fullPhone = `${phone1}-${phone2}-${phone3}`;

		if (email && !emailRegex.test(email)) {
			alert("이메일 형식이 올바르지 않습니다.");
			return false;
		}

		if (!address) {
			alert("주소를 입력해 주세요.");
			return false;
		}

		if (!addressDetail) {
			alert("상세 주소를 입력해 주세요.");
			return false;
		}

		return true;
	}



</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 사용자가 선택한 주소를 입력란에 넣음
				document.getElementById("address").value = data.roadAddress || data.jibunAddress;
				document.getElementById("addressDetail").focus();  // 상세주소 입력으로 자동 이동
			}
		}).open();
	}
</script>



</body>
</html>
