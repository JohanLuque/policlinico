<div class="container-fluid">

<div class="card">
    <div class="card-body">
        <h5 class="card-title fw-semibold mb-4" style="color:#ff7619 ;">Triaje</h5>
        <div class="card">
            <div class="card-body">
                <form id="form-historia">
                    <div class="mb-3 row g-2">
                        <div class="col-md-1">
                            <label for="">Buscar:</label>
                        </div>
                        <div class="col-md-3">
                            <input type="text" class="form-control form-control-sm">
                        </div>
                        <div class="col-md-3">
                            <button class="btn btn-sm" id="buscarPaciente" data-bs-toggle="modal" data-bs-target="#buscarPaciente" type="button"><i class="fa-solid fa-magnifying-glass fa-xl" style="color: #ff7619;"></i></button>
                        </div>
                    </div>

                    <!--FILIACION-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">FILIACIÓN</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-5">
                            <input class="form-control form-control-sm" id="nombreApellidoPaciente" type="text" placeholder="Nombres y Apellidos" readonly>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="dniPaciente" type="text" placeholder="DNI" readonly>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="generoPaciente" type="text" placeholder="Género" readonly>
                        </div>
                        <div class="col-md-1">
                            <input class="form-control form-control-sm" id="edadPaciente" type="text" placeholder="Edad" readonly>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="fecha" type="text" placeholder="Fecha" readonly>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" style="color:#ff7619 ;">FAMILIAR O APODERADO</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-5">
                            <input class="form-control form-control-sm" id="nombreApellidoApoderado" type="text" placeholder="Nombres y Apellidos" readonly>
                        </div>
                        <div class="col-md-3">
                            <input class="form-control form-control-sm" id="parentesco" type="text" placeholder="Parentesco" readonly>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="dniParentesco" type="text" placeholder="DNI" readonly>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="celular" type="text" placeholder="Celular" readonly>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" style="color:#ff7619 ;">ANTECEDENTES</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-5">
                            <input class="form-control form-control-sm" id="personales" type="text" placeholder="Personales" readonly>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control form-control-sm" id="familiares" type="text" placeholder="Familiares" readonly>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-5">
                            <input class="form-control form-control-sm" id="quirurgicos" type="text" placeholder="Quirurgicos" readonly>
                        </div>
                        <div class="col-md-5">
                            <input class="form-control form-control-sm" id="otros" type="text" placeholder="Otros" readonly>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" style="color:#ff7619 ;">ALERGIAS</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-6">
                            <input class="form-control form-control-sm" id="alergia" type="text" placeholder="Alergia">
                        </div>
                    </div>

                    <!--EXAMEN CLINICO-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">EXAMEN CLÍNICO</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" style="color:#ff7619 ;">FUNCIONES VITALES</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-1">
                            <label for="" class="fw-semibold">Peso:</label>
                        </div>
                        <div class="col-md-1">
                            <label for="" class="fw-semibold">Talla:</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">F. cardíaca:</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">F. Respiratoria:</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">P. Arterial:</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">Temperatura:</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">S. Oxigeno:</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-1">
                            <input class="form-control form-control-sm" id="peso" type="text" placeholder="Peso">
                        </div>
                        <div class="col-md-1">
                            <input class="form-control form-control-sm" id="talla" type="text" placeholder="Talla">
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="f.cardiaca" type="text" placeholder="FC">
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="f.respiratoria" type="text" placeholder="FR">
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="p.arterial" type="text" placeholder="P/A">
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="temperatura" type="text" placeholder="T(C°)">
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="s.oxigeno" type="text" placeholder="Sp02">
                        </div>
                    </div>

                    <!--ENFERMEDAD ACTUAL-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">ENFERMEDAD ACTUAL</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-12">
                            <input class="form-control form-control-sm" id="inicio" type="text" placeholder="Inicio">
                        </div>
                        <div class="col-md-12">
                            <input class="form-control form-control-sm" id="curso" type="text" placeholder="Curso">
                        </div>
                        <div class="col-md-12">
                            <input class="form-control form-control-sm" id="relato" type="text" placeholder="Relato">
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" style="color:#ff7619 ;">EXAMEN GENERAL</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-12">
                            <textarea class="form-control" id="e.general" type="text"></textarea>
                        </div>
                    </div>

                    <!--IMPRESION DIAGNOSTICA-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">IMPRESIÓN DIAGNOSTICA</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-1">
                            <label for="" class="fw-semibold">CIE-10:</label>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="cie10" type="text" placeholder="Código">
                        </div>
                        <div class="col-md-6"></div>
                        <div class="col-md-3">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="" value="">
                                <label class="form-check-label" for="">P</label>
                              </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="" value="">
                                <label class="form-check-label" for="">D</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="" value="">
                                <label class="form-check-label" for="">R</label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <input class="form-control form-control-sm" id="diagnostico" type="text" placeholder="Descripción del diagnóstico">
                    </div>

                    <!--PROCEDIMIENTO - INTERVENCION-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">PROCEDIMIENTO - INTERVENCIÓN</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-12">
                            <textarea class="form-control" id="procedimiento" type="text"></textarea>
                        </div>
                    </div>
                    <!--TRATAMIENTO-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">TRATAMIENTO</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">Medicamento</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">Presentación</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">Cantidad</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">Dosis</label>
                        </div>
                        <div class="col-md-2">
                            <label for="" class="fw-semibold">Días</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <!--CAMPOS PARA LOS DATOS:')-->
                    </div>
                    <!--OBSERVACIONES-->
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">OBSERVACIONES(REFERENCIAS, CITAS, INTERCONSULTAS,OTROS)</label>
                        </div>
                    </div>
                    <div class="mb-3 row g-2">
                        <div class="col-md-12">
                            <textarea class="form-control" id="observaciones" type="text"></textarea>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-10">
                            <label for="" class="card-title" style="color:#29ABE2; text-decoration:underline;">DATOS DEL PROFESIONAL</label>
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-2">
                            <label for="">Profesional:</label>
                        </div>
                        <div class="col-md-10">
                            <input class="form-control form-control-sm" id="nombreProfesional" type="text" placeholder="Nombre del profesional">
                        </div>
                    </div>
                    <div class="mb-2 row g-2">
                        <div class="col-md-1">
                            <label for="">Código:</label>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="codigo" type="text">
                        </div>
                        <div class="col-md-2">
                            <label for="">Consultorio:</label>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="consultorio" type="text">
                        </div>
                        <div class="col-md-1">
                            <label for="">Turno:</label>
                        </div>
                        <div class="col-md-2">
                            <input class="form-control form-control-sm" id="Turno" type="text">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>