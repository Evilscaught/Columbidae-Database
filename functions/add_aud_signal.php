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
        

    // define variables and set to empty values
    $audioNameErr = $descriptionErr = $audioURLErr = "";
    $audioName = $audioURL = $description = "";
    if ($_SERVER["REQUEST_METHOD"] == "POST") 
    {
        $continue = true;

        if (empty($_POST["audioName"])) 
        {
            $audioNameErr = "Audio Name is Required";
            $continue = false;
        } 
        else 
        {
            $audioName = test_input($_POST["audioName"]);

            // check if audioName only contains letters and whitespace
            if (!preg_match("/^[a-zA-Z0-9]{1,50}$/", $audioName))
            {
                $audioNameErr = "Audio Name must consist of no more than 50 alpha-numeric characters!";
                $continue = false;
            }
        }

        
        // Clean-up input before processing to server
        $audioURL = test_input($_POST["audioURL"]);
        $description = test_input($_POST["description"]);
        
        
        if (filter_var($audioURL, FILTER_VALIDATE_URL) === FALSE) 
        {
          $continue = false;
          $audioURLErr = "Not a Valid URL";
        }
        
        if (strlen($audioURL) > 99)
        {
          $continue = false;
          $audioURLErr = "URL is too Long";
        }

        if (strlen($description) > 999)
        {
          $continue = false;
          $descriptionErr = "Description is too Long";
        }

        // Connect to the database
        if ($continue == true)
        {
          // connect to database
          $link=mysqli_connect($DB_HOST, $DB_USERNAME, $DB_PASSWORD, $DB_DBNAME, $DB_PORT)
            or die();
          
          //perform SQL query
          $query = "CALL usp_Insert_AuditorySignal('$audioName', '$audioURL', '$description')";

          
          $result = mysqli_query($link, $query) or die("<br><h2>Unable to add audio to auditory signals! Please reload page & try again.</h2>");
          echo "<h2>Query Successfully Executed!  The auditory signal has been recorded to the database. :)</h2>";
          //Free result set
          mysqli_free_result($result);
          //close connection
          mysqli_close($link);
        }
    }
    function test_input($data) 
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
?>
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
        <h1><a href="../home.php">Home</a></h1>
      </div>
    </div>

    <div class="right_section">
     <p> Add a new pigeon to your pigeon coop! </p><br>
     <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
           
           Name: <br><input type="text" name="audioName" value="<?php echo $audioName;?>">
           <span class="error">* <?php echo $audioNameErr;?></span>
           <br><br>

           Audio URL: <br> <input type="text" name="audioURL" value="<?php echo $audioURL;?>">
           <span class="error"><?php echo $audioURLErr;?></span>
           <br><br>

           Description: <br> <input type="text" name="description" value="<?php echo $description;?>">
           <span class="error"><?php echo $descriptionErr;?></span>
           <br><br>

           <input type="submit" name="submit" value="Submit">  
      </form>
    </div>
    
    <div class="clear"></div>
    
    <div id="footer">Copyright &copy; 2020. Page Designed by <a href="http://www.htmltemplates.net" target="_blank">htmltemplates.net</a><br>  
    </div>
  </div>
</div>

</body>
</html>