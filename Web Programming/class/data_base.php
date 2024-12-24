<?php

/*Autor: Lautaro Casal*/

try {
    $conector = new PDO("mysql:dbname=miproyecto;host=127.0.0.1", "root", "");
    echo "Conexión exitosa";
} catch (PDOException $ex) {
    echo "Fallo de conexión: " .$ex->getMessage ();
}

class base_datos {  
    private $gbd;
    
    function __construct($driver,$base_datos, $host, $user, $pass) {
            $conection = $driver . ":dbname=" . $base_datos . ";host=" . $host;
            
            $this->gbd = new PDO($conection, $user, $pass);
            
            if (!$this->gbd) {
                throw new Exception("No se ha podido realizar la conexión");
            }
        }
        
    function select($tabla, $filtros = null, $arr_prepare = null, $orden = null, $limit = null) {
        $sql = "SELECT * FROM " . $tabla;
        if ($filtros != null) {
            $sql .= " WHERE " . $filtros;
        }
        if ($orden != null) {
            $sql .= " ORDER BY " . $orden;
        }
        if ($limit != null) {
            $sql .= " LIMIT " . $limit;
        }        
        $resource = $this->gbd->prepare($sql);
        $resource->execute($arr_prepare);
        if ($resource) {
            return $resource->fetchAll(PDO::FETCH_ASSOC);
        } else {
            throw new Exception("No se pudo realizar la consulta de selección");
        }
    }
    
    function delete($tabla, $filtros = null, $arr_prepare = null) {
        $sql = " DELETE FROM " . $tabla . " WHERE " . $filtros;
        $resource = $this->gbd->prepare($sql);
        $resource->execute($arr_prepare);
        if ($resource) {
            return true;
        } else {
            throw new Exception("No se pudo realizar la consulta de eliminación");
        }
    }
    
    function insert($tabla, $campos, $valores, $arr_prepare = null) {
        $sql = " INSERT INTO " . $tabla . " (" . $campos . ") VALUES (" . $valores . ")"; 
        $resource = $this->gbd->prepare($sql);
        $resource->execute($arr_prepare);
        if ($resource) {
            return $this->gbd->lastInsertId();
        } else {
            throw new Exception("No se pudo realizar la consulta de inserción");
        }
    }    
    
    function update($tabla, $campos, $filtros, $arr_prepare = null) {
        $sql = "UPDATE " . $tabla . " SET " . $campos . " WHERE " . $filtros;
        $resource = $this->gbd->prepare($sql);
        $resource->execute($arr_prepare);
        if ($resource) {
            return true;
        } else {
            echo '<pre>';
            print_r($resource->errorInfo());
            echo '</pre>';
            throw new Exception("No se pudo realizar la consulta de actualización");
        }
    }        
    
}
    
?>