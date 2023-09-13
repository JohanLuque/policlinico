<?php

require_once 'Conexion.php';

class EspecialistaServicio extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_listar_espcialistas_servicios(?)");
      $query->execute(
        array(
            $data['idservicio']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}