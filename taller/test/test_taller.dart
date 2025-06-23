import '../lib/empleado.dart';
import '../lib/vehiculo.dart';
import '../lib/taller.dart';

void main() {
  // 1. Crear un Empleado con nombre "Carlos"
  Empleado carlos = Empleado("Carlos");
  
  // 2. Usar su método para cambiar el mensaje de bienvenida del taller
  Taller taller = Taller("Taller Central");
  carlos.actualizarMensajeDelTaller(taller, "¡Bienvenido a nuestro excelente servicio!");
  
  // 3. Crear dos objetos Vehículo con placas diferentes
  Vehiculo vehiculo1 = Vehiculo("ABC-123");
  Vehiculo vehiculo2 = Vehiculo("XYZ-789");
  
  // 4. Llamar al método registrarDiagnostico en cada uno
  vehiculo1.registrarDiagnostico("Cambio de aceite completado");
  vehiculo2.registrarDiagnostico("Reparación de frenos terminada");
  
  // 5. Asignar a extraInfo valores de tipos distintos
  vehiculo1.extraInfo = "Cliente VIP - Descuento aplicado";
  vehiculo2.extraInfo = 250.75; // Costo adicional
  
  // 6. Mostrar su resumen
  print("=== RESUMEN DE VEHÍCULOS ===");
  print(vehiculo1.resumen());
  print(vehiculo2.resumen());
  
  // 7. Mostrar cuántos vehículos han sido reparados
  taller.incrementarContador();
  taller.incrementarContador();
  
  print("\nTotal de reparaciones realizadas: ${taller.obtenerReparaciones()}");
  print("Mensaje del taller: ${taller.mensajeGeneral}");
}