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
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }

  public function createTriaje($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_triaje_agregar_triaje(?,?,?,?,?,?,?,?,?,?)");
      $respuesta["status"] =$query->execute(
        array(
            $data['idAtencion'],
            $data['idHistoria'],
            $data['peso'],
            $data['talla'],
            $data['frecuenciaCardiaca'],
            $data['frecuenciaRespiratoria'],
            $data['presionArterial'],
            $data['temperatura'],
            $data['saturacionOxigeno'],
            $data['idusuario']

        )
      );
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }
  public function listar(){
    try{
      $query = $this->connection->prepare("CALL spu_triaje_listar_historias()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
    return $respuesta;
  }
  public function buscarHistorias($dni=0){
    try{
      $query = $this->connection->prepare("CALL spu_triaje_buscar_historias(?)");
      $query->execute(array($dni));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function obtenerDatosTriaje($idAtencion=0){
    try{
      $query = $this->connection->prepare("CALL spu_triaje_obtenerDatos(?)");
      $query->execute(array($idAtencion));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  public function updatDoctorTriajeEnfermedad($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_triaje_doctor_agregar_enfermedad(?,?)");
      $respuesta["status"] =$query->execute(
        array(
            $data['idEnfermedad'],
            $data['idDetalleatencion']
        )
      );
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso de registro de enfermedades. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }

  public function updatDoctorTriajeDetalle($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_triaje_doctor_agregar(?,?,?)");
      $respuesta["status"] =$query->execute(
        array(
            $data['idDetalleatencion'],
            $data['examenGeneral'],
            $data['frecuencia']
        )
      );
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso de registro de detalleatencion. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }

  public function listarTriajeHistorias(){
    try{
      $query = $this->connection->prepare("CALL spu_triaje_historia()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function detalleHistoriaClinica($data =[]){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL SPU_DOCTORES_REGISTRAR_DETALLE_HISTORIA(?,?,?,?,?,?,?,?)");
      $respuesta["status"] =$query->execute(
        array(
            $data['idDetalleatencion'],
            $data['inicio'],
            $data['curso'],
            $data['relato'],
            $data['procedimiento'],
            $data['observaciones'],
            $data['examenGeneral'],
            $data['frecuencia']
        )
      );
    }catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }
}