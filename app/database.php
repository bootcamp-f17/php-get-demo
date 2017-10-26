<?php 

  function getDb() {

    $db = pg_connect("host=localhost port=5432 dbname=rainbow_dev user=rainbowuser password=rainbowrainbowrainbow");

    return $db;

  }

?>