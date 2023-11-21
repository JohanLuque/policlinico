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

      public function listar($estado){
        try{
            $consulta = $this->connection->prepare("CALL spu_admision_listar_usuarios(?)");
            $consulta->execute(array($estado));
            return $consulta->fetchAll(PDO::FETCH_ASSOC);
        }
        catch(Exception $e){
            die($e->getMessage());
        } 
    }
    public function eliminarUsuario($idusuario = 0){
      $respuesta = [
        "status" => false,
        "mensaje" => ""
      ];
      try{
        $consulta = $this->connection->prepare("CALL spu_admision_eliminar_usuarios(?)");
        $respuesta["status"]=$consulta->execute(array($idusuario));
      }
      catch(Exception $e){
        $respuesta["mensaje"] = "No se pudo guardar. Codigo ". $e->getMessage();
      }
      return $respuesta;
    }
    public function getData($idusuario = 0){
      try{
          $consulta = $this->connection->prepare("CALL SPU_LOGIN_GetData(?)");
          $consulta->execute(array($idusuario));
          return $consulta->fetch(PDO::FETCH_ASSOC);
      }
      catch(Exception $e){
          die($e->getMessage());
      }
      
  }
  }