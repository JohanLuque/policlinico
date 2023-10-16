<?php

require_once 'Conexion.php';

class Gasto extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function registrarGasto($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_registrar_gastos(?,?,?,?)");
      $query->execute(
        array(
            $data['montoGasto'],
            $data['descripcionGasto'],
            $data['idPersona'],
            $data['idMedioPago']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function listarGastos(){
    try{
      $query = $this->connection->prepare("CALL spu_listarGastos_pagos()");
      $query->execute(array());
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}