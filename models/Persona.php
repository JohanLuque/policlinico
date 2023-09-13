<?php

require_once 'Conexion.php';

class Persona extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_buscar_personas(?)");
      $query->execute(
        array(
            $data['numeroDocumento']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}