<?php

require_once 'Conexion.php';

class DetalleServicio extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function create($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_servicios_detalles(?)");
      $query->execute(
        array(
            $data['idServicioDetalle']
        )
      );
        return $query->fetchAll(PDO::FETCH_NUM);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}