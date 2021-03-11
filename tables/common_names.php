<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Columbidae Archive</title>
<meta name="description" content="The ultimate Columbidae database!">
<meta name="keywords" content="Columbidae, Pigeon, Dove">
<link href="../css/style.css" rel="stylesheet" type="text/css">
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

      // connect to database
      $link=mysqli_connect($DB_HOST, $DB_USERNAME, $DB_PASSWORD, $DB_DBNAME, $DB_PORT)
        or die(header("Location: ../error.php"));

      //perform SQL query
      $query = "SELECT * FROM COMMON_NAMES";
      $result = mysqli_query($link, $query) 
        or die("<br><b>Query failed</b>");

      //print results in html
      echo"<h1>Common Names</h1><nl>";

      echo "<blockquote contenteditable=true>";
      echo "<table>\n";
      echo "<td><b>Species Name</b></td><td><b>Vernacular Name</b></td>";
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
      echo "</blockquote>";
      //Free result set
      mysqli_free_result($result);

      //close connection
      mysqli_close($link);
      ?>
      <p><a onclick="updateTable()" class="btn" id="saveBtn">Save Changes</a></p>
    </div>
    
    <div class="clear"></div>
    
    <div id="footer">Copyright &copy; 2020. Page Designed by <a href="http://www.htmltemplates.net" target="_blank">htmltemplates.net</a><br>  
    </div>
  </div>
</div>

</body></html>