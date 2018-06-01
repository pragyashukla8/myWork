<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Auto Part</title>
  <link rel="stylesheet" href="css/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    h1 {
      color: #6495ED;
    }


    .btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 15px 0;
      border: none;
      width: 25%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
		
    }

    form {
      padding: 50px;
      border: 1px solid;
    box-shadow: 5px 10px #888888;
      display: inline-block;
      text-align: center;
      
    }

    label {
      display: inline-block;
      width: 150px;
      text-align: right;
    }

    /* only the submit button is matched by this selector,
   but to be sure you could use an id or class for that button */
  </style>

</head>

<body>

  <header id="home" class="header">
    <nav class="nav" role="navigation">
      <div class="container nav-elements">
        <div class="branding">
          <a href="#home"><img src="images/logo.png"
						alt="Logo - H Plus Sports"></a>
        </div>
        <!-- branding -->
        <ul class="navbar">
			<li><a href="carsearchresult">Search Cars</a></li>
        	<li><a href="partsearchresult">Search Parts</a></li>
        	<li><a href="logout">Logout</a></li>
        	<li><a href="shoppingcart">Cart</a></li>
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



  <section id="carpartform" class="section">
    <div class="container tagline">
      <br />
      <h1>New Car Part Post</h1>
      <p>Please provide the details of the Car Part!</p>
      <hr>
      <br/>
      <form action="carpartform" method="post">
        <div class="form-control">
          <label>Title of the Post:</label>
          <input type="text" class="form-control" id="partid" name="partid">
        </div>

        <div class="form-control">
         <label>Category:</label>
         <input list="category" name="category" placeholder="">
         <datalist id="category">
            <option>Select a type</option>
            <option>Air Filter</option>
            <option>Brake</option>
            <option>Exhaust</option>
            <option>Transmission</option>
        </datalist>
        </div>


        <div class="form-control">
          <label>Car Part Name</label>
          <input list="partname" name="partname" placeholder="">
         <datalist id="partname">
            <option>Select Part</option>
            <option>Series 33-2260</option>
            <option>Series 33-2135</option>
            <option>Brake Pad Sensor</option>
            <option>Speed Sensor</option>
            <option>REPF382403 EGR Line</option>
            <option>REPF382401 EGR Line</option>
            <option>REPC320704 Automatic Transmission</option>
            <option>REPC320703 Automatic Transmission Solenoid</option>
        </datalist>
        
        </div>

        <div class="form-control">
          <label style="vertical-align:top;">Description</label>
          <textarea style="width:173px;resize:none;"class="form-control" rows="5" id="description" name="description"></textarea>
        </div>

        <div class="form-control">
          <label>Price:</label>
          <input min="1"type="number" class="form-control" id="price" name="price">
        </div>

        <br />
        <div>
          <label>Car Part State</label>
          <label><input type="radio" name="status" id="status" value="New">New</label>
          <label><input type="radio" name="status" id="status" value="Used">Used</label>
        </div>
        <hr />

        <br />
        <div class="button">
          <input class="btn" type="submit" value="Submit" id="submit">
        </div>
      </form>
    </div>
  </section>


  <br />

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