<?php

require_once 'Conexion.php';

class Enfermedad extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function registrarEnfermedad($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_doctores_registrar_enfermedades(?,?)");
      $respuesta["status"] = $query->execute(
        array(
            $data['codigoCie_10'],
            $data['descripcion']
        )
      );
        //return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }
}