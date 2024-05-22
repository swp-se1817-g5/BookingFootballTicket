<%-- 
    Document   : login
    Created on : May 23, 2024, 1:22:27 AM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : formCheckout
    Created on : May 23, 2024, 1:19:06 AM
    Author     : thuat
--%>
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
        <link rel="stylesheet" type="text/css" href="/assets/frontend/2018/css/cookieconsent.min.css" />
        <script src="/assets/frontend/2018/js/cookieconsent.min.js" type="6276b4eb410f80d7e7222863-text/javascript"></script>
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
                                    Please try to register again.

                                    <span class="countdown" id="defaultCountdown">-- : --</span>
                                </div>
                            </div>
                        </div>
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
                                    <div class="account-progress active-progress" style="width: 100%">
                                        Register Information
                                    </div>
                                </div>
                                <div class="signed-in">


                                    <h3>Already registered? </h3>
                                    <a class="tog-sign" id="toggleSignIn">

                                        <button type="button" name="signin" class="c2a_btn continue login-button">LOGIN</button>
                                    </a>


                                </div>
                                <input type="hidden" name="guestTimerexpiredUrl" value="https://www.footballticketpad.com/checkout/timerexpired/guest/2680039/338500" />
                                <div id="step1" class="step active">
                                    <div class="cent-content">
                                        <div class="heading">
                                            <p class="del-heading">User Information</p>
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
                                                        <button type="button" class="c2a_btn step-form-next">Register</button>
                                                    </div>
                                                </div>
                                            </form>
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

                        </div>

                        <style type="text/css">
                            .not-active{
                                display: none;
                            }
                        </style>

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

