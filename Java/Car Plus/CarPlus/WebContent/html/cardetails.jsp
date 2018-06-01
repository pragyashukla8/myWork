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

    #cardetails {
    background-color:white;
    padding-bottom:240px;
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
    
    #carid, #name, #description, #price, #make1, #model1, #yearmake, #color1, #kmrun, #mileage {
      border: ;
      outline: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size: 18px;
		
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



  <section id="cardetails" class="section">
    <div class="container tagline">
      <br />
      <h1>Edit Car Post</h1>
      <p>Please edit the details of your Car Post</p>
      <hr>
      <br/>
      
      <%
	      List<CarInventory> cardetail = new ArrayList<CarInventory>();	  
	  	  cardetail = (ArrayList)request.getAttribute("cardetail");
			Iterator<CarInventory> iterator = cardetail.iterator();
			while (iterator.hasNext()) {
				CarInventory carinventory = iterator.next();
	  %>
      
      <form action="cardetails" method="post">
      	<div class="divclass">
      	<div class="form-control">
      		<img style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin-left:10px; margin-bottom:35px;"  width="420" height="350" src="<%=carinventory.getImagepath()%>">
      	</div>	
      
        <div class="form-control">
          <label>Title:</label>
          <input type="text" class="form-control" id="carid" name="carid" value=<%=String.valueOf(carinventory.getCarid())%>>
        </div>

        <div class="form-control">
        <p class="formfield">
          <label>Description:</label>
          <textarea style="resize:none;" class="form-control" rows="5" id="description" name="description"><%=carinventory.getDescription()%></textarea>
        </p>
        </div>

        <div class="form-control">
          <label>Year:</label>
          <input type="text" class="form-control" id="yearmake" name="yearmake" value=<%=carinventory.getYearmake()%>>
        </div>

        <div class="form-control">
          <label>Make:</label>
          <input id="make1" list="make" name="make" value=<%=carinventory.getCarmake()%>>
          <datalist id="make">
		    <option>
               Select A Make
            </option>
        <option>Honda</option>
        <option>Kia</option>
        <option>Toyota</option>
        <option>Volvo</option>
      </datalist>
        </div>

        <div class="form-control">
          <label>Model:</label>
          <input id="model1" list="model" name="model" value=<%=carinventory.getCarmodel()%>>
          <datalist id="model">
		    <option>
               Select A Model
            </option>
            <option>Camry</option>
             <option>Civic</option>
             <option>Corolla</option>
             <option>CRV</option>
             <option>K900</option>
             <option>RIO</option>
             <option>V90</option>
             <option>XC60</option>
           </datalist>
         </div>
         
        <div class="form-control">
          <label>Color:</label>
          <input id="color1" list="color" name="color" value=<%=carinventory.getColor()%>>
          <datalist id="color">
		  <option>Select A Color</option>
          <option>Black</option>
          <option>Grey</option>
          <option>White</option>
        </datalist>
        </div>

        <div class="form-control">
          <label>Consumption:</label>
          <input type="text" class="form-control" id="mileage" name="mileage" value=<%=carinventory.getMileage()%>>
        </div>

        <div class="form-control">
          <label>Price:</label>
          <input type="text" class="form-control" id="price" name="price" value=<%=String.valueOf(carinventory.getCost())%>>
        </div>

        <div class="form-control">
          <label>KM Run:</label>
          <input type="text" class="form-control" id="kmrun" name="kmrun" value=<%=String.valueOf(carinventory.getKmrun())%>>
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

        <br />
        <div class="button">
          <input style="width:25%;" class="btn"type="submit" value="Submit" id="submit">
        </div>
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