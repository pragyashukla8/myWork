<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<html>
<head>
<link rel="stylesheet" href="css/style.css">
<meta charset="ISO-8859-1">
<title>Auto Part</title>
<style>

	.btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px;
      margin: 8px 0;
      border: none;
      width: 25%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
    }

    .btn:hover {
      background-color: #45a049;
    }
    
    #forgot {
	font-size:16px;
	}
	
	#login {
	background-color:white;
	}
	
	form {
	padding:60px;
	display: inline-block;
	text-align: center;
	box-shadow: 5px 10px #888888;
	border: 1px solid black;
	}
	
	#login {
 	padding-bottom:390px;
 	}
	
</style>

</head>
<body>
	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding" >
					<a href="#home"><img style="margin-left:92px;" src="images/logo.png"
						alt="Logo - H Plus Sports"></a>
				</div>
				<!-- branding -->
				<ul class="navbar">

				</ul>
				<!-- navbar -->
			</div>
			<!-- container nav-elements -->
		</nav>
		<!-- <div class="container tagline">
    <h1 class="headline">Our Mission</h1>
    <p>We support and encourage <em>active and healthy</em> lifestyles, by offering <em>ethically sourced</em> and <em>eco-friendly</em> nutritional products for the <em>performance-driven</em> athlete.</p>
  </div>container tagline -->
	</header>
	<!-- #home -->


	<section>
	<!-- displays date and time for today --> 
	<div style="margin-left:20px;">
	<h4 style="color:black; margin-top:20px; margin-bottom:20px;">Date/Time: <%=displayDate() %></h4>

	</div>
	
	</section>
	<section id="login" class="section">
		<div class="container ">

			
			<form action="login" method="post">
				<label>Username</label> <input style="margin-left:10px;" type="text" name="username"
					id="username"><br /> <label>Password</label> <input style="margin-left:15px;"
					type="password" name="password" id="password"><br /> 
					<p></p>
					<a style="margin-top:18px; color:#6495ED" id="forgot" href="forgetpassword"> Forgot Password??</a><br />
					<input style="margin-top:10px;" class="btn" type="submit" value="Login"></input>
					
			</form>
			
					
		</div>
	</section>
	<!-- #products -->


	<footer class="footer">
		<div class="container">

			<nav class="nav" role="navigation">
				<div class="container nav-elements">
					<div class="branding" ">
						<a href="#home"><img src="images/logo.png"
							alt="Logo - AutoPart"></a>
						<p class="address">
							3241 S Wabash<br> Chicago, IL 60616
						</p>
					</div>
				</div>
			</nav>
			<p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. and AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
		</div>
		<!-- container -->
	</footer>
	<!-- footer -->
	<%!
	public String displayDate(){
		SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		Date date = Calendar.getInstance().getTime();
		return dateFormat.format(date);
	}
	
	%>
</body>
</html>