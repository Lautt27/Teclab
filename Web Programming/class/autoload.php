<?php

/*Autor: Lautaro Casal*/

class Autocarga {
    
    static public function cargar_clase($clase) {
        $arrayClase = array();
        $base = __DIR__.DIRECTORY_SEPARATOR;
        $arrayClase['base_datos'] = $base.'data_base.php';
        $arrayClase['Categorias'] = $base.'categorias.php';
        $arrayClase['Productos'] = $base.'productos.php';
    
    if(isset($arrayClase[$clase])) {
        if (file_exists($arrayClase[$clase])) {
            include $arrayClase[$clase];
        } else {
            throw new Exception("Archivo de clase no encontrado [" . $arrayClase[$clase] . "]");
        }
    }
  }
}

spl_autoload_register('Autocarga::cargar_clase');