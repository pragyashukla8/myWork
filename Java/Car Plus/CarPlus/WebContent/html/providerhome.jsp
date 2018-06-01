<!DOCTYPE html>
<%@page import="java.util.Iterator"%>
 <%@page import="java.util.ArrayList"%>
 <%@page import="com.test.beans.Users"%>
 <%@page import="java.util.List"%>
 <%@page import="com.test.beans.PartInventory"%>
 <%@page import="com.test.beans.CarInventory"%>
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
			  #profile {
			  padding-bottom:1000px;
			  }
              body,
              html {
                height: 100%;
                margin: 0;
                font-family: Raleway, Helvetica, Arial, sans-serif;


              }

              h2 {
                color: #6495ED;
              }

              /* Style tab links */

              .tablink {
                background-color: #white;
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

              #Purchases {
                background-color: #F8F8F8;

              }

              #Sales {
                background-color: #F8F8F8;
                
              }

              #Posts {
                background-color: #F8F8F8;
                
              }

             

              form {}


              .accordion {
                background-color: #white;
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
            
            display: inline-block;
            text-align: center;
      }

 label {
           display: inline-block;
           width: 140px;
           text-align: right;
           min-width: 80px;
           margin-right:7px;
       }
 #newfname, #newlname,#newcontact,#newemail,#newaddress, #newdob {
      width: 50%;
      margin-bottom: 20px;
      padding: 12px;
      border: 1px solid #f8f8f8;
      border-radius: 3px;
    }
 

.btn {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 10px 0;
      border: none;
      width: 8%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
      margin-left:14%;
      min-width:80px;
    }
.btn0 {
      background-color: #6495ED;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 10px 0;
      border: none;
      width: 8%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
      min-width:80px;
    }
.btn1 {
      background-color: #ff0000;
      color: white;
      padding: 8.5px 12px 8.5px 12px;
      margin: 10px 0;
      border: none;
      width: 8%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
      min-width:80px;
    }
.btn2 {
      background-color: #45a049;
      color: white;
      padding: 15px;
      margin: 0px 35px 10px;;
      border: none;
      width: 12%;
      border-radius: 3px;
      cursor: pointer;
      font-size: 17px;
      min-width:150px;
      float: right;
    }

    .btn:hover {
      background-color: #45a049;
    }
	#edit3 {
 	color:white;
 	font-size: 15.7px;
 	}
 
#carttable, td, th {
      border-collapse: collapse;
      background-color: #F8F8F8;
      padding: 10px;
      width: auto;
      text-align: center;
      vertical-align: top;
      background-color: #F8F8F8;
	  border: 1.5px solid #ddd;
	  table-layout:auto;
    }

    .form-control
     {
      border: none;
      background-color: #f8f8f8;
      text-align: center;
      outline: 0;
      font-family: Raleway, Helvetica, Arial, sans-serif;
      font-size:21px;
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
                        <li><a href="logout">Logout</a></li>
                        <li><a href="shoppingcart">Cart</a></li>
                  </ul>
                  <!-- navbar -->
                </div>
                <!-- container nav-elements -->
              </nav>


            </header>
            <!-- #home -->

            <!--Page tabs: Account, Order History, Sales History -->
            <section id="profile" class="section">
              <div class="container tagline">
                <button class="tablink" onclick="openPage('Home', this, '#f8f8f8')" id="defaultOpen">Account</button>
                <button class="tablink" onclick="openPage('Purchases', this, '#f8f8f8')">Order History</button>
                <button class="tablink" onclick="openPage('Sales', this, '#f8f8f8')">Sales History</button>
                <button class="tablink" onclick="openPage('Posts', this, '#f8f8f8')">Current Posts</button>

                <div id="Home" class="tabcontent">
                  <h2>Account Information</h2>
                  <p>
                    Here is your personal information:
                  </p>
                  
                  <br />


                  <!-- Please retrieve data for Account Information -->
                  <form action="providerinfo" method="post">
                  <input class="btn0" type="submit" value="Edit" id="edituserdetail" name="edituserdetail">
                    <%
			  	     	List<Users> userdetail = new ArrayList<Users>();
			  	    	userdetail = (ArrayList)request.getAttribute("userdetail");
			  			Iterator<Users> iterator = userdetail.iterator();
			  			while (iterator.hasNext()) {
			  				Users users = iterator.next();

			       	%>

                      <div class="form-control">
                        <label for="newfname">First Name:</label>
                        <input type="text" class="form-control" id="newfname" name="newfname" value=<%=users.getFname()%> READONLY>
                      </div>
                      <div class="form-control">
                        <label for="newlname">Last Name:</label>
                        <input type="text" class="form-control" id="newlname" name="newlname" value=<%=users.getLname()%> READONLY>
                      </div>
                      <div class="form-control">
                        <label for="newcontact">Contact:</label>
                        <input type="text" class="form-control" id="newcontact" name="newcontact" value=<%=users.getContact()%> READONLY>
                      </div>
                      <div class="form-control">
                        <label style="margin-left:60px;" for="newemail">Email:</label>
                        <input style="width:340px;" type="text" class="form-control" id="newemail" name="newemail" value=<%=users.getEmailid()%> READONLY>
                      </div>
                      <div class="form-control">
                        <label for="newaddress">Address:</label>
                        <input type="text" class="form-control" id="newaddress" name="newaddress" value=<%=users.getAddress()%> READONLY>
                      </div>
                      <div class="form-control">
                        <label for="newdob">Date of Birth:</label>
                        <input type="text" class="form-control" id="newdob" name="newdob" value=<%=users.getDateofbirth()%> READONLY>
                      </div>


                      <%
						   }
       	 			  %>

                        <!-- End of Account Information -->
                </div>


                <div id="Purchases" class="tabcontent">
                  <h2>Purchases</h2>
                  <p>
                    This is a list of your purchases on our website.
                  </p>
                  <div id="purchases">
            <table id="carttable">
             <thead>
              <tr>
                <th width="480">Order ID</th>
                <th width="120">Item Name</th>
                <th width="120">Price</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>

			 <%
  	        		List<BookingData> bookingdetail1 = new ArrayList<BookingData>();
  					bookingdetail1 = (ArrayList)request.getAttribute("bookingdetail1");
              		Iterator<BookingData> iterator4 = bookingdetail1.iterator();
              		while (iterator4.hasNext()) {
  						BookingData bookingdata1 = iterator4.next();

          	 %>

              <tr>
                <td> <input disabled type="text" class="form-control"  id="purchasepartid" name="purchasepartid" value=<%=String.valueOf(bookingdata1.getOrderid())%>> </td>
                <td> <input disabled type="text" class="form-control"  id="purchasepartname" name="purchasepartname" value=<%=bookingdata1.getItemname()%>> </td>
                <td> <input disabled type="text" class="form-control"  id="purchaseprice" name="purchaseprice" value=<%=String.valueOf(bookingdata1.getCost())%>></td>
                <td> <input disabled type="text" class="form-control"  id="purchaseorderdate" name="purchaseorderdate" value=<%=bookingdata1.getOrderdate()%>> </td>
              </tr>

			 <%
              		}
			 %>

            </tbody>
            </table>
            <br>
            <hr>
            <br>





                  </div>
                </div>



                <div id="Sales" class="tabcontent">
                  <h2>Car Part Sales History</h2>
                  <p>
                    This is a list of Car Parts you have sold on our website.
                  </p>
                  <div id="purchases">
                     <table id="carttable">
             <thead>
              <tr>
                <th width="480">Sales ID</th>
                <th width="120">Item Name</th>
                <th width="120">Price</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>

			<%
  	        		List<BookingData> bookingdetail2 = new ArrayList<BookingData>();
  					bookingdetail2 = (ArrayList)request.getAttribute("bookingdetail2");
              		Iterator<BookingData> iterator5 = bookingdetail2.iterator();
              		while (iterator5.hasNext()) {
  						BookingData bookingdata2 = iterator5.next();

          	 %>

              <tr>
                <td> <input disabled type="text" class="form-control"  id="salespartid" name="salespartid" value=<%=String.valueOf(bookingdata2.getOrderid())%>> </td>
                <td> <input disabled type="text" class="form-control"  id="salespartname" name="salespartname" value=<%=bookingdata2.getItemname()%>> </td>
                <td> <input disabled type="text" class="form-control"  id="salesprice" name="salesprice" value=<%=String.valueOf(bookingdata2.getCost())%>></td>
                <td> <input disabled type="text" class="form-control"  id="salesdate" name="salesdate" value=<%=bookingdata2.getOrderdate()%>> </td>
              </tr>

			  <%
              		}
			  %>
			  
            </tbody>
            </table>
            <br>
            <hr>
            <br>


                  </div>
					
                </div>




                <div id="Posts" class="tabcontent">
                  <h2><input style="width:20%;" class="btn2" type="submit" value="Add Car Part Post" id=addnewpartpost name="addnewpartpost">Car Part Posts</h2>
                  <p>
                    This is a list of your current Car Parts posts on our website.
                  </p>
                  <div id="purchases">

          <%
		  	        List<PartInventory> partdetail = new ArrayList<PartInventory>();
		  			partdetail = (ArrayList)request.getAttribute("partdetail");
		              Iterator<PartInventory> iterator1 = partdetail.iterator();
		  			while (iterator1.hasNext()) {
		  				PartInventory partinventory = iterator1.next();

          %>

            
			<table id="carttable">
             <thead>
              <tr>
                <th width="480">Post ID</th>
                <th width="120">Item Name</th>
                <th width="120">Category</th>
                <th>Price</th>
                <th><input class="btn0" type="submit" value="Edit" id="editpostpartdetail" name="editpostpartdetail"></th>
              </tr>
            </thead>
            <tbody>

              <tr>

                <td> <input type="text" class="form-control" id="postpartid" name="postpartid" value=<%=String.valueOf(partinventory.getPartid())%> READONLY> </td>
                <td> <input type="text" class="form-control" id="postpartname" name="postpartname" value=<%=partinventory.getName()%> READONLY> </td>
                <td> <input type="text" class="form-control" id="postcategory" name="postcategory" value=<%=partinventory.getCategory()%> READONLY> </td>
                <td> <input type="number" class="form-control" id="postprice" name="postprice" value=<%=String.valueOf(partinventory.getCost())%> READONLY> </td>
                <td> <input class="btn1" type="submit" value="Delete" id="deletepostpart" name="deletepostpart"> </td>
              </tr>

            </tbody>
            </table>
            <br>
            <hr>
            <br>
            

             
             <%
					}
             %>


  

            </div>

           <h2><input style="width:20%;" class="btn2" type="submit" value="Add Car Post" id=addnewcarpost name="addnewcarpost">Car Posts</h2>
                  <p>
                    This is a list of your current Car posts on our website.
                  </p>
                  <div id="purchases">

                    <!-- Please make changes to Car Posts Java Code. I just copied over so please look over this part! -->

            <%
	  	        List<CarInventory> cardetail = new ArrayList<CarInventory>();
	  			cardetail = (ArrayList)request.getAttribute("cardetail");
	              Iterator<CarInventory> iterator2 = cardetail.iterator();
	  			while (iterator2.hasNext()) {
	  				CarInventory carinventory = iterator2.next();

            %>
                      
           <!-- Please retrive Car Details of Current Post 1 into this form -->
		   
           <table id="carttable">
             <thead>
              <tr>
                <th width="480">Post ID</th>
                <th width="120">Item Name</th>
                <th width="120">Category</th>
                <th>Price</th>
                <th><input class="btn0" type="submit" value="Edit" id="editpostcardetail" name="editpostcardetail"></th>
              </tr>
            </thead>
            <tbody>

              <tr>

                <td> <input type="text" class="form-control" id="postcarid" name="postcarid" value=<%=String.valueOf(carinventory.getCarid())%> READONLY></td>
                <td> <input type="text" class="form-control" id="postcarmake" name="postcarmake" value=<%=carinventory.getCarmake()%> READONLY> </td>
                <td> <input type="text" class="form-control" id="postcarmodel" name="postcarmodel" value=<%=carinventory.getCarmodel()%> READONLY> </td>
                <td> <input type="text" class="form-control" id="postcarprice" name="postcarprice" value=<%=String.valueOf(carinventory.getCost())%> READONLY> </td>
                <td> <input class="btn1" type="submit" value="Delete" id="deletepostcar" name="deletepostcar"> </td>
              </tr>

            </tbody>
            </table>
            
            <br>
            <hr>
            <br>
           
 
             
             
           <%
					}
           %>



                         

                      </div>
                  </div>
                </div>
                </form>
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
              // List of orders, sales, and posts scripts ---> Accordion HTML function
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