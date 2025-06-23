import 'dart:async';
import 'dart:math';

// Simulación de descarga de archivo
Future<String> descargarArchivo(String nombreArchivo) async {
  print('📥 Iniciando descarga de $nombreArchivo...');
  
  // Simular tiempo de descarga variable (2-5 segundos)
  int tiempoDescarga = 2 + Random().nextInt(4);
  await Future.delayed(Duration(seconds: tiempoDescarga));
  
  print('✅ Descarga completada: $nombreArchivo');
  return 'Archivo descargado: $nombreArchivo (${tiempoDescarga}s)';
}

// Simulación de navegación por la app
Future<void> navegarPorApp() async {
  List<String> pantallas = ['Inicio', 'Perfil', 'Configuración', 'Ayuda'];
  
  for (String pantalla in pantallas) {
    print('📱 Navegando a: $pantalla');
    await Future.delayed(Duration(milliseconds: 800));
  }
}

// Función principal que ejecuta ambas tareas
Future<void> ejemploDescargaYNavegacion() async {
  print('=== EJEMPLO 1: Descarga y navegación simultánea ===\n');
  
  // Iniciar descarga sin esperar (no usar await aquí)
  Future<String> descargaEnProceso = descargarArchivo('documento_importante.pdf');
  
  // Mientras se descarga, navegar por la app
  await navegarPorApp();
  
  // Ahora esperamos a que termine la descarga
  String resultado = await descargaEnProceso;
  print('📋 Resultado final: $resultado\n');
}

// Función principal del programa
void main() async {
  await ejemploDescargaYNavegacion();
}