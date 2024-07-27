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
        <title>Đặt lại Mật khẩu </title>

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
            .title-under {
                font-family: 'Helvetica', sans-serif;
            }
            .btn {
                font-family: 'Helvetica', sans-serif;
            }

            .button-md {
                font-family: 'Helvetica', sans-serif;
            }
            .swal2-title {
                font-family: 'Helvetica', sans-serif;
            }
            /* Thiết lập vị trí tương đối cho input-group để chứa label và input */
            .input-group {
                position: relative;
                margin-bottom: 1.5rem; /* Để tạo khoảng cách giữa các input groups */
            }

            /* Đảm bảo rằng input có khoảng cách padding để label có thể nhảy lên trên */
            .input-group input {
                padding-top: 1.5rem;
                box-sizing: border-box;
                width: 100%;
            }

            /* Thiết lập vị trí ban đầu của label */
            .input-group label {
                position: absolute;
                top: 0; /* Đặt vị trí top là 0 để label nằm sát đầu dòng */
                left: 0;
                transition: all 0.2s;
                pointer-events: none; /* Để label không ảnh hưởng khi nhấp vào input */
                color: #999;
            }

            /* Khi input được focus hoặc có giá trị, di chuyển label lên trên */
            .input-group input:focus + label,
            .input-group input:not(:placeholder-shown) + label {
                top: -1rem; /* Điều chỉnh vị trí top để label nhảy lên trên */
                left: 0;
                font-size: 0.75rem;
                color: #5a5a5a;
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
                            <h2 class="title-head">Đặt Lại <span>Mật Khẩu</span></h2>
                            <p>Quay lại <a href="./homePage">Trang chủ</a></p>
                        </div>

                        <form id="resetPasswordForm" action="resetPassword" method="post" class="contact-bx">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="email" value="${email}" type="email" id="email" required class="form-control" readonly placeholder=" ">
                                            <label for="email">Email</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="password" type="password" id="password" required="" class="form-control" placeholder=" ">
                                            <label for="password">Mật khẩu mới</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <input name="confirmPassword" type="password" id="confirmPassword" required="" class="form-control" placeholder=" ">
                                            <label for="confirmPassword">Nhập lại mật khẩu mới</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <button name="submit" type="submit" value="Submit" class="btn button-md">Gửi</button>
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
            var regexPassword = '^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$';

            var password = document.getElementById("password"),
                    confirm_password = document.getElementById("confirmPassword");

            function validatePassword() {
                var passwordValue = password.value;
                if (!new RegExp(regexPassword).test(passwordValue)) {
                    password.setCustomValidity("Mật khẩu cần ít nhất 8 kí tự bao gồm: ký tự chữ thường, ít nhất 1 ký tự viết hoa và 1 ký tự số.");
                    return false;
                } else {
                    password.setCustomValidity('');
                    return true;
                }
            }

            function validateConfirmPassword() {
                if (password.value !== confirm_password.value) {
                    confirm_password.setCustomValidity("Mật khẩu phải trùng khớp!");
                    return false;
                } else {
                    confirm_password.setCustomValidity('');
                    return true;
                }
            }

            password.onchange = validatePassword;
            confirm_password.onkeyup = validateConfirmPassword;

            document.getElementById('resetPasswordForm').addEventListener('submit', function (event) {
                if (!validatePassword() || !validateConfirmPassword()) {
                    event.preventDefault();
                }
            });

        </script>
        <%
            String mess = (String) request.getAttribute("mess");
            if (mess != null) {
        %>  
        <script type="text/javascript">
            window.onload = function () {
                var message = '<%= mess != null ? mess.replace("'", "\\'") : ""%>';
                showLoginPopup(message);
            }
        </script>
        <%
            }
        %>

        <script type="text/javascript">
            function showLoginPopup(mess) {
                Swal.fire({
                    title: mess,
                    icon: 'error'
                });
            }
        </script>
    </body>

</html>
