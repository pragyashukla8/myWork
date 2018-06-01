<!doctype html>
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
  <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.min.css" rel="stylesheet" type="text/css" />
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
  <style>
    h2 {
      color: #6495ED;
    }
    #search1 {
    background-color:white;
    padding-bottom:240px;
    }
    
    
    .divclass {
      padding: 85px;
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
    
    #partid, #name, #status, #price {
      border: ;
      outline: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size: 18px;
		
    }
    
   
    /*Resize the wrap to see the search bar change!*/
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
          	<li><a href="carsearchresult">Search Cars</a></li>
        	<li><a href="logout">Logout</a></li>
        	<li><a href="shoppingcart">Cart</a></li>
        </ul>
        <!-- navbar -->
      </div>


      <!-- container nav-elements -->
    </nav>
    <div class="container tagline">
      <h1 class="headline">Our Mission</h1>
      <p></p>
    </div>
    <!-- container tagline -->
  </header>
  <!-- #home -->

  <section id="search1" class="section">
    <div class="container">
      <h2 class="headline">Search Car Parts</h2>
      <form action="partsearchresult" method="post">
        
        <!-- Type dropdow -->
        <select name="categoryoption" style="width:140px; height:33px; font-size:15px;">  
          <option selected="selected" value="">-Select Category-</option>
          <option value="Air Filter">Air-Filter</option>
          <option value="Brake">Brake</option>
          <option value="Exhaust">Exhaust</option>
          <option value="Transmission">Transmission</option>
        </select>
        
        <!-- Parts dropdow -->
        <select name="nameoption" style="width:327px; height:33px; font-size:15px;">  
          <option selected="selected" value="">-Select Part-</option>
          <option value="Series 33-2260">Series 33-2260</option>
          <option value="Series 33-2135">Series 33-2135</option>
          <option value="Brake Pad Sensor">Brake Pad Sensor</option>
          <option value="Speed Sensor">Speed Sensor</option>
          <option value="REPF382403 EGR Line">REPF382403 EGR Line</option>
          <option value="REPF382403 EGR Line">REPF382403 EGR Line</option>
          <option value="REPC320704 Automatic Transmission">REPC320704 Automatic Transmission</option>
          <option value="REPC320703 Automatic Transmission Solenoid">REPC320703 Automatic Transmission Solenoid</option>
        </select>
        
        <!-- Price range Dropdown -->
        <select name="pricerange" style="width:100px; height:33px; font-size:15px;">
          <option selected="selected" value="">-Price Sort-</option>
          <option value="1">High to Low</option>
          <option value="2">Low to High</option>
         </select>
        
        
        <!-- Search Button -->
        <input style="background-color:#6495ED; margin-left:3.5px; width: 10.6%;" class="btn" type="submit" value="Search" id="search" name="search">
        <input style="margin-left:3.5px; width: 10.6%;" class ="btn" type="submit" value="Refresh" id="refresh" name="refresh">
      	
      	<p>
      	<hr>
      	</p>
            <h2 style="text-align:left;"class="headline"></h2>
            
         <%
	  		     List<PartInventory> partdetail = new ArrayList<PartInventory>();	  
	  	 		 partdetail = (ArrayList)request.getAttribute("partdetail");
				 Iterator<PartInventory> iterator = partdetail.iterator();
				 while (iterator.hasNext()) {
					PartInventory partinventory = iterator.next();
	 	 %>
            
			
			
			<div class="form-control">
			<div class="divclass">
				
            <div class="form-control">
            	<img style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); margin-left:15px; margin-bottom:35px;"  width="320" height="260" src="<%=partinventory.getImagepath()%>" READONLY>

            </div>
	
			<div class="form-control">
			<label for="partid">ID:</label>
           		 <input style="border:none;" type="text" class="form-control" id="partid" name="partid" value=<%=partinventory.getPartid()%> READONLY>
       	    </div>
			
			<div class="form-control">
				 <label for="name">Name:</label>
           		 <input style="border:none;" type="text" class="form-control" id="name" name="name" value=<%=partinventory.getName()%> READONLY>
       	    </div>
       	    
       	    <div class="form-control">
       	    	 <label for="status">Status:</label>
           		 <input style="border:none;" type="text" class="form-control" id="status" name="status" value=<%=partinventory.getStatus()%> READONLY>
       	    </div>
       	    
       	    <div class="form-control">
       	    	 <label for="price">Price:</label>
           		 <input style="border:none;" type="text" class="form-control" id="price" name="price" value=<%=String.valueOf(partinventory.getCost())%> READONLY>
       	    </div>
			
			<input style="margin-top:25px; width:35%;" class="btn" type="submit" value="View Detail" id="viewdetail" name="viewdetail">
			
			</div>        
          </form>
          
          <%
				 }
          %>
          
        </div>
      </div>
    </section>

  </section>

  <script>
    $(function() {
      var options = $("#product").html();
      $("#type").change(function(e) {
        var text = $("#type :selected").text();
        $("#product").html(options);
        if (text == "-Select-") return;
        $('#product :not([value^="' + text.substr(0, 3) + '"])').remove();
      });
    });
  </script>


  <!-- #history -->
  <!-- Top navigation -->




  <!-- #products -->


  <!-- guarantee -->


  <!-- people -->



  <!-- guarantee -->




  <footer class="footer">
    <div class="container">
      <nav class="nav" role="navigation">
        <div class="container nav-elements">
          <div class="branding">
            <a href="#home"><img src="images/logo.png" alt="Logo"></a>
            <p class="address">3241 S Wabash<br> Chicago, IL 60616
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