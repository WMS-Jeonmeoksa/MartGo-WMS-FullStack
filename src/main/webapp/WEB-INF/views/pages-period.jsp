<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<!DOCTYPE html>
<html lang="en">


<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Responsive Admin &amp; Dashboard Template based on Bootstrap 5">
	<meta name="author" content="AdminKit">
	<meta name="keywords" content="adminkit, bootstrap, bootstrap 5, admin, dashboard, template, responsive, css, sass, html, theme, front-end, ui kit, web">

	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="shortcut icon" href="img/icons/icon-48x48.png" />

	<link rel="canonical" href="https://demo-basic.adminkit.io/" />
	<title>warehouse rent</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

	<link href="/css/app.css" rel="stylesheet">
	<link href="/css/period.css" rel="stylesheet">

	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>

<body>
<div class="wrapper">
	<nav id="sidebar" class="sidebar js-sidebar">
		<div class="sidebar-content js-simplebar">
			<a class="sidebar-brand" href="index.html">
				<span class="align-middle">AdminKit</span>
			</a>

			<ul class="sidebar-nav">
				<li class="sidebar-header">
					Pages
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="index.html">
						<i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a>
				</li>
				<li class="sidebar-item active">
					<a class="sidebar-link" href="pages-warehouse.jsp">
						<i class="align-middle" data-feather="rent"></i> <span class="align-middle">Warehouse Rent</span>
					</a>
				</li>
				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-profile.html">
						<i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-sign-in.html">
						<i class="align-middle" data-feather="log-in"></i> <span class="align-middle">Sign In</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-sign-up.html">
						<i class="align-middle" data-feather="user-plus"></i> <span class="align-middle">Sign Up</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="pages-blank.html">
						<i class="align-middle" data-feather="book"></i> <span class="align-middle">Blank</span>
					</a>
				</li>

				<li class="sidebar-header">
					Tools & Components
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="ui-buttons.html">
						<i class="align-middle" data-feather="square"></i> <span class="align-middle">Buttons</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="ui-forms.html">
						<i class="align-middle" data-feather="check-square"></i> <span class="align-middle">Forms</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="ui-cards.html">
						<i class="align-middle" data-feather="grid"></i> <span class="align-middle">Cards</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="ui-typography.html">
						<i class="align-middle" data-feather="align-left"></i> <span class="align-middle">Typography</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="icons-feather.html">
						<i class="align-middle" data-feather="coffee"></i> <span class="align-middle">Icons</span>
					</a>
				</li>

				<li class="sidebar-header">
					Plugins & Addons
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="charts-chartjs.html">
						<i class="align-middle" data-feather="bar-chart-2"></i> <span class="align-middle">Charts</span>
					</a>
				</li>

				<li class="sidebar-item">
					<a class="sidebar-link" href="maps-google.html">
						<i class="align-middle" data-feather="map"></i> <span class="align-middle">Maps</span>
					</a>
				</li>
			</ul>

			<div class="sidebar-cta">
				<div class="sidebar-cta-content">
					<strong class="d-inline-block mb-2">Upgrade to Pro</strong>
					<div class="mb-3 text-sm">
						Are you looking for more components? Check out our premium version.
					</div>
					<div class="d-grid">
						<a href="upgrade-to-pro.html" class="btn btn-primary">Upgrade to Pro</a>
					</div>
				</div>
			</div>
		</div>
	</nav>

	<div class="main">
		<nav class="navbar navbar-expand navbar-light navbar-bg">
			<a class="sidebar-toggle js-sidebar-toggle">
				<i class="hamburger align-self-center"></i>
			</a>

			<div class="navbar-collapse collapse">
				<ul class="navbar-nav navbar-align">
					<li class="nav-item dropdown">
						<a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-bs-toggle="dropdown">
							<div class="position-relative">
								<i class="align-middle" data-feather="bell"></i>
								<span class="indicator">4</span>
							</div>
						</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="alertsDropdown">
							<div class="dropdown-menu-header">
								4 New Notifications
							</div>
							<div class="list-group">
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<i class="text-danger" data-feather="alert-circle"></i>
										</div>
										<div class="col-10">
											<div class="text-dark">Update completed</div>
											<div class="text-muted small mt-1">Restart server 12 to complete the update.</div>
											<div class="text-muted small mt-1">30m ago</div>
										</div>
									</div>
								</a>
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<i class="text-warning" data-feather="bell"></i>
										</div>
										<div class="col-10">
											<div class="text-dark">Lorem ipsum</div>
											<div class="text-muted small mt-1">Aliquam ex eros, imperdiet vulputate hendrerit et.</div>
											<div class="text-muted small mt-1">2h ago</div>
										</div>
									</div>
								</a>
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<i class="text-primary" data-feather="home"></i>
										</div>
										<div class="col-10">
											<div class="text-dark">Login from 192.186.1.8</div>
											<div class="text-muted small mt-1">5h ago</div>
										</div>
									</div>
								</a>
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<i class="text-success" data-feather="user-plus"></i>
										</div>
										<div class="col-10">
											<div class="text-dark">New connection</div>
											<div class="text-muted small mt-1">Christina accepted your request.</div>
											<div class="text-muted small mt-1">14h ago</div>
										</div>
									</div>
								</a>
							</div>
							<div class="dropdown-menu-footer">
								<a href="#" class="text-muted">Show all notifications</a>
							</div>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-bs-toggle="dropdown">
							<div class="position-relative">
								<i class="align-middle" data-feather="message-square"></i>
							</div>
						</a>
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-end py-0" aria-labelledby="messagesDropdown">
							<div class="dropdown-menu-header">
								<div class="position-relative">
									4 New Messages
								</div>
							</div>
							<div class="list-group">
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<img src="img/avatars/avatar-5.jpg" class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
										</div>
										<div class="col-10 ps-2">
											<div class="text-dark">Vanessa Tucker</div>
											<div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu tortor.</div>
											<div class="text-muted small mt-1">15m ago</div>
										</div>
									</div>
								</a>
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<img src="img/avatars/avatar-2.jpg" class="avatar img-fluid rounded-circle" alt="William Harris">
										</div>
										<div class="col-10 ps-2">
											<div class="text-dark">William Harris</div>
											<div class="text-muted small mt-1">Curabitur ligula sapien euismod vitae.</div>
											<div class="text-muted small mt-1">2h ago</div>
										</div>
									</div>
								</a>
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<img src="img/avatars/avatar-4.jpg" class="avatar img-fluid rounded-circle" alt="Christina Mason">
										</div>
										<div class="col-10 ps-2">
											<div class="text-dark">Christina Mason</div>
											<div class="text-muted small mt-1">Pellentesque auctor neque nec urna.</div>
											<div class="text-muted small mt-1">4h ago</div>
										</div>
									</div>
								</a>
								<a href="#" class="list-group-item">
									<div class="row g-0 align-items-center">
										<div class="col-2">
											<img src="img/avatars/avatar-3.jpg" class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
										</div>
										<div class="col-10 ps-2">
											<div class="text-dark">Sharon Lessman</div>
											<div class="text-muted small mt-1">Aenean tellus metus, bibendum sed, posuere ac, mattis non.</div>
											<div class="text-muted small mt-1">5h ago</div>
										</div>
									</div>
								</a>
							</div>
							<div class="dropdown-menu-footer">
								<a href="#" class="text-muted">Show all messages</a>
							</div>
						</div>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
							<i class="align-middle" data-feather="settings"></i>
						</a>

						<a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
							<img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span class="text-dark">Charles Hall</span>
						</a>
						<div class="dropdown-menu dropdown-menu-end">
							<a class="dropdown-item" href="pages-profile.html"><i class="align-middle me-1" data-feather="user"></i> Profile</a>
							<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="pie-chart"></i> Analytics</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="index.html"><i class="align-middle me-1" data-feather="settings"></i> Settings & Privacy</a>
							<a class="dropdown-item" href="#"><i class="align-middle me-1" data-feather="help-circle"></i> Help Center</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Log out</a>
						</div>
					</li>
				</ul>
			</div>
		</nav>
		<div class="container">
			<h1>창고 임대 신청</h1>
			<div class="progress-bar">
				<div class="step active">1<div class="step-label">창고 선택</div></div>
				<div class="step active">2<div class="step-label">섹터 선택</div></div>
				<div class="step active">3<div class="step-label">가격/기간 선택</div></div>
				<div class="step">4<div class="step-label">신청 완료</div></div>
			</div>

			<div class="summary-box">
				<h2>선택한 창고 및 섹터 정보</h2>
				<p><strong>창고:</strong> ${warehouseName} (ID: ${warehouseId})</p>
				<p><strong>섹터:</strong> ${sectorId}</p>
			</div>

			<h2>임대 가격표</h2>
			<p>원하시는 기간을 선택해주세요</p>
			<table>
				<thead>
				<tr>
					<th>번호</th><th>기간</th><th>월 임대료</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="info" items="${costInfo}" varStatus="loop">
					<!-- period, price 둘 다 안전하게 따옴표로 감싸서 전달합니다 -->
					<tr onclick="selectPrice(this, '${info.period}', '${info.price}')">
						<td>${loop.count}</td>
						<td>${info.period}</td>
						<td><fmt:formatNumber value="${info.price}" type="number" groupingUsed="true"/>원</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>

			<div id="calendarSection" class="calendar-section">
				<h2>임대 시작일 선택</h2>
				<input type="date" id="startDate" class="date-picker">
				<div class="final-summary">
					<h2>선택 요약</h2>
					<p><strong>기간:</strong> <span id="selectedPeriod">-</span></p>
					<p><strong>시작일:</strong> <span id="selectedStartDate">-</span></p>
					<p><strong>종료일:</strong> <span id="selectedEndDate">-</span></p>
					<p><strong>총 임대료:</strong> <span id="totalPrice">-</span></p>
				</div>
			</div>

			<input type="hidden" id="hiddenWarehouseId"   value="${warehouseId}" />
			<input type="hidden" id="hiddenWarehouseName" value="${warehouseName}" />
			<input type="hidden" id="hiddenSectorId"      value="${sectorId}" />

			<div class="button-group">
				<button class="btn btn-back" onclick="goToPreviousPage()">← 이전</button>
				<button class="btn btn-next" id="nextBtn" disabled onclick="goToNextPage()">다음 →</button>
			</div>
		</div>

		<script>
			// date-picker 최소값
			document.getElementById('startDate').min = new Date().toISOString().slice(0,10);

			let selectedPeriodMonths = 0;
			let selectedMonthly      = 0;

			function selectPrice(row, periodStr, priceStr) {
				console.log('selectPrice:', periodStr, priceStr);
				// 문자열로 받은 값 정수로 변환
				selectedPeriodMonths = parseInt(periodStr, 10);
				selectedMonthly      = parseInt(priceStr.replace(/,/g,''), 10);

				document.querySelectorAll('tbody tr').forEach(tr => tr.classList.remove('selected'));
				row.classList.add('selected');

				document.getElementById('calendarSection').classList.add('show');
				updateSummary();
				checkNextButton();
			}

			document.getElementById('startDate').addEventListener('change', () => {
				updateSummary();
				checkNextButton();
			});

			function updateSummary() {
				const start = document.getElementById('startDate').value;
				if (!selectedPeriodMonths || !start) return;
				const sd = new Date(start);
				const ed = new Date(sd);
				ed.setMonth(ed.getMonth() + selectedPeriodMonths);
				ed.setDate(ed.getDate() - 1);

				document.getElementById('selectedPeriod').innerText    =  selectedPeriodMonths + "개월";
				document.getElementById('selectedStartDate').innerText = start;
				document.getElementById('selectedEndDate').innerText   = ed.toISOString().slice(0,10);
				document.getElementById('totalPrice').innerText        =
						(selectedMonthly * selectedPeriodMonths).toLocaleString() + '원';
			}

			function checkNextButton() {
				document.getElementById('nextBtn').disabled =
						!(selectedPeriodMonths && document.getElementById('startDate').value);
			}

			function goToPreviousPage() {
				const qs = new URLSearchParams({
					warehouseId:   document.getElementById('hiddenWarehouseId').value,
					warehouseName: document.getElementById('hiddenWarehouseName').value,
					sectorId:      document.getElementById('hiddenSectorId').value
				});
				window.location.href = '/rent/sector?' + qs;
			}

			function goToNextPage() {
				const qs = new URLSearchParams({
					warehouseId:   document.getElementById('hiddenWarehouseId').value,
					warehouseName: document.getElementById('hiddenWarehouseName').value,
					sectorId:      document.getElementById('hiddenSectorId').value,
					month:         selectedPeriodMonths,
					startDay:      document.getElementById('startDate').value
				});
				window.location.href = '/rent/last?' + qs;
			}
		</script>
		<script src="js/app.js"></script>

<script>
	document.addEventListener("DOMContentLoaded", function() {
		var ctx = document.getElementById("chartjs-dashboard-line").getContext("2d");
		var gradient = ctx.createLinearGradient(0, 0, 0, 225);
		gradient.addColorStop(0, "rgba(215, 227, 244, 1)");
		gradient.addColorStop(1, "rgba(215, 227, 244, 0)");
		// Line chart
		new Chart(document.getElementById("chartjs-dashboard-line"), {
			type: "line",
			data: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [{
					label: "Sales ($)",
					fill: true,
					backgroundColor: gradient,
					borderColor: window.theme.primary,
					data: [
						2115,
						1562,
						1584,
						1892,
						1587,
						1923,
						2566,
						2448,
						2805,
						3438,
						2917,
						3327
					]
				}]
			},
			options: {
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				tooltips: {
					intersect: false
				},
				hover: {
					intersect: true
				},
				plugins: {
					filler: {
						propagate: false
					}
				},
				scales: {
					xAxes: [{
						reverse: true,
						gridLines: {
							color: "rgba(0,0,0,0.0)"
						}
					}],
					yAxes: [{
						ticks: {
							stepSize: 1000
						},
						display: true,
						borderDash: [3, 3],
						gridLines: {
							color: "rgba(0,0,0,0.0)"
						}
					}]
				}
			}
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Pie chart
		new Chart(document.getElementById("chartjs-dashboard-pie"), {
			type: "pie",
			data: {
				labels: ["Chrome", "Firefox", "IE"],
				datasets: [{
					data: [4306, 3801, 1689],
					backgroundColor: [
						window.theme.primary,
						window.theme.warning,
						window.theme.danger
					],
					borderWidth: 5
				}]
			},
			options: {
				responsive: !window.MSInputMethodContext,
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				cutoutPercentage: 75
			}
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		// Bar chart
		new Chart(document.getElementById("chartjs-dashboard-bar"), {
			type: "bar",
			data: {
				labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				datasets: [{
					label: "This year",
					backgroundColor: window.theme.primary,
					borderColor: window.theme.primary,
					hoverBackgroundColor: window.theme.primary,
					hoverBorderColor: window.theme.primary,
					data: [54, 67, 41, 55, 62, 45, 55, 73, 60, 76, 48, 79],
					barPercentage: .75,
					categoryPercentage: .5
				}]
			},
			options: {
				maintainAspectRatio: false,
				legend: {
					display: false
				},
				scales: {
					yAxes: [{
						gridLines: {
							display: false
						},
						stacked: false,
						ticks: {
							stepSize: 20
						}
					}],
					xAxes: [{
						stacked: false,
						gridLines: {
							color: "transparent"
						}
					}]
				}
			}
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var markers = [{
			coords: [31.230391, 121.473701],
			name: "Shanghai"
		},
			{
				coords: [28.704060, 77.102493],
				name: "Delhi"
			},
			{
				coords: [6.524379, 3.379206],
				name: "Lagos"
			},
			{
				coords: [35.689487, 139.691711],
				name: "Tokyo"
			},
			{
				coords: [23.129110, 113.264381],
				name: "Guangzhou"
			},
			{
				coords: [40.7127837, -74.0059413],
				name: "New York"
			},
			{
				coords: [34.052235, -118.243683],
				name: "Los Angeles"
			},
			{
				coords: [41.878113, -87.629799],
				name: "Chicago"
			},
			{
				coords: [51.507351, -0.127758],
				name: "London"
			},
			{
				coords: [40.416775, -3.703790],
				name: "Madrid "
			}
		];
		var map = new jsVectorMap({
			map: "world",
			selector: "#world_map",
			zoomButtons: true,
			markers: markers,
			markerStyle: {
				initial: {
					r: 9,
					strokeWidth: 7,
					stokeOpacity: .4,
					fill: window.theme.primary
				},
				hover: {
					fill: window.theme.primary,
					stroke: window.theme.primary
				}
			},
			zoomOnScroll: false
		});
		window.addEventListener("resize", () => {
			map.updateSize();
		});
	});
</script>
<script>
	document.addEventListener("DOMContentLoaded", function() {
		var date = new Date(Date.now() - 5 * 24 * 60 * 60 * 1000);
		var defaultDate = date.getUTCFullYear() + "-" + (date.getUTCMonth() + 1) + "-" + date.getUTCDate();
		document.getElementById("datetimepicker-dashboard").flatpickr({
			inline: true,
			prevArrow: "<span title=\"Previous month\">&laquo;</span>",
			nextArrow: "<span title=\"Next month\">&raquo;</span>",
			defaultDate: defaultDate
		});
	});
</script>
	</div>
</div>
</body>

</html>