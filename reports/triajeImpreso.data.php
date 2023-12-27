<page>
    <page_header class="mb-5 mt-5">
        <div class=" row">
            <img src='../views/images/logos/ticket.png' style="width: 200px;" class="ml-5">
            <h1 class="text-center" style="font-size: 25;text-decoration: underline ;" >HISTORIA CLÍNICA</h1>
        </div>
    </page_header>
    <div class="" style="margin-bottom: 125px;"></div>

    <div class="container me-5">
        <div class="row">
            <?php foreach ($datosTriaje as $datos):?>
                <h4 class="text-end mb-2 ms-4">ESPECIALIDAD: <?=$datos['nombreServicio']?></h4>
            <?php endforeach?>
        </div>
        <div class="row text-end">
            <h4>ALERGIAS: 
                <p class="mb-3" style="text-decoration: underline ;">
                    <?php foreach ($datosAlergias as $datos):?>
                    <?=$datos['alergia']?>,
                    <?php endforeach?> ______________________
                </p>
            </h4>
        </div>
    </div>
    <h2 class="mb-2 titulo">1.- FILIACIÓN</h2>
    <!--Tabla pacientes-->
    <?php foreach ($datosTriaje as $datos):?>
        <table class="table table-borde mt-3 mb-3">
            <colgroup>  
                <col style="width: 49%">
                <col style="width: 12%">
                <col style="width: 12%">
                <col style="width: 13%">
                <col style="width: 14%">
            </colgroup>
            <thead>
                <tr>
                    <th class="text-bold text-center">Apellidos y Nombres</th>
                    <th class="text-bold text-center">DNI</th>
                    <th class="text-bold text-center">Género</th>
                    <th class="text-bold text-center">Edad</th>
                    <th class="text-bold text-center">Fecha</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center"><?=$datos['paciente']?></td>
                    <td class="text-center"><?=$datos['numeroDocumento']?></td>
                    <td class="text-center"><?=$datos['genero']?></td>
                    <td class="text-center">
                        <?php if($datos["Edad"] == 1){
                            echo $datos['Edad'] . " año";
                        }else if($datos["Edad"] > 1){
                            echo $datos['Edad'] . " años";
                        }else if($datos["meses"] == 1){
                            echo $datos['meses'] . " Mes";
                        }else{
                            echo $datos['meses'] . " Meses";
                        }
                            ?>
                    </td>
                    <td class="text-center"><?=$datos['fecha']?></td>
                </tr>
            </tbody>
        </table>
    <!--Tabla familiares-->
    <h4 class="mb-1 mt-1" style="font-size: 14;">FAMILIAR</h4>
    <table class="table table-borde mt-3">
        <colgroup>  
            <col style="width: 50%">
            <col style="width: 30%">
            <col style="width: 20%">
        </colgroup>
        <thead>
            <tr>
                <th class="text-bold text-center">Apellidos y Nombres</th>
                <th class="text-bold text-center">Parentesco</th>
                <th class="text-bold text-center">DNI</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="text-center tabla"><?=$datos['familiar']?></td>
                <td class="text-center tabla"><?=$datos['parentesco']?></td>
                <td class="text-center tabla"><?=$datos['dniFam']?></td>
            </tr>
        </tbody>
    </table>
    <?php endforeach?>
    <!--Enfermedad actual-->
    <h2 class="titulo mb-2" >2.- ENFERMEDAD ACTUAL</h2>
    <table class='table table-borde mt-3 '>
        <thead>
            <tr>
                <th>Inicio</th>
                <td style="width: 93%; padding: 10px;"></td>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>Curso</th>
                <td style="width: 93%; padding: 10px;"></td>
            </tr>
            <tr>
                <th>Relato</th>
                <td style="width: 93%; padding: 10px;"></td>
            </tr>
        </tbody>

    </table>
    <!--Antecedentes-->
    <h2 class="titulo mb-2" >3.- ANTECEDENTES</h2>
    <?php foreach ($datosTriaje as $datos):?>
        <table class="table table-borde mt-3">
            <colgroup>  
                <col style="width: 25%">
                <col style="width: 25%">
                <col style="width: 25%">
                <col style="width: 25%">
            </colgroup>
            <thead>
                <tr>
                    <th class="text-bold text-center">Personales</th>
                    <th class="text-bold text-center">Familiares</th>
                    <th class="text-bold text-center">Quirúrgicos</th>
                    <th class="text-bold text-center">Otros</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center tabla"><?=$datos['antecedentePersonal']?></td>
                    <td class="text-center tabla"><?=$datos['antecedenteFamiliar']?></td>
                    <td class="text-center tabla"><?=$datos['antecedenteQuirurgico']?></td>
                    <td class="text-center tabla"><?=$datos['antecedenteOtro']?></td>
                </tr>
            </tbody>
        </table>
    <?php endforeach?>
    <!--Examen clinico-->
    <h2 class="titulo mb-2" >4.- EXAMEN CLÍNICO</h2>
    <h4 class="mb-1 mt-1" style="font-size: 14;">FUNCIONES VITALES</h4>
    <?php foreach ($datosTriaje as $datos):?>
        <table class="table table-borde mt-3 mb-3">
            <colgroup>  
                <col style="width: 14%">
                <col style="width: 14%">
                <col style="width: 14%">
                <col style="width: 14%">
                <col style="width: 14%">
                <col style="width: 14%">
                <col style="width: 14%">
            </colgroup>
            <thead>
                <tr>
                    <th class="text-bold text-center">Peso</th>
                    <th class="text-bold text-center">Talla</th>
                    <th class="text-bold text-center">FC</th>
                    <th class="text-bold text-center">FR</th>
                    <th class="text-bold text-center">P/A</th>
                    <th class="text-bold text-center">T(C°)</th>
                    <th class="text-bold text-center">Sp02</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-center"><?=$datos['peso']?> kg</td>
                    <td class="text-center"><?=$datos['talla']?> cm</td>
                    <td class="text-center"><?=$datos['frecuenciaCardiaca']?> min</td>
                    <td class="text-center"><?=$datos['FrecuenciaRespiratoria']?> min</td>
                    <td class="text-center"><?=$datos['PresionArterial']?> MmHg</td>
                    <td class="text-center"><?=$datos['temperatura']?> Tc°</td>
                    <td class="text-center"><?=$datos['SaturacionOxigeno']?> %</td>
                </tr>
            </tbody>
        </table>
    <?php endforeach?>

    <h4 class="mb-1 mt-1" style="font-size: 14;">EXAMEN GENERAL</h4>
    <table class="table table-borde mt-3">
        <thead>
            <tr>
                <th class="tabla"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
        </tbody>
    </table>

    <!--Impresión diagnostica-->
    <h2 class="titulo mb-2" >5.- IMPRESIÓN DIAGNOSTICA</h2>
    <table class="table table-borde mt-3">
        <colgroup>  
            <col style="width: 10%">
            <col style="width: 60%">
            <col style="width: 10%">
            <col style="width: 10%">
            <col style="width: 10%">
        </colgroup>
        <thead>
            <tr>
                <th class="text-bold text-center">CIE 10</th>
                <th class="text-bold text-center">DESCRIPCION DEL DIAGNOSTICO</th>
                <th class="text-bold text-center">P</th>
                <th class="text-bold text-center">D</th>
                <th class="text-bold text-center">R</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
            </tr>
        </tbody>
    </table>
</page>
<page>
    <!--Procedimientos-->
    <h2 class="mb-2 titulo" style="margin-top: 40px; ">6.- PROCEDIMIENTOS</h2>
    <table class="table table-borde mt-3">
        <thead>
            <tr>
                <th class="tabla"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
        </tbody>
    </table>
    <!--Tratamiento-->
    <h2 class="mb-2 titulo">7.- TRATAMIENTO</h2>
    <table class="table table-borde mt-3">
        <colgroup>  
            <col style="width: 30%">
            <col style="width: 30%">
            <col style="width: 20%">
            <col style="width: 10%">
            <col style="width: 10%">
        </colgroup>
        <thead>
            <tr>
                <th class="text-bold text-center">MEDICAMENTO</th>
                <th class="text-bold text-center">PRESENTACIÓN</th>
                <th class="text-bold text-center">CANTIDAD</th>
                <th class="text-bold text-center">DOSIS</th>
                <th class="text-bold text-center">DIAS</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
                <td class="tabla"></td>
            </tr>
        </tbody>
    </table>
    <!--Observaciones-->
    <h2 class="mb-2 titulo">8.- OBSERVACIONES(REFERENCIAS,CITAS,INTERCONSULTAS,OTROS)</h2>
    <table class="table table-borde mt-3">
        <thead>
            <tr>
                <th class="tabla"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
            <tr>
                <td class="tabla"></td>
            </tr>
        </tbody>
    </table>
    <!--Firma y sello-->
    <div class="container mt-5">
            <h4 class="text-center mb-1 mt-5">______________________ </h4>
            <h4 class="text-center">FIRMA Y SELLO </h4>
    </div>
</page>