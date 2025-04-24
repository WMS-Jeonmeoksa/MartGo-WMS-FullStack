<%@ page import="com.ssg.martgowmsfullstack.dto.UserDTO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    UserDTO user = (UserDTO) session.getAttribute("loginInfo");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="shortcut icon" href="img/icons/icon-48x48.png"/>

    <link rel="canonical" href="https://demo-basic.adminkit.io/"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <title>MartGo - 창고 임대 신청</title>
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/margoLogo.css" rel="stylesheet">
    <script src="/js/app.js"></script>
    <link href="/css/warehouse.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
<div class="wrapper">
    <!-- 사이드바 -->
    <nav id="sidebar" class="sidebar js-sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="${pageContext.request.contextPath}/user">
                <img src="/img/MartGo_Logo.png" alt="a">
            </a>
            <ul class="sidebar-nav">
                <li class="sidebar-header">회원 메뉴</li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/user">
                        <i class="align-middle" data-feather="home"></i> <span class="align-middle">홈</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/user/mypage">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">마이페이지</span>
                    </a>
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="${pageContext.request.contextPath}/rent/warehouse">
                        <i class="align-middle" data-feather="box"></i> <span class="align-middle">임대 신청</span>
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
                        <span class="nav-link"><i class="fas fa-user-circle"></i> <%= user.getUsername() %>님</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                            <i class="fas fa-sign-out-alt"></i> 로그아웃
                        </a>
                    </li>
                </ul>
            </div>

        </nav>

        <div class="rent-container">
            <div id="mapWrapper">
                <div id="map1" style="width:100%;height:100%"></div> <!-- 지도를 표시할 div 입니다 -->
                <div id="roadviewControl" onclick="setRoadviewRoad()"></div>
            </div>
            <div class="header">
                <h1>창고 임대 신청</h1>
            </div>
            <div class="steps-container">
                <div class="progress-bar">
                    <div class="step active">1
                        <div class="step-label">창고 선택</div>
                    </div>
                    <div class="step">2
                        <div class="step-label">섹터 선택</div>
                    </div>
                    <div class="step">3
                        <div class="step-label">가격/기간 선택</div>
                    </div>
                    <div class="step">4
                        <div class="step-label">신청 완료</div>
                    </div>
                </div>
            </div>

            <div class="section-header">
                <h3><i class="fas fa-warehouse"></i> 창고 목록</h3>
            </div>

            <div id="map" style="width:100%;height:550px; margin-top: 20px;"></div>

            <div class="button-group-full">
                <button class="btn btn-back" id="prev-btn">
                    ← 이전
                </button>
                <button class="btn btn-next" id="nextBtn" disabled>
                    다음 →
                </button>
            </div>
        </div>
            <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f0fadb18408cdb55d9431eca1e67b1b7&libraries=services"></script>
            <script>
                const mapContainer = document.getElementById('map');
                const mapOption = {
                    center: new kakao.maps.LatLng(36.5, 127.8),
                    level: 13
                };
                const map = new kakao.maps.Map(mapContainer, mapOption);

                const geocoder = new kakao.maps.services.Geocoder();

                const markerImageSrc = 'https://cdn-icons-png.flaticon.com/512/2776/2776067.png';
                const normalImage = new kakao.maps.MarkerImage(markerImageSrc, new kakao.maps.Size(40, 42), {offset: new kakao.maps.Point(20, 42)});
                const largeImage = new kakao.maps.MarkerImage(markerImageSrc, new kakao.maps.Size(50, 55), {offset: new kakao.maps.Point(25, 55)});

                const warehouses = [
                    <c:forEach var="wh" items="${warehouses}" varStatus="loop">
                    {
                        id: '${wh.warehouseId}',
                        name: '${wh.warehouseName}',
                        location: '${wh.location}',
                        ratio: '${wh.FAR}%',
                        area: '${wh.width}㎡',
                        status: '${wh.status}'
                    }<c:if test="${!loop.last}">, </c:if>
                    </c:forEach>
                ];

                let selectedMarker = null;
                let selectedWarehouseId = null;
                let selectedWarehouseName = null;

                warehouses.forEach(data => {
                    geocoder.addressSearch(data.location, function (result, status) {
                        if (status === kakao.maps.services.Status.OK) {
                            const coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            const marker = new kakao.maps.Marker({
                                map: map,
                                position: coords,
                                image: normalImage,
                                title: data.name
                            });

                            const content = `
                    <div class="custom-overlay">
                      <div class="title"><i class="fas fa-warehouse"></i> \${data.name}</div>
                      <div><i class="fas fa-map-marker-alt"></i> <strong>위치:</strong> \${data.location}</div>
                      <div><i class="fas fa-compress-arrows-alt"></i> <strong>용적률:</strong> \${data.ratio}</div>
                      <div><i class="fas fa-ruler-combined"></i> <strong>면적:</strong> \${data.area}</div>
                      <div><i class="fas fa-info-circle"></i> <strong>상태:</strong>
                        <span class="\${data.status == '사용가능' ? 'status-available' : 'status-unavailable'}">\${data.status}</span>
                      </div>
                    </div>
                `;

                            const infowindow = new kakao.maps.InfoWindow({content});

                            kakao.maps.event.addListener(marker, 'mouseover', () => infowindow.open(map, marker));
                            kakao.maps.event.addListener(marker, 'mouseout', () => infowindow.close());

                            kakao.maps.event.addListener(marker, 'click', () => {

                                if (selectedMarker !== null) {
                                    selectedMarker.setImage(normalImage);
                                }

                                marker.setImage(largeImage);
                                selectedMarker = marker;
                                selectedWarehouseId = data.id;
                                selectedWarehouseName = data.name;

                                sessionStorage.setItem('selectedWarehouseId', selectedWarehouseId);
                                sessionStorage.setItem('selectedWarehouseName', selectedWarehouseName);

                                document.getElementById('nextBtn').disabled = false;
                            });
                        }
                    });
                });

                document.getElementById('nextBtn').addEventListener('click', () => {
                    if (!selectedWarehouseId) {
                        alert('창고를 선택해주세요.');
                        return;
                    }
                    const selectedWarehouse = warehouses.find(w => w.id === selectedWarehouseId);
                    if (selectedWarehouse && selectedWarehouse.status === '사용불가') {
                        alert('선택한 창고는 현재 모두 임대중입니다. 다른 창고를 선택해주세요.');
                        return;
                    }
                    const params = new URLSearchParams({
                        warehouseId: selectedWarehouseId,
                        warehouseName: selectedWarehouseName
                    });
                    window.location.href = '/rent/sector?' + params.toString();
                });
                document.getElementById('prev-btn').addEventListener('click', () => {
                    // 창고 선택 페이지로 돌아가기
                    window.location.href = '/user';
                });
                const mapTypeControl = new kakao.maps.MapTypeControl();
                map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

                const zoomControl = new kakao.maps.ZoomControl();
                map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
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