<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Cart"%>
<%@page import="java.util.List"%>

<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Auto Part</title>
  <link rel="stylesheet" href="css/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="http://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>

  <!-- Latest compiled and minified CSS -->
  <!-- Latest compiled and minified CSS -->
  <style>
    

    input[type=text] {

      margin-bottom: 20px;
      padding: 12px;
      border: 1px solid #f8f8f8;
      border-radius: 3px;
      background-color: #f8f8f8;
    }

    label {
      margin-bottom: 10px;
      display: block;
    }

    

    .btn {
      background-color: #6495ED;
      color: white;
      padding: 12px;
      margin: 10px 0;
      border: none;
      width: 100%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
    }

    .btn:hover {
      background-color: #45a049;
    }

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

    .tablink {
      background-color: white;
      color: black;
      float: left;
      border: none;
      outline: none;
      cursor: pointer;
      padding: 14px 16px;
      font-size: 18px;
      width: 100%;
      font-weight: bold;
    }

    .tablink:hover {
      background-color: #E8E8E8;
    }

    /* Style the tab content (and add height:100% for full page content) */

    .tabcontent {
      color: black;
      display: none;
      padding: 100px 20px;
      height: 100%;

    }

    #Cart {
      background-color: #F8F8F8;

    }


    #carttable {
      border-collapse: collapse;
      background-color: F8F8F8;
      padding: 10px;
      text-align: center;
      vertical-align: top;

    }

   
    #remove {
      background-color: #f8f8f8;
      border: none;
      outline: 0;
    }

    input[type=number] {
      margin-bottom: 19px;
      height: 40px;
      opacity: 4;
      border: none;
      background-color: #f8f8f8;
      text-align: center;
    }

    #wrapper {
      width: 100%;
      height: 100px;
    }
	
	#itemid, #itemname, #quantity, #price{
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size: 18px;
		
    }
    #profile {
    padding-bottom:240px;
    }








    ​
    /* only the submit button is matched by this selector,
   but to be sure you could use an id or class for that button */
  </style>

</head>

<body>
  <!-- Header -->
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
    <div class="container tagline">
      <button class="tablink" onclick="openPage('Cart', this, '#F8F8F8')" id="defaultOpen"></button>

      <div id="Cart" class="tabcontent">
        <h2 style="text-align:center; margin-bottom:40px;">My Shopping Cart</h2>
        <p style="text-align:center; margin-bottom:30px;">
          Please review your Cart!
        </p>

        <hr />

		
        <form action="shoppingcart" method="post">
		
          <table id="" align="center">

            <thead>
              <tr>
                <th></th>
                <th >ItemID</th>
                <th >Name</th>
                <th >Unit Price</th>
                <th >Quantity</th>
              </tr>
            </thead>
            <tbody>

			  <%
	        		List<Cart> cartdetail = new ArrayList<Cart>();	  
		   		    cartdetail = (ArrayList)request.getAttribute("cartdetail");
					Iterator<Cart> iterator = cartdetail.iterator();
					while (iterator.hasNext()) {
						Cart cart = iterator.next();
	  		  %>

              <tr>
                <!-- Remove button -->
                <td><input type="submit" value="x" id="remove" name="remove" style="font-size:26px;color:red;margin-bottom:21.5px"></input></td>

                <!-- Retrive Item1, Quantity1, Price1 and Total-->
                <td> <input style="text-align:center;" type="text"  id="itemid" name="itemid" value=<%=String.valueOf(cart.getCartid())%>  READONLY> </td>
                <td> <input style="text-align:center;"  type="text"  id="itemname" name="itemname" value=<%=cart.getItemname()%>  READONLY> </td>
                <td> <input style="text-align:center;"  type="text"  id="price" name="price"  READONLY value=<%=String.valueOf(cart.getCost())%>> </td>
                <td> <input style="text-align:center;"  type="number" min="1" id="quantity" name="quantity"  value=<%=cart.getQuantity()%>> 
                </td>
                <!-- End -->
              </tr>
			    <%
					}
	  			%>

            </tbody>

        </table>
       
        

          <div id="wrapper">
            <a href="billing.html">
            <input type="submit" value="Billing and Delivery Information" class="btn" id="checkout" name="checkout" style="text-align:center; width:30%; margin-top:100px; margin-left:150px;">
            </a>
          </div>
		
      </div>
		
      </form>

	  





    </div>

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




  <script>
    // Page Tab scripts
    function openPage(pageName, elmnt, color) {
      var i, tabcontent, tablinks;
      tabcontent = document.getElementsByClassName("tabcontent");
      for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
      }
      tablinks = document.getElementsByClassName("tablink");
      for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
      }
      document.getElementById(pageName).style.display = "block";
      elmnt.style.backgroundColor = color;

    }
    document.getElementById("defaultOpen").click();
  </script>

  <script>
    $(document).on('click', 'button.rmv', function() {
      $(this).closest('tr').remove();
      return false;
    });
  </script>

  <!-- <script>
    $('.delivery-checkbox').on('change', function() {
      if ($('.delivery-checkbox').length > 1) {
        this.checked = false;
      }
    });
  </script> -->









</body>

</html>