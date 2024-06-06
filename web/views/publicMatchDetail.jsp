<%-- 
    Document   : matchDetail
    Created on : May 22, 2024, 11:17:28 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <div class="top-bar" data-mod="sticky" data-anchor="body" data-className="sticky">
            <div class="flex-topbar">

                <div class="trustpilot-widget" data-locale="en-GB" data-template-id="5419b6a8b0d04a076446a9ad" data-businessunit-id="54f5f5ad0000ff00057dce30" data-style-height="20px" data-style-width="100%" data-theme="dark">
                    <a href="https://uk.trustpilot.com/review/footballticketpad.com" target="_blank" rel="noopener">Trustpilot</a>
                </div>

                <div class="item">e: <a href="mailto:">info@footballticketpad.com</a></div>
                <div class="item">t: <a href="tel:+442071508525">+44 (0)20 71508525</a></div>
            </div>
        </div>
        <header id="header" class="header-top" data-mod="sticky" data-anchor="body" data-className="sticky">
            <div class="header-inner">
                <a href="https://www.footballticketpad.com" class="logo">
                    <img class="black-logo" src="https://www.footballticketpad.com/assets/css/images/logo.png"></img>
                </a>
                <div class="header-right">
                    <style type="text/css">
                        .nav-icon svg#cart {
                            fill: #1131a0;
                            width: 30px;
                            height: auto;
                            margin-top: 4px;
                        }
                        ul#UlCartItems::-webkit-scrollbar {
                            width: 3px;
                            background: transparent; /* make scrollbar transparent */
                        }
                        li.view-cart {
                            text-align: center !important;
                            padding:5px 0px;
                            margin:0;
                            margin-right: 5px;

                        }
                        li.view-cart a {
                            padding-left: 15px !important;
                            width: 50% !important;
                            display: inline !important;
                            padding: 5px 15px;
                        }
                        li.view-cart a:not(:first-child){
                            border-left:1px solid #e0e0e0;
                        }
                        .delete-cart-disable {
                            pointer-events: none;
                            cursor: default;
                        }
                        .call-button {
                            position: absolute;
                            right: 210px;
                        }
                        .call-button.user-logged-out {
                            right: 186px;
                        }

                    </style>
                    <input type="hidden" name="checkout-delete-room" value="https://www.footballticketpad.com/checkout/deleteRoom">
                    <input type="hidden" name="delete-cart-url" id="delete-cart-url" value="https://www.footballticketpad.com/checkout/deleteTicketHotel">
                    <input type="hidden" name="product_ticket_id" id="product_ticket_id" value>
                    <input type="hidden" name="addRoomTrans" id="addRoomTrans" value="add room">
                    <nav class="header-main-menu">
                        <ul>
                            <li>
                                <a class="has-child cross"><i class=" header-hot"></i>Popular Games</a>
                                <ul class="single-block"><li>
                                        <a href="/uefa-euro-2024/germany-v-scotland">
                                            <div class="text">Germany v Scotland</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/italy-v-albania">
                                            <div class="text">Italy v Albania</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/serbia-v-england">
                                            <div class="text">Serbia v England</div>
                                        </a>
                                    </li><li>
                                        <a href="/community-shield/community-shield-manchester-united-v-manchester-city">
                                            <div class="text">Community Shield -Manchester United v Manchester City</div>
                                        </a>
                                    </li><li>
                                        <a href="/friendly/tottenham-v-bayern-munich">
                                            <div class="text">Tottenham v Bayern Munich </div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/uefa-euro-2024-final">
                                            <div class="text">UEFA Euro 2024 Final</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/spain-v-italy">
                                            <div class="text">Spain v Italy</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/england-v-slovenia">
                                            <div class="text">England v Slovenia</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/scotland-v-hungary">
                                            <div class="text">Scotland v Hungary</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/scotland-v-switzerland">
                                            <div class="text">Scotland v Switzerland</div>
                                        </a>
                                    </li><li>
                                        <a href="/uefa-euro-2024/denmark-v-england">
                                            <div class="text">Denmark v England</div>
                                        </a>
                                    </li></ul>
                            </li>
                            <li>
                                <a href="/teams" class="has-child">Top Teams</a>
                                <ul class="advanced">
                                    <div class="half left"><li>
                                            <a href="https://www.footballticketpad.com/group/club/arsenal-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-15.png);"></span>Arsenal</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/chelsea-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-14.png);"></span>Chelsea</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/manchester-united-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-13.png);"></span>Manchester United</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/manchester-city-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-23.png);"></span>Manchester City </div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/liverpool-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-22.png);"></span>Liverpool</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/tottenham-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-29.png);"></span>Tottenham Hotspur</div>
                                            </a>
                                        </li></div>
                                    <div class="half right"><li>
                                            <a href="https://www.footballticketpad.com/group/club/everton-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-19.png);"></span>Everton</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/barcelona">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-99.png);"></span>Barcelona</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/real-madrid">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-34.png);"></span>Real Madrid</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/bayern-munich">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-33.png);"></span>Bayern Munich</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/borussia-dortmund">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-35.png);"></span>Borussia Dortmund</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/inter-milan">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-132.png);"></span>Inter Milan</div>
                                            </a>
                                        </li></div>
                                    <li><a href="/teams"><div class="text view-all">View all teams ></div></a></li>
                                </ul>
                            </li>
                            <li>
                                <a class="has-child cross">Country</a>
                                <ul class="advanced">
                                    <div class="half left"><li>
                                            <a href="https://www.footballticketpad.com/group/club/belgium">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-434.png);"></span>Belgium</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/croatia">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-216.png);"></span>Croatia</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/england">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-158.png);"></span>England</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/france">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-194.png);"></span>France</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/germany">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-38.png);"></span>Germany</div>
                                            </a>
                                        </li></div>
                                    <div class="half right"><li>
                                            <a href="https://www.footballticketpad.com/group/club/italy">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-160.png);"></span>Italy</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/netherlands">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-200.png);"></span>Netherlands</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/portugal">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-109.png);"></span>Portugal</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/scotland">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-204.png);"></span>Scotland</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/club/switzerland">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/club-214.png);"></span>Switzerland</div>
                                            </a>
                                        </li></div>
                                </ul>
                            </li>
                            <li>
                                <a href="/leagues" class="has-child">Tournaments</a>
                                <ul class="advanced">
                                    <div class="half left"><li>
                                            <a href="https://www.footballticketpad.com/group/league/premier-league">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-7.png);"></span>Premier League</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/fa-cup">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-46.png);"></span>FA Cup </div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/serie-a">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-113.png);"></span>Serie A</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/ligue-1">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-43.png);"></span>Ligue 1</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/uefa-euro-2024">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-757.png);"></span>UEFA EURO 2024</div>
                                            </a>
                                        </li></div>
                                    <div class="half right"><li>
                                            <a href="https://www.footballticketpad.com/group/league/la-liga">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-41.png);"></span>La Liga</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/carabao-cup">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-446.png);"></span>Carabao Cup</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/champions-league-tickets">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-44.png);"></span>Champions League</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/copa-america">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-835.png);"></span>Copa America</div>
                                            </a>
                                        </li><li>
                                            <a href="https://www.footballticketpad.com/group/league/olympic-game">
                                                <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-840.png);"></span>Olympic Game</div>
                                            </a>
                                        </li></div>
                                    <li><a href="/leagues"><div class="text view-all">View all leagues ></div></a></li>
                                </ul>
                            </li>
                            <li><a href="https://www.footballticketpad.com/contact-us">Contact Us</a></li>
                            <li class="double-block">
                                <a href="tel:+44 (0)20 71508525">Call us</a><a href="mailto:info@footballticketpad.com">Email us</a>
                            </li>
                            <li><a data-auth="login" href="javascript:void(0)">Login</a></li>
                            <li class="sell"><a data-quick-list="search" data-disabled class="sell" href="#">sell</a></li>
                            <div class="cart user-nav">
                                <a href="#">
                                    <div class="nav-icon desktop">
                                        <svg id="cart" data-name="Capa 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 469.33">
                                        <path d="M509.87,89.6c-2.14-2.13-4.27-4.27-8.54-4.27H96L85.33,29.87c0-4.27-6.4-8.54-10.66-8.54h-64C4.27,21.33,0,25.6,0,32S4.27,42.67,10.67,42.67H66.13l51.2,260.26c6.4,34.14,38.4,59.74,72.54,59.74H435.2c6.4,0,10.67-4.27,10.67-10.67s-4.27-10.67-10.67-10.67H192c-17.07,0-34.13-8.53-42.67-23.46L460.8,275.2c4.27,0,8.53-4.27,8.53-8.53L512,96S512,91.73,509.87,89.6ZM450.13,256,138.67,296.53l-38.4-192H486.4Z" transform="translate(0 -21.33)"></path>
                                        <path d="M181.33,384a53.34,53.34,0,1,0,53.34,53.33A52.82,52.82,0,0,0,181.33,384Zm0,85.33c-17.06,0-32-14.93-32-32s14.94-32,32-32,32,14.94,32,32S198.4,469.33,181.33,469.33Z" transform="translate(0 -21.33)"></path>
                                        <path d="M394.67,384A53.34,53.34,0,1,0,448,437.33,52.82,52.82,0,0,0,394.67,384Zm0,85.33c-17.07,0-32-14.93-32-32s14.93-32,32-32,32,14.94,32,32S411.73,469.33,394.67,469.33Z" transform="translate(0 -21.33)"></path>
                                        </svg>
                                        <div class="item-added">
                                            <span id="lblCartCount" data-cart-tot-count="0" class="item-no">0</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </ul>
                        <div class="call-button hidden-desktop user-logged-out">
                            <a href="tel:+44 (0)20 71508525">
                                <img src="/assets/svg/call-icon.svg" alt="call-icon">
                            </a>
                        </div>
                        <div class="cart-mobile-wrapper user-logged-out">
                            <div class="cart user-nav">
                                <div class="nav-icon">
                                    <svg id="cart" data-name="Capa 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 469.33">
                                    <path d="M509.87,89.6c-2.14-2.13-4.27-4.27-8.54-4.27H96L85.33,29.87c0-4.27-6.4-8.54-10.66-8.54h-64C4.27,21.33,0,25.6,0,32S4.27,42.67,10.67,42.67H66.13l51.2,260.26c6.4,34.14,38.4,59.74,72.54,59.74H435.2c6.4,0,10.67-4.27,10.67-10.67s-4.27-10.67-10.67-10.67H192c-17.07,0-34.13-8.53-42.67-23.46L460.8,275.2c4.27,0,8.53-4.27,8.53-8.53L512,96S512,91.73,509.87,89.6ZM450.13,256,138.67,296.53l-38.4-192H486.4Z" transform="translate(0 -21.33)"></path>
                                    <path d="M181.33,384a53.34,53.34,0,1,0,53.34,53.33A52.82,52.82,0,0,0,181.33,384Zm0,85.33c-17.06,0-32-14.93-32-32s14.94-32,32-32,32,14.94,32,32S198.4,469.33,181.33,469.33Z" transform="translate(0 -21.33)"></path>
                                    <path d="M394.67,384A53.34,53.34,0,1,0,448,437.33,52.82,52.82,0,0,0,394.67,384Zm0,85.33c-17.07,0-32-14.93-32-32s14.93-32,32-32,32,14.94,32,32S411.73,469.33,394.67,469.33Z" transform="translate(0 -21.33)"></path>
                                    </svg>
                                    <div class="item-added">
                                        <span id="lblCartCount" class="item-no">0</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="search-box user-logged-out hidden-mobile">
                            <button data-search="search" type="button" class="search-btn">
                                <div class="ftp-view"></div>
                            </button>
                        </div>
                        <div class="mobile-menu-btn">
                            <span class="ftp-menu"></span>
                        </div>
                    </nav>
                    <div class="auth_window">
                        <div class="overlay"></div>
                        <div class="window">
                            <div class="left-image" style="background-image: url(https://www.footballticketpad.com/assets/frontend/2018/images/auth_feature.png);"></div>
                            <form method="post" class="signin-form enquiryform">
                                <div class="close" data-close-auth>X</div>
                                <div class="heading">Sign in</div>
                                <button type="button" class="api_login facebook">
                                    <span class="ftp-facebook-logo"></span>
                                    Continue with Facebook
                                </button>
                                <button type="button" class="api_login google">
                                    <span class="ftp-GoogleLogoColor"><span class="path1"></span><span class="path2"></span><span class="path3"></span><span class="path4"></span></span>
                                    Sign in with Google
                                </button>
                                <div class="separator">
                                    <div class="text">or</div>
                                </div>
                                <input type="email" name="username" id="username" placeholder="Email address" />
                                <input type="password" name="password" id="password" placeholder="Password" />
                                <div class="login-message" style="color: #ff0000;"></div>
                                <br>
                                <button type="submit" name="auth_login" class="c2a_btn login-btn">Sign in</button>
                                <div class="options">
                                    <a href="/forgot-password">Forgot your password?</a>
                                </div>
                                <div class="register">Don't have an account? <a href="https://www.footballticketpad.com/registration">Sign up</a></div>
                            </form>
                        </div>
                    </div>
                    <div class="search_window">
                        <input style="opacity:0 " name id="convUpcomingGame" value="Upcoming game">
                        <div class="overlay"></div>
                        <div class="window">
                            <div data-close-search class="close"><span class="ftp-close cross"></span></div>
                            <span class="search-h1">Search Upcoming Games or Teams</span>
                            <div class="content">
                                <form method="get" action="/ticket-search">
                                    <input type="text" class="modal-forminput ui-autocomplete-input searchboxhome" name="search" placeholder="E.g. Liverpool" autocomplete="off" />
                                    <button type="submit" name="submit-search">
                                        <div class="icon">
                                            <div class="ftp-view"></div>
                                        </div>
                                    </button>
                                </form>
                            </div>
                            <div id="results-container" class="results">
                                <h2>Quick results</h2>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="quick_list_window" data-target loginStatus=" 0 ">
                    <div class="overlay"></div>
                    <div class="window">
                        <div data-mod="close-modal" class="close">
                            <div class="cross">
                                <img src="/assets/frontend/2018/images/001-close.svg" alt="close" width="20px">
                            </div>
                        </div>

                        <div class="quick-list-tickets active">
                            <form method="post" class="quick-list-form">
                                <div class="heading">Quick List Tickets</div>
                                <div class="full-width">
                                    <label for>1. Search for a game to list for</label>
                                    <input type="text" class="game_list_for" name="game_list_for" placeholder="E.g Liverpool vs Everton" required />
                                    <input type="hidden" class="ticket_id" required />
                                    <input type="hidden" class="booking_fees_perc" required />
                                    <input type="hidden" class="stadium_url" required />
                                </div>
                                <div class="full-width">
                                    <div class="half-width ticket_type_div">
                                        <label for>Select Ticket Type</label>
                                        <select name="ticket_type" id="ticket_type" required>
                                            <option value></option>
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                        <div class="removeLaters"></div>
                                    </div>
                                    <div class="half-width">
                                        <input type="hidden" name="conSelect" id="conSelect" value="Select">
                                        <label for>Ticket Category</label>
                                        <select name="form_of_ticket" id="ticket_category" required>
                                            <option value></option>
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                </div>
                                <div class="full-width">
                                    <div class="half-width hidden" id="team_side_div">
                                        <label for>Team side</label>
                                        <select name="team_side" id="team_side" required>
                                            <option value="0"></option>
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                        <input type="hidden" name="guest_stadium" value="0" id="guest_stadium" />
                                    </div>
                                </div>
                                <div class="full-width">
                                    <div class="half-width">
                                        <label for>Block</label>
                                        <input type="text" class="loc_block" name="loc_block" placeholder="E.g None Selected" required disabled />
                                        <input type="hidden" name="loc_row" value />
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                    <div class="half-width">
                                        <label for>Row</label>
                                        <input type="text" class="loc_row" name="loc_row" />
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                    <div class="half-width">
                                        <label for>Quantity</label>
                                        <select name="number_of_ticket" id="quantity" required>
                                            <option value="1">1</option >
                                            <option value="2">2</option >
                                            <option value="3">3</option >
                                            <option value="4">4</option >
                                            <option value="5">5</option >
                                            <option value="6">6</option >
                                            <option value="7">7</option >
                                            <option value="8">8</option >
                                            <option value="9">9</option >
                                            <option value="10">10</option >
                                            <option value="11">11</option >
                                            <option value="12">12</option >
                                            <option value="13">13</option >
                                            <option value="14">14</option >
                                            <option value="15">15</option >
                                            <option value="16">16</option >
                                            <option value="17">17</option >
                                            <option value="18">18</option >
                                            <option value="19">19</option >
                                            <option value="20">20</option >
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                    <div class="half-width">
                                        <div class="price">
                                            <label for>Price (per ticket)</label>
                                            <input type="text" class="price_per_ticket" autocomplete="off" decimalalert="Please make sure that the price is a valid number without currency symbols." name="price" required />
                                            <div class="tip"></div>
                                            <input type="hidden" id="conListingPrice" value="Listing price">
                                            <div class="list-price" currency="&pound;"></div>
                                        </div>
                                    </div>
                                    <div class="half-width">
                                        <div class="restrictions-yes">
                                            <label for>Listing Notes</label>
                                            <select name="ticket_notes" class="ticket_notes">
                                            </select>
                                            <span class="ftp-down-chevron"></span>
                                        </div>
                                    </div>
                                    <div class="half-width">
                                        <label for>Split?</label>
                                        <select name="sell_preference" id="sell_preference" required>
                                            <option value> - SELECT - </option >
                                            <option value="0">No preference</option >
                                            <option value="1">All together</option >
                                            <option value="2">Avoid leaving 1 ticket</option >
                                            <option value="3">In pairs</option >
                                        </select>
                                        <span class="ftp-down-chevron"></span>
                                    </div>
                                </div>
                                <div class="full-width">

                                    <div class="half-width hidden list_competitively_check">
                                        <label>List Competitvely?</label>
                                        <input name="list_competitively" type="radio" id="list_comp_yes" class="hide" value="1">
                                        <label class="radio-label" for="list_comp_yes">Yes</label>
                                        <input name="list_competitively" type="radio" id="list_comp_no" class="hide" checked value="0">
                                        <label class="radio-label" for="list_comp_no">No</label>
                                    </div>
                                    <div class="half-width hidden ready_ship_check">
                                        <label>Ready to Ship?</label>
                                        <input name="ready-to-ship" type="radio" id="ready_to_ship_yes" class="hide" checked value="1">
                                        <label class="radio-label" for="ready_to_ship_yes">Yes</label>
                                        <input name="ready-to-ship" type="radio" id="ready_to_ship_no" class="hide" value="0">
                                        <label class="radio-label" for="ready_to_ship_no">No</label>
                                    </div>
                                </div>
                                <div class="sell_1_btn" action="https://www.footballticketpad.com/ticket/sell"> Next </div>
                                <div class="next_btn" style="display:none"> Next </div>
                            </form>
                        </div>
                        <div class="create-account">
                            <form class="login_form">
                                <div class="heading">Registered User</div>
                                <div class="full-width">
                                    <div class="half-width">
                                        <label for="login-username">Email</label>
                                        <input type="email" name="login[username]" id="login-username" value />
                                    </div>
                                    <div class="half-width">
                                        <label for="login-password">Password</label>
                                        <input type="password" name="login[password]" id="login-password" value />
                                    </div>
                                    <div class="full-width">
                                        <div class="message"></div>
                                    </div>
                                    <div class="full-width">
                                        <input type="button" class="btn bluebtn dynamic-login c2a_btn" value="LOGIN">
                                    </div>
                                </div>
                            </form>
                            <form method="post" class="create-account-form">
                                <div class="heading">Create account</div>
                                <div class="full-width">
                                    <div class="message"></div>
                                </div>
                                <div class="full-width">
                                    <div class="half-width">
                                        <label for="fist_name">First name</label>
                                        <input id="fist_name" type="text" name="sell_modal_account_fname" requiredalert="This field is required." minalert="This field must be at least 2 characters long." required />
                                    </div>
                                    <div class="half-width">
                                        <label for="last_name">Last name</label>
                                        <input id="last_name" type="text" name="sell_modal_account_lname" required />
                                    </div>
                                    <div class="half-width">
                                        <label for="email">Email</label>
                                        <input id="email" type="email" name="sell_modal_account_email" required />
                                    </div>
                                    <div class="half-width">
                                        <label for="repeat_email">Repeat email</label>
                                        <input id="repeat_email" type="email" name="sell_modal_account_repeatemail" emailmismatchalert="The email addresses entered do not match." required />
                                    </div>
                                    <div class="half-width">
                                        <label for="password">Password</label>
                                        <input id="sell_modal_account_password" type="password" passminalert="Your password is too short, it must be between 8 and 16 characters long." passmaxalert="Your password is too short, it must be between 8 and 16 characters long." name="sell_modal_account_password" required />
                                    </div>
                                    <div class="half-width">
                                        <label for="repeat_password">Repeat password</label>
                                        <input id="repeat_password" type="password" name="sell_modal_account_repeatpassword" passMismatch="The passwords entered do not match." required />
                                    </div>
                                    <div class="half-width">
                                        <div class="tel-no">
                                            <label for="tel_no">Mobile Number</label>
                                            <select name="sell_modal_account_telextn" id="tel_no_extenstion">
                                                <option value="0093">+ 0093</option>
                                                <option value="00355">+ 00355</option>
                                                <option value="00213">+ 00213</option>
                                                <option value="00376">+ 00376</option>
                                                <option value="00244">+ 00244</option>
                                                <option value="001-268">+ 001-268</option>
                                                <option value="0054">+ 0054</option>
                                                <option value="00374">+ 00374</option>
                                                <option value="0061">+ 0061</option>
                                                <option value="0043">+ 0043</option>
                                                <option value="00994">+ 00994</option>
                                                <option value="001-242">+ 001-242</option>
                                                <option value="00973">+ 00973</option>
                                                <option value="00880">+ 00880</option>
                                                <option value="001-246">+ 001-246</option>
                                                <option value="00375">+ 00375</option>
                                                <option value="0032">+ 0032</option>
                                                <option value="00501">+ 00501</option>
                                                <option value="00229">+ 00229</option>
                                                <option value="00975">+ 00975</option>
                                                <option value="00591">+ 00591</option>
                                                <option value="00387">+ 00387</option>
                                                <option value="00267">+ 00267</option>
                                                <option value="0055">+ 0055</option>
                                                <option value="00673">+ 00673</option>
                                                <option value="00359">+ 00359</option>
                                                <option value="00226">+ 00226</option>
                                                <option value="00257">+ 00257</option>
                                                <option value="00855">+ 00855</option>
                                                <option value="00237">+ 00237</option>
                                                <option value="001">+ 001</option>
                                                <option value="00238">+ 00238</option>
                                                <option value="00236">+ 00236</option>
                                                <option value="00235">+ 00235</option>
                                                <option value="0056">+ 0056</option>
                                                <option value="0086">+ 0086</option>
                                                <option value="0057">+ 0057</option>
                                                <option value="00269">+ 00269</option>
                                                <option value="00243">+ 00243</option>
                                                <option value="00242">+ 00242</option>
                                                <option value="00506">+ 00506</option>
                                                <option value="00225">+ 00225</option>
                                                <option value="00385">+ 00385</option>
                                                <option value="0053">+ 0053</option>
                                                <option value="00357">+ 00357</option>
                                                <option value="00420">+ 00420</option>
                                                <option value="0045">+ 0045</option>
                                                <option value="00253">+ 00253</option>
                                                <option value="001-767">+ 001-767</option>
                                                <option value="001-809 and 1-829">+ 001-809 and 1-829</option>
                                                <option value="00593">+ 00593</option>
                                                <option value="0020">+ 0020</option>
                                                <option value="00503">+ 00503</option>
                                                <option value="00240">+ 00240</option>
                                                <option value="00291">+ 00291</option>
                                                <option value="00372">+ 00372</option>
                                                <option value="00251">+ 00251</option>
                                                <option value="00679">+ 00679</option>
                                                <option value="00358">+ 00358</option>
                                                <option value="0033">+ 0033</option>
                                                <option value="00241">+ 00241</option>
                                                <option value="00220">+ 00220</option>
                                                <option value="00995">+ 00995</option>
                                                <option value="0049">+ 0049</option>
                                                <option value="00233">+ 00233</option>
                                                <option value="0030">+ 0030</option>
                                                <option value="001-473">+ 001-473</option>
                                                <option value="00502">+ 00502</option>
                                                <option value="00224">+ 00224</option>
                                                <option value="00245">+ 00245</option>
                                                <option value="00592">+ 00592</option>
                                                <option value="00509">+ 00509</option>
                                                <option value="00504">+ 00504</option>
                                                <option value="0036">+ 0036</option>
                                                <option value="00354">+ 00354</option>
                                                <option value="0091">+ 0091</option>
                                                <option value="0062">+ 0062</option>
                                                <option value="0098">+ 0098</option>
                                                <option value="00964">+ 00964</option>
                                                <option value="00353">+ 00353</option>
                                                <option value="00972">+ 00972</option>
                                                <option value="0039">+ 0039</option>
                                                <option value="001-876">+ 001-876</option>
                                                <option value="0081">+ 0081</option>
                                                <option value="00962">+ 00962</option>
                                                <option value="007">+ 007</option>
                                                <option value="00254">+ 00254</option>
                                                <option value="00686">+ 00686</option>
                                                <option value="00850">+ 00850</option>
                                                <option value="0082">+ 0082</option>
                                                <option value="00965">+ 00965</option>
                                                <option value="00996">+ 00996</option>
                                                <option value="00856">+ 00856</option>
                                                <option value="00371">+ 00371</option>
                                                <option value="00961">+ 00961</option>
                                                <option value="00266">+ 00266</option>
                                                <option value="00231">+ 00231</option>
                                                <option value="00218">+ 00218</option>
                                                <option value="00423">+ 00423</option>
                                                <option value="00370">+ 00370</option>
                                                <option value="00352">+ 00352</option>
                                                <option value="00389">+ 00389</option>
                                                <option value="00261">+ 00261</option>
                                                <option value="00265">+ 00265</option>
                                                <option value="0060">+ 0060</option>
                                                <option value="00960">+ 00960</option>
                                                <option value="00223">+ 00223</option>
                                                <option value="00356">+ 00356</option>
                                                <option value="00692">+ 00692</option>
                                                <option value="00222">+ 00222</option>
                                                <option value="00230">+ 00230</option>
                                                <option value="0052">+ 0052</option>
                                                <option value="00691">+ 00691</option>
                                                <option value="00373">+ 00373</option>
                                                <option value="00377">+ 00377</option>
                                                <option value="00976">+ 00976</option>
                                                <option value="00382">+ 00382</option>
                                                <option value="00212">+ 00212</option>
                                                <option value="00258">+ 00258</option>
                                                <option value="0095">+ 0095</option>
                                                <option value="00264">+ 00264</option>
                                                <option value="00674">+ 00674</option>
                                                <option value="00977">+ 00977</option>
                                                <option value="0031">+ 0031</option>
                                                <option value="0064">+ 0064</option>
                                                <option value="00505">+ 00505</option>
                                                <option value="00227">+ 00227</option>
                                                <option value="00234">+ 00234</option>
                                                <option value="0047">+ 0047</option>
                                                <option value="00968">+ 00968</option>
                                                <option value="0092">+ 0092</option>
                                                <option value="00680">+ 00680</option>
                                                <option value="00507">+ 00507</option>
                                                <option value="00675">+ 00675</option>
                                                <option value="00595">+ 00595</option>
                                                <option value="0051">+ 0051</option>
                                                <option value="0063">+ 0063</option>
                                                <option value="0048">+ 0048</option>
                                                <option value="00351">+ 00351</option>
                                                <option value="00974">+ 00974</option>
                                                <option value="0040">+ 0040</option>
                                                <option value="00250">+ 00250</option>
                                                <option value="001-869">+ 001-869</option>
                                                <option value="001-758">+ 001-758</option>
                                                <option value="001-784">+ 001-784</option>
                                                <option value="00685">+ 00685</option>
                                                <option value="00378">+ 00378</option>
                                                <option value="00239">+ 00239</option>
                                                <option value="00966">+ 00966</option>
                                                <option value="00221">+ 00221</option>
                                                <option value="00381">+ 00381</option>
                                                <option value="00248">+ 00248</option>
                                                <option value="00232">+ 00232</option>
                                                <option value="0065">+ 0065</option>
                                                <option value="00421">+ 00421</option>
                                                <option value="00386">+ 00386</option>
                                                <option value="00677">+ 00677</option>
                                                <option value="00252">+ 00252</option>
                                                <option value="0027">+ 0027</option>
                                                <option value="0034">+ 0034</option>
                                                <option value="0094">+ 0094</option>
                                                <option value="00249">+ 00249</option>
                                                <option value="00597">+ 00597</option>
                                                <option value="00268">+ 00268</option>
                                                <option value="0046">+ 0046</option>
                                                <option value="0041">+ 0041</option>
                                                <option value="00963">+ 00963</option>
                                                <option value="00992">+ 00992</option>
                                                <option value="00255">+ 00255</option>
                                                <option value="0066">+ 0066</option>
                                                <option value="00670">+ 00670</option>
                                                <option value="00228">+ 00228</option>
                                                <option value="00676">+ 00676</option>
                                                <option value="001-868">+ 001-868</option>
                                                <option value="00216">+ 00216</option>
                                                <option value="0090">+ 0090</option>
                                                <option value="00993">+ 00993</option>
                                                <option value="00688">+ 00688</option>
                                                <option value="00256">+ 00256</option>
                                                <option value="00380">+ 00380</option>
                                                <option value="00971">+ 00971</option>
                                                <option value="0044" selected>+ 0044</option>
                                                <option value="00598">+ 00598</option>
                                                <option value="00998">+ 00998</option>
                                                <option value="00678">+ 00678</option>
                                                <option value="00379">+ 00379</option>
                                                <option value="0058">+ 0058</option>
                                                <option value="0084">+ 0084</option>
                                                <option value="00967">+ 00967</option>
                                                <option value="00260">+ 00260</option>
                                                <option value="00263">+ 00263</option>
                                            </select>
                                            <input id="tel_no" type="tel" name="sell_modal_account_tel" digitalert="This field only accepts numeric characters (digits)." required />
                                        </div>
                                    </div>
                                    <div class="half-width">
                                        <div class="agree-terms">
                                            <div class="check-view"></div>
                                            <label>
                                                <input name="sell_modal_account_terms" type="checkbox" termsalert="You must accept our terms and conditions in order to use our services." value="1">
                                                I agree to the <a href="/terms-conditions">Terms and Conditions</a>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="sell_2_btn" loginurl="https://www.footballticketpad.com/customer/account/login" registerurl="https://www.footballticketpad.com/ticket/registration"> Next </div>
                                <div class="next_btn" style="display:none"> Next </div>
                            </form>
                        </div>
                        <div class="payment-info">
                            <form method="post" class="payment-info-form">
                                <div class="heading">Payment information</div>
                                <input type="hidden" name="payment_option" value="bank" />
                                <div class="full-width">
                                    <div class="half-width bank-account" data-id>
                                        <label for="account_holder">Account holder</label>
                                        <input name="account_holder" id="account_holder" type="text" required />
                                    </div>
                                    <div class="half-width">
                                        <label for="iban_number">IBAN number</label>
                                        <input name="iban" id="iban" type="text" required />
                                    </div>
                                    <div class="half-width">
                                        <label for="bic_number">BIC or SWIFT number</label>
                                        <input name="bic_swift" id="bic-swift" type="text" required />
                                    </div>
                                </div>
                                <input type="hidden" id="transConfirmBeforeSale" name="transConfirmBeforeSale" value="We have placed your tickets on hold, we will need to contact you to verify some details before we list your tickets for sale">
                                <div class="publish_ticket_btn" bankaction="https://www.footballticketpad.com/account/account-information/bank" paymenturl="https://www.footballticketpad.com/ticket/sell/paymentmethod" accounturl="https://www.footballticketpad.com/account/account-information/bank" publishurl="https://www.footballticketpad.com/ticket/sell/published"> Publish </div>
                            </form>
                        </div>
                    </div>
                </div>


                <script type="ed1cf3913d91592aa786b287-text/javascript" charset="utf-8">
                    (function ($) {
                    $('.login-btn').click(function () {

                    var data = {
                    login: {
                    username: $('#username').val(),
                    password: $('#password').val()
                    }
                    };
                    $.ajax({
                    url: '/customer/account/login',
                    type: 'post',
                    dataType: 'json',
                    data: data,
                    beforeSend: function () {

                    },
                    success: function (reponse) { console.log(reponse);
                    if(reponse.data) {
                    var data = reponse.data;
                    if(data.message && data.message == 'success') {
                    window.location.href = "/account/listing";
                    }
                    else {
                    $('.login-message').html(data.message);
                    }

                    } else if(reponse.error) {
                    $('.login-message').html(reponse.error);
                    }

                    },
                    error: function (reponse) {

                    }
                    });
                    return false;
                    });

                    $('input').on('keyup', function(e) {
                    if (e.which == 13) {
                    e.preventDefault();
                    $('.login-btn').click();
                    }
                    });

                    $('.facebook').click(function () {
                    location.href = "https://www.footballticketpad.com/customer-account/login/fb";
                    });

                    $('.google').click(function () {
                    location.href = "https://www.footballticketpad.com/customer-account/login/google";
                    });

                    })(jQuery);

                </script>
            </div>
        </div>
    </header>
    <div class="container">
        <input type="hidden" name="ticketMultiCap" id="ticketMultiCap" value="Ticket(s)">
        <div class="content" id="test">
            <div class="team-page fixture">
                <div class="listing-modal">
                    <div class="overlay"></div>
                    <div class="inner">
                        <div class="modal" id="ticketSummary">
                            <div data-close-search class="close"><span class="ftp-close"></span></div>
                            <div class="heading">Ticket summary</div>
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
                                <select name="number_of_tickets" id>
                                </select>
                                <span class="ftp-down-chevron"></span>
                            </div>
                            <div class="whyDisabled text grey">
                            </div>
                            <input type="hidden" value class="checkout_product">
                            <input type="hidden" value class="checkout_eventId">
                            <div style="float: center;" class="c2a_btn" id="checkout" action="https://www.footballticketpad.com/checkout">Checkout</div>
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
                <script type="ed1cf3913d91592aa786b287-text/javascript">
                    $(function(){
                    $('form.GroupPurchaseform').submit(function(){
                    if($("input#website").val().length != 0){
                    return false;
                    }
                    });
                    });
                </script>
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
                                <svg viewBox="0 0 555.9 484.7" class="filter category-1 category-3">
                                <image width="250" height="250" data-tags="kat--1,kat-1" src="./assets/images/stand.png" transform="translate(151 113)"></image>
                                <path d="M59.2 149.2 29.8 144c1-18.3 8.1-30 8.1-30l26.7 12.2-5.4 23z" data-block="312" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M65.6 123.3 39 110.9c4.1-13.6 15.3-26.4 15.3-26.4l23.3 18.2-12 20.6z" data-block="311" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M97 83.7s-14.2 9.7-18.2 16.8L55.7 82.3c7.8-13.2 22.7-21.8 22.7-21.8L97 83.7z" data-block="310" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m118.7 69.3-19.9 13-18.2-23c11.5-12.1 26.3-16 26.3-16l11.8 26z" data-block="309" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m143.8 62.2-23 6.5-11.2-26.6c9.9-7.9 29.9-9.6 29.9-9.6l4.3 29.7z" data-block="308" data-section="central-upper-longside" data-tags="category-2,kat--2"></path>
                                <path d="M108.9 436.5c-26.6-9.8-27.8-16.2-27.8-16.2l18-22.8 21.9 12-12.1 27z" data-block="322" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M141.8 446.4s-18-.4-31.8-9l13.2-27.9 14.8 5.8 7.9-.2-4.1 31.3z" data-block="323" data-section="category-2" data-tags="kat--3,shortside-upper-tier"></path>
                                <path d="M439.8 437.6s-8.1 7.7-29.4 8.2l-4.3-29.4 22.8-5.1 10.9 26.3z" data-block="332" data-section="category-2" data-tags="kat--3,shortside-upper-tier"></path>
                                <path d="M469.7 420.7s-9.9 11.2-26.8 15.9l-11.7-26.5 21-12.7 17.5 23.3z" data-block="333" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m513.9 364.5-26.5-11.8 4.9-22.8 29.3 4.9c1.3 16.3-7.7 29.7-7.7 29.7z" data-block="336" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m522 141.5-30.2 4.8-5.4-22.2 27.2-12c8.9 11.3 8.4 29.4 8.4 29.4z" data-block="343" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m511.7 109.6-27.1 11.9-11.9-20.6 23.6-17.8c10.7 6.7 15.4 26.5 15.4 26.5z" data-block="344" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m471 99.3-17.8-17.1L471.8 59c17.7 11.5 23 22 23 22L471 99.3z" data-block="345" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M428.3 68.2s-10-5.7-23.2-6.1l4.5-28.8s17.7-.3 30.8 8.4l-12.1 26.5z" data-block="348" data-section="central-upper-longside" data-tags="category-2"></path>
                                <path d="m423.8 111.9-19.1-9.4 4.9-36.5c20.5.2 36.2 14.5 36.2 14.5l-22 31.4z" data-block="246" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m441.3 128.5-15.7-14.8 22.7-32.1s12.7 6.2 24.5 24.2l-31.5 22.7z" data-block="245" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m487.9 138.5-37.4 8.4-7.3-15.9 30.6-22.7c12.9 15.7 14.1 30.2 14.1 30.2z" data-block="244" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M446.6 397.8 424 364.5l15.2-14.3 31.9 23.7c-17.5 21.8-24.5 23.9-24.5 23.9z" data-block="236" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M444.7 398.8s-15.2 12.9-33.1 13.2l-8.2-37.2 18.3-9 23 33z" data-block="235" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M126.9 363.8 111.6 350l-32.2 23.2s6.4 13.5 24.5 24.2l23-33.6z" data-block="225" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m101.6 147.7-38.5-8.5c2.7-17.4 14-31.7 14-31.7l31.6 23.6-7.1 16.6z" data-block="217" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m109.7 129.3-31.3-23.4c7.2-15.4 25.3-24.4 25.3-24.4l21.8 32.8-15.8 15z" data-block="216" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m146.7 103.6-19.7 9.1-21.4-32.6c20.2-15.1 36.3-14.2 36.3-14.2l4.8 37.7z" data-block="215" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M424.7 136s-4.3-5.6-21.4-14.2l5.7-14.9c18.4 6.4 26 18.2 26 18.2L424.7 136z" data-block="135" data-section="category-2"></path>
                                <path d="m447.8 147.4-16.4 4.5-5.9-14.8 11.4-10.5c.1 0 4.2 1.1 10.9 20.8z" class="selected disabled" data-block="134" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze"></path>
                                <path d="m432.8 354.8-12.5-11.4 11.2-17 15.1 5.8s-3.6 11.8-13.8 22.6z" data-block="127" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m130.7 343.6-11.9 11.2c-9.5-7.6-15-23.9-15-23.9l16.2-4.5 10.7 17.2z" data-block="117" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m120.2 152.2-16.9-5c3.1-13.6 11.9-21.1 11.9-21.1l11.9 12.2-6.9 13.9z" data-block="109" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m148.3 122.6-19.8 13.5-12.2-11.7c9.9-13 26.4-16.9 26.4-16.9l5.6 15.1z" data-block="108" data-section="category-2" data-tags="kat--3"></path>
                                <path d="M96.8 396.1 79 418.8l-21.8-20.9 23.2-18.3z" data-block="321" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m79.3 377.8-23.9 18.3-16-27.6 27.4-11.3z" data-block="320" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m65.6 354.4-27.4 12.2-8.7-30.7 29.7-3.9z" data-block="319" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m58.5 329-29.8 5.1-3-30.3 31-1.1z" data-block="318" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m56.7 300.2-31.8 1.1-3.6-29.3h35.4z" data-block="317" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m56.7 238.2-35.9.4 1.4-28.3h34.5z" data-block="315" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M56.7 207.7H22.6l2.2-28.3h31.5z" data-block="314" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m59.2 151.3-30.6-5.1-3.8 30.4 31.6.4z" data-block="313" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m173.7 26.9-30.5 4.9 2.4 30.4 28.1-1.1z" data-block="307" data-section="central-upper-longside" data-tags="category-2"></path>
                                <path d="m208.9 23.2-32.6 2.5v35.4h32.6z" data-block="306" data-section="central-upper-longside" data-tags="category-2"></path>
                                <path d="M241.6 61.1h-31.8V23.3l31.8-2.4z" data-block="305" data-section="central-upper-longside" data-tags="kat--2" class="disabled"></path>
                                <path d="m173.9 451.2-30-4.1 5-30.9h25z" data-block="324" data-section="category-2" data-tags="kat--2"></path>
                                <path d="m208.4 456.6-32.2-4.8v-34.3h32.2z" data-block="325" data-section="category-2" data-tags="kat--2"></path>
                                <path d="m241.7 459-32.3-2.5v-39h32.3z" data-block="326" data-section="central-upper-longside" data-tags="kat--2" class="disabled"></path>
                                <path d="m308.9 457.7-33.1 1.3v-41.5h33.1z" data-block="328" data-section="central-upper-longside" data-tags="kat--1" class="disabled"></path>
                                <path d="m342.2 456.6-32.3 1.4v-40.5h32.3z" data-block="329" data-section="central-upper-longside" data-tags="kat--2" class="disabled"></path>
                                <path d="m375 451.6-30.6 4.5v-38.6H375z" data-block="330" data-section="category-2" data-tags="kat--2"></path>
                                <path d="m408.2 447.2-31.7 4.4v-34.1h26.9z" data-block="331" data-section="category-2" data-tags="kat--2"></path>
                                <path d="M494.6 396.8 472.1 419 454 395.7l18.1-18.1z" data-block="334" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m496.2 393.9-22.7-18.5 12.2-19.9 27.1 12.1z" data-block="335" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m522.5 332.2-29.6-5.5 1.8-26.7 32.5 2.6z" data-block="337" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m527.8 300-33.1-2.1v-28.5h35.6z" data-block="338" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M530.3 206.7h-35.6v-29.5l32-1.1z" data-block="341" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M526.7 174.8h-32.5l-1.5-26.2 29.3-3.8z" data-block="342" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m451.2 81-20.3-12.2 11.2-26.2 27.4 15.2z" data-block="346" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="m407.5 33.1-31.3-5.9v33.9l27.5 1.1z" data-block="349" data-section="central-upper-longside" data-tags="category-2"></path>
                                <path d="m375.2 26.9-32-3.7v37.9h32z" data-block="301" data-section="central-upper-longside" data-tags="category-2"></path>
                                <path d="m342 23.1-33.1-3.3v41.3H342z" data-block="302" data-section="central-upper-longside" data-tags="kat--2" class="disabled"></path>
                                <path d="M275.7 61.1h-32V20.8l32-1z" data-block="304" data-section="central-upper-longside" data-tags="kat--1" class="disabled"></path>
                                <path d="m402.3 102.5-17.6-1.1v-32l23.2-3.4z" data-block="247" data-section="longside-lower-tier" data-tags="category-1,kat--1,kat-1"></path>
                                <path d="m491.2 172.2-38.2.4-2.1-22.6 37.8-8.5z" data-block="243" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M492.7 207.5h-39.4v-31.4l39.4-1.3z" data-block="242" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m492.3 303-39.4-2.8.4-28.3h39z" data-block="239" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m488.6 338.2-37.7-9.2 1.6-26.4 39.8 2.4z" data-block="238" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m473 371.8-31.8-23.6 8.3-16.5 38.4 10z" data-block="237" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m409.5 412.8-31.9 2.1-2.6-39.1 26.1-1z" data-block="234" data-section="longside-lower-tier" data-tags="central-lower-longside,kat--1,kat-1"></path>
                                <path d="M375 414.9h-29.4v-39.1h28.1z" data-block="233" data-section="longside-lower-tier" data-tags="central-lower-longside,kat--1,kat-1"></path>
                                <path d="m173.9 414.1-32.7-.6 8.2-38.8 24.5 1.1z" data-block="227" data-section="longside-lower-tier" data-tags="central-lower-longside,kat--1,kat-1"></path>
                                <path d="m139.2 412.8-33.4-13.9 23.2-33.7 18.9 9z" data-block="226" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m110.7 348-33 23.5-13.9-32.1 37.5-8.4z" data-block="224" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M100.3 328.5 62.8 338l-3.6-34.2 40.1-1.1z" data-block="223" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M99.3 300 59 301.3l-1-30.8h41.3z" data-block="222" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m101.2 149-38.1-8.2-3.9 32.8h40.1z" data-block="218" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="m166.9 68.2-23.7-2.3 4.9 37.3 18.8-1.8z" data-block="214" data-section="longside-lower-tier" data-tags="category-1,kat--1,kat-1"></path>
                                <path d="m430.1 356.6-23.5 14.2L396 331l9.3-5.9 18.3 10.5-5.7 8.3z" data-block="126" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m144.3 370.5-23-13.6 11.8-13.7-5.4-8.2 19.3-11 9 7z" data-block="116" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m145.1 155.8-15.9-15.9-8 14.9-17.9-5.2-3 28.2h44.8z" data-block="110" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m176.4 102.5-32.3 3.8 6.9 18.1-5.9 3.1 10.5 18.8h20.8z" data-block="107" data-section="longside-lower-tier" data-tags="category-1"></path>
                                <path d="m406 106.3-30.9-3.8v43.8h22.5l10.5-19.7-7.5-1.7z" data-block="136" data-section="longside-lower-tier" data-tags="category-1"></path>
                                <path d="M450.9 178h-43l.3-23.2 16.6-15.7 5.5 14.5 18.5-3.5z" data-block="133" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m447.7 328.7-16.9-5-6 9.9-16.9-9.8v-23.6h43.2z" data-block="128" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="m404.5 371.6-29.5 1.5V331h19.1z" data-block="125" data-section="longside-lower-tier" data-tags="category-1,central-lower-longside,kat--1,kat-1"></path>
                                <path d="m176.2 373.8-29.7-2.4 11.1-40.4h18.6z" data-block="118" data-section="longside-lower-tier" data-tags="category-1,central-lower-longside,kat--1,kat-1"></path>
                                <path d="m145.8 322.4-19.3 10.7-5.4-9.5-18.3 5.4-2.5-29.7h44.8z" data-block="115" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M20.8 241h35.8v28.2H20.8z" data-block="316" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M242.6 417.5h32V459h-32z" data-block="327" data-section="central-upper-longside" data-tags="kat--1" class="disabled"></path>
                                <path d="M494.7 238.8h35.6v29.6h-35.6z" data-block="339" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M494.7 207.9h35.6v29.6h-35.6z" data-block="340" data-section="category-3" data-tags="kat--3,shortside-upper-tier" class=""></path>
                                <path d="M276.9 19.8h30.8V61h-30.8z" data-block="303" data-section="central-upper-longside" data-tags="kat--1" class="disabled"></path>
                                <path d="M453.3 210.2h39v29.6h-39z" data-block="241" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M453.3 241.2h39v29.2h-39z" data-block="240" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M306.5 375.8h37.9v40.5h-37.9z" data-block="232" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M275.8 375.8h29.7v40.5h-29.7z" data-block="231" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M246.2 375.8h28.3v40.5h-28.3z" data-block="230" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M207.1 375.8H245v40.1h-37.9z" data-block="229" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M176.2 375.8h29.7v40.5h-29.7z" data-block="228" data-section="longside-lower-tier" data-tags="central-lower-longside,kat--1,kat-1"></path>
                                <path d="M58 241h41.3v28.2H58z" data-block="221" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M58 210.3h41.3v28.2H58z" data-block="220" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M59.2 174.8h40.2v33.4H59.2z" data-block="219" data-section="category-2" data-tags="kat--3,shortside"></path>
                                <path d="M168 68.2h16.6v33.2H168z" data-block="213" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M185.8 68.2h15.5v33.2h-15.5z" data-block="212" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M202.3 68.2h13.1v33.2h-13.1z" data-block="211" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M216.6 68.2h17.7v33.2h-17.7z" data-block="210" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M235.6 68.2h15.3v33.2h-15.3z" data-block="209" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M252.1 68.2h15.5v33.2h-15.5z" data-block="208" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M268.7 68.2h15.5v33.2h-15.5z" data-block="207" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M285.2 68.2h14.3v33.2h-14.3z" data-block="206" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M300.5 68.2H316v33.2h-15.5z" data-block="205" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M317.2 68.2h16.5v33.2h-16.5z" data-block="204" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M334.9 69.4h14.2v32h-14.2z" data-block="203" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M350.3 69.4H366v32h-15.7z" data-block="202" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M368.1 69.4h15.5v32h-15.5z" data-block="201" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M177.5 102.5h31.1v43.8h-31.1z" data-block="106" data-section="longside-lower-tier" data-tags="category-1"></path>
                                <path d="M209.8 102.5h31.8v43.8h-31.8z" data-block="105" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M242.8 102.5h31.8v43.8h-31.8z" data-block="104" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M275.8 102.5h31.8v43.8h-31.8z" data-block="103" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M308.8 102.5h31.8v43.8h-31.8z" data-block="102" data-section="vip-hospitality-package" data-tags="prime-seats"></path>
                                <path d="M342.9 102.5h30.7v43.8h-30.7z" data-block="101" data-section="longside-lower-tier" data-tags="category-1"></path>
                                <path d="M407.9 179.8h43v27.7h-43z" data-block="132" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M407.9 208.8h43v29.7h-43z" data-block="131" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M407.9 239.8h43v29.7h-43z" data-block="130" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M407.9 270.8h43v27.5h-43z" data-block="129" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M342.3 331h30.5v42.1h-30.5z" data-block="124" data-section="longside-lower-tier" data-tags="category-1,central-lower-longside,kat--1,kat-1"></path>
                                <path d="M309.6 331H341v42.8h-31.4z" data-block="123" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M276.8 331h30.8v42.8h-30.8z" data-block="122" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M243.8 331h30.8v42.8h-30.8z" data-block="121" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M209.6 331h32v42.8h-32z" data-block="120" data-section="longside-lower-tier" data-tags="prime-seats"></path>
                                <path d="M177.8 331h30.5v42.8h-30.5z" data-block="119" data-section="longside-lower-tier" data-tags="category-1,central-lower-longside,kat--1,kat-1"></path>
                                <path d="M100.3 271.6h44.8v26.1h-44.8z" data-block="114" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M100.3 239.8h44.8v29.4h-44.8z" data-block="113" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M100.3 209.8h44.8v28.5h-44.8z" data-block="112" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <path d="M100.3 179.4h44.8v29.8h-44.8z" data-block="111" data-section="fans-first" data-tags="kat--5,stehpl--tze,stehpl-tze" class="disabled"></path>
                                <text class="maptext" font-size="12" transform="translate(216.41 46.83)">305</text>
                                <text class="maptext" font-size="12" transform="translate(250.95 45.83)">304</text>
                                <text class="maptext" font-size="12" transform="translate(483.16 376.62)">335</text>
                                <text class="maptext" font-size="12" transform="translate(465.57 402.29)">334</text>
                                <text class="maptext" font-size="12" transform="translate(439.74 421.79)">333</text>
                                <text class="maptext" font-size="12" transform="translate(412.7 434.29)">332</text>
                                <text class="maptext" font-size="12" transform="translate(383.12 439.83)">331</text>
                                <text class="maptext" font-size="12" transform="translate(351.85 442.79)">330</text>
                                <text class="maptext" font-size="12" transform="translate(317.2 445.74)">329</text>
                                <text class="maptext" font-size="12" transform="translate(282.32 446.41)">328</text>
                                <text class="maptext" font-size="12" transform="translate(248.32 446.41)">327</text>
                                <text class="maptext" font-size="12" transform="translate(217.75 446.41)">326</text>
                                <text class="maptext" font-size="12" transform="translate(185.05 441.33)">325</text>
                                <text class="maptext" font-size="12" transform="translate(150.66 439.83)">324</text>
                                <text class="maptext" font-size="12" transform="translate(122.7 434.54)">323</text>
                                <text class="maptext" font-size="12" transform="translate(93.2 421.79)">322</text>
                                <text class="maptext" font-size="12" transform="translate(69.32 402.29)">321</text>
                                <text class="maptext" font-size="12" transform="translate(50.32 379.58)">320</text>
                                <text class="maptext" font-size="12" transform="translate(38.28 351.08)">319</text>
                                <text class="maptext" font-size="12" transform="translate(32.82 320.33)">318</text>
                                <text class="maptext" font-size="12" transform="translate(29.74 289.33)">317</text>
                                <text class="maptext" font-size="12" transform="translate(29.49 258.29)">316</text>
                                <text class="maptext" font-size="12" transform="translate(30.49 229.75)">315</text>
                                <text class="maptext" font-size="12" transform="translate(30.49 200.17)">314</text>
                                <text class="maptext" font-size="12" transform="translate(32.82 169.33)">313</text>
                                <text class="maptext" font-size="12" transform="translate(38.28 139.87)">312</text>
                                <text class="maptext" font-size="12" transform="translate(47.53 111.87)">311</text>
                                <text class="maptext" font-size="12" transform="translate(65.57 84.24)">310</text>
                                <text class="maptext" font-size="12" transform="translate(93.2 67.12)">309</text>
                                <text class="maptext" font-size="12" transform="translate(118.74 56.29)">308</text>
                                <text class="maptext" font-size="12" transform="translate(150.72 50.37)">307</text>
                                <text class="maptext" font-size="12" transform="translate(183.66 47.83)">306</text>
                                <text class="maptext" font-size="9" transform="translate(169.7 89.07)">213</text>
                                <text class="maptext" font-size="9" transform="translate(187.95 89.24)">212</text>
                                <text class="maptext" font-size="9" transform="translate(203.32 88.93)">211</text>
                                <text class="maptext" font-size="9" transform="translate(218.57 88.93)">210</text>
                                <text class="maptext" font-size="9" transform="translate(234.62 88.93)">209</text>
                                <text class="maptext" font-size="9" transform="translate(251.12 88.93)">208</text>
                                <text class="maptext" font-size="9" transform="translate(269.95 89.24)">207</text>
                                <text class="maptext" font-size="9" transform="translate(285.28 89.24)">206</text>
                                <text class="maptext" font-size="9" transform="translate(301.45 88.93)">205</text>
                                <text class="maptext" font-size="9" transform="translate(318.45 89.24)">204</text>
                                <text class="maptext" font-size="9" transform="translate(334.91 89.24)">203</text>
                                <text class="maptext" font-size="9" transform="translate(350.85 89.24)">202</text>
                                <text class="maptext" font-size="12" transform="translate(150.66 399.66)">227</text>
                                <text class="maptext" font-size="12" transform="translate(118.74 393.91)">226</text>
                                <text class="maptext" font-size="12" transform="translate(93.2 378.58)">225</text>
                                <text class="maptext" font-size="12" transform="translate(77.57 352.37)">224</text>
                                <text class="maptext" font-size="12" transform="translate(72.16 323.99)">223</text>
                                <text class="maptext" font-size="12" transform="translate(72.16 289.33)">222</text>
                                <text class="maptext" font-size="12" transform="translate(72.16 257.83)">221</text>
                                <text class="maptext" font-size="12" transform="translate(72.16 228.83)">220</text>
                                <text class="maptext" font-size="12" transform="translate(72.16 197.83)">219</text>
                                <text class="maptext" font-size="12" transform="translate(72.16 163.83)">218</text>
                                <text class="maptext" font-size="12" transform="translate(78.45 136.12)">217</text>
                                <text class="maptext" font-size="12" transform="translate(93.2 111.87)">216</text>
                                <text class="maptext" font-size="12" transform="translate(121.07 93.83)">215</text>
                                <text class="maptext" font-size="12" transform="translate(148.32 89.24)">214</text>
                                <text class="maptext" font-size="12" transform="translate(284.16 44.67)">303</text>
                                <text class="maptext" font-size="12" transform="translate(316.03 44.58)">302</text>
                                <text class="maptext" font-size="12" transform="translate(350.57 46.83)">301</text>
                                <text class="maptext" font-size="12" transform="translate(382.16 48.83)">349</text>
                                <text class="maptext" font-size="12" transform="translate(409.78 53.16)">348</text>
                                <text class="maptext" font-size="12" transform="translate(440.78 67.12)">347</text>
                                <text class="maptext" font-size="12" transform="translate(464.58 84.83)">346</text>
                                <text class="maptext" font-size="12" transform="translate(483.16 107.49)">345</text>
                                <text class="maptext" font-size="12" transform="translate(494.82 135.99)">343</text>
                                <text class="maptext" font-size="12" transform="translate(499.16 164.7)">342</text>
                                <text class="maptext" font-size="12" transform="translate(501.66 197.83)">341</text>
                                <text class="maptext" font-size="12" transform="translate(501.66 228.83)">340</text>
                                <text class="maptext" font-size="12" transform="translate(501.66 259.79)">339</text>
                                <text class="maptext" font-size="12" transform="translate(501.66 291.52)">338</text>
                                <text class="maptext" font-size="12" transform="translate(501.66 320.33)">337</text>
                                <text class="maptext" font-size="12" transform="translate(494.82 349.29)">336</text>
                                <text class="maptext" font-size="12" transform="translate(250.95 129.16)">104</text>
                                <text class="maptext" font-size="12" transform="translate(217.75 130.25)">105</text>
                                <text class="maptext" font-size="12" transform="translate(184.62 130.24)">106</text>
                                <text class="maptext" font-size="12" transform="translate(157.53 129.16)">107</text>
                                <text class="maptext" font-size="12" transform="matrix(.89 -.44 .44 .89 127.91 129.33)">108</text>
                                <text class="maptext" font-size="12" transform="matrix(.51 -.85 .85 .51 117.83 151.63)">109</text>
                                <text class="maptext" font-size="12" transform="translate(113.97 169.33)">110</text>
                                <text class="maptext" font-size="12" transform="translate(113.78 200.17)">111</text>
                                <text class="maptext" font-size="12" transform="translate(113.28 228.83)">112</text>
                                <text class="maptext" font-size="12" transform="translate(112.78 259.79)">113</text>
                                <text class="maptext" font-size="12" transform="translate(114.28 291.52)">114</text>
                                <text class="maptext" font-size="12" transform="translate(112.78 316.12)">115</text>
                                <text class="maptext" font-size="12" transform="translate(132.32 340.68)">117</text>
                                <text class="maptext" font-size="12" transform="translate(155.03 357.16)">118</text>
                                <text class="maptext" font-size="12" transform="translate(183.66 358.2)">119</text>
                                <text class="maptext" font-size="12" transform="translate(216.62 358.2)">120</text>
                                <text class="maptext" font-size="12" transform="translate(250.95 358.2)">121</text>
                                <text class="maptext" font-size="12" transform="translate(285.28 359.2)">122</text>
                                <text class="maptext" font-size="12" transform="translate(317.2 359.2)">123</text>
                                <text class="maptext" font-size="12" transform="translate(350.28 359.2)">124</text>
                                <text class="maptext" font-size="12" transform="translate(380.16 359.2)">125</text>
                                <text class="maptext" font-size="12" transform="translate(399.66 340.68)">126</text>
                                <text class="maptext" font-size="12" transform="translate(416.16 316.12)">128</text>
                                <text class="maptext" font-size="12" transform="translate(416.16 289.33)">129</text>
                                <text class="maptext" font-size="12" transform="translate(416.16 259.79)">130</text>
                                <text class="maptext" font-size="12" transform="translate(416.16 228.83)">131</text>
                                <text class="maptext" font-size="12" transform="translate(416.16 200.17)">132</text>
                                <text class="maptext" font-size="12" transform="translate(416.16 172.58)">133</text>
                                <text class="maptext" font-size="12" transform="matrix(.38 -.92 .92 .38 -330.74 358.97)">134</text>
                                <text class="maptext" font-size="12" transform="matrix(.74 .66 -.66 .74 617.81 282.98)">135</text>
                                <text class="maptext" font-size="12" transform="translate(380.16 129.33)">136</text>
                                <text class="maptext" font-size="9" transform="translate(388.16 89.24)">247</text>
                                <text class="maptext" font-size="9" transform="translate(368.95 89.24)">201</text>
                                <text class="maptext" font-size="12" transform="translate(413.04 91.83)">246</text>
                                <text class="maptext" font-size="12" transform="translate(439.82 111.87)">245</text>
                                <text class="maptext" font-size="12" transform="translate(456.16 136.12)">244</text>
                                <text class="maptext" font-size="12" transform="translate(465.57 163.83)">243</text>
                                <text class="maptext" font-size="12" transform="translate(465.57 197.83)">242</text>
                                <text class="maptext" font-size="12" transform="translate(465.57 232.33)">241</text>
                                <text class="maptext" font-size="12" transform="translate(465.57 261.83)">240</text>
                                <text class="maptext" font-size="12" transform="translate(465.57 291.52)">239</text>
                                <text class="maptext" font-size="12" transform="translate(462.66 323.99)">238</text>
                                <text class="maptext" font-size="12" transform="translate(456.16 351.7)">237</text>
                                <text class="maptext" font-size="12" transform="translate(439.82 377.58)">236</text>
                                <text class="maptext" font-size="12" transform="matrix(-.48 .87 -.87 -.48 595.7 -739.61)">127</text>
                                <text class="maptext" font-size="12" transform="translate(413.04 393.91)">235</text>
                                <text class="maptext" font-size="12" transform="translate(383.62 399.2)">234</text>
                                <text class="maptext" font-size="12" transform="translate(352.85 399.66)">233</text>
                                <text class="maptext" font-size="12" transform="translate(317.2 399.66)">232</text>
                                <text class="maptext" font-size="12" transform="translate(284.16 399.66)">231</text>
                                <text class="maptext" font-size="12" transform="translate(252.12 399.66)">230</text>
                                <text class="maptext" font-size="12" transform="translate(215.41 399.66)">229</text>
                                <text class="maptext" font-size="12" transform="translate(183.66 399.66)">228</text>
                                <text class="maptext" font-size="12" transform="translate(284.16 129.33)">103</text>
                                <text class="maptext" font-size="12" transform="translate(316.03 129.25)">102</text>
                                <text class="maptext" font-size="12" transform="translate(350.57 129.25)">101</text>
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
                                <div class="heading">Select a section that you'd like to be seated in</div>
                                <div class="column">
                                    <div class="item" data-type="category-1">
                                        <div class="key" style="border-color:#E99C8A" "></div><div class="text">
                                            Category 1
                                        </div>
                                    </div>
                                    <div class="item" data-type="category-2">
                                        <div class="key" style="border-color:#F1D446" "></div><div class="text">
                                            Category 2
                                        </div>
                                    </div>
                                    <div class="item" data-type="category-3">
                                        <div class="key" style="border-color:#86A8BF" "></div><div class="text">
                                            Category 3
                                        </div>
                                    </div>
                                    <div class="item" data-type="longside-lower-tier">
                                        <div class="key" style="border-color:#A96EBB" "></div><div class="text">
                                            Longside Lower Tier
                                        </div>
                                    </div>
                                    <div class="item" data-type="prime-seats">
                                        <div class="key" style="border-color:#000000" "></div><div class="text">
                                            Prime Seats
                                        </div>
                                    </div>
                                    <div class="item" data-type="shortside-upper-tier">
                                        <div class="key" style="border-color:#85E1D5" "></div><div class="text">
                                            Shortside Upper Tier
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
                                <div class="listing-inner">

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282867" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="#ticketSummary" data-toggle="modal">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282863" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282863">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282269" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282269">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282273" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282273">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282264" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282264">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282265" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282265">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282270" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;772.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282270">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_shortside-upper-tier" data-section="shortside-upper-tier" data-sort-original="1" data-sort-section="1" data-sort-price="798.99" data-sort-availability="2" data-delivery="0" data-ticket-type="Shortside Upper Tier" data-preference="3" data-product="336272" data-event_id="10019" style="border-color:#85E1D5">
                                        <div class="overlay" style="background-color:#85E1D5;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Shortside Upper Tier
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Other Note: CAT 3 PAIR SAT TOGETHER</div>
                                            </div>
                                        </div><div class="price">&pound;798.99 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/336272">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="824.00" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="338005" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;824.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338005">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="858.33" data-sort-availability="3" data-delivery="0" data-ticket-type="Category 3" data-preference="1" data-product="338116" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>3</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;858.33 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338116">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="858.33" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="3" data-product="338117" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;858.33 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338117">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="858.33" data-sort-availability="1" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="338114" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>1</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;858.33 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338114">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="870.35" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="339231" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;870.35 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339231">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="875.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="282268" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;875.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282268">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="875.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="282271" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;875.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282271">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="875.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="2" data-product="338006" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;875.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338006">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="921.85" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="339229" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;921.85 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339229">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="927.00" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="338009" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;927.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338009">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1004.25" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="338004" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,004.25 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338004">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1030.00" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="338007" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,030.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338007">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1100.00" data-sort-availability="3" data-delivery="0" data-ticket-type="Category 1" data-preference="1" data-product="339343" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>3</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                            </div>
                                        </div><div class="price">&pound;1,100.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339343">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1184.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="339230" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,184.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339230">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1236.00" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="335658" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>2</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,236.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/335658">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1236.00" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="282865" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,236.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/282865">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="1287.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="275549" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,287.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/275549">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1459.17" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="3" data-product="338115" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,459.17 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/338115">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_prime-seats" data-section="prime-seats" data-sort-original="1" data-sort-section="1" data-sort-price="1519.25" data-sort-availability="4" data-delivery="0" data-ticket-type="Prime Seats" data-preference="0" data-product="339228" data-event_id="10019" style="border-color:#000000">
                                        <div class="overlay" style="background-color:#000000;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Prime Seats
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,519.25 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339228">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_longside-lower-tier" data-section="longside-lower-tier" data-sort-original="1" data-sort-section="1" data-sort-price="1599.99" data-sort-availability="4" data-delivery="1" data-ticket-type="Longside Lower Tier" data-preference="2" data-product="339077" data-event_id="10019" style="border-color:#A96EBB">
                                        <div class="overlay" style="background-color:#A96EBB;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Longside Lower Tier
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Other Note: PRIME SEATS BLOCK: 231, SEATED TOGETHER.</div>
                                            </div>
                                        </div><div class="price">&pound;1,599.99 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339077">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="1716.67" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="275545" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,716.67 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/275545">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-3" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="1716.67" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="275544" data-event_id="10019" style="border-color:#86A8BF">
                                        <div class="overlay" style="background-color:#86A8BF;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 3
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,716.67 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/275544">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_prime-seats" data-section="prime-seats" data-sort-original="1" data-sort-section="1" data-sort-price="1957.00" data-sort-availability="1" data-delivery="0" data-ticket-type="Prime Seats" data-preference="0" data-product="339423" data-event_id="10019" style="border-color:#000000">
                                        <div class="overlay" style="background-color:#000000;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Prime Seats
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity" style="color:red">
                                                only <span>1</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;1,957.00 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/339423">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-1" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="2145.83" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="275547" data-event_id="10019" style="border-color:#E99C8A">
                                        <div class="overlay" style="background-color:#E99C8A;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 1
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;2,145.83 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/275547">Book now</a>
                                        </div>
                                    </div>

                                    <div class="item trigger_category-2" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="2317.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="275550" data-event_id="10019" style="border-color:#F1D446">
                                        <div class="overlay" style="background-color:#F1D446;"></div>
                                        <div class="seat">
                                            <div class="div_ticket-type">
                                                Category 2
                                            </div>
                                            <div></div>
                                        </div><div class="availability">
                                            <div class="quantity">
                                                <span>4</span>
                                                ticket(s) <div class="showIcons">
                                                    <span class="icons">
                                                        <img src="/assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
                                                        <div class="arrow-left"></div>
                                                        <span class="toolTipText">Mobile tickets</span>
                                                    </span>
                                                </div>
                                            </div>
                                            <div class="info">
                                                <div>Others</div>
                                            </div>
                                        </div><div class="price">&pound;2,317.50 </div><div class="book" data-ripple="true" data-alert-text="Selling Fast!" data-type="hot">
                                            <a href="/checkout/275550">Book now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="for-s-view">
                                <div class="filters">
                                    <div class="left">
                                        <div class="tickets">
                                            <img src="/assets/frontend/2018/images/tickets.svg" alt="Tickets">
                                            <span class="tickets_count">4</span>
                                        </div>
                                        <div class="seated-together">
                                            <div class="title">Seated together</div>
                                            <label class="switch">
                                                <input type="checkbox" name="seated_together" class="switch_preference">
                                                <span class="slider round"></span>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="right">
                                        <div class="remove-filters">
                                            <img src="/assets/frontend/2018/images/alerts/error.svg" alt="Remove Filters">
                                            Remove Filters
                                        </div>
                                    </div>
                                </div>

                                <div class="listing">
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282867" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282863" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282269" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282273" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282264" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282265" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="772.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="282270" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;772.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="shortside-upper-tier" data-sort-original="1" data-sort-section="1" data-sort-price="798.99" data-sort-availability="2" data-delivery="0" data-ticket-type="Shortside Upper Tier" data-preference="3" data-product="336272" data-event_id="10019">
                                        <div class="left" style="border-color:#85E1D5">
                                            <div class="seat">
                                                <div class="name">
                                                    Shortside Upper Tier
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Other Note: CAT 3 PAIR SAT TOGETHER">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Other Note: CAT 3 PAIR SAT TOGETHER</div>
                                            </div>
                                            <div class="price">&pound;798.99 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="824.00" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="338005" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;824.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="858.33" data-sort-availability="3" data-delivery="0" data-ticket-type="Category 3" data-preference="1" data-product="338116" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>3</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;858.33 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="858.33" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="3" data-product="338117" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;858.33 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="858.33" data-sort-availability="1" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="338114" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>1</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;858.33 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="870.35" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="339231" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;870.35 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="875.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="282268" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;875.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="875.50" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="282271" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;875.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="875.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="2" data-product="338006" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;875.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="921.85" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="339229" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;921.85 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="927.00" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="338009" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;927.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1004.25" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="338004" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,004.25 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1030.00" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="338007" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,030.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1100.00" data-sort-availability="3" data-delivery="0" data-ticket-type="Category 1" data-preference="1" data-product="339343" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>3</span> remaining</div>
                                            <div class="info" style="display:none">
                                            </div>
                                            <div class="price">&pound;1,100.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1184.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="339230" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,184.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1236.00" data-sort-availability="2" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="335658" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>2</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,236.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1236.00" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="282865" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,236.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="1287.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="275549" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,287.50 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="1459.17" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="3" data-product="338115" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,459.17 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="prime-seats" data-sort-original="1" data-sort-section="1" data-sort-price="1519.25" data-sort-availability="4" data-delivery="0" data-ticket-type="Prime Seats" data-preference="0" data-product="339228" data-event_id="10019">
                                        <div class="left" style="border-color:#000000">
                                            <div class="seat">
                                                <div class="name">
                                                    Prime Seats
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,519.25 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="longside-lower-tier" data-sort-original="1" data-sort-section="1" data-sort-price="1599.99" data-sort-availability="4" data-delivery="1" data-ticket-type="Longside Lower Tier" data-preference="2" data-product="339077" data-event_id="10019">
                                        <div class="left" style="border-color:#A96EBB">
                                            <div class="seat">
                                                <div class="name">
                                                    Longside Lower Tier
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Other Note: PRIME SEATS BLOCK: 231, SEATED TOGETHER.">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Other Note: PRIME SEATS BLOCK: 231, SEATED TOGETHER.</div>
                                            </div>
                                            <div class="price">&pound;1,599.99 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="1716.67" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="275545" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,716.67 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-3" data-sort-original="1" data-sort-section="1" data-sort-price="1716.67" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 3" data-preference="0" data-product="275544" data-event_id="10019">
                                        <div class="left" style="border-color:#86A8BF">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 3
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,716.67 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="prime-seats" data-sort-original="1" data-sort-section="1" data-sort-price="1957.00" data-sort-availability="1" data-delivery="0" data-ticket-type="Prime Seats" data-preference="0" data-product="339423" data-event_id="10019">
                                        <div class="left" style="border-color:#000000">
                                            <div class="seat">
                                                <div class="name">
                                                    Prime Seats
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>1</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;1,957.00 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-1" data-sort-original="1" data-sort-section="1" data-sort-price="2145.83" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 1" data-preference="0" data-product="275547" data-event_id="10019">
                                        <div class="left" style="border-color:#E99C8A">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 1
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;2,145.83 </div>
                                        </div>
                                    </div>
                                    <div class="item" data-section="category-2" data-sort-original="1" data-sort-section="1" data-sort-price="2317.50" data-sort-availability="4" data-delivery="0" data-ticket-type="Category 2" data-preference="0" data-product="275550" data-event_id="10019">
                                        <div class="left" style="border-color:#F1D446">
                                            <div class="seat">
                                                <div class="name">
                                                    Category 2
                                                    <span class="showIcons">
                                                        <span class="icons">
                                                            <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto">
                                                            <span class="arrow-left"></span>
                                                            <span class="toolTipText">Print at Home</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="block"></div>
                                                <div class="more-info">
                                                    <abbr title="Others">
                                                        <span class="info-icon">i</span> Ticket features
                                                    </abbr>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="right">
                                            <div class="remaining"><span>4</span> remaining</div>
                                            <div class="info" style="display:none">
                                                <div>Others</div>
                                            </div>
                                            <div class="price">&pound;2,317.50 </div>
                                        </div>
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
