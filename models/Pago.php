<?php

require_once 'Conexion.php';

class Pago extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function RegistrarPago($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_pagar_pagos(?,?,?)");
      $query->execute(
        array(
            $data['idatencion'],
            $data['idMedioPago'],
            $data['monto']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function cambiarEstado($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_estadoCambiar_Pagos(?)");
      $query->execute(
        array(
            $data['idatencion']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}