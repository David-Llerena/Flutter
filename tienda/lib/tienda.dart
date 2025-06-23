class Tienda {
  String nombre;
  String anuncio;
  int _productosVendidos; // Atributo protegido

  Tienda(this.nombre) : 
    anuncio = "Bienvenido a nuestra tienda",
    _productosVendidos = 0;

  void cambiarAnuncio(String nuevoAnuncio) {
    anuncio = nuevoAnuncio;
  }

  void aumentarVentas() {
    _productosVendidos++;
  }

  int obtenerVentas() {
    return _productosVendidos;
  }
}