<?php

require_once 'Conexion.php';

class Persona extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_buscar_personas(?)");
      $query->execute(
        array(
            $data['numeroDocumento']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function registrarPersona($data = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->connection->prepare("CALL spu_registrar_persona(?,?,?,?,?,?,?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $data["nombres"],
          $data["apellidoPaterno"],
          $data["apellidoMaterno"],
          $data["tipoDocumento"],
          $data["numeroDocumento"],
          $data["fechaNacimiento"],
          $data["genero"],
          $data["telefono"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guardar. Codigo ". $e->getMessage();
    }
    return $respuesta;
  }
}