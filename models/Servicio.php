<?php

require_once 'Conexion.php';

class Servicio extends Conexion{

  private $connection;

  public function __CONSTRUCT(){
    $this->connection = parent::getConexion();
  }

  public function getData(){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_listar_servicios()");
      $query->execute();
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function filtroServicios($datos = []){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_filtro_servicios(?)");
      $query->execute(array(
        $datos["idServicio"]
      ));
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Exception $e){
      die($e->getMessage());
    }
  }

  public function listarEspecialidades(){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_listar_especialidades()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function reporteSemanal($idservicio){
    try{
      $query = $this->connection->prepare("CALL spu_reporte_servicioSemanal(?)");
      $query->execute(array($idservicio));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function reporteQuincenal($idservicio){
    try{
      $query = $this->connection->prepare("CALL spu_reporte_servicioQuincenal(?)");
      $query->execute(array($idservicio));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function reporteMensual($idservicio,$mes){
    try{
      $query = $this->connection->prepare("CALL spu_reporte_servicioMensual(?,?)");
      $query->execute(array($idservicio, $mes));
        return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }

  public function listarServiciosReporte(){
    try{
      $query = $this->connection->prepare("CALL spu_listar_servicios()");
      $query->execute();
      return $query->fetchAll(PDO::FETCH_ASSOC);
    }catch(Exception $e){
      die($e->getCode());
    }
  }
  
  public function filtroDoctores($datos = []){
      try{
        $query = $this->connection->prepare("CALL spu_atenciones_filtro_doctores(?)");
        $query->execute(array(
          $datos["idServicio"]
        ));
        return $query->fetchAll(PDO::FETCH_ASSOC);
      }
      catch(Exception $e){
        die($e->getMessage());
      }
  }

  public function agregarServicios($datos = []){
    $respuesta = [
      "status" => false,
      "message" => ""
    ];
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_agregar_Servicios(?,?)");
      $respuesta["status"] = $query->execute(array(
        $datos["tipo"],
        $datos["nombreServicio"]
      ));
    }
    catch(Exception $e){
      $respuesta["message"] = "No se ha podido completar el proceso. Código de error: " . $e->getMessage();
    }
    return $respuesta;
  }

  public function cambiarEstadoProcedimiento($data =[]){
    try{
      $query = $this->connection->prepare("CALL spu_atenciones_cambiar_estado_procedimientos(?)");
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