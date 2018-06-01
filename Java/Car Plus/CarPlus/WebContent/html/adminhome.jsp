<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.beans.Users"%>
<%@page import="java.util.List"%>
<%@page import="com.test.beans.PartInventory"%>
<%@page import="com.test.beans.CarInventory"%>
<%@page import="com.test.beans.Login"%>
<%@page import="com.test.beans.BookingData"%>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <title>Auto Part</title>
  <link rel="stylesheet" href="css/style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Latest compiled and minified CSS -->
  <!-- Latest compiled and minified CSS -->
  <style>
    * {
      box-sizing: border-box
    }

    /* Set height of body and the document to 100% */

    body,
    html {
      height: 100%;
      margin: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;

    }

    h1,
    h2,
    h3,
    h4 {
      color: #6495ED;
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
      font-size: 17px;
      width: 25%;
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

    #Home {
      background-color: #F8F8F8;
    }

    #Ecommerce {
      background-color: #F8F8F8;
    }


    #Users {
      background-color: #F8F8F8;
    }

    #Posts {
      background-color: #F8F8F8;
    }

    #Orders {
      background-color: #F8F8F8;
    }

    #Statistics {
      background-color: #F8F8F8;
    }

    #ecommerce {
      margin: 35px;
    }


    .accordion {
      background-color: #eee;
      color: #444;
      cursor: pointer;
      padding: 18px;
      width: 100%;
      border: none;
      text-align: left;
      outline: none;
      font-size: 15px;
      transition: 0.4s;
    }

    .active,
    .accordion:hover {
      background-color: #ccc;
    }

    .accordion:after {
      content: '\002B';
      color: #777;
      font-weight: bold;
      float: right;
      margin-left: 5px;
    }

    .active:after {
      content: "\2212";
    }

    .panel {
      padding: 0 18px;
      background-color: white;
      max-height: 0;
      overflow: hidden;
      transition: max-height 0.2s ease-out;
    }

    form {
      padding: 30px;
      border: 1px solid black;
      display: inline-block;
      text-align: center;
    }

    label {
      display: inline-block;
      width: 140px;
      text-align: right;
      min-width: 80px;
    }



    .column {
      float: left;
      width: 42%;
      padding: 15px;
      margin: 20px;
      margin-left: 52px;
      text-align: center;
      background-color: white;
      height: 360px;
      box-shadow: 1px 1px #F8F8F8;

      border-radius: 20px;
      vertical-align: middle;
    }

    .today {
      float: left;
      width: 42%;
      padding-bottom: 25px;
      padding-left: 25px;
      padding-top: 12px;
      margin: 20px;
      margin-left: 52px;
      text-align: left;
      background-color: white;
      height: 135px;
      box-shadow: 1px 1px #F8F8F8;

      border-radius: 20px;
      vertical-align: middle;
    }

    .row:after {
      content: "";
      display: table;
      clear: both;
      margin-bottom: 20px;
      align: left;
      vertical-align: middle;
    }




    @media screen and (max-width:600px) {
      .column {
        width: 100%;
      }
    }

    ​.wide {
      width: 50%;
    }

    table {
      border-collapse: collapse;
      width: 100%;
    }

    th,
    td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    #span {
      display: inline-block;
      vertical-align: middle;
      line-height: normal;
    }

    .button {
      background-color: #4CAF50;
      /* Green */
      border: none;
      color: white;
      padding: 15px 32px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
    }

    .button2 {
      background-color: #FF7F50;
    }



    .button3 {
      background-color: #f44336;
    }

    input[type=text] {
      width: 230px;
      box-sizing: border-box;
      border: none;
      border-radius: 4px;
      font-size: 16px;
      background-color: white;
      background-position: 10px 10px;
      background-repeat: no-repeat;
      padding: 12px 20px 12px 40px;
      -webkit-transition: width 0.4s ease-in-out;
      transition: width 0.4s ease-in-out;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      outline: none;
    }

    input[type=text]:focus {}


    .btn {
      background-color: #6495ED;
      color: white;
      padding: 12px;
      margin: 10px 0;
      margin-left: 35px;
      margin-right: 25px;
      border: none;
      width: 27%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
      float: left;

    }

    .btn:hover {
      background-color: #45a049;
    }

    .form-control {
      border: none;
      background-color: #f8f8f8;
      text-align: center;
      outline: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size: 21px;
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
          <li><a href="logout">Logout</a></li>
        </ul>
        <!-- navbar -->
      </div>
      <!-- container nav-elements -->
    </nav>


  </header>
  <!-- #home -->


  <section id="profile" class="section">
    <div class="container tagline">

      <button class="tablink" onclick="openPage('Posts', this, '#F8F8F8')" id="defaultOpen">Posts</button>
      <button class="tablink" onclick="openPage('Orders', this, '#F8F8F8')">Orders</button>
      <button class="tablink" onclick="openPage('Users', this, '#F8F8F8')">Users</button>
      <button class="tablink" onclick="openPage('Statistics', this, '#F8F8F8')">Statistics</button>



      <div id="Posts" class="tabcontent">


        <h1>
          Post Statistics
        </h1>

		<%
			String caradcount = (String)request.getAttribute("caradcount");
			String partadcount = (String)request.getAttribute("partadcount");
		%>

        <div class="row">
          <div class="today">
            <h2 style="color:#ff8000">
              <br />
              Car Posts:
              <input style="font-size:28px; width:"type="text" class="form-control" id="category" value=<%=caradcount%> disabled>
            </h2>
            <br />

          </div>


          <div class="today">
            <h2 style="color:#06b200">
              <br />
              Car Part Posts:
              <input style="font-size:28px; width:"type="text" class="form-control" id="category" value=<%=partadcount%> disabled>
            </h2>
            <br />

          </div>

        </div>

        <div class="row">
          <table id="carttable">
            <thead>
              <tr>
                <th style="padding-left:42px; text-align: left;">Post ID</th>
                <th style="padding-left:42px; text-align: left;">Name</th>
                <th style="padding-right:132px;text-align: left;">Price</th>
              </tr>
            </thead>
            <tbody>

			  <%
  	        		List<PartInventory> partdetail = new ArrayList<PartInventory>();
  					partdetail = (ArrayList)request.getAttribute("partdetail1");
              		Iterator<PartInventory> iterator = partdetail.iterator();
              		while (iterator.hasNext()) {
  						PartInventory partinventory = iterator.next();

          	 	%>

              <tr>
				
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="postid" name="postid" value=<%=String.valueOf(partinventory.getPartid())%>> </td>
                <td> <input style=" text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="posttitle" name="posttitle" value=<%=partinventory.getName()%>> </td>
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="postprice" name="postprice" value=<%=String.valueOf(partinventory.getCost())%>></td>
              </tr>
              	<%
  					}
              	%>
              	
              	<%
  	        		List<CarInventory> cardetail = new ArrayList<CarInventory>();
  					cardetail = (ArrayList)request.getAttribute("cardetail1");
              		Iterator<CarInventory> iterator1 = cardetail.iterator();
              		while (iterator1.hasNext()) {
  						CarInventory carinventory = iterator1.next();

          	 	%>
			  <tr>	
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="postid" name="postid" value=<%=String.valueOf(carinventory.getCarid())%>> </td>
                <td> <input style=" text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="posttitle" name="posttitle" value=<%=carinventory.getCarmodel()%>> </td>
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="postprice" name="postprice" value=<%=String.valueOf(carinventory.getCost())%>></td>
              </tr>
              	<%
  					}
              	%>
              
              

            </tbody>
          </table>


        </div>

      </div>


      <div id="Orders" class="tabcontent">

        <h1>
          Order Statistics
        </h1>
        
        <%
			String carordercount = (String)request.getAttribute("carordercount");
			String partordercount = (String)request.getAttribute("partordercount");
		%>
        
        <div class="row">
          <div class="today">
            <h2 style="color:#ff8000">
              <br />
              Car Orders:
              <input style="font-size:28px; width:"type="text" class="form-control" id="category" value=<%=carordercount%> disabled>
            </h2>
            <br />

          </div>


          <div class="today">
            <h2 style="color:#06b200">
              <br />
              Car Part Orders:
              <input style="font-size:28px; width:200px;"type="text" class="form-control" id="category" value=<%=partordercount%> disabled>
            </h2>
            <br />

          </div>

        </div>

        <div class="row">
          <table id="carttable">
            <thead>
              <tr>
                <th style="padding-left:42px; text-align: left;">Post ID</th>
                <th style="padding-left:42px; text-align: left;">Name</th>
                <th style="padding-right:132px;text-align: left;">Price</th>
              </tr>
            </thead>
            <tbody>

			 <%
  	        		List<BookingData> bookingdetail = new ArrayList<BookingData>();
  					bookingdetail = (ArrayList)request.getAttribute("bookingdetail3");
              		Iterator<BookingData> iterator3 = bookingdetail.iterator();
              		while (iterator3.hasNext()) {
  						BookingData bookingdata = iterator3.next();

          	 %>

              <tr>
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="postpartid" name="postpartid" value=<%=String.valueOf(bookingdata.getOrderid())%>> </td>
                <td> <input style=" text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="postpartname" name="postpartname" value=<%=bookingdata.getItemname()%>> </td>
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="tect" disabled class="form-control" id="postprice" name="postprice" value=<%=String.valueOf(bookingdata.getCost())%>></td>
              </tr>
              
              <%
              		}
              %>

            </tbody>
          </table>

        </div>



      </div>

      <div id="Users" class="tabcontent">
        <h2>Users</h2>

        <div id="ecommerce">
          <table id="carttable">
            <thead>
              <tr>
                <th style="padding-left:42px; text-align: left;">Name</th>
                <th style="padding-right:132px;text-align: left;">Role</th>
              </tr>
            </thead>
            <tbody>

			<%
  	        		List<Login> logindetail = new ArrayList<Login>();
  					logindetail = (ArrayList)request.getAttribute("logindetail1");
              		Iterator<Login> iterator2 = logindetail.iterator();
              		while (iterator2.hasNext()) {
  						Login login = iterator2.next();

          	 %>

              <tr>
                <td> <input style=" text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="username" name="username" value=<%=login.getUsername()%>></td>
                <td> <input style="text-align: left; background-color:#f8f8f8;" type="text" disabled class="form-control" id="usertype" name="usertype" value=<%=login.getUsertype()%>></td>
              </tr>

			 <%
              		}
			 %>

            </tbody>
          </table>



        </div>
      </div>

      <div id="Statistics" class="tabcontent">
        <h2>Statistics</h2>
        
        <%
			String customercount = (String)request.getAttribute("customercount");
			String providercount = (String)request.getAttribute("providercount");
		%>

        <div id="ecommerce">
          <div class="row">
            <div class="today">
              <h2 style="color:#ff8000">
                <br />
                Car sold:
                <input style="font-size:28px; width:"type="text" class="form-control" id="category" value=<%=carordercount%> disabled>
              </h2>
              <br />

            </div>


            <div class="today">
              <h2 style="color:#06b200">
                <br />
                Car Ad Active:
                <input style="text-align: center; font-size:28px; width:150px;"type="text" class="form-control" id="category" value=<%=caradcount%> disabled>
              </h2>
              <br />

            </div>

          </div>
          <div class="row">
            <div class="today">
              <h2 style="color:#2E86C1">
                <br />
                Car Part Sold:
                <input style="text-align: center;font-size:28px; width:"type="text" class="form-control" id="category" value=<%=partordercount%> disabled>
              </h2>
              <br />

            </div>


            <div class="today">
              <h2 style="color:#F1C40F">
                <br />
                Car Part Active:
                <input style="text-align: center; font-size:28px; width:150px;"type="text" class="form-control" id="category" value=<%=partadcount%> disabled>
              </h2>
              <br />

            </div>

          </div>

          <div class="row">
            <div class="today">
              <h2 style="color:#F1C40F">
                <br />
                Total Providers:
                <input style="font-size:28px; width:150px;"type="text" class="form-control" id="category" value=<%=providercount%> disabled>
              </h2>
              <br />

            </div>


            <div class="today">
              <h2 style="color:#2E86C1">
                <br />
                Total Customers:
                <input style="font-size:28px; width:150px;"type="text" class="form-control" id="category" value=<%=customercount%> disabled>
              </h2>
              <br />

            </div>

          </div>


        </div>
      </div>




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
    // List of orders, Analytics, and Users scripts ---> Accordion HTML function
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
          panel.style.maxHeight = null;
        } else {
          panel.style.maxHeight = panel.scrollHeight + "px";
        }
      });
    }
  </script>

</body>

</html>