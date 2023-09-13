<?php

require_once 'Conexion.php';

class Especialista extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_listar_especialistas(?)");
      $query->execute(
        array(
            $data['estado']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}