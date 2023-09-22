<?php

require_once 'Conexion.php';

class Atencion extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function create($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_admision_atenciones(?,?,?,?,?,?)");
      $respuesta["status"] =$query->execute(
        array(
            $data['turno'],
            $data['idusuario'],
            $data['idpersona'],
            $data['idfamiliar'],
            $data['parentesco'],
            $data['orden']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
      //die($e->getMessage());
    }
    return $respuesta;
  }
}