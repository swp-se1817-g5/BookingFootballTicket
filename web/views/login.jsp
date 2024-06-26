<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <!-- META ============================================= -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="keywords" content="" />
        <meta name="author" content="" />
        <meta name="robots" content="" />

        <!-- DESCRIPTION -->
        <meta name="description" content="EduChamp : Education HTML Template" />

        <!-- OG -->
        <meta property="og:title" content="EduChamp : Education HTML Template" />
        <meta property="og:description" content="EduChamp : Education HTML Template" />
        <meta property="og:image" content="" />
        <meta name="format-detection" content="telephone=no">

        <!-- FAVICONS ICON ============================================= -->
        <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png" />

        <!-- PAGE TITLE HERE ============================================= -->
        <title>Booking Football Ticket </title>

        <!-- MOBILE SPECIFIC ============================================= -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!--[if lt IE 9]>
        <script src="assets/js/html5shiv.min.js"></script>
        <script src="assets/js/respond.min.js"></script>
        <![endif]-->

        <!-- All PLUGINS CSS ============================================= -->
        <link rel="stylesheet" type="text/css" href="./assets/css/assets.css">

        <!-- TYPOGRAPHY ============================================= -->
        <link rel="stylesheet" type="text/css" href="./assets/css/typography.css">

        <!-- SHORTCODES ============================================= -->
        <link rel="stylesheet" type="text/css" href="./assets/css/shortcodes/shortcodes.css">

        <!-- STYLESHEETS ============================================= -->
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css">
        <link class="skin" rel="stylesheet" type="text/css" href="assets/css/color/color-1.css">
        
    </head>
    <body id="bg">
        <div class="page-wraper">
            <div class="account-form">
                <div class="account-head" style="background-image:url(./assets/images/background/bg2.jpg);">
                    <a href="index.html"><img src="./assets/images/logo-white-2.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Login <span>Now</span></h2>
                            <p>Register Your Account <a href="./register">Click here</a></p>
                        </div>    
                        <c:if test="${not empty errorMessage}">
                            <p style="color:red">${errorMessage}</p>
                        </c:if>
                        <form class="contact-bx" action="login" method="post">
                            <input type="hidden" name="redirectURL" value="${redirectURL}">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Email</label>
                                            <input name="email" type="email" value="${emailValid}" required class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Password</label>
                                            <input id="password" name="password" type="password" value="${passValid}" required class="form-control">                                   
                                            <i id="togglePassword" class="fa fa-eye-slash" aria-hidden="true" style="cursor: pointer;"></i>  
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="d-flex align-items-center">
                                        <input class="" type="checkbox"
                                               name="remember_me"
                                               name="remember_me"  id="remember_me">
                                        <label class="form-check-label text-secondary fs-3" 
                                               style="margin-left: 5px; font-weight: 400;" for="remember_me">
                                            Remember me!
                                        </label>
                                        <a href="requestPassword" class="ml-auto">Forgot Password?</a>

                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30 mt-4">
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Login</button>
                                </div>

                                <div class="col-lg-12">
                                    <h6>Login with Social media</h6>
                                    <div class="d-flex">
                                        <a class="btn flex-fill m-r5 facebook" href="https://www.facebook.com/v19.0/dialog/oauth?fields=id,name,email&client_id=2789778564531786&redirect_uri=http://localhost:8080/BookingFootballTicket/loginFB"><i class="fa fa-facebook"></i>Facebook</a>
                                        <a class="btn flex-fill m-l5 google-plus" href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/BookingFootballTicket/gmail&response_type=code&client_id=710226049781-g37fdin0lmq797dniqao07fsr27oj20j.apps.googleusercontent.com&approval_prompt=force"><i class="fa fa-google"></i>Google</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- External JavaScripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/vendors/bootstrap/js/popper.min.js"></script>
        <script src="assets/vendors/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/vendors/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/vendors/bootstrap-touchspin/jquery.bootstrap-touchspin.js"></script>
        <script src="assets/vendors/magnific-popup/magnific-popup.js"></script>
        <script src="assets/vendors/counter/waypoints-min.js"></script>
        <script src="assets/vendors/counter/counterup.min.js"></script>
        <script src="assets/vendors/imagesloaded/imagesloaded.js"></script>
        <script src="assets/vendors/masonry/masonry.js"></script>
        <script src="assets/vendors/masonry/filter.js"></script>
        <script src="assets/vendors/owl-carousel/owl.carousel.js"></script>
        <script src="assets/js/functions.js"></script>
        <script src="assets/js/contact.js"></script>
        <script src='assets/vendors/switcher/switcher.js'></script>
        <script>
            document.getElementById('togglePassword').addEventListener('click', function () {
                const passwordInput = document.getElementById('password');
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                this.classList.toggle('fa-eye-slash');
                this.classList.toggle('fa-eye');
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <%
            String successMess = (String) request.getAttribute("successMess");
            if (successMess != null) {
        %>
        <div class="alert alert-success" role="alert">
            <%= successMess%>
        </div>
        <%
            }
        %>

    </body>

</html>
