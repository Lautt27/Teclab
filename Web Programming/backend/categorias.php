<?php

include '../class/autoload.php';

if(isset($_POST['accion']) && $_POST['accion'] == 'guardar') {
    $miCategoria = new Categorias();
    $miCategoria->nombre = $_POST['categoria'];
    $miCategoria->guardar();
} elseif (isset($_GET['add'])) {
    include 'views/categorias.html';
    die();
}

$lista_ctg = Categorias::listar();
include 'views/lista_categorias.html';

?>