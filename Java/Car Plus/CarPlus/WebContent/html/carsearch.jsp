<!doctype html>
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

    #submit {
      /*color: #3385ff;*/
      background-color: #87CEFA;
      /* Green */
      border: #3385ff;
      border-radius: 3px;
      padding: 5.3px 20px;
      text-align: right;
      border: 1px solid #008CBA;
      display: inline-block;
      font-size: 17px;
      margin: 4px 2px;
      cursor: pointer;
    }

    #search {
      padding-bottom: 240px;
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
          <li><a href="home">Home</a></li>
          <li><a href="#history">About Us</a></li>
          <li><a href="#products">Cars For Sale</a></li>
          <li><a href="#parts">Car Parts For Sale</a></li>
          <li><a href="#search">Search</a></li>
          <li><a href="registerUser">New User?</a></li>
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

  <section id="search" class="section">
    <div class="container">
      <h2 class="headline">Search Cars</h2>
      <form action="search" method="get">
        <!-- Search Button -->
        <label class="card-title"></label>
        <input type="search" name="search" style="width:500px; height:33px; font-size:15px;">

        <!-- Make dropdow -->
        <select name="type" id="make" class="span4 required OneandDoneType" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-    Select Make   -</option>
          <option value="1">Toyota</option>
          <option value="2">Honda</option>
          <option value="3">Kia</option>
          <option value="4">Volvo</option>
        </select>

        <!-- Model dropdow -->
        <select name="subtype" id="model" class="span4 required OneandDoneSubType" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-   Select Model   -</option>
          <option value="Toyota">Camry</option>
          <option value="Toyota">Corolla</option>
          <option value="Honda">Civic</option>
          <option value="Honda">CR-V</option>
          <option value="Kia">Rio</option>
          <option value="Kia">K900</option>
          <option value="Volvo">XC60</option>
          <option value="Volvo">V90 </option>
        </select>

        <!-- Color Dropdown -->
        <select name="color" style="width:180px; height:33px; font-size:15px;">
          <option selected="selected" value="">-Select Color-</option>
          <option value="1">Black</option>
          <option value="2">White</option>
          <option value="3">Grey</option>
        </select>

        <!-- Search Button -->
        <input type="submit" value="Search" id="submit">
      </form>
    </div>

  </section>

  <script>
    $(function() {
      var options = $("#model").html();
      $("#make").change(function(e) {
        var text = $("#make :selected").text();
        $("#model").html(options);
        if (text == "-Select-") return;
        $('#model :not([value^="' + text.substr(0, 3) + '"])').remove();
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