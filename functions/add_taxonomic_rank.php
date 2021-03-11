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
            <h1><a href="../home.php">Home</a></h1>
          </div>
        </div>

        <div class="right_section" id="right_section">
            <p>Select the taxonomic rank you would like to add to: </p>

              <select id="select" name="select" onchange="createForm()">  
                <option value="Select" selected>Select</option>  
                <option value="Family">Family</option>  
                <option value="Subfamily">Subfamily</option>  
                <option value="Genus">Genus</option>
                <option value="Species">Species</option>
              </select>  


            <script>
              function createForm()
              {
                let select = document.getElementById("select");
                let selection = select.options[select.selectedIndex].value;

                let right_section = document.getElementById("right_section");
                let familyForm = 
                `
                  <form name="hrefForm" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                    <select id="selection" name="selection" style="display: none"><option value="Family" selected>Select</option></select>  
                    <table>
                      <tr>
                        <td><b>Family Name</b></td><td><b>Additional Information</b></td>
                      </tr>
                      <tr> 
                        <td><textarea id="familyName" name="familyName" rows="1" cols="50" placeholder="Enter the Family Name.."></textarea></td>
                        <td><textarea id="info" name="info" rows="1" cols="50" placeholder="Enter Additional Information.."></textarea></td> 
                      </tr>
                    </table>
                    <p><a class="btn" id="addToDbBtn" href="javascript: submitform()">Add to Database</a></p>
                  </form>
                `;

                let subfamilyForm = 
                ` 
                  <form name="hrefForm" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">   

                    <select id="selection" name="selection" style="display: none"><option value="Subfamily" selected>Select</option></select> 
                    <p>Warning: Family name should be the same as one that already exists in the database, otherwise entry will be rejected.</p>
                    <table>
                      <tr>
                        <td><b>Subfamily Name</b></td><td><b>Family Name</b></td><td><b>Additional Information</b></td>
                      </tr>
                      <tr> 
                        <td><textarea id="subfamilyName" name="subfamilyName" rows="1" cols="30" placeholder="Enter the Subfamily Name.."></textarea></td>
                        <td><textarea id="familyName" name="familyName" rows="1" cols="30" placeholder="Enter the Family Name.."></textarea></td>
                        <td><textarea id="info" name="info" rows="1" cols="30" placeholder="Enter Additional Information.."></textarea></td> 
                      </tr>
                    </table>
                    <p><a class="btn" id="addToDbBtn" href="javascript: submitform()">Add to Database</a></p>
                  </form>
                `;

                let genusForm =
                `
                  <form name="hrefForm" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                    <select id="selection" name="selection" style="display: none"><option value="Genus" selected>Select</option></select> 
                    <p>Warning: Subfamily name should be the same as one that already exists in the database, otherwise entry will be rejected.</p>
                    <table>
                      <tr>
                        <td><b>Genus Name</b></td><td><b>Subfamily Name</b></td><td><b>Additional Information</b></td>
                      </tr>
                      <tr> 
                        <td><textarea id="genusName" name="genusName" rows="1" cols="30" placeholder="Enter the Genus Name.."></textarea></td>
                        <td><textarea id="subfamilyName" name="subfamilyName" rows="1" cols="30" placeholder="Enter the Subfamily Name.."></textarea></td>
                        <td><textarea id="info" name="info" rows="1" cols="30" placeholder="Enter Additional Information.."></textarea></td> 
                      </tr>
                    </table>
                    <p><a class="btn" id="addToDbBtn" href="javascript: submitform()">Add to Database</a></p>
                   </form>
                `;

                let speciesForm =
                ` 
                  <form name="hrefForm" method="POST" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

                    <select id="selection" name="selection" style="display: none"><option value="Species" selected>Select</option></select> 
                    <p>Warning: Genus name should be the same as one that already exists in the database, otherwise entry will be rejected.</p>
                    <table>
                      <tr>
                        <td><b>Latin Name</b></td> <td><b>Genus Name</b></td>
                      </tr>
                      <tr> 
                        <td><textarea id="latinName" name="latinName" rows="1" cols="50" placeholder="Enter the Binomial Latin Name.."></textarea></td>
                        <td><textarea id="genusName" name="genusName" rows="1" cols="50" placeholder="Enter the Genus Name.."></textarea></td>
                      </tr>
                      <tr>
                        <td><b>Diet</b></td> <td><b>Description</b></td>
                      </tr>
                      <tr> 
                        <td><textarea id="diet" name="diet" rows="1" cols="50" placeholder="Enter Diet.."></textarea></td>
                        <td><textarea id="info" name="info" rows="1" cols="50" placeholder="Enter Additional Information.."></textarea></td>
                      </tr>
                    </table>
                    <p><a class="btn" id="addToDbBtn" href="javascript: submitform()">Add to Database</a></p>
                   </form>
                `;
                
                try
                {
                  let form_section = document.getElementById("form_section");
                  form_section.parentNode.removeChild(form_section);

                  console.info(`Removing existing HTML-div element with id="form_section".`);
                }
                catch (TypeError)
                {
                  console.info(`HTML-div element with id="form_section" hasn't been instantiated yet, ${TypeError}.`);
                }
                finally
                {
                  console.info(`Creating new HTML-div element with id="form_section".`);

                  right_section.insertAdjacentHTML('beforeend', '<div id="form_section"></div>');
                  let form_section = document.getElementById("form_section");

                  switch (selection)
                  {
                    case "Select":
                      form_section.insertAdjacentHTML('afterbegin', '<p>No Taxonomic Rank Selected');
                      break;
                    case "Family":
                      form_section.insertAdjacentHTML('afterbegin', familyForm);
                      break;
                    case "Subfamily":
                      form_section.insertAdjacentHTML('afterbegin', subfamilyForm);
                      break;
                    case "Genus":
                      form_section.insertAdjacentHTML('afterbegin', genusForm);
                      break;
                    case "Species":
                      form_section.insertAdjacentHTML('afterbegin', speciesForm);
                      break;
                    default:
                      break;
                  }
                }
              }

              function submitform()
              {
                document.hrefForm.submit();
              }
            </script>

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
                $link=mysqli_connect($DB_HOST, $DB_USERNAME, $DB_PASSWORD, $DB_DBNAME, $DB_PORT) or die(header("Location: ../error.php"));
                
                $selection = htmlspecialchars($_POST["selection"]);
                switch ( $selection )
                {
                  case "Family":
                    $familyName = htmlspecialchars($_POST["familyName"]);
                    $info = htmlspecialchars($_POST["info"]);

                    $query = "CALL usp_insert_AddNewFamily('$familyName', '$info')";
                    mysqli_query($link, $query) or die("<br><b>Unable to add to Family</b></br>");
                    break;
                  case "Subfamily":
                    $subfamilyName = htmlspecialchars($_POST["subfamilyName"]);
                    $familyName = htmlspecialchars($_POST["familyName"]);
                    $info = htmlspecialchars($_POST["info"]);

                    $query = "CALL usp_insert_AddNewSubfamily('$subfamilyName', '$familyName', '$info')";
                    mysqli_query($link, $query) or die("<br><b>Unable to add to Subfamily</b></br>");
                    break;
                  case "Genus":
                    $genusName = htmlspecialchars($_POST["genusName"]);
                    $subfamilyName = htmlspecialchars($_POST["subfamilyName"]);
                    $info = htmlspecialchars($_POST["info"]);

                    $query = "CALL usp_insert_AddNewGenus('$genusName', '$subfamilyName', '$info')";
                    mysqli_query($link, $query) or die("<br><b>Unable to add to Genus</b></br>");
                    break;
                  case "Species":
                    $latinName = htmlspecialchars($_POST["latinName"]);
                    $genusName = htmlspecialchars($_POST["genusName"]);
                    $diet = htmlspecialchars($_POST["diet"]);
                    $info = htmlspecialchars($_POST["info"]);

                    $query = "CALL usp_insert_AddNewSpecies('$latinName', '$genusName', '$diet', '$info')";
                    mysqli_query($link, $query) or die("<br><b>Unable to add to Species</b></br>");
                    break;
                  default:
                    break;
                }
                echo "<p><b>Entry successfully added to the database!</b></p>";
                mysqli_close($link);
              }

              function debug_to_console($data)
              {
                $output = $data;
                if (is_array($output))
                {
                    $output = implode(',', $output);
                }

                echo "<script>console.debug('Debug Objects: " . $output . "' );</script>";
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