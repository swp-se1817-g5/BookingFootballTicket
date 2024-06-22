<%-- 
    Document   : matchDetail
    Created on : May 22, 2024, 11:17:28 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en-GB">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="google-site-verification" content="9V9Q5hFOJM5zHXaAYTZSx0b42V3BgxEFb931mguTcJY" />
        <link rel="canonical" href="https://www.footballticketpad.com/uefa-euro-2024/germany-v-scotland" />
        <link rel="alternate" hreflang="x-default" href="https://www.footballticketpad.com/uefa-euro-2024/germany-v-scotland" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Germany v Scotland Tickets | Euro 2024 | Ticket Pad</title>
        <meta name="description" content="Secure your Germany v Scotland match tickets today! Five Star Service, 100% Guarantee!">
        <meta name="keywords" content>
        <meta name="author" content>
        <meta property="og:image" content="https://www.footballticketpad.com/assets/ftp-logo.png" />
        <meta name="google-site-verification" content="O7lp3hSrStK1vKzEa9v7j3rzLLYzUpjqsSwBuQXMjNg" />
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/pages/team-page.css">

        <!-- Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- jQuery và Bootstrap JavaScript -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


        <style type="text/css">
            .availability {
                z-index: 6 !important;
            }
            .showIcons {
                margin-left:  10px;
                display: inline-block;
            }
            .icons {
                position: relative;
            }
            .toolTipText {
                font-size: 14px;
                visibility: hidden;
                width: 120px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                position: absolute !important;
                top: 0;
                z-index: 7;
                left: 29px;
                padding: 8px 4px;
            }
            .icons:hover .toolTipText, .icons:focus .toolTipText {
                visibility: visible;
            }
            .arrow-left {
                visibility: hidden;
                width: 0;
                height: 0;
                border-top: 10px solid transparent;
                border-bottom: 10px solid transparent;
                position: absolute;
                top: 6px;
                left: 22px;
                border-right:10px solid #000;
            }
            .icons:hover .arrow-left {
                visibility: visible;
            }

            /* Mobile more */
            .more-info {
                margin-top: 10px;
            }

            .more-info abbr {
                text-decoration: none;
                color: #22b639;
                font-size: 14px;
                transition: 0.3s;
            }

            .more-info abbr:hover {
                color: #01930c;
            }
            .info-icon {
                display: inline-block;
                border-radius: 60px;
                border: 1px solid #42c14b;
                padding: 2px 8px;
            }
            .tooltip
            {
                position:absolute;
                background-color: #EBEBEB;
                font-size: smaller;
                padding: 18px 19px 14px 26px;
                width: 100%;
                border-radius: 16px;
            }
            .tooltip:before{
                content: "";
                position: absolute;
                top: 50%;
                left: -7px;
                width: 0;
                border-top: 20px solid transparent;
                border-left: 20px solid #EBEBEB;
                border-right: 20px solid transparent;
                transform: rotate(45deg);
                ;
            }
            /* Mobile more */

            .force{
                margin-top:50px;
            }
            @media  screen and (min-width: 1114px) {
                .force {
                    display: none!important;
                }
            }
            .waiting-class{
                position:absolute;
                top:0;
                left:0;
                right:0;
                bottom:0;
                background: rgba(128, 128, 128, .3);
                display: flex;
                align-items: center;
                justify-content: center;

            }
            .right{
                position: relative;
            }
            .wrapper{
                display: flex;
                align-items: center;
                flex-direction: column;
                row-gap:20px;

            }
            .lds-dual-ring {
                display: inline-block;
                width: 80px;
                height: 80px;
            }
            .lds-dual-ring:after {
                content: " ";
                display: block;
                width: 64px;
                height: 64px;
                margin: 8px;
                border-radius: 50%;
                border: 6px solid #fff;
                border-color: #fff transparent #fff transparent;
                animation: lds-dual-ring 1.2s linear infinite;
            }
            @keyframes  lds-dual-ring {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }

            .desk-only{
                display: none;
            }

            @media (min-width: 800px) {
                .desk-only{
                    display: block;
                }
            }

            .match-details .left {
                font-weight: 600;
                margin-bottom: 5px;
                font-size: 16px;
                line-height: 20px;
                display: inline-block;
                padding-right: 25px;
                vertical-align: top;
                width: calc(50% - 25px);
            }
            .match-details .right {
                font-weight: 600;
                margin-bottom: 5px;
                font-size: 16px;
                line-height: 20px;
                display: inline-block;
                padding-right: 25px;
                vertical-align: top;
                width: calc(50% - 25px);
            }

        </style>
        <link rel="stylesheet" type="text/css" href="/map/167/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/app9.css?v=1.4">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/pikaday.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/chartist.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/bootstrap-multiselect.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/style-fix-v0.css?v=1.4">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery-3.3.1.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery-ui.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery.inViewport.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/jquery-validator/jquery.validate.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/jquery-form.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/bootstrap-multiselect.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/hotel.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.google.com/recaptcha/api.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/app.js?v=1.4" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/assets/frontend/2018/css/cookieconsent.min.css" />
        <script src="/assets/frontend/2018/js/cookieconsent.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
        <script type="ed1cf3913d91592aa786b287-text/javascript"> window.addEventListener("load", function() {window.cookieconsent.initialise({"palette": {"popup": {"background": "#000000B2"}, "button": {"background": "#133ABD"} }, "content": {"message": "This website uses cookies to ensure you get the best experience on our website.", "dismiss": "Got it!", "link": "Learn more", "href": "/privacy-policy"} }) }); </script>
    </head>
    <noscript><img height="1" width="1" style="display:none" src="https://www.facebook.com/tr?id=388758328741664&ev=PageView&noscript=1"/></noscript>

    <body class="template-fixture buy">
        <%@include file="header1.jsp" %>
        <div class="container-fluid">





            <input type="hidden" name="ticketMultiCap" id="ticketMultiCap" value="Ticket(s)">
            <div class="content" id="test">
                <div class="team-page fixture">

                    <%-- start modal summary--%>
                    <!-- Modal -->
                    <div class="modal fade" id="ticketSummary" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document" style="
                             top: 50px;
                             max-width: 750px;
                             width: 100%;
                             margin: 0 auto;
                             padding: 10px;
                             ">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Ticket summary</h5>
                                    <div data-dismiss="modal" aria-label="Close" data-close-search class="close"><span class="ftp-close"></span></div>
                                    </button>
                                </div>
                                <div class="modal-body" style="margin: 0 54px 0 54px;">
                                    <div class="match-details">
                                        <div class="left">
                                            <div class="bold">Germany vs Scotland</div>
                                            <div class="grey">in</div>
                                            <div class="item">UEFA EURO 2024</div>
                                            <div class="grey">at</div>
                                            <div class="item"> Allianz Arena </div>
                                            <div class="grey">on</div>
                                            <div class="item">Fri 14th June 2024 : 9:00pm</div>
                                        </div>
                                        <div class="right">
                                            <div class="item ticketType"></div>
                                            <div class="item ticketBlock"></div>
                                            <div class="bold ticketIndiv"><span id="qty">0</span> tickets at &pound;<span id="priceIndiv"></span> each</div>
                                            <div class="bold ticketSum">Sub Total price &pound;<span id="sum"></span></div>
                                            <div class="bold ticketAtt">
                                                Best value tickets
                                                Unrestricted view
                                            </div>
                                            <div class="features" id="restrictions">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="number-of-tickets">
                                        <div class="heading">Number of tickets</div>
                                        <div class="info">Please review the number of tickets selected</div>
                                        <select name="number_of_tickets" id="number_of_tickets">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                    <div class="whyDisabled text grey">
                                    </div>
                                    <input type="hidden" class="checkout_product" id="checkout_product">
                                    <input type="hidden" class="checkout_eventId" id="checkout_eventId">
                                </div>
                                <div class="modal-footer">
                                    <div style="float: center;" class="c2a_btn" id="checkout" action="https://www.footballticketpad.com/checkout">Checkout</div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="team-header" style="border-color:#a2a2a2">
                        <div class="inner">
                            <div class="left">
                                <div class="badge">
                                    <img src="https://www.footballticketpad.com/uploads/Germany.png" alt="Germany" />
                                    <img src="https://www.footballticketpad.com/uploads/scotland-hd-logo-124124.png" alt="Scotland" />
                                </div><div class="details">



                                    <h1>Germany vs Scotland</h1>
                                    <nav class="breadcrumb hidden-s-view">
                                        <ul>
                                            <li><a href="/">Home</a></li>
                                            <li><a href="/group/league/uefa-euro-2024">UEFA EURO 2024</a></li>

                                            <li>
                                                Germany v Scotland Tickets
                                            </li>
                                        </ul>
                                        <script type="application/ld+json">{"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Home","item":"https://www.footballticketpad.com"},{"@type":"ListItem","position":2,"name":"UEFA EURO 2024","item":"https://www.footballticketpad.com/group/league/uefa-euro-2024"},{"@type":"ListItem","position":3,"name":"Germany v Scotland Tickets","item":"https://www.footballticketpad.com/uefa-euro-2024/germany-v-scotland"}]}</script> </nav>
                                </div>
                            </div><div class="right">
                                <div class="heading">Fri 14th June 2024</div>
                                <div class="recently-bought">
                                    <div>Kick off: 9:00pm </div>
                                    <div>Allianz Arena
                                        Werner-Heisenberg-Allee 25,
                                        München, Germany,
                                        80939
                                    </div>
                                    <div>UEFA EURO 2024</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ftp-alerts hidden-s-view">
                        <div class="alert warning">
                            <div class="inner">
                                <div class="message">
                                    <div class="large">Popular game, price rise expected</div>
                                    <div class="small">Tip: Buy now and avoid paying a higher price</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="GroupPurchase-modal add-payment-modal">
                        <div class="overlay">
                        </div>
                        <div class="window">
                            <div class="heading">
                                <div class="text">
                                    Tickets for
                                    <strong>
                                        Germany
                                    </strong>
                                    vs
                                    <strong>
                                        Scotland
                                    </strong>
                                </div>
                                <button class="close" type="button">
                                    X
                                </button>
                            </div>
                            <div class="modal-inner">
                                <p>
                                    Tickets for
                                    <strong>
                                        Germany
                                    </strong>
                                    v
                                    <strong>
                                        Scotland
                                    </strong>
                                    are available on group purchase through our corporate sales department. Please fill in the form below and a member of our VIP Sales Team will contact you with a quote!
                                </p>
                                <form action="https://www.footballticketpad.com/group-purchase-request" class="GroupPurchaseform" method="post">
                                    <input name="_token" type="hidden" value="10Pn2tsJ5lFtcDlyo8Gv0sR6Ls7vnJYe4xUgRDBP">
                                    <input id="website" name="website" type="text" value />
                                    <input name="game" type="hidden" value="Germany v Scotland" />
                                    <input name="event_id" type="hidden" value="10019" />
                                    <div class="in-form">
                                        <input name="name" placeholder="Your Name" required type="text" />
                                    </div>
                                    <div class="in-form">
                                        <input name="company_name" placeholder="Company Name" required type="text" />
                                    </div>
                                    <div class="in-form">
                                        <input name="email" placeholder="Your Email" required type="text" />
                                    </div>
                                    <div class="in-form">
                                        <input name="tel" placeholder="Telephone/mobile" required type="text" />
                                    </div>
                                    <div class="in-form">
                                        <textarea cols="6" name="message" placeholder="Message" required rows="6" style="width: 100%;">
                                        </textarea>
                                    </div>

                                    <div class="captcha-blck pull-left columns six">
                                        <div class="g-recaptcha" data-sitekey="6LdIM0wbAAAAALLWIkAuHRy--nhoQSJBHikrkuZF"> </div>
                                    </div>
                                    <div class="captcha-err-blck pull columns six" style="color:red"></div>
                                    <div>
                                        <input class="btn pinkbtn pull-right" type="submit" value="Submit">
                                        </input>
                                    </div>
                                    <div class="post-after-response">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <style type="text/css">
                        #website {
                            display: none;
                        }
                    </style> <div class="column-section hidden-s-view">
                        <div class="inner">
                            <div class="content-column resizer">
                                <div class="text">
                                    <div class="inner-content">


                                        <h2>
                                            Germany v Scotland Match Day Tickets
                                        </h2>
                                        <p>Get your Euro 2024 football tickets for Germany v Scotland&nbsp;at Allianz Arena. Tickets will be limited with Away Section tickets also available for travelling A2 fans. Be quick and book Germany v A2 tickets today!</p>
                                    </div>
                                </div>
                                <div class="size-toggle">
                                    <div>Read More</div>
                                    <div>Read less</div>
                                </div>
                            </div><div class="content-column features">
                                <div class="item">
                                    <div class="icon"><div class="ftp-ticket"></div></div>
                                    <h4>100% Ticket Guarantee</h4>
                                    <div class="text">No need to worry - your tickets are guaranteed, no matter what.</div>
                                </div><div class="item">
                                    <div class="icon"><div class="ftp-secure"></div></div>
                                    <h4>SSL Secure Checkout</h4>
                                    <div class="text">We use high levels of data encryption here and do not share your data with any third party vendors!</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="fixture-listings disabled">
                        <div class="inner">
                            <div class="left">
                                <div class="stadium-map-heading hidden-mobile">
                                    <div class="label">Stadium Map</div>
                                </div>
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
                                            fill: #F1D446; /* Màu vang cho fans-side */
                                            transition: fill 0.3s ease;
                                        }

                                        .standard,
                                        .standard.hovered,
                                        .standard.clicked {
                                            fill: #E99C8A; /* Màu xanh lá cho standard */
                                            transition: fill 0.3s ease;
                                        }

                                        .vip-stand,
                                        .vip-stand.hovered,
                                        .vip-stand.clicked {
                                            fill: #5b5a82; /* Màu xanh dương cho vip-stand */
                                            transition: fill 0.3s ease;
                                        }

                                        .under-roof,
                                        .under-roof.hovered,
                                        .under-roof.clicked {
                                            fill: #A96EBB; /* Màu vàng cho under-roof */
                                            transition: fill 0.3s ease;
                                        }

                                        .on-roof,
                                        .on-roof.hovered,
                                        .on-roof.clicked {
                                            fill: #85E1D5; /* Màu hồng cho on-roof */
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
                                    </svg>


                                    <div class="section-toolTip">
                                        <div class="block">Block: <span></span></div>
                                        <div class="availability"><span></span> tickets remaining</div>
                                        <div class="price"></div>
                                    </div>

                                    <div class="for-s-view">
                                        <div class="fab" id="edit_featurs_mobile">
                                            <span class="ftp-filters"></span>
                                        </div>
                                        <div class="filters-modal mobile">
                                            <div class="inner">
                                                <span class="ftp-close"></span>
                                                <div class="title">Filter tickets</div>
                                                <div class="half-width">
                                                    <label for>Seat features</label>
                                                    <select name="seating_section_mobile" id="seating_section_mobile">
                                                        <option value="any">Any</option>
                                                        <option value="category-1">Category 1</option>
                                                        <option value="category-2">Category 2</option>
                                                        <option value="category-3">Category 3</option>
                                                        <option value="longside-lower-tier">Longside Lower Tier</option>
                                                        <option value="prime-seats">Prime Seats</option>
                                                        <option value="shortside-upper-tier">Shortside Upper Tier</option>
                                                    </select>
                                                    <span class="ftp-down-chevron"></span>
                                                </div>
                                                <div class="half-width">
                                                    <label for>Delivery Options</label>
                                                    <select name="delivery_option_mobile" id="delivery_option_mobile">
                                                        <option value="-1">Select</option>
                                                        <option value="0">Mail</option>
                                                        <option value="1">Collect on match day</option>
                                                    </select>
                                                    <span class="ftp-down-chevron"></span>
                                                </div>
                                                <div class="full-width">
                                                    <div class="c2a_btn">Apply filters</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="seating hidden-s-view">
                                    <div class="heading">Explain Selected above</div>
                                    <div class="column" id="all-seating">
                                        <div class="item active" data-type="standard">
                                            <div class="key" style="border-color:#E99C8A" "></div><div class="text">
                                                Standard
                                            </div>
                                        </div>
                                        <div class="item active" data-type="fans-side">
                                            <div class="key" style="border-color:#F1D446" "></div><div class="text">
                                                Fans side
                                            </div>
                                        </div>
                                        <div class="item active" data-type="no-select">
                                            <div class="key" style="border-color:#cccccc" "></div><div class="text">
                                                No Select
                                            </div>
                                        </div>
                                        <div class="item active" data-type="under-roof">
                                            <div class="key" style="border-color:#A96EBB" "></div><div class="text">
                                                Under the Roof
                                            </div>
                                        </div>
                                        <div class="item active" data-type="vip-stand">
                                            <div class="key" style="border-color:#5b5a82" "></div><div class="text">
                                                Vip Seat
                                            </div>
                                        </div>
                                        <div class="item active" data-type="on-roof">
                                            <div class="key" style="border-color:#85E1D5" "></div><div class="text">
                                                On the Roof
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="right waiting-listing">
                                <div class="listing-sort hidden-s-view">
                                    <div class="number-of-seats">
                                        <select name="number_of_seats" id="number_of_seats">
                                            <option value="-1"> Select Tickets</option >
                                            <option value="1"> 1 Ticket</option >
                                            <option value="2"> 2 Ticket</option >
                                            <option value="3"> 3 Ticket</option >
                                            <option value="4"> 4 Ticket</option >
                                            <option value="5"> 5+ Ticket</option >
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                    <div class="seated-together">
                                        <div class="title">Seated together</div>
                                        <label class="switch">
                                            <input type="checkbox" name="seated_together" class="switch_preference">
                                            <span class="slider round"></span>
                                        </label>
                                    </div>
                                    <div class="filters_btn" id="show_filters">
                                        <span class="ftp-filters"></span>
                                        Filters
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                    <div class="filters-modal">
                                        <div class="inner">
                                            <span class="ftp-close"></span>
                                            <div class="title">Filter tickets</div>
                                            <div class="half-width">
                                                <label for>Seat features</label>
                                                <select name="seating_section" id="seating_section" class="seating_section_web">
                                                    <option value="any">Any</option>
                                                    <option value="category-1">Category 1</option>
                                                    <option value="category-2">Category 2</option>
                                                    <option value="category-3">Category 3</option>
                                                    <option value="longside-lower-tier">Longside Lower Tier</option>
                                                    <option value="prime-seats">Prime Seats</option>
                                                    <option value="shortside-upper-tier">Shortside Upper Tier</option>
                                                </select>
                                                <span class="ftp-down-chevron"></span>
                                            </div>
                                            <div class="half-width">
                                                <label for>Delivery Options</label>
                                                <select name="delivery_option" id="delivery_option">
                                                    <option value="-1">Select</option>
                                                    <option value="0">Mail</option>
                                                    <option value="1">Collect on match day</option>
                                                </select>
                                                <span class="ftp-down-chevron"></span>
                                            </div>
                                            <div class="full-width">
                                                <div class="c2a_btn">Apply filters</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="listing-holder hidden-s-view">
                                    <c:forEach items="${seatByMatch}" var="seatMatch">
                                        <div class="listing-inner">
                                            <div class="item trigger_category-3" 
                                                 data-section="${seatMatch.seatarea.seatClass.seatClassName}" 
                                                 data-sort-original="1" 
                                                 data-sort-section="1" 
                                                 data-sort-price="772.50" 
                                                 data-sort-availability="2" 
                                                 data-delivery="0" 
                                                 data-ticket-type="${seatMatch.seatarea.seatClass.seatClassName}" 
                                                 data-preference="0" 
                                                 data-product="282867" 
                                                 data-event_id="10019"
                                                 style="border-color:#86A8BF">
                                                <div class="overlay" style="background-color:#86A8BF;"></div>
                                                <div class="seat">
                                                    <div class="div_ticket-type">
                                                        ${seatMatch.seatarea.stand.standName}${seatMatch.seatarea.seatName}
                                                    </div>
                                                    <div></div>
                                                </div><div class="availability">
                                                    <div class="quantity" style="color:red">
                                                        only <span>2</span>
                                                        ticket(s) <div class="showIcons">
                                                            <span class="icons">
                                                                <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                                <div class="arrow-left"></div>
                                                                <span class="toolTipText">Mobile tickets</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="info">
                                                        <div>Others</div>
                                                    </div>
                                                </div><div class="price">${seatMatch.price}&#8363;</div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                                    <a href="#ticketSummary" data-toggle="modal">Book now</a>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="column-section force">
                <div class="inner">
                    <div class="inner">
                        <div class="content-column resizer">
                            <div class="text">
                                <div class="inner-content">
                                    <h2>Germany v Scotland Match Day Tickets</h2>
                                    <p>Get your Euro 2024 football tickets for Germany v Scotland&nbsp;at Allianz Arena. Tickets will be limited with Away Section tickets also available for travelling A2 fans. Be quick and book Germany v A2 tickets today!</p>
                                </div>
                            </div>
                            <div class="size-toggle">
                                <div>Read More</div>
                                <div>Read less</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script async type="ed1cf3913d91592aa786b287-text/javascript" src="//widget.trustpilot.com/bootstrap/v5/tp.widget.bootstrap.min.js"></script>
<%@include file="footer.jsp" %>
<script src="https://www.footballticketpad.com/assets/frontend/2018/js/slider.min.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<script src="https://www.footballticketpad.com/assets/frontend/2018/js/common_v1-1.js?v=1.4" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<script src="https://www.footballticketpad.com/assets/frontend/2018/js/app-mods.js?v=1.4" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.css">
<script async defer src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<script async defer src="https://www.footballticketpad.com/assets/frontend/2018/js/fixtureV4-4.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<script async defer src="https://www.footballticketpad.com/assets/frontend/2018/js/fixture-ajax.js" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-KWDJ87" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-57128660-1" type="ed1cf3913d91592aa786b287-text/javascript"></script>
<script src="/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="ed1cf3913d91592aa786b287-|49" defer></script>

</body>
</html>
