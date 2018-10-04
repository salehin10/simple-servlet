<%-- 
    Document   : index
    Created on : Aug 5, 2018, 9:14:48 PM
    Author     : Salehin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap-grid.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- own cascade style sheet -->
        <link rel="stylesheet" href="myCSS/index.css">
        <title>Hello, world!</title>
    </head>
    
    <body>
        <div class="container text-container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h2 class="welcome-text">Welcome to TripAdvisor !!</h2>
                </div>
            </div>
        </div>
        <div class="container form-container">
            <div class="row center-block">
                <div class="col-xl-12">
                    <div class="card" style="width: 18rem;">
                        <div class="card-body">
                            <h5 class="card-title text-center">Log-in <img src="myCSS/img/airplane%20(1).png" alt="travel" /></h5>
                            <form action="Index" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" name="userEmail" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" class="form-control" name="userPassword" placeholder="Password">
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <button type="submit" class="btn btn-primary">Next</button>                                       
                                    </div>
                                    <div class="col-6">
                                        <button type="submit" formaction="" class="btn btn-primary">Sign-up</button>
                                    </div>
                                    
                                </div>
                                <!--<button type="submit" class="btn btn-primary">Submit</button> -->
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

</html>
