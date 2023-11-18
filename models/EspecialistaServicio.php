<?php

require_once 'Conexion.php';

class EspecialistaServicio extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function registrarEspecialista($data = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->connection->prepare("CALL spu_atenciones_agregar_Especialista_a_Servicios(?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $data["idEspecialista"],
          $data["idServicio"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guardar. Codigo ". $e->getMessage();
    }
    return $respuesta;
  }
}