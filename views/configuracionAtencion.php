<div class="container-fluid">
    <div class="card">
        <div class="card-header">
            <h1 class="text-center">Configuración</h1>
        </div>
        <div class="card-body">
            <div class="mb-2 row g-2">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">SERVICIO:</div>
                            <div class="card-body">
                                <div class="mb-3 row g-2">
                                    <div class="col-md-2">
                                        <label for="">Tipo:</label>          
                                    </div>
                                    <div class="col-md-9">       
                                        <div class="form-check form-check-inline">                           
                                        <input class="form-check-input" type="radio" name="options" id="rbServicio" value="S">
                                            <label class="form-check-label">Servicio</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="options" id="rbEspecialidas" value="E">
                                            <label class="form-check-label">Especialidad</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="col-md-2">
                                        <label for="">Nombre:</label>          
                                    </div>
                                    <div class="col-md-8">
                                        <input class="form-control form-control-sm" id="nombreServicio" type="text">
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="colmd-6"></div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-primary" id="guardar">Guardar</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-danger" id="cancelar">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div> 
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-header bg-info text-white">DETALLE DE SERVICIO:</div>
                            <div class="card-body">
                                <div class="mb-3 row g-2">
                                    <div class="col-md-3">
                                        <label for="">Servicio:</label>          
                                    </div>
                                    <div class="col-md-8">                                  
                                        <select name="" id="listaServicios" class="form-select form-select-sm">
                                        <option value="">Seleccione</option>
                                        </select> 
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="col-md-3">
                                        <label for="">Descripción:</label>          
                                    </div>
                                    <div class="col-md-8">
                                        <input class="form-control form-control-sm" id="descripcionServicio" type="text">
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="col-md-3">
                                        <label for="">Precio:</label>          
                                    </div>
                                    <div class="col-md-8">
                                        <input class="form-control form-control-sm" id="precioServicio" type="text">
                                    </div>
                                </div>
                                <div class="mb-3 row g-2">
                                    <div class="colmd-6"></div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-primary" id="guardar">Guardar</button>
                                    </div>
                                    <div class="col-md-3">
                                        <button type="button" class="btn btn-danger" id="cancelar">Cancelar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>              
            </div>
        </div>
    </div>
</div>