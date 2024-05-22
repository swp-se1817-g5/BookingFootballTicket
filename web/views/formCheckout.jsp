<%-- 
    Document   : formCheckout
    Created on : May 23, 2024, 1:19:06 AM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="https://cdn.eu.trustpayments.com/js/latest/st.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
<!doctype html>
<html class="no-js" lang="en-GB">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="google-site-verification" content="9V9Q5hFOJM5zHXaAYTZSx0b42V3BgxEFb931mguTcJY" />
        <link rel="canonical" href="https://www.footballticketpad.com/checkout/338500" />
        <link rel="alternate" hreflang="x-default" href="https://www.footballticketpad.com/checkout/338500" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Football Ticket Pad</title>
        <meta name="description" content="Football Ticket Pad">
        <meta name="keywords" content="Football Ticket Pad">
        <meta name="author" content>
        <meta property="og:image" content="https://www.footballticketpad.com/assets/ftp-logo.png" />
        <meta name="google-site-verification" content="O7lp3hSrStK1vKzEa9v7j3rzLLYzUpjqsSwBuQXMjNg" />
        <meta name="robots" content="noindex">
        <style type="text/css">

            /** added on 14-10-19 starts **/
            a.selected {
                background-color:#1F75CC;
                color:white;
                z-index:100;
            }
            .confirmMsg {
                margin-top: 25px;
                position: sticky;
                top: 30px;
                left: 0;
                width: 100%;
                /* z-index: 999; */
                z-index: 1010;
            }
            .messagepop {
                background-color:#FFFFFF;
                border:1px solid #999999;
                cursor:default;
                /* display:none; */
                position:absolute;
                z-index:1050;
                padding: 25px 25px 20px;
                width: 100%;
                text-align: center;
            }
            .messagepop {
                top: 50%;
                left: 0;
                right: 0;
                margin: 0 auto;
                max-width: 945px;
                width: 100%;
            }
            label {
                display: block;
                margin-bottom: 3px;
                padding-left: 15px;
                text-indent: -15px;
            }

            .messagepop p, .messagepop.div {
                margin: 8px 0;
                padding-bottom: 8px;
                font-weight: bold;
            }
            .confirm-progress-bar{
                background: #1400bf;
                /* background: #D4D4D4; */
                height: 20px;
                /* width: 0px; */
            }
            .quick-summary{
                padding:20px 10px!important;
            }

            /** added on 14-10-19 ends **/
        </style>
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/pages/checkout-page.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/app9.css?v=1.4">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/pikaday.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/chartist.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/bootstrap-multiselect.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/style-fix-v0.css?v=1.4">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery-3.3.1.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery-ui.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery.inViewport.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/jquery-validator/jquery.validate.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/jquery-form.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/bootstrap-multiselect.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/hotel.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.google.com/recaptcha/api.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/app.js?v=1.4" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script type="6276b4eb410f80d7e7222863-text/javascript">
            $.ajaxSetup({ headers: { 'csrftoken' : '25RWzOSoBxW6zeNZpsZcQG32rZDnZ63jZxfO44g6' } });
            var auto_complete_source="https://www.footballticketpad.com/events/auto-complete";
        </script>

        <script type="6276b4eb410f80d7e7222863-text/javascript">
            (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
            })(window,document,'script','dataLayer','GTM-KWDJ87');
        </script>


        <link rel="stylesheet" type="text/css" href="/assets/frontend/2018/css/cookieconsent.min.css" />
        <script src="/assets/frontend/2018/js/cookieconsent.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
        <script type="6276b4eb410f80d7e7222863-text/javascript"> window.addEventListener("load", function() {window.cookieconsent.initialise({"palette": {"popup": {"background": "#000000B2"}, "button": {"background": "#133ABD"} }, "content": {"message": "This website uses cookies to ensure you get the best experience on our website.", "dismiss": "Got it!", "link": "Learn more", "href": "/privacy-policy"} }) }); </script>


        <script type="6276b4eb410f80d7e7222863-text/javascript">
            !function(f,b,e,v,n,t,s)
            {if(f.fbq)return;n=f.fbq=function(){n.callMethod?
            n.callMethod.apply(n,arguments):n.queue.push(arguments)};
            if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';
            n.queue=[];t=b.createElement(e);t.async=!0;
            t.src=v;s=b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t,s)}(window, document,'script',
            'https://connect.facebook.net/en_US/fbevents.js');
            fbq('init', '388758328741664');
            fbq('track', 'PageView');
        </script>
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=388758328741664&ev=PageView&noscript=1"
                   /></noscript>

</head>
<body class="checkout-process steps">


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
                <input type="hidden" name="product_ticket_id" id="product_ticket_id" value="338500">
                <input type="hidden" name="addRoomTrans" id="addRoomTrans" value="add room">
                <nav class="header-main-menu">
                    <ul>
                        <li>
                            <a class="has-child cross"><i class=" header-hot"></i>Popular Games</a>
                            <ul class="single-block"><li>
                                    <a href="/europa-league/europa-league-final">
                                        <div class="text">Europa League Final</div>
                                    </a>
                                </li><li>
                                    <a href="/fa-cup/fa-cup-final-2024">
                                        <div class="text">FA Cup Final 2024</div>
                                    </a>
                                </li><li>
                                    <a href="/scottish-cup/scottish-cup-final">
                                        <div class="text">Scottish Cup Final</div>
                                    </a>
                                </li><li>
                                    <a href="/uefa-euro-2024/denmark-v-england">
                                        <div class="text">Denmark v England</div>
                                    </a>
                                </li><li>
                                    <a href="/uefa-euro-2024/england-v-slovenia">
                                        <div class="text">England v Slovenia</div>
                                    </a>
                                </li><li>
                                    <a href="/uefa-euro-2024/scotland-v-switzerland">
                                        <div class="text">Scotland v Switzerland</div>
                                    </a>
                                </li><li>
                                    <a href="/uefa-euro-2024/spain-v-italy">
                                        <div class="text">Spain v Italy</div>
                                    </a>
                                </li><li>
                                    <a href="/uefa-euro-2024/scotland-v-hungary">
                                        <div class="text">Scotland v Hungary</div>
                                    </a>
                                </li><li>
                                    <a href="/champions-league-tickets/champions-league-final-2024">
                                        <div class="text">Champions League Final 2024</div>
                                    </a>
                                </li><li>
                                    <a href="/uefa-euro-2024/uefa-euro-2024-final">
                                        <div class="text">UEFA Euro 2024 Final</div>
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
                                        <a href="https://www.footballticketpad.com/group/league/europa-league">
                                            <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-45.png);"></span>Europa League</div>
                                        </a>
                                    </li><li>
                                        <a href="https://www.footballticketpad.com/group/league/copa-america">
                                            <div class="text hasLogo"><span style="background-image:url(/uploads/resized-logs/league-835.png);"></span>Copa America</div>
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
                            <a href="https://www.footballticketpad.com/checkout/338500?quantity=&eventId=&hotel=1">
                                <div class="nav-icon desktop">
                                    <svg id="cart" data-name="Capa 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 469.33">
                                    <path d="M509.87,89.6c-2.14-2.13-4.27-4.27-8.54-4.27H96L85.33,29.87c0-4.27-6.4-8.54-10.66-8.54h-64C4.27,21.33,0,25.6,0,32S4.27,42.67,10.67,42.67H66.13l51.2,260.26c6.4,34.14,38.4,59.74,72.54,59.74H435.2c6.4,0,10.67-4.27,10.67-10.67s-4.27-10.67-10.67-10.67H192c-17.07,0-34.13-8.53-42.67-23.46L460.8,275.2c4.27,0,8.53-4.27,8.53-8.53L512,96S512,91.73,509.87,89.6ZM450.13,256,138.67,296.53l-38.4-192H486.4Z" transform="translate(0 -21.33)"></path>
                                    <path d="M181.33,384a53.34,53.34,0,1,0,53.34,53.33A52.82,52.82,0,0,0,181.33,384Zm0,85.33c-17.06,0-32-14.93-32-32s14.94-32,32-32,32,14.94,32,32S198.4,469.33,181.33,469.33Z" transform="translate(0 -21.33)"></path>
                                    <path d="M394.67,384A53.34,53.34,0,1,0,448,437.33,52.82,52.82,0,0,0,394.67,384Zm0,85.33c-17.07,0-32-14.93-32-32s14.93-32,32-32,32,14.94,32,32S411.73,469.33,394.67,469.33Z" transform="translate(0 -21.33)"></path>
                                    </svg>
                                    <div class="item-added">
                                        <span id="lblCartCount" data-cart-tot-count="1" class="item-no">1</span>
                                    </div>
                                </div>
                            </a>
                            <ul id="UlCartItems" style="overflow: scroll; min-height: 120px; max-height: 200px">
                                <li id="cart_ticket_1" class="ticketCart">
                                    x FA Cup Final 2024
                                </li>
                                <li class="view-cart">
                                    <a href="https://www.footballticketpad.com/checkout/338500?quantity=&eventId=&hotel=1">View cart</a>

                                    <a id="deleteCart" style="cursor:pointer;">
                                        Clear cart</a>
                                </li>
                            </ul>
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
                                    <span id="lblCartCount" class="item-no">1</span>
                                </div>
                            </div>
                            <ul id="UlCartItems" style="min-width: 315px;">
                                <li id="cart_ticket_1" class="ticketCart">
                                    x FA Cup Final 2024
                                </li>
                                <li class="view-cart">
                                    <a href="https://www.footballticketpad.com/checkout/338500?quantity=&eventId=&hotel=1">View cart</a>
                                    <a id="deleteCartMob" style="cursor:pointer;">
                                        Clear cart</a>
                                </li>

                            </ul>
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
        </div>
    </div>
</header>
<div class="container">
    <div class="configVariables hidden" cartId="2680039" pgateway="sectrading" isTixstock="0" loginstate=" 0 " convrate="1" quantity="2" pTicketId="338500" choose-hotel-url="https://www.footballticketpad.com/choose-hotel/338500?quantity=2&eventId=10290&hotel=1" totalamount="892.87" loginurl="https://www.footballticketpad.com/customer/account/checkout/login" getshippingformurl="https://www.footballticketpad.com/checkout/getShippingForm" getshippingurl="https://www.footballticketpad.com/checkout/getShipping/338500" promourl="https://www.footballticketpad.com/checkout/setPromoCode/338500" timeexpiredurl="https://www.footballticketpad.com/checkout/timerexpired/2680039/338500" paymentnotcompleted="Payment has not been completed" checkouterror="Unable to place order." validate-before-payment="https://www.footballticketpad.com/validate-before-payment" checkout-delete-room="https://www.footballticketpad.com/checkout/deleteRoom" checkRegisteredEmail="https://www.footballticketpad.com/checkout/checkUserRegistered" newCheckoutRegister="https://www.footballticketpad.com/checkout/newCheckoutRegister" step2Payment="https://www.footballticketpad.com/checkout/step2Payment/338500" newCheckoutRegisterDetails="https://www.footballticketpad.com/checkout/newCheckoutRegisterDetails" getDelPriceUrl="https://www.footballticketpad.com/checkout/getDelPriceUrl" saveAddressDataToCheckoutSession="https://www.footballticketpad.com/checkout/saveAddressDataToCheckoutSession" saveAddressDataToSession="https://www.footballticketpad.com/checkout/saveAddressDataToSession" ticketTixstockUrl="https://www.footballticketpad.com/checkout/checkTicketTixstockAvailable/338500" ticketReleaseUrl="https://www.footballticketpad.com/checkout/releaseTicket/2680039" tixstockFlag="1" resetTixstockUrl="https://www.footballticketpad.com/checkout/resetTixstockTimer" stLiveStatus="1">
    </div>
    <div class="content">
        <div class="checkout">
            <div class="expired-modal">
                <div class="overlay"></div>
                <div class="window">
                    <div class="heading">Ticket Expired</div>
                    <div class="input-container">
                        Your ticket has expired and has been relisted
                        <br><br>
                        Please try to buy the ticket again.
                    </div>
                    <div class="mesg promo-error"></div>
                    <button type="button" data-redirect-home class="c2a_btn">OK</button>
                </div>
            </div>
            <div class="promo-modal">
                <div class="overlay"></div>
                <div class="window">
                    <span class="ftp-close"></span>
                    <div class="heading">Promotion code</div>
                    <div class="input-container">
                        <label>Enter promotion code</label>
                        <input type="text" name="promo_code" placeholder="Example code" />
                    </div>
                    <div class="mesg promo-error"></div>
                    <button type="button" data-close-promo class="c2a_btn">Apply code</button>
                </div>
            </div>
            <div class="check-ticket-availability-modal">
                <div class="overlay"></div>
                <div class="window">
                    <div class="heading">Checking Ticket Availability</div>
                    <div class="input-container">
                    </div>
                    <div class="recheck-tix-err-text"></div>
                    <a class="home-redirect-button" href="https://www.footballticketpad.com">
                        <button type="button" data-redirect-home class="c2a_btn" id="deleteTicketHotels">Ok</button>
                    </a>
                    <!-- -->
                </div>
            </div>
            <div class="ftp-alerts">
                <div class="alert warning timerClock">
                    <div class="inner">
                        <div class="checkout-alert">
                            <div class="heading timerHead">
                                Your tickets are not reserved, checkout to avoid losing them

                                <span class="countdown" id="defaultCountdown">-- : --</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="confirmMsg">
                <div class="messagepop pop">
                    <p class="msgParaBox"><i class="fa fa-warning"></i> We are processing your Order. Please don't refresh or leave the page. You will be redirected to success page automatically after processing the order.</p>
                    <div class="confirm-progress-bar"></div>
                </div>
            </div>



            <div class="bookFeePaymentConfirmationModal" id="bookFeePaymentConfirmationModal">
                <div class="overlay"></div>
                <div class="window">

                    <div class="heading">Updated Price Summary</div>
                    <div class="input-container">
                        <div class="grand-total">
                            <input type="hidden" id="checkoutFinalTotAmtGbp" name="checkoutFinalTotAmtGbp" value="1785.74">
                            <div class="bold">

                                2 x tickets at &pound;
                                735.29
                                each
                            </div>
                            <br>
                            <div class="bold">
                                Delivery Charge :
                                <span class="cost" id="freeDelCostSumm"></span>
                                <span class="disp-del-price-summ">
                                    &pound;
                                    <span class="deliveryPriceValueSumm" id="deliveryPriceValueSumm"></span>
                                </span>
                            </div>
                            <br>
                            <div class="bold">
                                Final ticket price : &pound;
                                <span class="totalTicketBookingFee" id="totalTicketBookingFee">1785.74</span>
                            </div>
                            <br>
                        </div>
                        <div style="font-size:20px">(Includes booking fee)
                        </div>
                    </div>
                    <div class="mesg promo-error"></div>
                    <button type="button" data-close-promo class="c2a_btn" id="confirmBookingPayment">Confirm Payment</button>

                </div>
            </div>


            <div class="hotelRecheckModal" id="hotelRecheckModal">
                <div class="overlay"></div>
                <div class="window">

                    <div class="heading">Hotels - Not Bookable</div>
                    <div class="input-container">
                        <div class="hotelRecheckText">
                            <p>
                            </p>
                            <br>
                            <br>
                        </div>
                    </div>
                    <input type="hidden" name="recheckToken" id="recheckToken">
                    <div class="mesg promo-error"></div>
                    <button type="button" data-close-promo class="c2a_btn" id="selectNewRooms">Select Rooms</button>
                    <button type="button" data-close-promo class="c2a_btn" id="cancelNewSelection">Continue Booking</button>
                </div>
            </div>

            <div class="quick-summary">
                <div class="quick-price">
                    <div>
                        <div class="price-split">
                            <span class="booking-sum">Your Booking Summary</span>
                        </div>
                        <div class="price-split">
                            <span>25/05/2024 </span>
                            <span style="text-align: right;">FA Cup Final 2024</span>
                        </div>
                        <div class="price-split mobile_head">
                            <span>2x ticket(s)</span><span>at
                                &pound;625.00
                                each</span>
                        </div>
                        <div class="price-split mobile_head_log">
                            <span>2x ticket(s)</span><span>at
                                &pound;<span class="ticket_hotel_total" style="margin:0px;"></span>
                                each</span>
                        </div>
                        <div class="price-split">
                            <span>Club Wembley VIP - Manchester City Section</span>
                            <span>
                            </span>
                        </div>
                    </div>
                    <div class="sum-fix">
                        <a href="#" id="reveal-summary" class="reveal-sum">See full summary</a>
                    </div>
                </div>
            </div>
            <div class="section darker">
                <div class="inner checkout-container">
                    <div class="checkout-steps">
                        <div id="step-container"><div id="fb-root"></div>
                            <div class="progress-bar">
                                <div class="account-progress active-progress">
                                    1 - Account Information
                                </div>
                                <div id="pay-progress" class="payment-process">
                                    2 - Payment Information
                                </div>
                            </div>
                            <div class="signed-in">


                                <h3>Already registered? </h3>
                                <a class="tog-sign" id="toggleSignIn">

                                    <button type="button" name="signin" class="c2a_btn continue login-button">LOGIN</button>
                                </a>


                            </div>
                            <form class="sign-in-old" method="post" action id="checkoutlogin-form">
                                <div class="active-signin">
                                    <div class="toggle-signin">
                                        <h2 class="ticketpad-account">Sign in with your Ticketpad account</h2>
                                        <div class="input-holder">
                                            <label>Email</label>
                                            <input type="email" name="username" placeholder="Ex. John@mail.com" aria-required="true" required="1" minlength="2" />
                                            <p class="error"></p>
                                        </div>
                                        <div class="input-holder">
                                            <label>Password</label>
                                            <input type="password" name="password" aria-required="true" required="1" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;&bull;" />
                                            <p class="error"></p>
                                        </div>
                                        <a href="#" class="forgot-align">Forgot Password?</a>
                                        <div class="actions">
                                            <button type="submit" class="c2a_btn" name="auth_login">Sign in</button>
                                        </div>
                                        <div class="social-login">
                                            <p style="font-size:16px; font-weight: 600;">Sign in with</p>
                                            <div class="socialmedia-login">
                                                <a href="https://www.footballticketpad.com/customer-account/login/fb">
                                                    <font color="black">Facebook</font>
                                                    <div style="margin: 0 5px;" class="fb-login-button" data-width data-size="medium" data-button-type="login_with" data-auto-logout-link="false" data-use-continue-as="true">
                                                    </div>
                                                </a>
                                                <button class="google-singin">
                                                    <a href="https://www.footballticketpad.com/customer-account/login/google">
                                                        Sign in with Google
                                                    </a>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <input type="hidden" name="guestTimerexpiredUrl" value="https://www.footballticketpad.com/checkout/timerexpired/guest/2680039/338500" />
                            <div id="step1" class="step active">
                                <div class="cent-content">
                                    <div class="heading">
                                        <p class="del-heading">Buyer Information</p>
                                    </div>
                                    <form class="form" id="checkoutregister-form">
                                        <div class="fields">
                                            <div class="input-row">
                                                <div class="input-holder">
                                                    <label>First name*
                                                        <input type="text" name="first_name" aria-required="true" required="1" minlength="2" />
                                                        <p class="error"></p>
                                                    </label>
                                                </div>
                                                <div class="input-holder">
                                                    <label>Last name*
                                                        <input type="text" name="last_name" aria-required="true" required="1" />
                                                        <p class="error"></p>
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="input-row">
                                                <div class="input-holder">
                                                    <label>Email*</label>
                                                    <input type="email" name="email" required="1" />
                                                    <p class="error"></p>
                                                </div>
                                                <div class="input-holder">
                                                    <label>Repeat email</label>
                                                    <input type="email" name="email_confirmation" required="1" />
                                                    <p class="error"></p>
                                                </div>
                                            </div>
                                            <div class="input-row">
                                                <div class="input-holder">
                                                    <label>Password*</label>
                                                    <input type="password" name="password" required="1" minlength="8" />
                                                    <p class="error"></p>
                                                </div>
                                                <div class="input-holder">
                                                    <label>Repeat password</label>
                                                    <input type="password" name="password_confirmation" minlength="8" />
                                                    <p class="error"></p>
                                                </div>
                                            </div>
                                            <div class="input-row">
                                                <div class="input-holder">
                                                    <label>Telephone*</label>
                                                    <input type="text" name="contact_no" aria-required="true" required="1" minlength="7" />
                                                    <p class="error"></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="errDiv" style="color: red;"></div>
                                    </form>
                                    <div class="form">
                                        <input type="hidden" readonly="readonly" name="shipping_country" id="country" data-name="United Kingdom" value="GB">
                                        <div id="errDiv2" style="color:red;">
                                        </div >
                                        <form action="/" id="checkoutForm" class="checkoutForm">
                                            <input type="hidden" id="cThis" name="same_as_ship" value="false">
                                            <div class="form">
                                                <div class="fields">

                                                    <p class="del-heading">Billing address</p>

                                                    <div class="input-holder">
                                                        <label>
                                                            Address Line 1 *

                                                            <input class=" street" placeholder="Address" required="1" name="street_bill" type="text" value>
                                                            <p class="error"></p>
                                                        </label>
                                                    </div>
                                                    <div class="input-holder">
                                                        <label>Address line 2 *

                                                            <input class=" street" placeholder="Address" required="1" name="street_bill2" type="text" value>
                                                            <p class="error"></p>
                                                        </label>
                                                    </div>
                                                    <div class="input-holder">
                                                        <label>Postcode * <input class=" postcode" placeholder="Postcode" required="1" name="postcode_bill" type="text" value>
                                                            <p class="error"></p>
                                                        </label>
                                                    </div>
                                                    <div class="input-holder">
                                                        <label>City * <input class=" city" placeholder="City" required="1" name="city_bill" type="text" value>
                                                            <p class="error"></p>
                                                        </label>
                                                    </div>

                                                    <div class="input-holder">
                                                        <label>Country * <select class=" country-code input" placeholder="Country Code" id="country2" required="1" name="country_id_bill"><option value="AF">Afghanistan</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AG">Antigua and Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas, The</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia and Herzegovina</option><option value="BW">Botswana</option><option value="BR">Brazil</option><option value="BN">Brunei</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN">China, People&#039;s Republic of</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CD">Congo, Democratic Republic of the (Congo &ndash; Kinshasa)</option><option value="CG">Congo, Republic of the (Congo &ndash; Brazzaville)</option><option value="CR">Costa Rica</option><option value="CI">Cote d&#039;Ivoire (Ivory Coast)</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GA">Gabon</option><option value="GM">Gambia, The</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GR">Greece</option><option value="GD">Grenada</option><option value="GT">Guatemala</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HN">Honduras</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KP">Korea, Democratic People&#039;s Republic of (North Korea)</option><option value="KR">Korea, Republic of (South Korea)</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Laos</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MK">Macedonia</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="MX">Mexico</option><option value="FM">Micronesia</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar (Burma)</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="QA">Qatar</option><option value="RO">Romania</option><option value="RU">Russia</option><option value="RW">Rwanda</option><option value="KN">Saint Kitts and Nevis</option><option value="LC">Saint Lucia</option><option value="VC">Saint Vincent and the Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="ST">Sao Tome and Principe</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syria</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="TL">Timor-Leste (East Timor)</option><option value="TG">Togo</option><option value="TO">Tonga</option><option value="TT">Trinidad and Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TV">Tuvalu</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US">United States</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VA">Vatican City</option><option value="VE">Venezuela</option><option value="VN">Vietnam</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option></select>
                                                            <p class="error"></p>
                                                        </label>
                                                    </div>
                                                </div>
                                                <div class="contain-shipping-options">
                                                    <p class="del-heading">Ticket delivery options</p>
                                                    <div class="contain-del-options">
                                                        <div class="radio-holder">
                                                            <input type="hidden" name="cartId" value="2680039" />
                                                            <div class="radio-btn">
                                                                <label for="add-eticket-mobile-app" class="name format-label">
                                                                    <input class="cb" type="checkbox" id="add-eticket-mobile-app" name="delivery-type" value="eticket-mobile-app" />
                                                                    E-ticket/mobile app
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="cartId" value="2680039" />
                                                    <div id="shipping_methods" class="temp-hide"></div>
                                                </div>
                                                <div class="terms">
                                                    <label class="checkbox-label">
                                                        <input type="checkbox" id="terms-conditions" name="terms" value="terms-and-conditions" />
                                                        <input type="hidden" name="cartId" value="2680039" />
                                                        <span class="position-terms">
                                                            By having an account you are agreeing with our
                                                            <a target="_blank" href="https://www.footballticketpad.com/terms-conditions">Terms and Conditions</a>
                                                            and
                                                            <a target="_blank" href="https://www.footballticketpad.com/privacy-policy">Privacy Statement</a>
                                                        </span>
                                                    </label>
                                                </div><br/>
                                                <div class="action extra">
                                                    <button type="button" class="c2a_btn step-form-next">Next - Payment Details</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div id="step2" style="display: none;"><div class="step active">
                                    <div class="cent-content">
                                        <div class="form-step">
                                            <div class="form">
                                                <div id="errDivReg" style="color: red;"></div>
                                                <p class="del-heading">Payment information</p>
                                                <div class="card-img">


                                                    <img src="/assets/images/payments/maestro.png" alt="Maestro" width="40px" height="auto">
                                                    <img src="/assets/images/payments/mastercard.png" alt="Mastercard" width="40px" height="auto">
                                                    <img src="/assets/images/payments/visa.png" alt="Visa" width="40px" height="auto">
                                                </div>
                                                <div id="st-notification-frame"></div>
                                                <form id="st-form" action="https://www.footballticketpad.com/checkout/getPaymentResult" method="POST">
                                                    <div class="fields">
                                                        <div class="input-holder">
                                                            <label><div id="st-card-number" class="st-card-number"></div></label>
                                                        </div>
                                                        <div class="input-holder">
                                                            <label><div id="st-expiration-date" class="st-expiration-date"></div></label>
                                                        </div>
                                                        <div class="input-holder">
                                                            <label><div id="st-security-code" class="st-security-code"></div></label>
                                                        </div>
                                                    </div>
                                                    <input type="hidden" name="productId" value="338500" />
                                                    <input type="hidden" name="cartId" value="2680039" />
                                                    <div class="side-by-side">
                                                        <button class="c2a_btn step-form-prev" style="margin-top: 20px; margin-right: 15px; background: unset; color: #0735c6; border: 1px solid;">
                                                            Previous
                                                        </button>
                                                        <button id="st-form__submit" class="st-form__submit c2a_btn pay_now checkout-final" type="submit">
                                                            Pay now
                                                        </button>
                                                    </div>
                                                    <div id="st-animated-card" class="st-animated-card-wrapper"></div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <style type="text/css">

                                .temp-hide{
                                    position: absolute;
                                    left:-100%;
                                    height: 0;
                                    opacity: 0;
                                    z-index: -1;
                                }
                                .billing-adress {
                                    text-align: left;
                                    font-size: 18px;
                                    color: #000;
                                    display: block;
                                    font-weight: 400;
                                    height: 50px;
                                    line-height: 80px;
                                    -webkit-transition: ease-in-out all .3s;
                                    transition: ease-in-out all .3s;
                                    border-bottom: 2px solid transparent;
                                }

                                .country-list {
                                    max-width: 351px;
                                }

                                .country span {
                                    position: inherit !important;
                                }

                                .checkout .checkout-steps .input-holder.input-terms {
                                    width: 100%;
                                    line-height: 28px;
                                    text-align: center;
                                }

                                .extra{
                                    margin-top:50px;
                                }
                            </style>
                            <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/intlTelInput.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
                        </div>
                        <div class="add-payment-modal">
                            <div class="overlay"></div>
                            <div class="window">
                                <div class="heading">
                                    <div class="text">Payment details</div>
                                    <button type="button" class="close">X</button>
                                </div>
                                <div class="modal-inner">
                                    <div class="accepted-cards">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <style type="text/css">
                        .not-active{
                            display: none;
                        }
                    </style>
                    <div class="checkout-summary" id="breakdown">
                        <div class="price-breakdown">
                            <div class="match-info">
                                <div class="game-info">
                                    <div style="font-weight: 600;" class="item set-line-height">FA Cup Final 2024</div>
                                    <div class="item">FA Cup </div>
                                    <div class="item set-line-height">Wembley Stadium</div>
                                    <div class="date-and-time">

                                        <p class="item set-line-height">
                                            25/05/2024 - 15:00 </p>
                                    </div>
                                    <div class="seating-section">

                                        <div style="font-weight: 600;" class="item set-line-height" class="item">
                                            Club Wembley VIP - Manchester City Section
                                        </div>
                                        <div class="item set-line-height">
                                            Other Note:
                                            VIP SEATS CLUB WEMBLEY CITY SECTION SEATED TOGETHER - LOUNGE CLUB ACCESS PRE AND POST GAME
                                        </div>
                                    </div>
                                    <div class="contain-ticket-details">
                                        <div class="usp-container">
                                            <div class="feature">
                                                <img src="https://www.footballticketpad.com/assets/frontend/2018/images/004-eye.png" alt="Best value tickets" width="35px" />
                                                <p>
                                                    Other Note
                                                </p>
                                            </div>
                                            <div class="feature">
                                                <img src="https://www.footballticketpad.com/assets/frontend/2018/images/002-commerce-and-shopping.png" alt="Best value tickets" width="35px" />
                                                <p>Best value tickets</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <span class="ticketp" style="display:none;" data-price="1470.58">1470.58 </b></span>
                            <div class="match-details">
                                <span class="hotelp" data-price="0"></span>
                                <div class="grand-total">
                                    <div class="delivery-details">
                                        <div style="font-size:18px; margin-top: 0; font-weight: 600; margin-bottom: 20px;">Order details</div>

                                        <div class="price-split">
                                            <span>Price</span>
                                            <span>&pound;625.00 each</span>
                                        </div>


                                    </div>

                                    <div class="price-split">
                                        <span>Quantity</span>
                                        <span>2x ticket(s)</span>
                                    </div>
                                    <div class="price-split">
                                        <span>Ticket type</span>
                                        <span>
                                            <span class="checkoutIcon">
                                                <img src="/assets/svg/eticket_print.svg" alt="E-Ticket printer" height="20px" width="auto" />
                                            </span>
                                            E-tickets </span>
                                    </div>

                                    <div class="price-split">
                                        <span>Delivery</span>
                                        <span style="text-align: end; max-width: 150px;">E-Tickets and Mobile will be emailed within 72 hours of kick off</span>
                                    </div>
                                    <div class="price-split partial_check">
                                        <span style="font-size: 18px;">

                                            Sub
                                            Total
                                        </span>
                                        <span class>
                                            &pound;

                                            <span style="font-size: 18px;">
                                                1250
                                            </span>
                                        </span>
                                    </div>
                                    <div class="price-split full_total not-active">
                                        <span style="font-size: 18px;">
                                            Fees & Tax
                                        </span>
                                        <span>
                                            <span style="font-size: 18px;">
                                                £ 535.74
                                            </span>
                                        </span>
                                    </div>
                                    <div class="price-split full_total not-active">
                                        <span style="font-size: 18px;">

                                            Sub
                                            Total
                                        </span>
                                        &pound;
                                        <span style="font-size: 18px;" class="ticket_hotel_total"></span>
                                    </div>
                                </div>




                            </div>
                        </div>
                    </div>
                </div>
                <input type="text" id="checkout_final_price" name="checkout_final_price" value="1470.58" hidden="true">
            </div>

            <input type="hidden" id="roomP" value="0" />
            <input type="hidden" id="ticketp" value="1470.58" />
            <input type="hidden" id="ticketGuestp" value="1785.74" />
            <input type="hidden" id="ticketGuestLoc" value="1785.74" />
        </div>
    </div>
</div>
</div>
</div>
<script async type="6276b4eb410f80d7e7222863-text/javascript" src="//widget.trustpilot.com/bootstrap/v5/tp.widget.bootstrap.min.js"></script>
<%@include file="footer.jsp" %>
<script src="https://www.footballticketpad.com/assets/frontend/2018/js/slider.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
<script src="https://www.footballticketpad.com/assets/frontend/2018/js/common_v1-1.js?v=1.4" type="6276b4eb410f80d7e7222863-text/javascript"></script>
<script src="https://www.footballticketpad.com/assets/frontend/2018/js/app-mods.js?v=1.4" type="6276b4eb410f80d7e7222863-text/javascript"></script>

<script type="6276b4eb410f80d7e7222863-application/javascript" async src="//static.klaviyo.com/onsite/js/klaviyo.js?company_id=TFyH8Y"></script>
<script src="/assets/frontend/2018/js/checkoutV8.2.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>

<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-KWDJ87" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


<script async src="https://www.googletagmanager.com/gtag/js?id=UA-57128660-1" type="6276b4eb410f80d7e7222863-text/javascript"></script>


<script src="/cdn-cgi/scripts/7d0fa10a/cloudflare-static/rocket-loader.min.js" data-cf-settings="6276b4eb410f80d7e7222863-|49" defer></script></body>
</html>
