<?php

require_once 'Conexion.php';

class Servicio extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData(){
    try{
      $query = $this->connection->prepare("CALL spu_listar_servicios()");
      $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function filtroServicios($datos = []){
    try{
      $query = $this->connection->prepare("CALL spu_filtro_servicios(?)");
      $query->execute(array(
        $datos["idServicio"]
      ));
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}