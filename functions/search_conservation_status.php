<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Columbidae Archive</title>
    <meta name="description" content="The ultimate Columbidae database!">
    <meta name="keywords" content="Columbidae, Pigeon, Dove">
    <link href="../css/style.css" rel="stylesheet" type="text/css">
    <style>
      p
      {
        padding: 2px;
      }

      input[type=text] 
      {
        padding: 5px;
        margin-top: 0px;
        font-size: 17px;
        border:#a4a5a5 solid 1px;
      } 
            
      input[type=button], input[type=submit], input[type=reset] 
      {
        cursor: pointer;
        color:#000000;
        font-size:12px;
        text-decoration:none;
        padding:7px 15px 7px 15px;
        font-weight:bold;
        display:inline-block;
        border:#7a6f73 solid 1px;
        background-color: #bdd92c;
      }
    </style>
  </head>

  <body>

    <div id="wrapper"> 

      <div id="header"> 

        <div class="top_banner">
          <h1>COLUMBIDÆ</h1>
          <p>The Columbidae Family Database</p>
        </div>

      </div>

      <div id="page_content">

        <div class="left_side_bar back_nav"> 
          <div class="col_1">
            <h1><a href="../index.php">Home</a></h1>
          </div>
        </div>

        <div class="right_section">

          <h3>Look up the conservation status of one or more species</h3>
          <p>Accepted Input:</p>
          <ul>
              <li>Family Name</li>
              <li>Subfamily Name</li>
              <li>Genus Name</li>
              <li>Binomial Species Name</li>
          </ul>
          <p>Please note that at this time only members of the Columbidae family have been recorded!</p>
          <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <input type="text" placeholder="Search.." name="search">
            <input class="btn" type="submit" name="submit" value="🔎">
          </form>

          <?php
            require_once realpath("../" . "./vendor/autoload.php");
            use Dotenv\Dotenv; 
                      
            $dotenv = Dotenv::createImmutable("../");
            $dotenv->load();
                      
            $DB_HOST = $_ENV["DB_HOST"];
            $DB_USERNAME = $_ENV["DB_USERNAME"];
            $DB_PASSWORD = $_ENV["DB_PASSWORD"];
            $DB_DBNAME = $_ENV["DB_DBNAME"];
            $DB_PORT = $_ENV["DB_PORT"];

            if ($_SERVER["REQUEST_METHOD"] == "POST") 
            {
              $search = test_input($_POST["search"]);

              // connect to database
              $link=mysqli_connect($DB_HOST, $DB_USERNAME, $DB_PASSWORD, $DB_DBNAME, $DB_PORT) or die(header("Location: ../error.php"));
              
              $query = "CALL usp_query_Conservation('$search')";
              $result = mysqli_query($link, $query) or die("<br><b>Unable to Conduct Search</b></br>");
              echo "<br>";
              echo '<table id="resultTable">';
              echo "<td><b>Species Name</b></td><td><b>Conservation Status</b></td><td><b>Previous Conservation Status</b></td><td><b>Population Trend</b></td></td><td><b>Last Assessment</b></td>";
              while ($line = mysqli_fetch_array($result, MYSQLI_ASSOC)) 
              {
                echo "\t<tr>\n";
                foreach ($line as $col_value) 
                {
                  echo "\t\t<td>$col_value</td>\n";
                }
                echo "\t</tr>\n";
              }
              echo "</table>\n";

              echo "
                    <script>
                      let rowCount = document.getElementById('resultTable').rows.length;
                      
                      if (rowCount == 1)
                      {
                        let row = resultTable.insertRow(1);
                        let infoCell = row.insertCell(0);

                        infoCell.style = 'text-align: center; color: red;'
                        infoCell.innerHTML = '<b>No Matches Found</b>';
                        infoCell.colSpan = 5;
                      }
                    </script>
                  ";
            
              //close connection
              mysqli_close($link);

            }


            function test_input($data) 
            {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);
                return $data;
            }
          ?>

        </div>
        
        <div class="clear"></div>
        
        <div id="footer">Copyright &copy; 2020. Page Designed by <a href="http://www.htmltemplates.net" target="_blank">htmltemplates.net</a><br>  
        </div>
      </div>
    </div>

  </body>
</html>