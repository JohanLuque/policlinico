<?php

require_once 'Conexion.php';

class HistoriaClinica extends Conexion{

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
      $query = $this->connection->prepare("CALL spu_triaje_Nueva_historiaClinica(?,?,?,?,?,?)");
      $respuesta["status"] =$query->execute(
        array(
            $data['idpersona'],
            $data['idusuario'],
            $data['antecedentePersonal'],
            $data['antecedenteFamiliar'],
            $data['antecedenteQuirurgico'],
            $data['antecedenteOtro']
        )
      );
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }
}