<%-- 
    Document   : index
    Created on : 14-Oct-2015, 23:27:15
    Author     : Manthan1412
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/main.css"/>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="JS/main.js"></script>
        <title>Welcome to MyCart</title>
    </head>
    <body>
        <div class="main">
            <div class="header">
                <div class="absolute-header">
                    <div class="logo">
                        <h1>MyCart_Logo</h1>
                    </div>
                    <div class="signin">
                        <ul>
                            <li class="list-item"><a href="#" class="button cart"><img src="IMAGE/logo-big-shopping.png" style="height: 20px; width: 20px;">Cart</a></li>
                            <li class="list-item"><a href="#" class="button login-button">Log in</a></li>
                            <li class="list-item"><a href="#" class="button sign-up">Sign up</a></li>
                        </ul>
                    </div>
                </div>
                <div class="category">
                    Categories
                </div>
            </div>
            <div class="container">
                <div class="products">
                    <div class="offers">
                        offers
                    </div>
                    <div class="product">
                        products
                    </div>
                </div>
                <div class="advt">
                    advertisement
                </div>
            </div>
        </div>
        
        <!--user modal-->
        <div class="modal"> 
            <div class="modal-container"> 
                <ul class="switch">
                    <li><a href="#">Log in</a></li>
                    <li><a href="#">Sign up</a></li>
                </ul>
                <!--log in-->
                <div id="login">
                    <form class="form">
                        <p class="fieldset">
                            <label class="image-replace cd-email" for="login-email">E-mail</label>
                            <input class="full-width border user-detail" id="login-email" type="email" placeholder="E-mail">
                            <span class="error">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <label class="image-replace cd-password" for="login-password">Password</label>
                            <input class="full-width border user-detail" id="login-password" type="text"  placeholder="Password">
                            <a href="#0" class="hide-password">Hide</a>
                            <span class="error">Error message here!</span>
                        </p>

                        <p class="fieldset">
                            <input type="checkbox" id="remember-me" class="rem" checked>
                            <label for="remember-me">Remember me</label>
                        </p>

                        <p class="fieldset">
                            <input class="button-pad" type="submit" value="Login">
                        </p>
                    </form>

                    <p class="forgot-pwd"><a href="#">Forgot your password?</a></p>
                </div> 
            </div>
        </div>
    </body>
</html>
