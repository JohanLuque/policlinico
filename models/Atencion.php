<?php

require_once 'Conexion.php';

class Atencion extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function create($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_admision_atenciones(?,?,?,?,?,?,?)");
      $query->execute(
        array(
            $data['idusuario'],
            $data['idpersona'],
            $data['idfamiliar'],
            $data['parentesco'],
            $data['idorden'],
            $data['servicio'],
            $data['precio']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
}