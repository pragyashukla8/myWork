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
 form {
      padding: 50px;
      border: 1px solid black;
      display: inline-block;
      text-align: center;
      box-shadow: 5px 10px #888888;
    }

    label {
      display: inline-block;
      width: 150px;
      text-align: right;
    }
	.btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 12px 0;
      border: none;
      width: 25%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
		
    }
</style>
</head>
<body>
	<header id="home" class="header">
		<nav class="nav" role="navigation">
			<div class="container nav-elements">
				<div class="branding">
          <a href="#home"><img src="images/logo.png" alt="Logo "></a>
        </div>
				<!-- branding -->
				<ul class="navbar">
          		<li><a href="login">Login</a></li>
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
	

	<section id="forgetpassword" class="section">
	<h1 style="magin-top:20px; margin-left:22%;">Forget Password</h1>
	<hr>
		<div class="container ">

			
			<form action="forgetpassword" method="post">
				<label>User Name</label> <input type="text" name="username"
					id="username"><br /> 				
				<label>Email ID</label> <input type="text" name="emailid"
					id="emailid"><br /> 
				<label>Secret Question </label>
					<input list="secretquestion" name="secretquestion">
					<datalist id="secretquestion">
    					<option value="What is your mother's maiden name?">
    					<option value="What was your first school?">
    					<option value="What was your birth city?">
    					<option value="What was your first pet name?"> 
    				</datalist><br/> 
    			<label>Secret Answer</label> <input type="text" name="secretanswer"
					id="secretanswer"><br />
				<label>New Password</label> <input type="password" name="newpassword"
					id="newpassword"><br />	
					<hr style="1px solid #f2f2f2; margin-top:20px;">
					<input class="btn"type="submit" value="Submit">
			</form>
		</div>
		</section>
</body>
</html>