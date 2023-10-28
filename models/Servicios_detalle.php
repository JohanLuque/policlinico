<?php

require_once 'Conexion.php';

class ServicioDetalle extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function filtroServicios($data = []){
    try{
      $query = $this->connection->prepare("CALL spu_filtro_servicios(?)");
      $query->execute(
        array(
          $data['idServicio']
        )
      );
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function precioGenero($data = []){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_obtenerPrecio_genero(?)");
      $query->execute(
        array(
          $data['idservicios_detalle']
        )
      );
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}