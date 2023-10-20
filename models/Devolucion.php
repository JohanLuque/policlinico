<?php

require_once 'Conexion.php';

class Devolucion extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function registrarDevolucion($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_caja_registrar_devolucion(?,?,?,?)");
      $query->execute(
        array(
            $data['motivoDevolucion'],
            $data['montoDevolucion'],
            $data['idAtencion'],
            $data['idMedioPago']
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