class Taller {
  String nombre;
  String mensajeGeneral;
  int _totalReparaciones; // Atributo protegido

  Taller(this.nombre) : 
    mensajeGeneral = "Bienvenido al Taller",
    _totalReparaciones = 0;

  void cambiarMensaje(String nuevoMensaje) {
    mensajeGeneral = nuevoMensaje;
  }

  void incrementarContador() {
    _totalReparaciones++;
  }

  int obtenerReparaciones() {
    return _totalReparaciones;
  }
}