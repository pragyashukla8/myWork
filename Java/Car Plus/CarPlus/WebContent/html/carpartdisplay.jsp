<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.PartInventory"%>
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
    
    .btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 10px 0;
      border: none;
      width: 30%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
		
    }



    form {
      padding: 100px;
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
    #partid, #partname, #description, #category, #price{
      border: ;
      outline: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size: 18px;
		
    }
    img {
    
    border-radius: 4px;
    padding: 5px;
    
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
      <h1>Car Parts</h1>
      <p>Check out our Car Parts!</p>
      <hr>
      <br/>
      
      <%
		    List<PartInventory> partdetail = new ArrayList<PartInventory>();	  
			partdetail = (ArrayList)request.getAttribute("partdetail");
			Iterator<PartInventory> iterator = partdetail.iterator();
			while (iterator.hasNext()) {
				PartInventory partinventory = iterator.next();
      		
      %>
      
      <form action="carpartdisplay" method="post">
      
      	<div class="form-control">
      		<img style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin-left:75px; margin-bottom:35px;" width="320" height="260" src="<%=partinventory.getImagepath()%>">
      	</div>	
      
        <div class="form-control">
          <label>ID:</label>
          <input style="border:none;" type="text" class="form-control" id="partid" name="partid" value=<%=partinventory.getPartid()%> READONLY>
        </div>

        <div class="form-control">
          <label>Car Part Name:</label>
          <input style="border:none;" type="text" class="form-control" id="partname" name="partname" value=<%=partinventory.getName()%> READONLY>
        </div>

        <div class="form-control">
          <label style="vertical-align: top;">Description:</label>
          <textarea style="border:none; resize:none; wrap:hard;" class="form-control" rows="5" id="description" name="description" READONLY><%=partinventory.getDescription()%></textarea>
        </div>

        <div class="form-control">
          <label>Type:</label>
          <input style="border:none;" type="text" class="form-control" id="category" name="category" value=<%=partinventory.getCategory()%> READONLY>
        </div>

        <div class="form-control">
          <label>Price:</label>
          <input style="border:none;" type="number" class="form-control" id="price" name="price" value=<%=partinventory.getCost()%> READONLY>
        </div>

		<%
			if(partinventory.getStatus().equals("New"))
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
        <br />
        <div class="button">
          <input type="submit" value="Add to Cart" id="addToCart" class="btn">
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
      <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © and ™ AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
    </div>
    <!-- container -->
  </footer>
  <!-- footer -->




</body>

</html>