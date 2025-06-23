import 'dart:async';
import 'dart:math';

// Simulación de envío de mensaje
Future<bool> enviarMensaje(String mensaje, String destinatario) async {
  print('📤 Enviando mensaje a $destinatario...');
  print('💬 Contenido: "$mensaje"');
  
  // Simular latencia de red (1-3 segundos)
  int tiempoEnvio = 1 + Random().nextInt(3);
  await Future.delayed(Duration(seconds: tiempoEnvio));
  
  // Simular posible fallo (10% de probabilidad)
  bool exitoso = Random().nextDouble() > 0.1;
  
  if (exitoso) {
    print('✅ Mensaje enviado exitosamente');
    return true;
  } else {
    print('❌ Error al enviar mensaje');
    return false;
  }
}

// Simulación de actualización de interfaz
Future<void> actualizarInterfaz() async {
  List<String> acciones = [
    'Actualizando lista de contactos',
    'Sincronizando mensajes recientes',
    'Cargando avatares de usuario',
    'Actualizando estado de conexión'
  ];
  
  for (String accion in acciones) {
    print('🔄 $accion...');
    await Future.delayed(Duration(milliseconds: 600));
  }
}

// Función principal del segundo ejemplo
Future<void> ejemploMensajeYActualizacion() async {
  print('=== EJEMPLO 2: Envío de mensaje y actualización de UI ===\n');
  
  String mensaje = 'Hola! ¿Cómo estás?';
  String destinatario = 'María';
  
  // Iniciar envío sin esperar
  Future<bool> envioEnProceso = enviarMensaje(mensaje, destinatario);
  
  // Mientras se envía, actualizar la interfaz
  await actualizarInterfaz();
  
  // Verificar resultado del envío
  bool mensajeEnviado = await envioEnProceso;
  
  if (mensajeEnviado) {
    print('🎉 ¡Todo listo! Mensaje enviado e interfaz actualizada\n');
  } else {
    print('⚠️  Interfaz actualizada, pero el mensaje falló. Reintentando...\n');
  }
}

// Función principal del programa
void main() async {
  await ejemploMensajeYActualizacion();
}