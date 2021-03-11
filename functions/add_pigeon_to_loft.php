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
    $snErr = $eyeColorErr = $weightErr = $dateOfBirthErr = $breedErr = "";
    $sn = $eyeColor = $weight = $breed = $dateOfBirth = "";
    if ($_SERVER["REQUEST_METHOD"] == "POST") 
    {
        $continue = true;

        if (empty($_POST["sn"])) 
        {
            $snErr = "Serial Number is Required";
            $continue = false;
        } 
        else 
        {
            $sn = test_input($_POST["sn"]);

            // check if sn only contains letters and whitespace
            if (!preg_match("/^[a-zA-Z0-9]{1,20}$/", $sn))
            {
                $snErr = "Serial number must consist of no more than 20 alpha-numeric characters.";
                $continue = false;
            }
        }
        
        // Clean-up input before processing to server
        $eyeColor = test_input($_POST["eyeColor"]);
        $weight = test_input($_POST["weight"]);
        $breed = test_input($_POST["breed"]);
        $dateOfBirth = test_input($_POST["dateOfBirth"]);

        // Connect to the database
        if ($continue == true)
        {
          $link=mysqli_connect($DB_HOST, $DB_USERNAME, $DB_PASSWORD, $DB_DBNAME, $DB_PORT)
            or die();
          
          //perform SQL query
          $query = "CALL usp_insert_pigeon('$sn', '$eyeColor', $weight, '$breed', '$dateOfBirth')";
          $result = mysqli_query($link, $query) or die("<br><h2>Unable to add pigeon to the database! Please reload page & try again.</h2>");
          echo "<h2>Query Successfully Executed!  The Pigeon has been Recorded to the Database. :)</h2>";
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
        <h1><a href="../index.php">Home</a></h1>
      </div>
    </div>

    <div class="right_section">
     <p> Add a new pigeon to your pigeon coop! </p><br>
     <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
           
           Serial Number: <br><input type="text" name="sn" value="<?php echo $sn;?>">
           <span class="error">* <?php echo $snErr;?></span>
           <br><br>
           
           Eye Color: <br> <input type="color" name="eyeColor" value="<?php echo $eyeColor;?>">
           <span class="error"> <?php echo $eyeColorErr;?></span>
           <br><br>
           
           Weight: <br> <input type="number" min="0" max="1000" name="weight" <input type="number" placeholder="Weight in Grams" value="<?php echo $weight;?>">
           <span class="error"><?php echo $weightErr;?></span>
           <br><br>

           Breed: <br> <input type="text" name="breed" value="<?php echo $breed;?>">
           <span class="error"><?php echo $breedErr;?></span>
           <br><br>

           Date Of Birth: <br> <input type="date" name="dateOfBirth" required pattern="\d{4}-\d{2}-\d{2}" value="<?php echo $dateOfBirth;?>">
           <span class="error"><?php echo $dateOfBirthErr;?></span>
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