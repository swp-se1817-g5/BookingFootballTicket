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
                                <svg id="svgStadium" viewBox="0 0 1247 1136" data-section="" data-block="" data-tags="" >
                                <defs>
                                <style>
                                    path {
                                        fill: #cccccc;
                                    }

                                    .maptext {
                                        font-size: 45.833px;
                                        fill: #fff;
                                        font-family: "Myriad Pro";
                                        font-weight: 700;
                                    }
                                    [data-block] {
                                        transition: fill 0.3s ease; /* Transition để làm mượt việc thay đổi màu */
                                    }

                                    /* Định nghĩa màu riêng cho từng section khi hover và click */
                                    .fans-side,
                                    .fans-side.hovered,
                                    .fans-side.clicked {
                                        fill: #F1D446; /* Màu vang cho fans-side */
                                    }

                                    .standard,
                                    .standard.hovered,
                                    .standard.clicked {
                                        fill: #E99C8A; /* Màu xanh lá cho standard */
                                    }

                                    .vip-stand,
                                    .vip-stand.hovered,
                                    .vip-stand.clicked {
                                        fill: #5b5a82; /* Màu xanh dương cho vip-stand */
                                    }

                                    .under-roof,
                                    .under-roof.hovered,
                                    .under-roof.clicked {
                                        fill: #A96EBB; /* Màu vàng cho under-roof */
                                    }

                                    .on-roof,
                                    .on-roof.hovered,
                                    .on-roof.clicked {
                                        fill: #85E1D5; /* Màu hồng cho on-roof */
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

                                        paths.forEach(function (path) {
                                            var sectionName = path.getAttribute('data-section');
                                            path.classList.add(sectionName);
                                        });

                                        // Thiết lập màu mặc định cho tất cả các phần tử khi trang tải xong
                                        paths.forEach(function (path) {
                                            var sectionName = path.getAttribute('data-section');
                                            path.classList.add(sectionName);
                                        });

                                        paths.forEach(function (path) {
                                            path.classList.add('clicked');
                                        });

                                        paths.forEach(function (path) {
                                            path.addEventListener('mouseenter', function () {
                                                var sectionName = this.getAttribute('data-section');
                                                var sections = document.querySelectorAll('path[data-section="' + sectionName + '"]');
                                                sections.forEach(function (item) {
                                                    item.classList.add('hovered', sectionName);
                                                });
                                            });

                                            path.addEventListener('mouseleave', function () {
                                                var sectionName = this.getAttribute('data-section');
                                                var sections = document.querySelectorAll('path[data-section="' + sectionName + '"]');
                                                sections.forEach(function (item) {
                                                    if (!item.classList.contains('clicked')) {
                                                        item.classList.remove('hovered', sectionName);
                                                    }
                                                });
                                            });

                                            path.addEventListener('click', function () {
                                                var sectionName = this.getAttribute('data-section');
                                                var sections = document.querySelectorAll('path[data-section="' + sectionName + '"]');
                                                sections.forEach(function (item) {
                                                    item.classList.toggle('clicked');
                                                    item.classList.remove('hovered'); // Remove hovered class when clicked
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
                                <div class="heading">Select a section that you'd like to be seated in</div>
                                <div class="column">
                                    <div class="item" data-type="category-1">
                                        <div class="key" style="border-color:#E99C8A" "></div><div class="text">
                                            Standard
                                        </div>
                                    </div>
                                    <div class="item" data-type="category-2">
                                        <div class="key" style="border-color:#F1D446" "></div><div class="text">
                                            Fans side
                                        </div>
                                    </div>
                                    <div class="item" data-type="category-3">
                                        <div class="key" style="border-color:#cccccc" "></div><div class="text">
                                            No Select
                                        </div>
                                    </div>
                                    <div class="item" data-type="longside-lower-tier">
                                        <div class="key" style="border-color:#A96EBB" "></div><div class="text">
                                            Under the Roof
                                        </div>
                                    </div>
                                    <div class="item" data-type="prime-seats">
                                        <div class="key" style="border-color:#5b5a82" "></div><div class="text">
                                            Vip Seat
                                        </div>
                                    </div>
                                    <div class="item" data-type="shortside-upper-tier">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                                        <img src="../assets/svg/mobile_download.svg" alt="Mobile Download" height="20px" width="auto">
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
                                            <img src="../assets/frontend/2018/images/tickets.svg" alt="Tickets">
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
                                            <img src="../assets/frontend/2018/images/alerts/error.svg" alt="Remove Filters">
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
