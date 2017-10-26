<!DOCTYPE html>
<html>
<head>
  <title>PHP Get and Post Demo</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body class="container">

  <h1>PHP Get and Post Demo</h1>

  <h2>Show One Palette</h2>

  <?php

    include('database.php');

    // Input sanitation
    $id = intval(htmlentities($_GET["id"]));

    function getPalette($id) {
      $sql = "select * from palettes where id=" . $id;
      $request = pg_query(getDb(), $sql);
      return pg_fetch_assoc($request);
    }

  ?>

  <h3 class="mt-5">
    <?php 
      $palette = getPalette($id);
      echo $palette['palette_name'];
    ?>
  </h3>


  <div class="mt-5">
    <a href="/app/index.php">Return to list of palettes</a>
  </div>

</body>
</html>