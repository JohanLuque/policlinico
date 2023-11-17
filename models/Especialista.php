<?php

require_once 'Conexion.php';

class Especialista extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_listar_especialistas(?)");
      $query->execute(
        array(
            $data['estado']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function registrarEspecialista($data = []){
    $respuesta = [
      "status" => false,
      "mensaje" => ""
    ];
    try{
      $consulta = $this->connection->prepare("CALL spu_atenciones_agregar_Especialista(?,?)");
      $respuesta["status"]=$consulta->execute(
        array(
          $data["idPersona"],
          $data["codigo"]
        )
      );
    }
    catch(Exception $e){
      $respuesta["mensaje"] = "No se pudo guardar. Codigo ". $e->getMessage();
    }
    return $respuesta;
  }
}