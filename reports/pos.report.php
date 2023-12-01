<?php

require_once '../vendor/autoload.php';
require_once '../models/MediosPago.php';


use Spipu\Html2Pdf\Html2Pdf; 
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {
    $medio = new MediosPago();
    $datos = $medio->POS($_GET['fecha']);
    ob_start();

    include './estilos.html';
    include './pos.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('L', 'A4', 'es');
    $html2pdf->pdf->SetDisplayMode('fullpage');
    $html2pdf->writeHTML($content);
    $html2pdf->output('ReporteServicios.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}