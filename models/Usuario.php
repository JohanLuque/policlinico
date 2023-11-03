<?php

require_once 'Conexion.php';

class Usuario extends Conexion{

    private $connection;

    public function __CONSTRUCT(){
        $this->connection = parent::getConexion();
    }

    public function login($nombreUsuario =""){
        try{
            $consulta = $this->connection->prepare("CALL SPU_LOGIN_USUARIOS(?)");
            $consulta->execute(array($nombreUsuario));
            return $consulta->fetch(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        }
        
    }

}