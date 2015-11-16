<%-- 
    Document   : index
    Created on : 22-Oct-2015, 18:09:49
    Author     : Manthan1412
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Cart</title>
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="CSS/reset.css"/>
        <link rel="stylesheet" href="CSS/mycart.css"/>
         <!--<script src="JS/jquery-2.1.4.js"></script>-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="JS/admin.js"></script>
        <script src="JS/jquery.menu-aim.js"></script>
    </head>
    <body>
       <header class="cd-main-header">
		<a href="#0" class="cd-logo"><IMAGE src="IMAGE/cd-logo.svg" alt="Logo"></a>
		
		<div class="cd-search is-hidden">
			<form action="#0">
				<input type="search" placeholder="Search...">
			</form>
		</div> 

		<a href="#0" class="cd-nav-trigger">Menu<span></span></a>

		<nav class="cd-nav">
			<ul class="cd-top-nav">
				<li><a href="#0">Tour</a></li>
				<li><a href="#0">Contact us</a></li>
				<li class="has-children account pad">
                                    <a href="#0">
						<img src="IMAGE/cd-avatar.png" alt="avatar">
						Admin
					</a>

					<ul>
						<li><a href="#0">My Account</a></li>
						<li><a href="#0">Edit Account</a></li>
						<li><a href="#0">Logout</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</header> <!-- .cd-main-header -->

	<main class="cd-main-content">
		<nav class="cd-side-nav">
			<ul>
				<li class="cd-label">Main</li>
				<li class="has-children overview">
					<a href="#0">Overview</a>
					
					<ul>
						<li><a href="#0">All Data</a></li>
						<li><a href="#0">Category 1</a></li>
						<li><a href="#0">Category 2</a></li>
					</ul>
				</li>
				<li class="has-children notifications active">
					<a href="#0">Orders<span class="count">3</span></a>
					
					<ul>
						<li><a href="#0">Delivered<span class="count">1</span></a></li>
						<li><a href="#0">Dispatched<span class="count">2</span></a></li>
						<li><a href="#0">Not executed</a></li>
					</ul>
				</li>

				<li class="has-children comments">
					<a href="#0">Products</a>
					
					<ul>
						<li><a href="#0">All Comments</a></li>
						<li><a href="#0">Edit Comment</a></li>
						<li><a href="#0">Delete Comment</a></li>
					</ul>
				</li>
			</ul>

			<ul>
				<li class="cd-label">Secondary</li>
				<li class="has-children bookmarks">
					<a href="#0">Advertisements</a>
					
					<ul>
						<li><a href="#0">All Bookmarks</a></li>
						<li><a href="#0">Edit Bookmark</a></li>
						<li><a href="#0">Import Bookmark</a></li>
					</ul>
				</li>
				<li class="has-children images">
					<a href="#0">Offers</a>
					
					<ul>
						<li><a href="#0">All Images</a></li>
						<li><a href="#0">Edit Image</a></li>
					</ul>
				</li>

				<li class="has-children users">
					<a href="#0">Users</a>
					
					<ul>
						<li><a href="#0">All Users</a></li>
						<li><a href="#0">Edit User</a></li>
						<li><a href="#0">Add User</a></li>
					</ul>
				</li>

				<li class="has-children users">
					<a href="#0">Messages<span class="count">1</span></a>
				</li>	
			</ul>

			<!-- <ul>
				<li class="cd-label">Action</li>
				<li class="action-btn"><a href="#0">+ Button</a></li>
			</ul> -->
		</nav>

		<div class="content-wrapper">
                    <div class="temp">
                        temp
                    </div>
			<!--<h1>Page is under construction! </h1>-->
		</div> <!-- .content-wrapper -->
                
	</main>
    </body>
</html>
