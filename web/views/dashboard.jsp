<%-- 
    Document   : dashboard
    Created on : May 31, 2024, 10:22:56 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>BẢNG ĐIỀU KHIỂN - BookingFootballTicket</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <div class="container-fluid position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <%@include file="side-bar.jsp" %>
            <!-- Sidebar End -->


            <!-- Content Start -->
            <div class="content">
                <!-- Navbar Start -->
                <%@include file="dashboardHeader.jsp" %>
                <!-- Navbar End -->


                <!-- Sale & Revenue Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-line fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Vé Bán Được Tháng Này</p>
                                    <h6 class="mb-0">${requestScope.totalTicketsSoldThisMonth}</h6>
                                    <h7 class="mb-0">Vé</h7>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-bar fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Tổng Vé Bán Được</p>
                                    <h6 class="mb-0">${requestScope.totalTicketsSold}</h6>
                                    <h7 class="mb-0">Vé</h7>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-area fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Doanh Thu Tháng Này</p>
                                    <h6 class="mb-0">${requestScope.totalRevenueThisMonth}</h6>
                                    <h7 class="mb-0">VND</h6>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-xl-3">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Tổng Doanh Thu</p>
                                    <h6 class="mb-0">${requestScope.totalRevenue}</h6>
                                    <h7 class="mb-0">VND</h6>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Sale & Revenue End -->


                <!-- Sales Chart Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Thống kê vé trận và vé mùa</h6>
                                </div>
                                <canvas id="ticket-sales"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Doanh thu hàng năm</h6>
                                </div>
                                <canvas id="ticket-revenue"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sales Chart End -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Số vé bán được năm nay</h6>
                                </div>
                                <canvas id="ticket-year"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Doanh thu năm nay</h6>
                                </div>
                                <canvas id="revenue-year"></canvas>
                            </div>
                        </div>
                    </div>
                </div>





                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
            </div>

            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="lib/chart/chart.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/waypoints/waypoints.min.js"></script>
            <script src="lib/owlcarousel/owl.carousel.min.js"></script>
            <script src="lib/tempusdominus/js/moment.min.js"></script>
            <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: 'dashboard',
                        method: 'POST',
                        success: function (ticketData) {
                            var ctx1 = $("#ticket-sales").get(0).getContext("2d");
                            var myChart1 = new Chart(ctx1, {
                                type: "line",
                                data: {
                                    labels: ticketData.years,
                                    datasets: [{
                                            label: "Vé Trận",
                                            data: ticketData.matchTickets,
                                            backgroundColor: "rgba(0, 156, 255, .7)"
                                        },
                                        {
                                            label: "Vé Mùa",
                                            data: ticketData.seasonTickets,
                                            backgroundColor: "rgba(0, 156, 255, .5)"
                                        }
                                    ]
                                },
                                options: {
                                    responsive: true,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    callback: function (value) {
                                                        return value.toLocaleString();
                                                    }
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                                                var value = tooltipItem.yLabel.toLocaleString();
                                                return datasetLabel + ': ' + value;
                                            }
                                        }
                                    }
                                }
                            });
                        },
                        error: function (error) {
                            console.log("Error:", error);
                        }
                    });
                });
            </script>
            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: 'dashboard',
                        method: 'POST',
                        success: function (ticketData) {
                            var ctx2 = $("#ticket-revenue").get(0).getContext("2d");
                            var myChart2 = new Chart(ctx2, {
                                type: "bar",
                                data: {
                                    labels: ticketData.years,
                                    datasets: [{
                                            label: "Số vé đã bán",
                                            data: ticketData.totalTickets,
                                            backgroundColor: "rgba(0, 156, 255, .5)",
                                            yAxisID: 'y-axis-1'
                                        },
                                        {
                                            label: "Doanh thu",
                                            data: ticketData.totalRevenue,
                                            backgroundColor: "rgba(0, 156, 255, .3)",
                                            yAxisID: 'y-axis-2'
                                        }
                                    ]
                                },
                                options: {
                                    responsive: true,
                                    scales: {
                                        yAxes: [{
                                                id: 'y-axis-1',
                                                type: 'linear',
                                                position: 'left',
                                                ticks: {
                                                    beginAtZero: true,
                                                    callback: function (value) {
                                                        return value.toLocaleString();
                                                    }
                                                },
                                                scaleLabel: {
                                                    display: true,
                                                    labelString: 'Số vé đã bán'
                                                }
                                            }, {
                                                id: 'y-axis-2',
                                                type: 'linear',
                                                position: 'right',
                                                ticks: {
                                                    beginAtZero: true,
                                                    callback: function (value) {
                                                        return value.toLocaleString() + ' VND';
                                                    }
                                                },
                                                scaleLabel: {
                                                    display: true,
                                                    labelString: 'Doanh thu (VND)'
                                                },
                                                gridLines: {
                                                    drawOnChartArea: false
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                                                var value = tooltipItem.yLabel.toLocaleString();
                                                if (datasetLabel === 'Doanh thu') {
                                                    value += ' VND';
                                                }
                                                return datasetLabel + ': ' + value;
                                            }
                                        }
                                    }
                                }
                            });
                        },
                        error: function (error) {
                            console.log("Error:", error);
                        }
                    });
                });
            </script>
            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: 'dashboard',
                        method: 'POST',
                        success: function (ticketData) {
                            var ctx3 = $("#ticket-year").get(0).getContext("2d");
                            var myChart3 = new Chart(ctx3, {
                                type: "line",
                                data: {
                                    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                                    datasets: [{
                                            label: "Lượng vé",
                                            fill: false,
                                            backgroundColor: "rgba(0, 156, 255, .3)",
                                            data: ticketData.ticketYear
                                        }]
                                },
                                options: {
                                    responsive: true,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    callback: function (value) {
                                                        return value.toLocaleString();
                                                    }
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                                                var value = tooltipItem.yLabel.toLocaleString();
                                                return datasetLabel + ': ' + value;
                                            }
                                        }
                                    }
                                }
                            });
                        },
                        error: function (error) {
                            console.log("Error:", error);
                        }
                    });
                });
            </script>
            <script>
                $(document).ready(function () {
                    $.ajax({
                        url: 'dashboard',
                        method: 'POST',
                        success: function (ticketData) {
                            var ctx3 = $("#revenue-year").get(0).getContext("2d");
                            var myChart3 = new Chart(ctx3, {
                                type: "line",
                                data: {
                                    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
                                    datasets: [{
                                            label: "Doanh thu",
                                            fill: false,
                                            backgroundColor: "rgba(0, 156, 255, .3)",
                                            data: ticketData.revenueYear
                                        }]
                                },
                                options: {
                                    responsive: true,
                                    scales: {
                                        yAxes: [{
                                                ticks: {
                                                    beginAtZero: true,
                                                    callback: function (value) {
                                                        return value.toLocaleString();
                                                    }
                                                }
                                            }]
                                    },
                                    tooltips: {
                                        callbacks: {
                                            label: function (tooltipItem, data) {
                                                var datasetLabel = data.datasets[tooltipItem.datasetIndex].label || '';
                                                var value = tooltipItem.yLabel.toLocaleString() + " VND";
                                                return datasetLabel + ': ' + value;
                                            }
                                        }
                                    }
                                }
                            });
                        },
                        error: function (error) {
                            console.log("Error:", error);
                        }
                    });
                });
            </script>
    </body>

</html>