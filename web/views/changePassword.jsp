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
        <title>Change Password </title>

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
                            <h2 class="title-head">Change <span>Password</span></h2>
                        </div>

                        <form action="changepass" method="post" class="contact-bx">
                            <div class="row placeani">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Old Password</label>
                                            <input name="oldpassword" type="password" id="oldpassword" required="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>New Password</label>
                                            <input name="password" type="password" id="password" required="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label>Confirm Password</label>
                                            <input name="confirmPassword" type="password" id="confirmPassword" required="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 m-b30">
                                    <button name="submit" type="submit" onclick="validateSignupForm()" value="Submit" class="btn button-md">Submit</button>
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
                                                password.setCustomValidity("Password needs at least 8 characters, 1 lowercase character, 1 uppercase character, and 1 numeric character.");
                                                return false;
                                            } else {
                                                password.setCustomValidity('');
                                                return true;
                                            }
                                        }

                                        function validateConfirmPassword() {
                                            if (password.value !== confirm_password.value) {
                                                confirm_password.setCustomValidity("Passwords must be same!");
                                                return false;
                                            } else {
                                                confirm_password.setCustomValidity('');
                                                return true;
                                            }
                                        }

                                        password.onchange = validatePassword;
                                        confirm_password.onkeyup = validatePassword;

                                        function validateSignupForm() {
                                            var form = document.getElementById('signupForm');

                                            for (var i = 0; i < form.elements.length; i++) {
                                                if (form.elements[i].value === '' && form.elements[i].hasAttribute('required')) {
                                                    console.log('There are some required fields!');
                                                    return false;
                                                }
                                            }

                                            if (!validatePassword()) {
                                                return false;
                                            }

                                            onSignup();
                                        }

//                                        function onSignup() {
//                                            var xhttp = new XMLHttpRequest();
//                                            xhttp.onreadystatechange = function () {
//
//                                                disableSubmitButton();
//
//                                                if (this.readyState == 4 && this.status == 200) {
//                                                    enableSubmitButton();
//                                                } else {
//                                                    console.log('AJAX call failed!');
//                                                    setTimeout(function () {
//                                                        enableSubmitButton();
//                                                    }, 1000);
//                                                }
//
//                                            };
//
//                                            xhttp.open("GET", "ajax_info.txt", true);
//                                            xhttp.send();
//                                        }
        </script>
        <%
    String mess = (String) request.getAttribute("mess");
    String messEr = (String) request.getAttribute("messEr");
    if (mess != null || messEr != null) {
        %>  
        <script type="text/javascript">
            window.onload = function () {
                var message = '<%= mess != null ? mess.replace("'", "\\'") : "" %>';
                var errorMessage = '<%= messEr != null ? messEr.replace("'", "\\'") : "" %>';
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
