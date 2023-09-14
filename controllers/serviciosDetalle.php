<?php

require_once '../models/Servicios_detalle.php';

if(isset($_POST['operacion'])){
  $servicioDetalle = new ServicioDetalle();
  switch($_POST['operacion']){
    case 'filtroServicios':
      $parametros = [
        "idServicio" => $_POST['idServicio']
      ];
    echo json_encode($servicioDetalle->filtroServicios($parametros));
    break;
  }
}