<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.test.beans.PartInventory"%>
<%@page import="com.test.beans.BookingData"%>
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

        <ul class="navbar">
          <li><a href="carsearchresult">Search Cars</a></li>
          <li><a href="partsearchresult">Search Parts</a></li>
          <li><a href="logout">Logout</a></li>
          <li><a href="shoppingcart">Cart</a></li>
        </ul>

      </div>

    </nav>


  </header>



  <section id="carform" class="section">
    <div class="container tagline">
      <br />
      <h1>Edit Account Information</h1>
      <p>Please provide your information!</p>
      <hr>
      <br/>
      <form action="accountedit" method="post">
      
      	  <%
  	     	List<Users> userdetail = new ArrayList<Users>();
  	    	userdetail = (ArrayList)request.getAttribute("userdetail");
  			Iterator<Users> iterator = userdetail.iterator();
  			while (iterator.hasNext()) {
  				Users users = iterator.next();

       	 %>
      
        <div class="form-control">
          <label>First Name:</label>
          <input type="text" class="form-control" id="fname" name="fname" value=<%=users.getFname()%> readonly>
        </div>
        <div class="form-control">
          <label>Last Name:</label>
          <input type="text" class="form-control" id="lname" name="lname" value=<%=users.getLname()%> readonly>
        </div>
        <div class="form-control">
          <label>Contact:</label>
          <input type="text" class="form-control" id="contact" name="contact" value=<%=users.getContact()%>>
        </div>
        <div class="form-control">
          <label>Email:</label>
          <input type="text" class="form-control" id="email" name="email" value=<%=users.getEmailid()%>>
        </div>
        <div class="form-control">
          <label>Address:</label>
          <input type="text" class="form-control" id="address" name="address" value=<%=users.getAddress()%>>
        </div>
        <div class="form-control">
          <label>Date of Birth:</label>
          <input type="text" class="form-control" id="dob" name="dob" value=<%=users.getDateofbirth()%> readonly>
        </div>
        <br />
        <hr />
        <div class="button">
          <input class="btn" type="submit" value="Submit" id="submit" name="submit">
        </div>
        
        <%
  			}
        %>
        
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
      <p class="legal">For questions about the Auto Part Buying Service please call 1-888-878-4227. © AutoPart, Inc. All rights reserved. Vehicle photos © Evox Images © 1986-2018 Chrome Data Solutions, LP</p>
    </div>
    <!-- container -->
  </footer>
  <!-- footer -->




</body>

</html>