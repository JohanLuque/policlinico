
function notificar(titulo, mensaje, tiempo){
  Swal.fire({
    icon: 'info',
    title: titulo,
    text: mensaje,
    confirmButtonColor: '#2E86C1',
    confirmButtonText: 'Aceptar',
    footer: 'Policlinico solidario',
    timerProgressBar: true,
    timer: (tiempo * 1000)
  })
} 

  function mostrarPregunta(titulo, mensaje) {
    return Swal.fire({
        title: titulo,
        text: mensaje,
        icon: 'question',
        showCancelButton: true,
        confirmButtonText: 'Aceptar',
        cancelButtonText: 'Cancelar',
        confirmButtonColor: '#fa886a',
        cancelButtonColor: '#797D7F',
        footer: 'POLICLINICO SOLIDARIO DE CHINCHA'
      }).then((result) => {
        return result;
    });
  }

  function toast(mensaje){
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 2000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    Toast.fire({
      icon: 'error',
      title: mensaje
    })
  }

  function toastCheck(mensaje){
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 2000,
      timerProgressBar: true,
      didOpen: (toast) => {
        toast.addEventListener('mouseenter', Swal.stopTimer)
        toast.addEventListener('mouseleave', Swal.resumeTimer)
      }
    })

    Toast.fire({
      icon: 'success',
      title: mensaje
    })
  }

  