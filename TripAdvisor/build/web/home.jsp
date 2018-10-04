<%-- 
    Document   : home
    Created on : Aug 9, 2018, 2:02:22 AM
    Author     : Salehin
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!--Own css file  -->
        <link rel="stylesheet" href="myCSS/homeStyle.css">
        <title>Home</title>
    </head>
    <!-- javaScript here -->

    <body>
        <!-- main nav bar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <img src="myCSS/img/visitbanla.png" alt="Visit Bangladesh" style="height:7%;width:6%">
            <a class="navbar-brand" href="home.jsp" style="margin-left:1%">Home</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Things To See
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="">Fair Festivals</a>
                            <a class="dropdown-item" href="zoo.jsp">Bangladesh National Zoo</a>

                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="aboutBangladesh.jsp">About Bangladesh</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0" action="index.jsp">
                    <a href="#"><%out.print(session.getAttribute("userEmail"));%></a>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">logout</button>
                </form>
            </div>
        </nav>
        <!-- Slide Start Here -->
        <div class="container carousel-container">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="myCSS/img/image5.png" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="myCSS/img/image3.png" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="myCSS/img/image2.png" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!-- Card Start Here -->
        <div class="container card-container">
            <div class="row">
                <div class="col-4">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="myCSS/img/Food.png" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Bangladeshi Food</h5>
                            <p class="card-text">Bangladesh is a land of many delicious & traditional foods.</p>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-8">

                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Visit Bangladesh</h5>
                        </div>
                        <div class="card-body">
                            <p class="card-text">
                                <%      try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        String jdbcURL = "jdbc:mysql://localhost:3306/userdb";
                                        String user = "root";
                                        String password = "";
                                        Connection con = null;
                                        con = DriverManager.getConnection(
                                                jdbcURL, user, password);
                                        Statement stmt = con.createStatement();
                                        String userQuery = "select * from visitbangladesh";
                                        ResultSet descriptionResultSet = stmt.executeQuery(userQuery);
                                        descriptionResultSet.next();
                                        out.print(descriptionResultSet.getString(1));
                                    } catch (ClassNotFoundException e) {
                                        out.println("Class not found");
                                    }
                                %>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="js/bootstrap.min.js"></script>
    
    
</html>