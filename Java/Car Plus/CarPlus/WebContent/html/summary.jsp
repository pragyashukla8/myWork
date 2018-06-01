<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Auto Part</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>

  <!-- Latest compiled and minified CSS -->
  <!-- Latest compiled and minified CSS -->
  <style>
    a {
      color: #2196F3;
    }

    hr {
      border: 1px solid lightgrey;
    }


    /* Set height of body and the document to 100% */

    body,
    html {
      font-family: Raleway, Helvetica, Arial, sans-serif;
    }

    h2 {
      color: #6495ED;
    }

    h3 {
      color: #6495ED;
      margin-bottom: 10px;
    }

    /* Style tab links */

    

    .tablink:hover {
      background-color: white;
    }

    /* Style the tab content (and add height:100% for full page content) */

    .tabcontent {
      color: black;
      display: none;
      padding: 200px 600px;
      height: 100%;
	  background-color:white;

    }


    #Summary {
      background-color: white;

    }
    
    #profile {
    padding-bottom:240px;
    
    }
    
    .btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 15px 0;
      border: none;
      width: 45%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
		
    }
    form {
    width: 100%;
    display: inline;
    }
    
    #profile {
    padding-bottom: 650px;
    }
  </style>

</head>

<body>
  <!-- Header -->
  <header id="home" class="header">
    <nav class="nav" role="navigation">
      <div class="container nav-elements">
        <div class="branding">
          
        </div>
        <!-- branding -->
        <ul class="navbar">
          <li><a href="login">Logout</a></li>
        </ul>
        <!-- navbar -->
      </div>
      <!-- container nav-elements -->
    </nav>


  </header>
  <!-- #home -->

  <!--Page tabs: My Cart, Customer Information, Order Review, Summary -->
  <section id="profile" class="section">

	<p></p>

	<form action="summary" method="post">
      
        <h2 style="margin-top: 40px;text-align:center;font-size:40px;"> Thank you for shopping with us! </h2>
        <p style="text-align:center;">
          You may view your Order Details here: <input style="margin-left: 16px;width: 195px;"class="btn" type="submit" value="Go to Home Page" id="homepage">
        </p>
      
    </form>  
  
    <br />
  </section>




  <!-- #products -->

  <footer class="footer">
    <div class="container">
      <nav class="nav" role="navigation">
        <div class="container nav-elements">
          <div class="branding">
            <a href="#home"><img src="images/logo.png"
							alt="Logo - H Plus Sports"></a>
            <p class="address">
              3241 S Wabash Ave<br> Chicago, IL 60616
            </p>
          </div>
        </div>
      </nav>
      <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © and ™ AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
    </div>
    <!-- container -->
  </footer>
  <!-- footer -->




  












</body>

</html>