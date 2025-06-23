import 'taller.dart';

class Empleado {
  String nombre;

  Empleado(this.nombre);

  void actualizarMensajeDelTaller(Taller taller, String nuevoTexto) {
    taller.cambiarMensaje(nuevoTexto);
  }
}