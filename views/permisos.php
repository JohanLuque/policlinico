<?php
session_start();
$nivelacceso = $_SESSION['login']['nivelacceso'];
$url = $_SERVER['REQUEST_URI'];
$url_array = explode("/", $url);
$vistaActiva = $url_array[count($url_array) - 1];

$permisos = [
    "G" => ["atenciones.php","atencionesListado.php", 
                "atencionMedica.php","configuracionAtencion.php",
                "dashboart.php", "gastos.php", "historiaClinica.php", 
                "pagos.php", "impresos.php","triaje.php","vistaDoctores.php", "vistaServicios.php","dashboartCaja.php"],
    "A" => ["atenciones.php","atencionesListado.php", "configuracionAtencion.php","dashboart.php"],
    "C" => ["dashboartCaja.php","pagos.php", "gastos.php"],
    "T" => ["historiaClinica.php","impresos.php", "triaje.php"],
    "E" => ["vistaDoctores.php"],
    "S" => ["vistaServicios.php"]
];

$autorizado = false;

$vistasPermitidas = $permisos[$nivelacceso];

foreach($vistasPermitidas as $item){
    if ($item == $vistaActiva){
        $autorizado = true;
    }
}

if (!$autorizado){
    echo "<h1>Acceso restringido</h1>";
    exit();
}

?>