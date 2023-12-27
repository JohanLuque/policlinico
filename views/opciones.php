<?php
$permiso = $_SESSION['login']['nivelacceso'];
$opciones = [];

switch ($permiso){
    case "G":
        $opciones = 
        [
            [   "menu" => "Admisión", 
                "url" => "index.php?view=atenciones.php",
                "icono" => "ti ti-clipboard-text nav-small-cap-icon"
            ],
            [   "menu" => "Lista de atenciones", 
                "url" => "index.php?view=atencionesListado.php",
                "icono" => "ti ti-clipboard-plus nav-small-cap-icon"
            ],
            [   "menu" => "Inicio Caja", 
                "url" => "index.php?view=dashboartCaja.php",
                "icono" => "ti ti-shopping-cart-plus nav-small-cap-icon"
            ],
            [   "menu" => "Caja", 
                "url" => "index.php?view=pagos.php",
                "icono" => "ti ti-shopping-cart-plus nav-small-cap-icon"
            ],
            [   "menu" => "Gastos", 
                "url" => "index.php?view=gastos.php",
                "icono" => "ti ti-coin nav-small-cap-icon"
            ],
            [   "menu" => "Historia Clinica", 
                "url" => "index.php?view=historiaClinica.php",
                "icono" => "ti ti-clipboard-heart nav-small-cap-icon"
            ],
            [   "menu" => "Triaje", 
                "url" => "index.php?view=triaje.php",
                "icono" => "ti ti-heartbeat nav-small-cap-icon"
            ],
            [   "menu" => "Configuración Atención", 
                "url" => "index.php?view=configuracionAtencion.php",
                "icono" => "ti ti-settings nav-small-cap-icon"
            ],
            [   "menu" => "Configuración Cuenta", 
                "url" => "index.php?view=cambiarClave.php",
                "icono" => "ti ti-password nav-small-cap-icon"
            ],
            [   
                "menu" => "Atención", 
                "url" => "index.php?view=vistaDoctores.php",
                "icono" => "ti ti-stethoscope nav-small-cap-icon"
            ],
            [   "menu" => "Historias clinicas", 
                "url" => "index.php?view=vistaDetalleHistoriasClinicas.php",
                "icono" => "ti ti-heartbeat nav-small-cap-icon"
            ]
        ];
    break;
    case "C":
        $opciones = 
        [
            [   "menu" => "Inicio Caja", 
                "url" => "index.php?view=dashboartCaja.php",
                "icono" => "ti ti-shopping-cart-plus nav-small-cap-icon"
            ],
            [   "menu" => "Caja", 
                "url" => "index.php?view=pagos.php",
                "icono" => "ti ti-shopping-cart-plus nav-small-cap-icon"
            ],
            [   "menu" => "Gastos", 
                "url" => "index.php?view=gastos.php",
                "icono" => "ti ti-coin nav-small-cap-icon"
            ],
            [   "menu" => "Configuración Cuenta", 
                "url" => "index.php?view=cambiarClave.php",
                "icono" => "ti ti-password nav-small-cap-icon"
            ]
        ];
    break;
    case "T":
        $opciones = [
            [   "menu" => "Historia Clínica", 
                "url" => "index.php?view=historiaClinica.php",
                "icono" => "ti ti-clipboard-heart nav-small-cap-icon"
            ],
            [   "menu" => "Triaje", 
                "url" => "index.php?view=triaje.php",
                "icono" => "ti ti-heartbeat nav-small-cap-icon"
            ],
            [   "menu" => "Buscar Historias clínicas", 
                "url" => "index.php?view=vistaDetalleHistoriasClinicas.php",
                "icono" => "ti ti-heartbeat nav-small-cap-icon"
            ],
            [   
                "menu" => "Atención", 
                "url" => "index.php?view=vistaDoctores.php",
                "icono" => "ti ti-stethoscope nav-small-cap-icon"
            ],
            [   "menu" => "Configuración Cuenta", 
                "url" => "index.php?view=cambiarClave.php",
                "icono" => "ti ti-password nav-small-cap-icon"
            ]
        ];    
    break;
    case "A":
        $opciones = [
            [   "menu" => "Admisión", 
                "url" => "index.php?view=atenciones.php",
                "icono" => "ti ti-clipboard-text nav-small-cap-icon"
            ],
            [   "menu" => "Lista de atenciones", 
                "url" => "index.php?view=atencionesListado.php",
                "icono" => "ti ti-clipboard-plus nav-small-cap-icon"
            ],
            [   "menu" => "Configuración Atención", 
                "url" => "index.php?view=configuracionAtencion.php",
                "icono" => "ti ti-settings nav-small-cap-icon"
            ],
            [   "menu" => "Configuración Cuenta", 
                "url" => "index.php?view=cambiarClave.php",
                "icono" => "ti ti-password nav-small-cap-icon"
            ]
        ];    
    break;
    case "E":
        $opciones = [
            [   
                "menu" => "Atención", 
                "url" => "index.php?view=vistaDoctores.php",
                "icono" => "ti ti-stethoscope nav-small-cap-icon"
            ],
            [   "menu" => "Historias clínicas", 
                "url" => "index.php?view=vistaDetalleHistoriasClinicas.php",
                "icono" => "ti ti-heartbeat nav-small-cap-icon"
            ],
            [   "menu" => "Configuración cuenta", 
                "url" => "index.php?view=cambiarClave.php",
                "icono" => "ti ti-coin nav-small-cap-icon"
            ]
            
        ];    
    break;
    case "S":
        $opciones = [
            [   
                "menu" => "Vista Servicios", 
                "url" => "index.php?view=vistaServicios.php",
                "icono" => "ti ti-stethoscope nav-small-cap-icon"
            ],
            [   "menu" => "Configuración cuenta", 
                "url" => "index.php?view=cambiarClave.php",
                "icono" => "ti ti-coin nav-small-cap-icon"
            ]
        ];    
    break;
}

    foreach($opciones as $item){
    echo "
        <li class='sidebar-item'>
            <a class='sidebar-link' href='{$item['url']}' aria-expanded='false'>        
                <i class='{$item['icono']}'></i>
                <span class='hide-menu'>{$item['menu']}</span>
            </a>
        </li>
    ";
}