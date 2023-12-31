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
                "pagos.php","triaje.php","dashboartCaja.php", "cambiarClave.php","vistaDoctores.php"],
    "A" => ["dashboart.php","atenciones.php","atencionesListado.php", "configuracionAtencion.php","dashboart.php", "cambiarClave.php"],
    "C" => ["dashboart.php","dashboartCaja.php","pagos.php", "gastos.php", "cambiarClave.php"],
    "T" => ["dashboart.php","historiaClinica.php", "triaje.php", "cambiarClave.php","vistaDoctores.php"],
    "E" => ["dashboart.php","vistaDoctores.php", "cambiarClave.php"],
    "S" => ["dashboart.php","vistaServicios.php", "cambiarClave.php"]
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