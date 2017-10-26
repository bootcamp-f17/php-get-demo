<!DOCTYPE html>
<html>
<head>
  <title>PHP Get and Post Demo</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
</head>
<body class="container">

  <h1>PHP Get and Post Demo</h1>

  <h2>Index of Palettes</h2>

  <?php
    include('database.php');
    function getPalettes() {
      $request = pg_query(getDb(), "select * from palettes;");
      return pg_fetch_all($request);
    }
  ?>

  <ul class="mt-5">

  <?php 
    $palettes = getPalettes();
    foreach ($palettes as $palette) {
  ?>

    <li><a href="/app/palette.php?id=<?=$palette["id"]?>"><?=$palette["palette_name"]?></a></li>

  <?php
    }
  ?>

</body>
</html>