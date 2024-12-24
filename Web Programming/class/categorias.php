<?php

/*Autor: Lautaro Casal*/

class Categorias {
    protected $id;
    public $nombre;
    private $exist;
    
    function __construct($id = null) {
        if($id != null) {
            $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
            $resp = $db->select("categoria", "id=?", array($id));
            
            if (isset($resp[0]['id'])) {
                $this->id = $resp[0]['id'];
                $this->nombre = $resp[0]['nombre_categoria'];
                $this->exist = true;
            }
        }
    }
    
    public function mostrar() {
        echo "<pre>";
        print_r($this);
        echo "</pre>";
    }
    
    public function guardar() {
        if($this->exist) {
            return $this->actualizar();
        } else {
            return $this->insertar();
        }
    }
    
    public function eliminar() {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        return $db->delete("categoria", "id=?", array($this->id));
    }
    
    private function insertar() {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        $resp = $db->insert("categoria", "nombre_categoria", "?", array($this->nombre));

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
        return $db->update("categoria", "nombre_categoria=?", "id=?", array($this->nombre, $this->id));
    }
    
    static public function listar() {
        $db = new base_datos("mysql", "miproyecto", "127.0.0.1", "root", "");
        return $db->select("categoria");
    }
        
}

?>