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
  public function listarHistoriasClinicas($dni=0){
    try{
      $query = $this->connection->prepare("CALL spu_listar_historias_clinicas(?)");
      $query->execute(array($dni));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}