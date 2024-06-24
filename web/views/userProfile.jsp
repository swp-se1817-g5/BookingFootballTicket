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
        <link rel="canonical" href="https://www.footballticketpad.com/account/info" />
        <link rel="alternate" hreflang="x-default" href="https://www.footballticketpad.com/account/info" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Football Booking Ticket</title>
        <meta name="description" content="Football Ticket Pad">
        <meta name="keywords" content="Football Ticket Pad">
        <meta name="author" content>
        <meta property="og:image" content="https://www.footballticketpad.com/assets/ftp-logo.png" />
        <meta name="google-site-verification" content="O7lp3hSrStK1vKzEa9v7j3rzLLYzUpjqsSwBuQXMjNg" />
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/dashboard.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/app9.css?v=1.4">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/pikaday.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/chartist.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/jquery-ui.min.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/bootstrap-multiselect.css">
        <link rel="stylesheet" href="https://www.footballticketpad.com/assets/frontend/2018/css/style-fix-v0.css?v=1.4">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery-3.3.1.min.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery-ui.min.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/vendor/jquery.inViewport.min.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/jquery-validator/jquery.validate.min.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/jquery-form.min.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/bootstrap-multiselect.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/hotel.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.google.com/recaptcha/api.js" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <script src="https://www.footballticketpad.com/assets/frontend/2018/js/app.js?v=1.4" type="92a57d65b99f90d20b5c8e41-text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="/map/167/style.css">
        <link rel="stylesheet" type="text/css" href="/assets/frontend/2018/css/cookieconsent.min.css" />
    </head>

    <body class="dashboard">
        <%@include file="header1.jsp" %>
        <div class="container">
            <div class="content">
                <nav class="menu">
                    <ul>
                        <li class><a href="https://www.footballticketpad.com/account/listing">Listing</a></li>
                        <li class><a href="https://www.footballticketpad.com/account/bookings">Purchases</a></li>
                        <li class><a href="https://www.footballticketpad.com/account/hotel/bookings">Hotel bookings</a></li>
                        <li class><a href="https://www.footballticketpad.com/account/sales">Sales</a></li>
                        <li class="active"><a href="https://www.footballticketpad.com/account/info">Account Information</a></li>
                        <li class><a href="https://www.footballticketpad.com/account/favourites">Favourites</a></li>
                    </ul>
                </nav>
                <div class="listing-header  tx-disabled">
                    <div class="inner">
                        <div class="item heading">
                            <h1 class="for-above-m-view">Account Information</h1>
                            <div class="for-below-m-view account-area-m-nav h1 " data-mod="select-menu">
                                <select>
                                    <option value="https://www.footballticketpad.com/account/listing">Listing</option>
                                    <option value="https://www.footballticketpad.com/account/bookings">Purchases</option>
                                    <option value="https://www.footballticketpad.com/account/hotel/bookings">Hotel bookings</option>
                                    <option value="https://www.footballticketpad.com/account/sales">Sales</option>
                                    <option value="https://www.footballticketpad.com/account/info" selected>Account Information</option>
                                    <option value="https://www.footballticketpad.com/account/favourites">Favourites</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="hidden-below-m-view">
                    <div class="section seller">
                        <div class="panel">
                            <div class="heading">Edit details</div>
                            <div class="body">
                                <form class="seller-form" method="post" id="form_edit_details" action="https://www.footballticketpad.com/account/info">
                                    <div class="full-width" style="background-color: white;">
                                        <div class="half-width">
                                                <div>
                                                    <label>Name</label>
                                                    <input type="text" name="firstname" value="${sessionScope.currentUser.name}" required />
                                                    <p class="error"></p>
                                                </div>
                                                <div>
                                                    <label>Email</label>
                                                    <input type="email" name="email" value="thuatthuat098@gmail.com" required readonly/>
                                                    <p class="error"></p>
                                                </div>
                                                <div class="tel-no">
                                                    <label for="tel_no">Mobile Number</label>
                                                    <input type="text" name="telephone" value="0943626825" />
                                                    <p class="error"></p>
                                                </div>
                                                <div>
                                                    <label>Role</label>
                                                    <input type="text" name="role" value="user" readonly/>
                                                    <p class="error"></p>
                                                </div>
                                                <label>Email</label>
                                                <input type="email" name="email" value="thuatthuat098@gmail.com" required />
                                                <p class="error"></p>
                                        </div>
                                        <div class="half-with">
                                            <div class="submit">
                                                <button type="submit" class="c2a_btn save_data" formId="form_edit_details">Save</button>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="section seller">
                        <div class="panel">
                            <div class="heading">Security</div>
                            <div class="body">
                                <form class="seller-form" id="form_update_security" method="post" action="https://www.footballticketpad.com/account/seller-security">
                                    <input type="hidden" name="_token" value="huzioONgvzJlks4RH5uurLDQ7tx0heQEZGOKtp7R">
                                    <div class="full-width">
                                        <div class="sub-heading">Change password</div>
                                    </div>
                                    <div class="full-width">
                                        <div class="half-width">
                                            <label>Current Password</label>
                                            <input type="password" name="current_password" required />
                                            <p class="error"></p>
                                        </div>
                                    </div>
                                    <div class="full-width">
                                        <div class="half-width">
                                            <label>New Password</label>
                                            <input type="password" name="new_password" required />
                                            <p class="error"></p>
                                        </div>
                                        <div class="half-width">
                                            <label> Repeat new password</label>
                                            <input type="password" name="confirm_new_password" required />
                                            <p class="error"></p>
                                        </div>
                                    </div>
                                    <div class="full-with">
                                        <div class="half-width">
                                            <p class="success-message"></p>
                                        </div>
                                        <div class="half-width submit">
                                            <button type="submit" class="c2a_btn save_data" formId="form_update_security">Save</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
            <style>
                .panel .body form .tel-no input {
                    width: 100%;
                    position: static;
                }
                .panel .body form .tel-no span {
                    position: static;
                }
                .intl-tel-input.allow-dropdown input, .intl-tel-input.allow-dropdown input[type=text] {
                    padding-left: 10px;
                }
                .flag-container{
                    border: 1px solid #ccc;
                    border-right: 0;
                }
                .listing-header .inner .item.heading {
                    width: unset;
                }
            </style>
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
