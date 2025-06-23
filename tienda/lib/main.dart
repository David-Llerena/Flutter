
import 'producto.dart';
import 'tienda.dart';

void main() {
  // Crear la tienda
  Tienda tienda = Tienda("SuperMarket");
  
  // 1. Crear dos productos distintos
  Producto producto1 = Producto("P001");
  Producto producto2 = Producto("P002");
  
  // 2. Usar registrarVenta para cada uno, con descripciones y observaciones distintas
  producto1.registrarVenta("Laptop Gaming", 1200.50, "Producto en excelente estado");
  producto2.registrarVenta("Mouse Inalámbrico", 45.99, "Batería incluida");
  
  // 3. Cambiar el anuncio de la tienda
  tienda.cambiarAnuncio("¡Ofertas especiales esta semana!");
  
  // 4. Mostrar el resumen de ambos productos
  print("=== RESUMEN DE PRODUCTOS ===");
  print(producto1.resumen(tienda));
  print("");
  print(producto2.resumen(tienda));
  
  // 5. Mostrar el total de productos vendidos
  tienda.aumentarVentas(); // Por producto1
  tienda.aumentarVentas(); // Por producto2
  
  print("\nTotal de productos vendidos: ${tienda.obtenerVentas()}");
}