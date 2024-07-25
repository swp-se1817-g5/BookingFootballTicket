<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

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
        <title>Quên mật khẩu</title>

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
        <style>
            body {
                font-family: 'Helvetica', sans-serif;
            }
            .title-head {
                font-family: 'Helvetica', sans-serif;
            }
            .btn {
                font-family: 'Helvetica', sans-serif;
            }

            .button-md {
                font-family: 'Helvetica', sans-serif;
            }
            

        </style>

    </head>
    <body id="bg">
        <div class="page-wraper">
            <div class="account-form">
                <div class="account-head" style="background-image:url(./assets/images/background/bg2.jpg);">
                    <a href="index.html"><img src="./images/logo/FBT.png" alt=""></a>
                </div>
                <div class="account-form-inner">
                    <div class="account-container">
                        <div class="heading-bx left">
                            <h2 class="title-head">Quên <span>Mật Khẩu</span></h2>
                            <!--                            <p>Đăng nhập tài khoản của bạn <a href="./login">Ở đây</a></p>-->
                            <p>Quay lại <a href="./homePage">Trang chủ</a></p>
                        </div>

                        <form action="requestPassword" method="post" class="contact-bx">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Địa chỉ Email của bạn</label>
                                            <input type="email" class="form-control"
                                                   name="email" 
                                                   id="email" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <button name="submit" type="submit" onclick="return validateEmail();" value="Submit" class="btn button-md">Gửi</button>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
                                        function validateEmail() {
                                            var email = document.querySelector('input[name="emailInputReset"]').value;
                                            var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
                                            if (!emailRegex.test(email)) {
//                                                showErrorPopup("Please enter a valid email addres!");
                                                return false;
                                            }
                                            return true;
                                        }

        </script>
        <%
            String mess = (String) request.getAttribute("mess");
            String messEr = (String) request.getAttribute("messEr");
            if (mess != null || messEr != null) {
        %>  
        <script type="text/javascript">
            window.onload = function () {
                var message = '<%= mess != null ? mess.replace("'", "\\'") : ""%>';
                var errorMessage = '<%= messEr != null ? messEr.replace("'", "\\'") : ""%>';
                if (message) {
                    showLoginPopup(message);
                }
                if (errorMessage) {
                    showErrorPopup(errorMessage);
                }
            }
        </script>
        <%
            }
        %>
        <script type="text/javascript">
            function showLoginPopup(mess) {
                Swal.fire({
                    title: mess,
                    icon: 'success'
                });
            }

            function showErrorPopup(messEr) {
                Swal.fire({
                    title: messEr,
                    icon: 'error'
                });
            }
        </script>
    </body>

</html>
