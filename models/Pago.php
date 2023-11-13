<?php

require_once 'Conexion.php';

class Pago extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function RegistrarPago($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_caja_registrar_pago(?,?,?)");
      $respuesta["status"] = $query->execute(
        array(
            $data['idatencion'],
            $data['idMedioPago'],
            $data['monto']
        )
      );
        
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
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

  public function cambiarEstadoDevolucion($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_caja_cambiar_estado_Devolucion(?)");
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

  public function ingresos(){
    try{
      $query = $this->connection->prepare("CALL spu_caja_obtener_ingresos()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function ticket1($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_ticket_1(?)");
      $query->execute(array($idatencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function ticket2($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_ticket_2(?)");
      $query->execute(array($idatencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function ticket3($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_ticket_3(?)");
      $query->execute(array($idatencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function montoMedioPago($idmedio){
    try{
      $query = $this->connection->prepare("CALL spu_monto_medioPago(?)");
      $query->execute(array($idmedio));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}