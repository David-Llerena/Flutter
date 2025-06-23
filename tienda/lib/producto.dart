import 'tienda.dart';

class Producto {
  String codigo;
  String descripcion;
  double precio;
  dynamic observacion; // Puede ser cualquier tipo

  Producto(this.codigo) : 
    descripcion = "",
    precio = 0.0,
    observacion = "";

  void registrarVenta(String descripcion, double precio, dynamic observacion) {
    this.descripcion = descripcion;
    this.precio = precio;
    this.observacion = observacion;
  }

  String resumen(Tienda tienda) {
    return "Código: $codigo, Descripción: $descripcion, Precio: \$${precio.toStringAsFixed(2)}, Observación: $observacion\nTienda: ${tienda.nombre}, Anuncio: ${tienda.anuncio}";
  }
}
