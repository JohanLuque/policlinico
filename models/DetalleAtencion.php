<?php

require_once 'Conexion.php';

class DetalleAtencion extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData($dni=0){
    try{
      $query = $this->connection->prepare("CALL spu_listar_detalles_atenciones(?)");
      $query->execute(array($dni));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  } 
  
  public function create($data=[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_triaje_agregar_triaje(?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] = $query->execute(array(
        $data['idatencion'],
        $data['idhistoria'],
        $data['peso'],
        $data['talla'],
        $data['frecuenciaCardiaca'],
        $data['frecuenciaRespiratoria'],
        $data['presionArterial'],
        $data['temperatura'],
        $data['saturacionOxigeno'],
        $data['idusuario']
      ));
        //return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  } 
}