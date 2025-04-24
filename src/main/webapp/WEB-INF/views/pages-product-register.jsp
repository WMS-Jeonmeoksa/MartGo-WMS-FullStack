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
    <link rel="stylesheet" href="/css/product_register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="${pageContext.request.contextPath}/js/app.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/dashboard/customer">
                <img src="/img/MartGo_Logo.png" alt="MartGo_Logo">
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">거래처 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/dashboard/customer">
                        <i class="align-middle" data-feather="list"></i>
                        <span class="align-middle">대시 보드</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/customer/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/product/register">
                        <i class="align-middle" data-feather="plus-square"></i> <span class="align-middle">제품 등록</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/incoming/select">
                        <i class="align-middle" data-feather="log-in"></i> <span class="align-middle">입고 요청</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/outgoing/select">
                        <i class="align-middle" data-feather="log-out"></i> <span class="align-middle">출고 요청</span>
                    </a>
                </li>

                <form id="stockForm" action="${pageContext.request.contextPath}/stock/customer" method="post"
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

    <div class="product-container">
        <div class="header">
            <h1 class="product-h1">
                <i class="fas fa-cube"></i>&nbsp;제품 등록
            </h1>
        </div>

        <form action="${pageContext.request.contextPath}/product/register" method="post" onsubmit="return prepareCategoryValue()">
            <div class="product-form-group">
                <label for="productId">제품 ID</label>
                <input type="text" id="productId" name="productId" placeholder="예: PRD001" required>
            </div>

            <div class="product-form-group">
                <label for="productName">제품명</label>
                <input type="text" id="productName" name="productName" placeholder="예: 비스포크 냉장고" required>
            </div>

            <div class="product-form-group">
                <label for="categorySelect">카테고리</label>
                <select id="categorySelect" onchange="handleCategoryChange()">
                    <option value="">선택하세요</option>
                    <option value="냉장고">냉장고</option>
                    <option value="TV">TV</option>
                    <option value="세탁기">세탁기</option>
                    <option value="건조기">건조기</option>
                    <option value="에어컨">에어컨</option>
                    <option value="청소기">청소기</option>
                    <option value="direct">직접입력</option>
                </select>
                <input type="text" id="categoryInput" placeholder="카테고리를 입력하세요" style="display:none; margin-top: 8px;">
                <input type="hidden" name="category" id="category">
            </div>

            <div class="product-form-group">
                <label for="height">제품 높이 (cm)</label>
                <input type="number" id="height" name="height" placeholder="예: 180" min="0" required>
            </div>

            <div class="product-form-group">
                <label for="width">제품 면적 (㎡)</label>
                <input type="number" id="width" name="width" placeholder="예: 20" min="0" step="0.01" required>
            </div>

            <div class="product-form-group">
                <label for="price">제품 가격 (원)</label>
                <input type="number" id="price" name="price" placeholder="예: 500000" min="0" required>
            </div>

            <div class="product-form-group">
                <label for="manufacturer">제조사</label>
                <input type="text" id="manufacturer" name="manufacturer" placeholder="예: 삼성전자" required>
            </div>

            <div class="button-group-full">
                <button class="product_btn btn-back" type="button" onclick="goBack()">
                    <i class="fas fa-arrow-left"></i> 이전
                </button>
                <button class="product_btn btn-next" type="submit">
                    등록하기 <i class="fas fa-check"></i>
                </button>
            </div>
        </form>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }

        function handleCategoryChange() {
            const select = document.getElementById("categorySelect");
            const input = document.getElementById("categoryInput");
            if (select.value === "direct") {
                input.style.display = "block";
            } else {
                input.style.display = "none";
                input.value = "";
            }
        }

        function prepareCategoryValue() {
            const category = document.getElementById("category");
            const select = document.getElementById("categorySelect");
            const input = document.getElementById("categoryInput");

            category.value = (select.value === "direct") ? input.value.trim() : select.value;

            if (category.value === "") {
                alert("카테고리를 입력해주세요.");
                return false;
            }

            return confirm("등록하시겠습니까?");
        }
    </script>


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
</div>
</div>
</body>
</html>
