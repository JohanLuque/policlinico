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
      $query = $this->connection->prepare("CALL spu_atenciones_registrar(?,?,?,?,?,?,?)");
      $respuesta["status"] = $query->execute(
        array(
            $data['turno'],
            $data['idusuario'],
            $data['idpersona'],
            $data['idfamiliar'],
            $data['parentesco'],
            $data['orden'],
            $data['fechaAtencion']
        )
      );
      //return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
      //die($e->getMessage());
    }
    return $respuesta;
  }

  public function listarAtenciones(){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_listar()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function listarAtencionesTodo(){
    try{
      $query = $this->connection->prepare("CALL listar_atenciones_todo()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function pagar($idatencion){
    try{
      $query = $this->connection->prepare("CALL spu_estadoCambiar_Pagos(?)");
      $query->execute(array($idatencion));
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function listarParaTriaje($numeroDocumento){
    try{
      $query = $this->connection->prepare("CALL spu_triaje_Atenciones_dni(?)");
      $query->execute(array($numeroDocumento));
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function editarFechaAtencion($datos=[]){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_editar_fecha(?,?)");
      $query->execute(
        array(
          $datos['fechaAtencion'],
          $datos['idatencion']
        )
      );
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getMessage());
    }
  } 
  public function listarEspera(){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_listar_espera()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function contador(){
    try{
      $query = $this->connection->prepare("CALL spu_contadores()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  // REPORTES
  public function grafico_turnos(){
    try{
      $query = $this->connection->prepare("CALL grafico_turnos()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }
}