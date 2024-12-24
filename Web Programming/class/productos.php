<?php

/*Autor: Lautaro Casal*/

class Productos {
    public $id;
    public $nombre;
    public $descripcion;
    public $precio;
    public $categoria;
    public $imagen;
    private $exist = false;
    
    function __construct($id) {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        $resp = $db->select("productos", "id=?", array($id));
        if (isset($resp[0]['id'])) {
            $this->id = $resp[0]['id'];
            $this->nombre = $resp[0]['nombre_producto'];
            $this->descripcion = $resp[0]['descripcion']; 
            $this->precio = $resp[0]['precio'];
            $this->imagen = $resp[0]['imagen'];
            $this->categoria = $resp[0]['categoria_id'];
            $this->exist = true;
        }
    }
    
    public function mostrar() {
        echo "<pre>";
        print_r($this);
        echo "</pre>";
    }
    
    public function guardar() {
        if($this->exist) {
            return $this->actualizar($db);
        } else {
            return $this->insertar($db);
        }
    }
    
    public function eliminar() {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        return $db->delete("productos", "id=?", array($this->id));
    }
    
    private function insertar($db) {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        $resp = $db->insert("productos", "nombre_producto, descripcion, precio, imagen, categoria_id", "?,?,?,?",
                array($this->nombre, $this->descripcion, $this->precio, $this->imagen, $this->categoria));
        if($resp) {
            $this->id = $resp;
            $this->exist = true;
            return true;
        } else {
            return false;
        }
        
    }
    
    private function actualizar() {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        return $db->update("productos", "nombre_producto=?, descripcion=?, precio=?, imagen=?, categoria_id=?", "id=?",
                array($this->nombre, $this->descripcion, $this->precio, $this->imagen, $this->categoria, $this->id));
    }
    
    static public function listar() {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        return $db->select("productos");
    }
        
}

?>