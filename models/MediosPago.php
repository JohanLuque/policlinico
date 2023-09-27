<?php

require_once 'Conexion.php';

class MediosPago extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  } 

  public function listarMediosPago(){
    try{
      $query = $this->connection->prepare("CALL spu_listar_metodospago()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

}