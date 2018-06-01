<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.CarInventory"%>
<%@page import="java.util.List"%>

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
    #cardisplay{
    padding-bottom:240px;
    }

    #save {
      /*color: #3385ff;*/
      background-color: #87CEFA;
      /* Green */
      border: none;
      padding: 8px 20px;
      text-align: right;

      display: inline-block;
      font-size: 17px;
      margin: 4px 2px;
      cursor: pointer;
    }

    .divclass {
      padding: 100px;
      border-radius: 4px;
      display: inline-block;
      text-align: center;
      margin: 55px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }
    
    form-control {
    	padding: 45px;
      border-radius: 4px;
      display: inline-block;
      text-align: center;
      margin: 55px;
      box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    label {
      display: inline-block;
      width: 140px;
      text-align: right;
      margin-right:8px;
    }


    
    .btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 10px 0;
      border: none;
      width: 11.2%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
		
    }
    
    #carid, #name, #description, #price, #make, #model, #yearmake, #color, #kmrun, #mileage{
      border: ;
      outline: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size: 20px;
		
    }
    
    .formfield * {
  vertical-align: top;
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



  <section id="cardisplay" class="section">
    <div class="container tagline">
      <br />
      <h1>Car Post</h1>
      <p>Please add to cart to buy</p>
      <hr>
      <br/>
      
      <%
	      List<CarInventory> cardetail = new ArrayList<CarInventory>();	  
	  	  cardetail = (ArrayList)request.getAttribute("cardetail");
			Iterator<CarInventory> iterator = cardetail.iterator();
			while (iterator.hasNext()) {
				CarInventory carinventory = iterator.next();
	  %>
      
      <form action="cardisplay" method="post">
      	<div class="divclass">
      	<div class="form-control">
      		<img style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin-left:15px; margin-bottom:35px;" width="420" height="350" src="<%=carinventory.getImagepath()%>">
      	</div>	
      
        <div class="form-control">
          <label>Title:</label>
          <input style="border:none;" type="text" class="form-control" id="carid" name="carid" value=<%=String.valueOf(carinventory.getCarid())%> READONLY>
        </div>

        <div class="form-control">
          <p class="formfield">
          <label style="vertical-aling:middle;">Description:</label>
          <textarea style="resize:none; border:none;" class="form-control" rows="5" id="description" name="description" READONLY><%=carinventory.getDescription()%></textarea>
          </p>
        </div>

        <div class="form-control">
          <label>Year:</label>
          <input style="border:none;" type="text" class="form-control" id="yearmake" name="yearmake" value=<%=carinventory.getYearmake()%> READONLY>
        </div>

        <div class="form-control">
          <label>Make:</label>
          <input style="border:none;" type="text" class="form-control" id="make" name="make" value=<%=carinventory.getCarmake()%> READONLY>
        </div>

        <div class="form-control">
          <label>Model:</label>
          <input style="border:none;" type="text" class="form-control" id="model" name="model" value=<%=carinventory.getCarmodel()%> READONLY>
        </div>
         
        <div class="form-control">
          <label>Color:</label>
          <input style="border:none;" type="text" class="form-control" id="color" name="color" value=<%=carinventory.getColor()%> READONLY>
        </div>

        <div class="form-control">
          <label>Consumption:</label>
          <input style="border:none;" type="text" class="form-control" id="mileage" name="mileage" value=<%=carinventory.getMileage()%> READONLY>
        </div>

        <div class="form-control">
          <label>Price:</label>
          <input style="border:none;" type="text" class="form-control" id="price" name="price" value=<%=String.valueOf(carinventory.getCost())%> READONLY>
        </div>

        <div class="form-control">
          <label>KM Run:</label>
          <input style="border:none;" type="text" class="form-control" id="kmrun" name="kmrun" value=<%=String.valueOf(carinventory.getKmrun())%> READONLY>
        </div>

        <div class="form-control">
          <br />
          <%
          	if(carinventory.getStatus().equals("New"))
          	{
          %>
          <div>
            <label>Car Part State:</label>
            <label><input type="radio" name="status" id="status" value="New" checked>New</label>
            <label><input type="radio" name="status" id="status" value="Used">Used</label>
          </div>
          <%
          	}else{
          %>
          
          <div>
            <label>Car Part State:</label>
            <label><input type="radio" name="status" id="status" value="New">New</label>
            <label><input type="radio" name="status" id="status" value="Used" checked>Used</label>
          </div>
          
          <%
          	}
          %>
          
          <hr />
          </div>
        </div>

        <br />
        <div class="button">
          <input style="width:20%;"class="btn"type="submit" value="Add To Cart" id="addToCart">
        </div>
      </form>
      <%
			}
      %>
      
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
      <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
    </div>
    <!-- container -->
  </footer>
  <!-- footer -->




</body>

</html>