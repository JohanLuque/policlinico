<?php

require_once 'Conexion.php';

class DetalleServicio extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function create($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_registrar_detallesServicios(?)");
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
  public function resumen($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_caja_detalle_pagos(?)");
      $query->execute(array($idatencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function detalle_servicio($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_caja_listar_detalle_servicio(?)");
      $query->execute(array($idatencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function resumenAtencion($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_detalle_atencion(?)");
      $query->execute(array($idatencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}