<?php

require_once '../models/Servicio.php';

if(isset($_POST['operacion'])){

  $servicio = new Servicio ();

  switch($_POST['operacion']){
    case 'getData':
      echo json_encode($servicio->getData());
      break;
    case 'filtroServicios':
      $parametros = [
        "idServicio" => $_POST["idServicio"]
      ];
      echo json_encode($servicio->filtroServicios($parametros));
      break;
    case 'listarEspecialidades':
      echo json_encode($servicio->listarEspecialidades());
      break;
    case 'listarServiciosReporte':
      echo json_encode($servicio->listarServiciosReporte());
      break;
    case 'filtroDoctores':
      $parametros = [
        "idServicio" => $_POST["idServicio"]
        ];
        echo json_encode($servicio->filtroDoctores($parametros));
      break;
    case 'agregarServicio':
      $parametros = [
        "tipo" => $_POST["tipo"],
        "nombreServicio" => $_POST["nombreServicio"]
        ];
        echo json_encode($servicio->agregarServicios($parametros));
      break;
    case 'cambiarEstado':
      $parametros = [
        "idservicios_detalle" => $_POST['idservicios_detalle']
      ];
      $respuesta = $servicio->cambiarEstadoProcedimiento($parametros);
      echo json_encode($respuesta);
      break;
    case 'graficoEspecialidades':
      echo json_encode($servicio->grafico_especialidades());
      break;
  }
}
