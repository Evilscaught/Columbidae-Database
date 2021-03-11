<!DOCTYPE HTML>  
<html>
    <head>
        <style>
            .error {color: #FF0000;}
        </style>
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
                if (empty($_POST["sn"])) 
                {
                    $snErr = "Serial Number is Required";
                } 
                else 
                {
                    $sn = test_input($_POST["sn"]);
                    // check if sn only contains letters and whitespace
                    if (!preg_match("/^[a-zA-Z0-9 ]*$/",$sn))
                    {
                        $snErr = "Only letters and numbers allowed";
                    }
                }
                

                $eyeColor = test_input($_POST["eyeColor"]);
                $weight = test_input($_POST["weight"]);
                $breed = test_input($_POST["breed"]);
                $dateOfBirth = test_input($_POST["dateOfBirth"]);

                // Connect to the database
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

            function test_input($data) 
            {
                $data = trim($data);
                $data = stripslashes($data);
                $data = htmlspecialchars($data);
                return $data;
            }
        ?>

        <h2>Add a new pigeon to the database (PIGEON TABLE)</h2>

        <p><span class="error">* required field</span></p>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">  
           
            Serial Number: <input type="text" name="sn" value="<?php echo $sn;?>">
            <span class="error">* <?php echo $snErr;?></span>
            <br><br>
            
            Eye Color: <input type="text" name="eyeColor" value="<?php echo $eyeColor;?>">
            <span class="error"> <?php echo $eyeColorErr;?></span>
            <br><br>
            
            Weight: <input type="text" name="weight" value="<?php echo $weight;?>">
            <span class="error"><?php echo $weightErr;?></span>
            <br><br>

            Breed: <input type="text" name="breed" value="<?php echo $breed;?>">
            <span class="error"><?php echo $breedErr;?></span>
            <br><br>

            Date Of Birth: <input type="text" name="dateOfBirth" value="<?php echo $dateOfBirth;?>">
            <span class="error"><?php echo $dateOfBirthErr;?></span>
            <br><br>

            <input type="submit" name="submit" value="Submit">  
        </form>

        <?php
            echo "<h2>Your Input:</h2>";
            echo $sn;
            echo "<br>";
            echo $eyeColor;
            echo "<br>";
            echo $weight;
            echo "<br>";
            echo $breed;
            echo "<br>";
            echo $dateOfBirth;
            echo "<br><br>";
        ?>
    </body>
</html>


