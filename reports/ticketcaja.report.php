<?php

require_once '../vendor/autoload.php';
require_once '../models/Pago.php';


use Spipu\Html2Pdf\Html2Pdf; 
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {
    $pago = new Pago ();
    $datos = $pago->reporte2($_GET['idolimpiada']);
    $titulo = $_GET['titulo'];
    ob_start();

    include './estilos.html';
    include './ganadores.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'es');
    $html2pdf->writeHTML($content);
    $html2pdf->output('ticket.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}