<%-- 
    Document   : newjsp
    Created on : Jul 5, 2024, 2:46:50 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <style>
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .section-header h2 {
                margin-bottom: 0;
            }
            @media (max-width: 768px) {
                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
            .card {
                margin-bottom: 1rem;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 2rem 0;
                text-align: center;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            .card-body {
                text-align: center;
            }
            .team-logos {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 1rem;
            }
            .team-logos img {
                width: 50px;
                height: 50px;
                margin: 0 10px;
            }
            .book-now-btn {
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                padding: 0.5rem 1rem;
                text-decoration: none;
            }
            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
            }
            .stadium-map {
                background-color: #f8f9fa;
                padding: 20px;
                margin-bottom: 20px;
            }


            .ticket-row {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
                border: 1px solid #dee2e6;
                border-radius: 4px;
                padding: 10px;
            }
            .color-bar {
                width: 5px;
                height: 100%;
                margin-right: 10px;
            }
            .color-bar-standard {
                background-color: dodgerblue;
            }
            .vip-seat {
                background-color: cyan;
            }
            .color-bar-longside-upper {
                background-color: orange;
            }
            .ticket-info {
                display: flex;
                flex-direction: column;
            }
            .ticket-status {
                color: red;
            }
            .view-type {
                color: green;
            }
            .book-now {
                color: blue;
            }
            .scroll-container {
                max-height: 660px; /* Chiều cao tối đa của khung cuộn */
                overflow-y: auto; /* Kích hoạt thanh cuộn dọc */
                padding-right: 10px; /* Đệm phải để tránh đè lên thanh cuộn */
            }




            .alert-custom {
                background-color: #ffe5e5;
                border: 1px solid #ffcccc;
            }
            .border-custom {
                border-bottom: 2px solid #d1d5db;
            }
            .match-title {
                font-size: 1.5rem; /* Giảm kích thước chữ */
            }
            .team-logos {
                display: flex;
                align-items: flex-start; /* Căn top */
                height: 100%;
            }
            .team-logos img {
                height: 50px; /* Điều chỉnh chiều cao logo tùy ý */
                margin-right: 10px;
            }
            .headerr {
                margin-bottom: 160px;
            }
        </style>
    </head>
    <body>
        <div class="headerr">
            <jsp:include page="header.jsp" />
        </div>
        <div class="container">
            <div class="row border-custom pb-3 mb-3">
                <div class="col-md-2 text-center team-logos badge">
                    <img src="${match.team1.img}" alt="${match.team1.clubName}" />
                    <img src="${match.team2.img}" alt="${match.team2.clubName}" />
                </div>
                <div class="col-md-7 text-left">
                    <h2 class="match-title">${match.team1.clubName} vs ${match.team2.clubName}</h2>
                    <p><a href="./">Trang chủ</a> / <a href="#">${match.season.seasonName}</a> / <a href="">${match.team1.clubName} vs ${match.team2.clubName} Tickets</a></p>
                </div>
                <div class="col-md-3 text-right">
                    <p>${date}</p>
                    <p>Khai mạc: ${time}</p>
                    <p>Sân vận động Quốc Gia Mỹ Đình</p>
                    <p>${match.type.name}</p>
                </div>
            </div>
        </div>


        <div class="alert alert-custom text-center" role="alert">
            <strong>Popular game, price rise expected</strong><br>
            Tip: Buy now and avoid paying a higher price
        </div>

        <div class="container mt-5">
            <div class="row">
                <!-- Stadium Map Section -->
                <div class="col-md-6">
                    <div class="stadium-map">
                        <h5 class="text-center">Stadium Map</h5>
                        <div class="left">
                            <div class="stadium-map">
                                <svg id="svgStadium" viewBox="0 0 1247 1136" data-section="" data-block="" data-tags="" >
                                <defs>
                                <style>
                                    path {
                                        fill: #cccccc;
                                        stroke: #cccccc;
                                        stroke-width: 3;
                                    }

                                    .maptext {
                                        font-size: 45.833px;
                                        fill: #fff;
                                        font-family: "Myriad Pro";
                                        font-weight: 700;
                                        pointer-events: none;
                                    }
                                    [data-block] {
                                        transition: fill 0.3s ease; /* Transition để làm mượt việc thay đổi màu */
                                    }

                                    /* Định nghĩa màu riêng cho từng section khi hover và click */
                                    .fans-side,
                                    .fans-side.hovered,
                                    .fans-side.clicked {
                                        fill: #dc3645; /* Màu vang cho fans-side */
                                        transition: fill 0.3s ease;
                                    }

                                    .standard,
                                    .standard.hovered,
                                    .standard.clicked {
                                        fill: #0f6dfd;
                                        transition: fill 0.3s ease;
                                    }

                                    .vip-stand,
                                    .vip-stand.hovered,
                                    .vip-stand.clicked {
                                        fill: #198754;
                                        transition: fill 0.3s ease;
                                    }

                                    .under-roof,
                                    .under-roof.hovered,
                                    .under-roof.clicked {
                                        fill: #ffc118; /* Màu vàng cho under-roof */
                                        transition: fill 0.3s ease;
                                    }

                                    .on-roof,
                                    .on-roof.hovered,
                                    .on-roof.clicked {
                                        fill: #0fcaf0; /* Màu hồng cho on-roof */
                                        transition: fill 0.3s ease;
                                    }


                                    .cls-1 {
                                        fill: #bb6767;
                                    }
                                    .cls-2 {
                                        fill: #b8ce94;
                                    }
                                    .cls-2, .cls-3, .cls-4 {
                                        stroke: #fdffff;
                                        stroke-width: 3px;
                                    }
                                    .cls-2, .cls-3 {
                                        fill-rule: evenodd;
                                    }
                                    .cls-3, .cls-4 {
                                        fill: none;
                                    }
                                    .cls-5 {
                                        font-size: 45.833px;
                                        fill: white;
                                        font-family: "Myriad Pro";
                                        font-weight: 800;
                                    }
                                </style>
                                <script>
                                    document.addEventListener('DOMContentLoaded', function () {
                                        const svg = document.getElementById('svgStadium');
                                        const paths = svg.querySelectorAll('path');
                                        const items = document.querySelectorAll('.item');


                                        // Add initial classes to all paths
                                        paths.forEach(function (path) {
                                            var sectionName = path.getAttribute('data-section');
                                            path.classList.add(sectionName, 'clicked');
                                        });

                                        // Add event listeners to all paths
                                        paths.forEach(function (path) {
                                            path.addEventListener('mouseenter', function () {
                                                var sectionName = this.getAttribute('data-section');
                                                document.querySelectorAll('path[data-section="' + sectionName + '"]')
                                                        .forEach(item => item.classList.add('hovered', sectionName));
                                            });

                                            path.addEventListener('mouseleave', function () {
                                                var sectionName = this.getAttribute('data-section');
                                                document.querySelectorAll('path[data-section="' + sectionName + '"]')
                                                        .forEach(item => {
                                                            if (!item.classList.contains('clicked')) {
                                                                item.classList.remove('hovered', sectionName);
                                                            }
                                                        });
                                            });

                                            path.addEventListener('click', function () {
                                                var sectionName = this.getAttribute('data-section');
                                                document.querySelectorAll('path[data-section="' + sectionName + '"]')
                                                        .forEach(item => {
                                                            item.classList.toggle('clicked');

                                                            // Check if the path has the class 'clicked' and log a message
                                                            if (item.classList.contains('clicked')) {
                                                                items.forEach(item => {
                                                                    const itemTicketType = item.getAttribute('data-ticket-type');
                                                                    if (itemTicketType === sectionName) {
                                                                        item.style.display = 'block';
                                                                    }
                                                                });
                                                            } else {
                                                                items.forEach(item => {
                                                                    const itemTicketType = item.getAttribute('data-ticket-type');
                                                                    if (itemTicketType === sectionName) {
                                                                        item.style.display = 'none';
                                                                    }
                                                                });
                                                            }
                                                        });
                                            });
                                        });
                                    });

                                    var pricePerTicketString = '';
                                    function Summary(price, className, standName, seatName) {
                                        document.getElementById('priceIndiv').innerText = parseInt(price.replace(/,/g, ''), 0);
                                        document.getElementById('sum').innerText = parseInt(price.replace(/,/g, ''), 0);
                                        document.getElementById('ticketSeatStand').innerText = standName + seatName;
                                        document.getElementById('seatClassView').innerText = className;
                                        pricePerTicketString = price;
                                    }

                                    function changeTotalPrice() {
                                        var pricePerTicket = parseInt(pricePerTicketString.replace(/,/g, ''), 0);
                                        var quantity = document.getElementById('number_of_tickets').value;
                                        document.getElementById('sum').innerText = quantity * pricePerTicket;
                                    }

                                    function cancel() {
                                        document.getElementById('number_of_tickets').value = 1;
                                    }
                                </script>

                                </defs>
                                <%--Stand C--%>
                                <path data-section="fans-side" data-block="4" data-tags="" d="M294,405s-43.585,33.376-66.465,76.174l-81.853-34.1S175,395.162,251.139,344.783Z"/>
                                <path data-section="standard" data-block="5" data-tags="" d="M246.139,343.783s-71.127,46.322-105.457,102.286L57.986,404s42.049-65.858,141.67-123.373Z"/>
                                <path data-section="fans-side" data-block="3" data-tags="" d="M223.535,482.174s-22.88,35.12-22.88,83.826H106.328s-5.088-52.684,35.354-117.931Z"/>
                                <path data-section="standard" data-block="6" data-tags="" d="M137.682,448.069S102.328,500.572,102.328,566H0.463s-5.081-75.469,54.523-160Z"/>
                                <path data-section="fans-side" data-block="1" data-tags="" d="M293,733s-43.585-33.376-66.465-76.174l-81.853,34.105S174,742.838,250.139,793.217Z"/>
                                <path data-section="standard" data-block="8" data-tags="" d="M247.139,793.217S176.012,746.9,141.682,690.931L58.986,733s42.049,65.858,141.67,123.373Z"/>
                                <path data-section="fans-side" data-block="2" data-tags="" d="M224.535,653.826s-22.88-35.12-22.88-83.826H107.328s-5.088,52.683,35.354,117.931Z"/>
                                <path data-section="standard" data-block="7" data-tags="" d="M138.682,688.931S103.328,636.428,103.328,571H1.463s-5.081,75.469,54.523,160Z"/>
                                <%--Stand D--%>
                                <path data-section="fans-side" data-block="4" data-tags="" d="M953,403s43.585,33.376,66.46,76.174l81.86-34.1S1072,393.162,995.861,342.783Z"/>
                                <path data-section="standard" data-block="5" data-tags="" d="M999.861,340.783s71.129,46.322,105.459,102.286L1188.01,401s-42.04-65.858-141.67-123.373Z"/>
                                <path data-section="fans-side" data-block="3" data-tags="" d="M1022.46,482.174s22.88,35.12,22.88,83.826h94.33s5.09-52.684-35.35-117.931Z"/>
                                <path data-section="standard" data-block="6" data-tags="" d="M1107.32,448.069s35.35,52.5,35.35,117.931h101.87s5.08-75.469-54.53-160Z"/>
                                <path data-section="fans-side" data-block="1" data-tags="" d="M953,732s43.585-33.376,66.46-76.174l81.86,34.105S1072,741.838,995.861,792.217Z"/>
                                <path data-section="standard" data-block="8" data-tags="" d="M999.861,792.217S1070.99,745.9,1105.32,689.931L1188.01,732s-42.04,65.858-141.67,123.373Z"/>
                                <path data-section="fans-side" data-block="2" data-tags="" d="M1023.46,653.826s22.88-35.12,22.88-83.826h94.33s5.09,52.683-35.35,117.931Z"/>
                                <path data-section="standard" data-block="7" data-tags="" d="M1109.32,687.931s35.35-52.5,35.35-117.931h101.87s5.08,75.469-54.53,160Z"/>
                                <%--Stand B--%>
                                <path data-section="fans-side" data-block="1" data-tags="" d="M441.256,339.7S393.907,353.931,334,396l-42.861-60.217s60.753-37.4,121.224-54.963Z"/>
                                <path data-section="standard" data-block="12" data-tags="" d="M410.364,276.82s-74.741,23.456-121.225,54.963l-46.484-63.158s78.536-41.444,137.569-57.513Z"/>
                                <path data-section="vip-stand" data-block="2" data-tags="" d="M524.909,318s-21.621,2.448-80.653,20.7L415.364,279.82s51.512-16.421,101.054-23.606Z"/>
                                <path data-section="under-roof" data-block="11" data-tags="" d="M516.418,253.214s-56.568,7.848-101.055,23.606l-30.139-65.708s68.964-19.393,122.412-25.656Z"/>
                                <path data-section="vip-stand" data-block="3" data-tags="" d="M623,309.469s-76.818,2.322-94.091,7.532l-8.491-61.787A731.946,731.946,0,0,1,623,248.028v61.441Z"/>
                                <path data-section="under-roof" data-block="10" data-tags="" d="M623,244.028s-63.93.333-102.582,7.186l-8.782-67.758s68.08-7.888,111.364-7.888v68.46Z"/>
                                <path data-section="fans-side" data-block="6" data-tags="" d="M808.744,339.7S856.093,353.931,916,396l42.861-60.217s-60.754-37.4-121.225-54.963Z"/>
                                <path data-section="standard" data-block="7" data-tags="" d="M837.636,276.82s74.741,23.456,121.225,54.963l46.479-63.158s-78.532-41.444-137.564-57.513Z"/>
                                <path data-section="vip-stand" data-block="5" data-tags="" d="M724.091,318s21.62,2.448,80.653,20.7l28.892-58.876S782.124,263.4,732.581,256.214Z"/>
                                <path data-section="under-roof" data-block="8" data-tags="" d="M732.581,253.214s56.569,7.848,101.055,23.606l30.14-65.708s-68.965-19.393-122.413-25.656Z"/>
                                <path data-section="vip-stand" data-block="4" data-tags="" d="M626,309.469s76.818,2.322,94.091,7.532l8.49-61.787A731.921,731.921,0,0,0,626,248.028v61.441Z"/>
                                <path data-section="under-roof" data-block="9" data-tags="" d="M626,244.028s63.93,0.333,102.581,7.186l8.783-67.758s-68.08-7.888-111.364-7.888v68.46Z"/>
                                <path data-section="on-roof" data-block="13" data-tags="" d="M471.289,145.64H335L292.139,86.361s63.3-37.493,121.225-55.2Z"/>
                                <path data-section="on-roof" data-block="14" data-tags="" d="M623,145.64H477.289L419.364,31.163S510.078-.342,623-0.342V145.64Z"/>
                                <path data-section="on-roof" data-block="16" data-tags="" d="M776.711,145.64H913l42.861-59.279s-63.3-37.493-121.225-55.2Z"/>
                                <path data-section="on-roof" data-block="15" data-tags="" d="M626,145.64H771.711L829.636,31.163S738.922-.342,626-0.342V145.64Z"/>
                                <%--Stand A--%>
                                <path data-section="fans-side" data-block="1" data-tags="" d="M440.256,795.3S392.907,781.069,333,739l-42.861,60.217s60.753,37.4,121.224,54.963Z"/>
                                <path data-section="standard" data-block="12" data-tags="" d="M408.364,857.18s-74.741-23.456-121.225-54.963l-46.484,63.158s78.536,41.444,137.569,57.513Z"/>
                                <path data-section="vip-stand" data-block="2" data-tags="" d="M524.909,817s-21.621-2.447-80.653-20.694L415.364,855.18s51.512,16.421,101.054,23.606Z"/>
                                <path data-section="under-roof" data-block="11" data-tags="" d="M515.418,881.786s-56.568-7.848-101.055-23.606l-30.139,65.708s68.964,19.393,122.412,25.656Z"/>
                                <path data-section="vip-stand" data-block="3" data-tags="" d="M622,824.531s-76.818-2.322-94.091-7.533l-8.491,61.788A731.946,731.946,0,0,0,622,885.972V824.531Z"/>
                                <path data-section="under-roof" data-block="10" data-tags="" d="M622,888.972s-63.93-.333-102.582-7.186l-8.782,67.758s68.08,7.888,111.364,7.888v-68.46Z"/>
                                <path data-section="fans-side" data-block="6" data-tags="" d="M808.744,794.3S856.093,780.069,916,738l42.861,60.217s-60.754,37.4-121.225,54.963Z"/>
                                <path data-section="standard" data-block="7" data-tags="" d="M838.636,859.18s74.741-23.456,121.225-54.963l46.479,63.158s-78.532,41.444-137.564,57.513Z"/>
                                <path data-section="vip-stand" data-block="5" data-tags="" d="M725.091,817s21.62-2.447,80.653-20.694l28.892,58.876S783.124,871.6,733.581,878.786Z"/>
                                <path data-section="under-roof" data-block="8" data-tags="" d="M733.581,882.786s56.569-7.848,101.055-23.606l30.14,65.708s-68.965,19.393-122.413,25.656Z"/>
                                <path data-section="vip-stand" data-block="4" data-tags="" d="M627,824.531s76.818-2.322,94.091-7.533l8.49,61.788A731.921,731.921,0,0,1,627,885.972V824.531Z"/>
                                <path data-section="under-roof" data-block="9" data-tags="" d="M627,889.972s63.93-.333,102.581-7.186l8.783,67.758s-68.08,7.888-111.364,7.888v-68.46Z"/>
                                <path data-section="on-roof" data-block="13" data-tags="" d="M471.289,990.36H335l-42.861,59.28s63.3,37.49,121.225,55.2Z"/>
                                <path data-section="on-roof" data-block="14" data-tags="" d="M622,990.36H476.289l-57.925,114.48s90.714,31.5,203.636,31.5V990.36Z"/>
                                <path data-section="on-roof" data-block="16" data-tags="" d="M777.711,990.36H914l42.861,59.28s-63.3,37.49-121.225,55.2Z"/>
                                <path data-section="on-roof" data-block="15" data-tags="" d="M626,990.36H771.711l57.925,114.48s-90.714,31.5-203.636,31.5V990.36Z"/>
                                <%--<path data-section="" data-block="" data-tags="" d="M422.11,451.308H833.1V691.527H422.11V451.308Z"/>--%>

                                <path class="cls-1" d="M253.625 569a371.375 244.531 0 1 0 742.75 0a371.375 244.531 0 1 0 -742.75 0" />
                                <path class="cls-2" d="M422.11,451.308H833.1V691.527H422.11V451.308Z" />
                                <path class="cls-3" d="M625,450.875V691.531" />
                                <path class="cls-3" d="M423.614,530.116h34.618v78.5H423.614" />
                                <path class="cls-3" d="M423.614,647.872H499v-154.7H423.614" />
                                <path id="Shape_16_copy" data-name="Shape 16 copy" class="cls-3" d="M830.386,530.116H795.768v78.5h34.618" />
                                <path id="Shape_17_copy" data-name="Shape 17 copy" class="cls-3" d="M830.386,647.872H755v-154.7h75.389" />
                                <path class="cls-4" d="M592 569a32 32 0 1 0 64 0a32 32 0 1 0 -64 0" />


                                <text class="maptext" x="360.125" y="820.219">1</text>
                                <text class="maptext" x="468.125" y="852.219">2</text>
                                <text class="maptext" x="563.125" y="870.219">3</text>
                                <text class="maptext" x="666.125" y="868.219">4</text>
                                <text class="maptext" x="765.126" y="855.218">5</text>
                                <text class="maptext" x="871.126" y="818.219">6</text>
                                <text class="maptext" x="305.125" y="885.219">12</text>
                                <text class="maptext" x="430.125" y="921.219">11</text>
                                <text class="maptext" x="544.125" y="939.219">10</text>
                                <text class="maptext" x="669.125" y="941.219">9</text>
                                <text class="maptext" x="787.125" y="925.219">8</text>
                                <text class="maptext" x="910.125" y="888.219">7</text>
                                <text class="maptext" x="356.124" y="1053.219">13</text>
                                <text class="maptext" x="511.125" y="1075.218">14</text>
                                <text class="maptext" x="687.124" y="1075.218">15</text>
                                <text class="maptext" x="850.125" y="1047.218">16</text>
                                <text class="maptext" x="1016.125" y="736.219">1</text>
                                <text class="maptext" x="1073.125" y="635.218">2</text>
                                <text class="maptext" x="1075.125" y="533.219">3</text>
                                <text class="maptext" x="1010.125" y="426.219">4</text>
                                <text class="maptext" font-size="25" x="1080.125" y="373.219">5</text>
                                <text class="maptext" x="1166.125" y="505.219">6</text>
                                <text class="maptext" x="1172.125" y="659.219">7</text>
                                <text class="maptext" x="1082.125" y="791.218">8</text>
                                <text class="maptext" x="213.125" y="736.219">1</text>
                                <text class="maptext" x="156.124" y="635.218">2</text>
                                <text class="maptext" x="151.125" y="531.219">3</text>
                                <text class="maptext" x="218.125" y="434.219">4</text>
                                <text class="maptext" x="147.125" y="380.219">5</text>
                                <text class="maptext" x="58.125" y="513.219">6</text>
                                <text class="maptext" x="62.125" y="661.219">7</text>
                                <text class="maptext" x="143.124" y="790.219">8</text>
                                <text class="maptext" x="360.125" y="352.219">1</text>
                                <text class="maptext" x="468.125" y="313.219">2</text>
                                <text class="maptext" x="564.125" y="297.218">3</text>
                                <text class="maptext" x="665.125" y="297.218">4</text>
                                <text class="maptext" x="762.125" y="313.219">5</text>
                                <text class="maptext" x="872.126" y="350.219">6</text>
                                <text class="maptext" x="907.125" y="287.218">7</text>
                                <text class="maptext" x="784.125" y="246.219">8</text>
                                <text class="maptext" x="665.125" y="231.219">9</text>
                                <text class="maptext" x="549.125" y="229.219">10</text>
                                <text class="maptext" x="361.125" y="115.219">13</text>
                                <text class="maptext" x="511.125" y="94.219">14</text>
                                <text class="maptext" x="678.125" y="94.219">15</text>
                                <text class="maptext" x="841.125" y="115.219">16</text>
                                <text class="maptext" x="434.126" y="246.219">11</text>
                                <text class="maptext" x="305.125" y="284.219">12</text>


                                <text id="Stand_A" data-name="Stand A" class="cls-5" x="537.274" y="759.644">Stand A</text>
                                <text id="Stand_B" data-name="Stand B" class="cls-5" x="536.274" y="414.643">Stand B</text>
                                <text id="Stand_C" data-name="Stand C" class="cls-5" transform="translate(890.745 474.636) rotate(90)">Stand C</text>
                                <text id="Stand_D" data-name="Stand D" class="cls-5" transform="translate(358.627 667.019) rotate(-90)">Stand D</text>
                                </svg>
                            </div>
                        </div>
                        <p class="text-center"><strong>Explain Selected above</strong></p>
                        <ul class="list-inline text-center">
                            <li class="list-inline-item"><span class="badge badge-secondary">No Select</span></li>
                            <li class="list-inline-item"><span class="badge badge-primary">standard</span></li>
                            <li class="list-inline-item"><span class="badge badge-success">vip-stand</span></li>
                            <li class="list-inline-item"><span class="badge badge-danger">fans-side</span></li>
                            <li class="list-inline-item"><span class="badge badge-warning">under-roof</span></li>
                            <li class="list-inline-item"><span class="badge badge-info">on-roof</span></li>
                        </ul>
                    </div>
                </div>

                <!-- Ticket Info Section -->
                <div class="col-md-6">
                    <ul class="scroll-container list-group">
                        <c:forEach items="${seatByMatch}" var="seatMatch">
                            <c:if test="${seatMatch.availability > 0}">
                                <form class="item card" data-section="${seatMatch.seatarea.seatClass.seatClassName}"
                                      data-sort-price="${seatMatch.price}"
                                      data-sort-availability="${seatMatch.availability}"
                                      data-ticket-type="${seatMatch.seatarea.seatClass.seatClassName}"
                                      action="summaryTicket" method="post">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-8 text-left">
                                                <input name="matchSeatIdd" value="${seatMatch.matchSeatId}" style="display: none;">
                                                <input name="seatId" value="${seatMatch.seatarea.seatId}" style="display: none;">
                                                <h5 class="card-title fa fa-flag-o"> Vị trí ${seatMatch.seatarea.stand.standName}${seatMatch.seatarea.seatName}</h5>
                                                <ul class="list-unstyled">
                                                    <li><i class="badge ${seatMatch.seatarea.seatClass.seatClassName}">${seatMatch.seatarea.seatClass.seatClassName}</i></li>
                                                    <li><i class="fa fa-circle-thin active"></i> Còn ${seatMatch.availability} vé</li>
                                                </ul>
                                            </div>
                                            <div class="col-md-4 text-end">
                                                <h5>${seatMatch.price} vnđ ${seatMatch.matchSeatId}</h5>
                                                <p class="text-muted">cho mỗi vé</p>
                                                <div class="mb-2">
                                                    <select class="form-select" name="numberOfTicket">
                                                        <c:choose>
                                                            <c:when test="${seatMatch.availability >= 5}">
                                                                <option value="1">1 ticket</option>
                                                                <option value="2">2 tickets</option>
                                                                <option value="3">3 tickets</option>
                                                                <option value="4">4 tickets</option>
                                                                <option value="5">5 tickets</option>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach var="i" begin="1" end="${seatMatch.availability}">
                                                                    <option value="${i}">${i} ticket</option>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </select>
                                                </div>
                                                <input name="mathId" value="${matchId}" hidden/>
                                                <button class="btn btn-success w-100" type="submit">Mua ngay</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>

                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2024 Your Website. All rights reserved.</p>
            </div>
        </footer>
        <style>
            .standard {
                color:#fff;
                background-color:#007bff
            }
            .under-roof {
                color:#fff;
                background-color:#ffc118
            }
            .on-roof {
                color:#fff;
                background-color:#17a2b8
            }
            .vip-stand {
                color:#fff;
                background-color:#28a745
            }
            .fans-side {
                color:#fff;
                background-color:#dc3545
            }
        </style>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    </body>
</html>
