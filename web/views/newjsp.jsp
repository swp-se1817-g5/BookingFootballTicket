<%-- 
    Document   : newjsp
    Created on : Jul 5, 2024, 2:46:50 PM
    Author     : thuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Homepage Bán Vé Đá Bóng</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <style>
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
            }
            .section-header h2 {
                margin-bottom: 0;
            }
            @media (max-width: 768px) {
                .section-header {
                    flex-direction: column;
                    align-items: flex-start;
                }
            }
            .card {
                margin-bottom: 1rem;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 2rem 0;
                text-align: center;
            }
            .card {
                border-radius: 15px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }
            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: none;
            }
            .card-body {
                text-align: center;
            }
            .team-logos {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 1rem;
            }
            .team-logos img {
                width: 50px;
                height: 50px;
                margin: 0 10px;
            }
            .book-now-btn {
                background-color: #007bff;
                color: white;
                border-radius: 5px;
                padding: 0.5rem 1rem;
                text-decoration: none;
            }
            .book-now-btn:hover {
                background-color: #0056b3;
                color: white;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light bg-light container">
            <a class="navbar-brand" href="#">Logo</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="tournamentsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Tournaments
                        </a>
                        <div class="dropdown-menu" aria-labelledby="tournamentsDropdown">
                            <a class="dropdown-item" href="#">Tournament 1</a>
                            <a class="dropdown-item" href="#">Tournament 2</a>
                            <a class="dropdown-item" href="#">Tournament 3</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="teamsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Đội bóng
                        </a>
                        <div class="dropdown-menu" aria-labelledby="teamsDropdown">
                            <a class="dropdown-item" href="#">Team 1</a>
                            <a class="dropdown-item" href="#">Team 2</a>
                            <a class="dropdown-item" href="#">Team 3</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="newsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Tin Tức
                        </a>
                        <div class="dropdown-menu" aria-labelledby="newsDropdown">
                            <a class="dropdown-item" href="#">News 1</a>
                            <a class="dropdown-item" href="#">News 2</a>
                            <a class="dropdown-item" href="#">News 3</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="matchesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Trận đấu
                        </a>
                        <div class="dropdown-menu" aria-labelledby="matchesDropdown">
                            <a class="dropdown-item" href="#">Match 1</a>
                            <a class="dropdown-item" href="#">Match 2</a>
                            <a class="dropdown-item" href="#">Match 3</a>
                        </div>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0 mr-3">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                </form>
                
                <ul class="navbar-nav">
                    <li class="nav-item" id="login-register">
                        <a class="nav-link" href="./login">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Register</a>
                    </li>
                    <li class="nav-item dropdown d-none" id="user-menu">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <img src="https://via.placeholder.com/30" class="rounded-circle" alt="User Avatar">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#">Profile</a>
                            <a class="dropdown-item" href="#">History</a>
                            <a class="dropdown-item" href="#">Logout</a>
                        </div>
                    </li>
                </ul>
                
            </div>
        </nav>

        <div class="container mt-5">
            <!-- Trận Đấu Sắp Diễn Ra -->
            <div class="section-header">
                <h2 class="mb-3">Trận Đấu Sắp Diễn Ra</h2>
                <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
            </div>
            <div class="row">
                <c:forEach items="${getListMatches}" var="lm" varStatus="lmStatus">
                    <c:set var="m" value="${getMatches[lmStatus.index]}" />
                    <c:set var="s" value="${getAllseason[lmStatus.index]}" />
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-header">
                                <div>
                                    <small>TICKETS SOLD</small>
                                    <span><p>79</p></span>
                                </div>
                                <div>
                                    <i class="far fa-heart"></i>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="team-logos">
                                    <img src="${lm.team1.img}" alt="${lm.team1.clubName}">
                                    <span>VS</span>
                                    <img src="${lm.team2.img}" alt="${lm.team2.clubName}">
                                </div>
                                <h5 class="card-title">Europa League Final Tickets</h5>
                                <p class="card-text">Football Club A vs Football Club B</p>
                                <p class="card-text">Mỹ Đình Stadium</p>
                                <input type="datetime-local" value="${m.time}" readonly style="border: none; background: none">
                                <p class="card-text">Europa League</p>
                                <p class="card-text">Tickets from</p>
                                <a href="matchDetail?matchId=${lm.matchId}" class="book-now-btn">Book now</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Các Đội Bóng Nổi Bật -->
            <div class="section-header">
                <h2 class="mb-3">Các Đội Bóng Nổi Bật</h2>
                <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 1">
                        <div class="card-body">
                            <h5 class="card-title">Team 1</h5>
                            <p class="card-text">Description of Team 1.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 2">
                        <div class="card-body">
                            <h5 class="card-title">Team 2</h5>
                            <p class="card-text">Description of Team 2.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 3">
                        <div class="card-body">
                            <h5 class="card-title">Team 3</h5>
                            <p class="card-text">Description of Team 3.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Team 4">
                        <div class="card-body">
                            <h5 class="card-title">Team 4</h5>
                            <p class="card-text">Description of Team 4.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Các Tournament -->
            <div class="section-header">
                <h2 class="mb-3">Các Tournament</h2>
                <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 1">
                        <div class="card-body">
                            <h5 class="card-title">Tournament 1</h5>
                            <p class="card-text">Description of Tournament 1.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 2">
                        <div class="card-body">
                            <h5 class="card-title">Tournament 2</h5>
                            <p class="card-text">Description of Tournament 2.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 3">
                        <div class="card-body">
                            <h5 class="card-title">Tournament 3</h5>
                            <p class="card-text">Description of Tournament 3.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Tournament 4">
                        <div class="card-body">
                            <h5 class="card-title">Tournament 4</h5>
                            <p class="card-text">Description of Tournament 4.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tin Tức -->
            <div class="section-header">
                <h2 class="mb-3">Tin Tức Mới Nhất</h2>
                <a href="#" class="btn btn-outline-secondary">Xem Thêm</a>
            </div>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="News 1">
                        <div class="card-body">
                            <h5 class="card-title">News 1</h5>
                            <p class="card-text">Description of News 1.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="News 2">
                        <div class="card-body">
                            <h5 class="card-title">News 2</h5>
                            <p class="card-text">Description of News 2.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="News 3">
                        <div class="card-body">
                            <h5 class="card-title">News 3</h5>
                            <p class="card-text">Description of News 3.</p>
                            <a href="#" class="btn btn-primary">Xem Thêm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <p>&copy; 2024 Your Website. All rights reserved.</p>
            </div>
        </footer>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    </body>
</html>
