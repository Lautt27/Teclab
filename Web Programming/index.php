<?php

include 'class/autoload.php';

$lp = Productos::listar();

include 'backend/views/home.html';

?>