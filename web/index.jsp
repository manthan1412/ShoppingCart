
<%-- 
    Document   : index
    Created on : 22-Oct-2015, 19:19:26
    Author     : Manthan1412
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
    String signin = request.getParameter("login");
    String signup = request.getParameter("signup");
    String signin_email = request.getParameter("signin-email");
    String signup_email = request.getParameter("signup-email");
    String signin_password = request.getParameter("signin-password");
    String signup_password = request.getParameter("signup-password");
    String signup_username = request.getParameter("signup-username");
    String reset_email = request.getParameter("reset-email");
    String next = request.getParameter("next");
    String signup_firstname = request.getParameter("signup-firstname");
    String signup_lastname = request.getParameter("signup-lastname");
    String signup_contact = request.getParameter("signup-contact");
    String signup_address = request.getParameter("signup-address");
    request.setAttribute("next","1");
    Object s = "1";
    Object x = request.getAttribute("next"); 
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="CSS/reset.css"/>
        <link rel="stylesheet" href="CSS/mycart.css"/>
        <link rel="stylesheet" href="CSS/modal.css"/>
        <!--<link rel="stylesheet" href="CSS/category.css"/>-->
        <script src="JS/jquery-2.1.4.js"></script>
        <!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>-->
        <script src="JS/modal.js"></script>
        <script>
            function login(){
                //document.getElementById("demo").innerHTML=m;
                document.getElementById("open-me-signin").click();
                <% 
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/my_cart","root","");
                Statement st= con.createStatement();
                String query="SELECT * from user WHERE email='"+signin_email+"'";
                ResultSet result=st.executeQuery(query);
                if(result.next()){
                    if(result.getString(5).equals(signin_password)){
                        
                    }
                    else{
                        %>
                            $(function(){
                                var $form_modal = $('.cd-user-modal'),
                                $form_login = $form_modal.find('#cd-login');
                                event.preventDefault();
                                $form_login.find('#signin-password').addClass('has-error').next('a').next('span').addClass('is-visible');
                           });
                    <%    
                    }
                }
                else{
                %>
                            $(function(){
                                var $form_modal = $('.cd-user-modal'),
                                $form_login = $form_modal.find('#cd-login');
                                event.preventDefault();
                                $form_login.find('#signin-email').addClass('has-error').next('span').addClass('is-visible');
                           });
              <% 
                } %>
            }
            function signup(){
                document.getElementById("open-me-signup").click();
                <%       
                    if(signup!=null){
                     Class.forName("com.mysql.jdbc.Driver");
                     st= con.createStatement();
                     query = "SELECT * FROM user WHERE username='"+signup_username+"'";
                     result = st.executeQuery(query);
                     if(signup_username.length()==0 || result.next()){ %>

               
                             $(function(){
                                 var $form_modal = $('.cd-user-modal'),
                                 $form_login = $form_modal.find('#cd-signup');
                                 event.preventDefault();
                                 $form_login.find('#signup-username').addClass('has-error').next('span').addClass('is-visible');
                             });

                     <%
                     }
                     else{
                         query = "SELECT * FROM user WHERE email='"+signup_email+"'";
                         ResultSet isValidEmail = st.executeQuery(query);
                         if(signup_email.length()==0 || isValidEmail.next()){
                     %>

                                 $(function(){
                                     var $form_modal = $('.cd-user-modal'),
                                     $form_login = $form_modal.find('#cd-signup');
                                     event.preventDefault();
                                     $form_login.find('#signup-email').addClass('has-error').next('span').addClass('is-visible');
                                 });

                     <%
                         }
                         else{
                             if(signup_password.length()<6){
                     %>

                                     $(function(){
                                     var $form_modal = $('.cd-user-modal'),
                                     $form_login = $form_modal.find('#cd-signup');
                                     event.preventDefault();
                                     $form_login.find('#signup-password').addClass('has-error').next('a').next('span').addClass('is-visible');
                                 });

                     <%
                             }
                             else{
                                 session.setAttribute("signup_username",(String)signup_username);
                                 session.setAttribute("signup_password",(String)signup_password);
                                 session.setAttribute("signup_email",(String)signup_email);
                                %>
                                 document.getElementById("demo").innerHTML = "<%=session.getAttribute("signup_username")%>";
                                 document.getElementById("open-me-next").click();
                              <%}
                         }
                     }
                     con.close();

                    }  %>
            }
            function next(){
                document.getElementById("open-me-next").click();
                var signup_contact = document.getElementById("signup-contact").value;
                var l = signup_contact.length;
                if(isNaN("<%out.print(signup_contact);%>") || l<10 || l>12 ){
                    $(function (){
                        var $form_modal = $('.cd-user-modal'),
                            $form_next = $form_modal.find('#cd-next');
                            event.preventDefault();
                            $form_next.find("#signup-contact").addClass('has-error').next('span').addClass('is-visible');
                    });
                }
                else{
                    document.getElementById("demo").innerHTML = "<%=session.getAttribute("signup_username")%>";
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    //st= con.createStatement();
                    String signup_user = (String)session.getAttribute(signup_username);
                    query = "INSERT INTO user(username,password,firstname,lastname,email,contact,address) values('"+(String)signup_user+"','"+session.getAttribute("signup_password")+"','"+signup_firstname+"','"+signup_lastname+"','"+session.getAttribute(signup_email)+"','"+signup_contact+"','"+signup_address+"')";
                    //ResultSet res = st.executeQuery(query);
                %>
                    document.getElementById("demo1").innerHTML="<%out.print(signup_user);%>";
                }
            }
            function check(){
                var v = document.getElementById("accept-terms").checked;
                if(v===false)
                    event.preventDefault();
                    //document.getElementById("demo").innerHTML=v;
            }
        </script>
        <title>My cart</title>
        
    </head>
    <body <% if(signin!=null) out.print("onload='login();'"); else if(signup!=null){ out.print("onload='signup();'");} else if(next!=null) out.print("onload='next();'"); %>>
        <header class="cd-main-header">
		<a href="#0" class="cd-logo"><img src="IMAGE/cd-logo.svg" alt="Logo"></a>
		
		<div class="cd-search is-hidden">
			<form action="#0">
				<input type="search" placeholder="Search...">
			</form>
		</div>

		<a href="#0" class="cd-nav-trigger">Menu<span></span></a>

		<nav class="cd-nav">
			<ul class="cd-top-nav">
				<li><a href="#0">Contact us</a></li>
				<li><a class="cd-signin" href="#" id="open-me-signin">Sign in</a></li>
                                <li class="signup-pad"><a class="cd-signup" href="#" id="open-me-signup">Sign up</a></li>
                                <li><a href="#" id="open-me-next" class="cd-nexts" style="display: none; visibility: hidden; overflow: hidden;">Next</a>
			</ul>
		</nav>
	</header>
        
        
        
        <div class="cd-user-modal">
		<div class="cd-user-modal-container">
			<ul class="cd-switcher">
				<li><a href="#0">Sign in</a></li>
				<li><a href="#0">New account</a></li>
			</ul>

			<div id="cd-login"> 
                            <form class="cd-form" method="post">
					<p class="fieldset">
						<label class="image-replace cd-email" for="signin-email">E-mail</label>
                                                <input class="full-width has-padding has-border" name="signin-email" id="signin-email" type="email" placeholder="E-mail" value="<%if(signin_email!=null) out.print(signin_email);%>">
						<span class="cd-error-message font-size">Invalid email address!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signin-password">Password</label>
						<input class="full-width has-padding has-border" id="signin-password" type="password" name="signin-password" placeholder="Password" value="<%if(signin_password!=null) out.print(signin_password);%>">
						<a href="#0" class="hide-password font-size">Show</a>
						<span class="cd-error-message font-size">Password didn't match!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="remember-me"  checked>
						<label for="remember-me" class="font-size">Remember me</label>
					</p>

					<p class="fieldset">
                                            <input type="submit" class="full-width has-padding" value="Login" name="login" />
					</p>
				</form>
				
				<p class="cd-form-bottom-message"><a href="#0" style="color:gray;">Forgot your password?</a></p>
                        </div> 

			<div id="cd-signup">
				<form class="cd-form" method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Username</label>
                                                <input class="full-width has-padding has-border" id="signup-username" type="text" placeholder="Username" name="signup-username" value="<% if(signup_username!=null) out.print(signup_username);%>">
						<span class="cd-error-message font-size">Not available!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-email" for="signup-email">E-mail</label>
						<input class="full-width has-padding has-border" id="signup-email" type="email" placeholder="E-mail" name="signup-email" value="<% if(signup_email!=null) out.print(signup_email);%>">
						<span class="cd-error-message font-size">Invalid email address!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Password</label>
						<input class="full-width has-padding has-border" id="signup-password" type="password"  placeholder="Password" name="signup-password" value="<% if(signup_password!=null) out.print(signup_password);%>">
						<a href="#0" class="hide-password font-size">Show</a>
						<span class="cd-error-message font-size">Minimum length should be 6!</span>
					</p>

					<p class="fieldset">
						<input type="checkbox" id="accept-terms">
						<label for="accept-terms" class="font-size">I agree to the <a href="#0">Terms</a></label>
					</p>

					<p class="fieldset">
                                            <input class="full-width has-padding" type="submit" value="Next" name="signup" onclick="check();">
					</p>
				</form>
			</div> 


			<div id="cd-next">
				<form class="cd-form" id="form-next" method="post">
					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Firstname</label>
                                                <input class="full-width has-padding has-border" id="signup-firstname" type="text" placeholder="Firstname" name="signup-firstname" value="<% if(signup_firstname!=null) out.print(signup_firstname);%>">
						<span class="cd-error-message font-size">Not available!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-username" for="signup-username">Lastname</label>
						<input class="full-width has-padding has-border" id="signup-lastname" type="text" placeholder="Lastname" name="signup-lastname" value="<% if(signup_lastname!=null) out.print(signup_lastname);%>">
						<span class="cd-error-message font-size">Invalid email address!</span>
					</p>

					<p class="fieldset">
						<label class="image-replace cd-password" for="signup-password">Contact No</label>
						<input class="full-width has-padding has-border" id="signup-contact" type="text"  placeholder="Contact No" name="signup-contact" value="<% if(signup_contact!=null) out.print(signup_contact);%>">
						<!--<a href="#0" class="hide-password font-size">Show</a>-->
						<span class="cd-error-message font-size">Length should be between 10 to 12!</span>
					</p>

                                        <p class="fieldset">
                                            <label class="image-replace cd-password" for="signup-password">Address</label>
                                            <input class="full-width has-padding has-border" id="signup-address" type="text" name="signup-address" placeholder="Address" value="<%if(signup_address!=null) out.print(signup_address);%>">
                                            <span class="cd-error-message font-size">Maximmum length is 160</span>
                                        </p>
                                        
                                        <p class="fieldset">
                                            <input class="full-width has-padding" type="submit" value="Next" name="next">
					</p>
                                        
                                        
				</form>
                                               
                                        <p class="cd-form-bottom-message"><a href="#0" style="color:gray;">Back</a></p>

			</div> 

			<div id="cd-reset-password"> 
				<p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

                                <form class="cd-form" method="post">
					<p class="fieldset">
						<label class="image-replace cd-email" for="reset-email">E-mail</label>
                                                <input class="full-width has-padding has-border" id="reset-email" type="email" placeholder="E-mail" name="reset-email" value="<% if(reset_email!=null) out.print(reset_email);%>">
						<span class="cd-error-message font-size">Invalid e-mail address!</span>
					</p>

					<p class="fieldset">
						<input class="full-width has-padding" type="submit" value="Reset password">
					</p>
				</form>

                                <p class="cd-form-bottom-message"><a href="#0" style="color:gray;">Back to log-in</a></p>
			</div> 
			<a href="#0" class="cd-close-form">Close</a>
		</div> 
	</div>
        
                                                
        <div class="category">
            <a class="padding" id="cat" href="#">Category</a>
            <ul class="list" id="list">
                <li class="list-item">Electronics</li>
                <li class="list-item">Kitchen</li>
                <li class="list-item">Men</li>
                <li class="list-item">Womens</li>
            </ul>
            
        </div>
          <!--main container-->
        <div class="main">
            <!--<p>main-container</p>-->
            <div class="container">
                <div class="products">
                    <div class="offers">
                        <div class="offer">
                            offer
                        </div>
                        <div class="offer">
                            offer
                        </div>
                        <div class="offer">
                            offer
                        </div>
                        <div class="offer">
                            offer
                        </div>
                        <div class="offer">
                            offer
                        </div>
<!--                        <p id="demo">/p>
                        <p id="demo1"></p>
                        <p><%=session.getAttribute("name") %></p>-->
                    </div>
                    <div class="product">
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                        <div class="pro">
                            product
                        </div>
                    </div>
                </div>
                <div class="advts">
                    <div class="advt">
                    advertisement
                    </div>
                    <div class="advt">
                    advertisement
                    </div>
                    <div class="advt">
                    advertisement
                    </div>
                    <div class="advt">
                    advertisement
                    </div>
                    <div class="advt">
                    advertisement
                    </div>
                </div>
            </div>
        </div>
     
    </body>
    
</html>