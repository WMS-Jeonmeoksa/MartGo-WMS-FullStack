<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>비밀번호 재설정</title>
    <link href="${pageContext.request.contextPath}/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/registerForm.css" rel="stylesheet">
</head>
<body>

<div class="container d-flex flex-column justify-content-center align-items-center" style="height:100vh;">
    <div class="card" style="max-width: 500px; width: 100%;">
        <div class="card-body">
            <h2 class="text-center mb-4">비밀번호 재설정</h2>
            <p class="text-center text-muted">최초 로그인 시 비밀번호를 변경해야 합니다.</p>

            <form method="post" action="${pageContext.request.contextPath}/admin/update-password"
                  onsubmit="return validatePasswordForm();">
                <div class="mb-3">
                    <label for="newPassword" class="form-label">새 비밀번호</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>

                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                </div>

                <!-- ✅ 수정된 부분 -->
                <input type="hidden" name="adminId" value="${sessionScope.tempAdminId}"/>

                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>

                <div class="d-grid">
                    <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function validatePasswordForm() {
        const pw1 = document.getElementById("newPassword").value;
        const pw2 = document.getElementById("confirmPassword").value;

        if (pw1.length < 4) {
            alert("비밀번호는 최소 4자리 이상이어야 합니다.");
            return false;
        }

        if (pw1 !== pw2) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
