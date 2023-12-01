<?php

require_once 'Conexion.php';

class MediosPago extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  } 

  public function listarMediosPago(){
    try{
      $query = $this->connection->prepare("CALL spu_caja_listar_metodos_pago()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function POS($fecha){
    try{
      $query = $this->connection->prepare("CALL spu_reporte_POS(?)");
      $query->execute(array($fecha));
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

}