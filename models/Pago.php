<?php

require_once 'Conexion.php';

class Pago extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function RegistrarPago($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_caja_registrar_pago(?,?,?)");
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
      $query = $this->connection->prepare("CALL spu_caja_cambiar_estado_pagos(?)");
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
  public function registrarDevolucion($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_caja_registrar_devolucion(?,?)");
      $query->execute(
        array(
            $data['idAtencion'],
            $data['descripcion'],
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function traerDatosDevolucion($idAtencion = 0){
    try{
      $query = $this->connection->prepare("CALL spu_caja_obtener_datos_devolucion(?)");
      $query->execute(array($idAtencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}