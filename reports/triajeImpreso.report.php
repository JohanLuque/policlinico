<?php

require_once '../vendor/autoload.php';
require_once '../models/DetalleAtencion.php';


use Spipu\Html2Pdf\Html2Pdf; 
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {
    $detalleAtencion = new DetalleAtencion();
    $datosTriaje = $detalleAtencion->impresionesTriaje($_GET['idDetalleHistoria']);
    $datosAlergias = $detalleAtencion->impresionesAlergias($_GET['idHistoria']);
    ob_start();

    include './estilos.html';
    include './triajeImpreso.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', '80X80', 'es');
    //$html2pdf = new Html2Pdf('P', 'A4', 'fr', true, 'UTF-8', 0);
    $html2pdf->pdf->SetDisplayMode('fullpage');
    $html2pdf->writeHTML($content);
    $html2pdf->output('ticket.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}