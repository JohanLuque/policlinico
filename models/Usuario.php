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
    public function registrarUsuario($data = []){
        $respuesta = [
          "status" => false,
          "mensaje" => ""
        ];
        try{
          $consulta = $this->connection->prepare("CALL spu_atenciones_agregar_Usuarios(?,?,?,?)");
          $respuesta["status"]=$consulta->execute(
            array(
              $data["idPersona"],
              $data["nombreUsuario"],
              $data["clave"],
              $data["nivelAcceso"]
            )
          );
        }
        catch(Exception $e){
          $respuesta["mensaje"] = "No se pudo guardar. Codigo ". $e->getMessage();
        }
        return $respuesta;
      }

}