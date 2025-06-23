void main() {
  ejercicio2();
}

void ejercicio2() {
  print('\n\n=== EJERCICIO 2: RANKING DE JUGADORES ===\n');

  // 1. Declara un Map<String, int> llamado puntajes
  Map<String, int> puntajes = {
    'Ana': 1250,
    'Carlos': 980,
    'María': 1150,
    'Pedro': 1050
  };

  print('1. Ranking inicial de jugadores:');
  puntajes.forEach((nombre, puntaje) {
    print('   $nombre: $puntaje puntos');
  });

  // 2. Agrega al menos cuatro jugadores con puntajes distintos
  puntajes['Luis'] = 1300;
  puntajes['Sofia'] = 890;
  print('\n2. Después de agregar nuevos jugadores:');
  print('   Total de jugadores: ${puntajes.length}');

  // 3. Muestra todos los nombres de los jugadores registrados
  print('\n3. Jugadores registrados:');
  List<String> nombres = puntajes.keys.toList();
  for (int i = 0; i < nombres.length; i++) {
    print('   ${i + 1}. ${nombres[i]}');
  }

  // 4. Imprime el puntaje de un jugador específico usando su nombre como clave
  String jugadorBuscado = 'María';
  print('\n4. Puntaje de $jugadorBuscado: ${puntajes[jugadorBuscado]} puntos');

  // 5. Modifica el puntaje de uno de los jugadores
  puntajes['Carlos'] = 1100;
  print('\n5. Puntaje actualizado de Carlos: ${puntajes['Carlos']} puntos');

  // 6. Agrega un nuevo jugador con su respectivo puntaje
  puntajes['Roberto'] = 1180;
  print('\n6. Nuevo jugador agregado: Roberto con ${puntajes['Roberto']} puntos');

  // 7. Elimina a un jugador del mapa
  int? puntajeEliminado = puntajes.remove('Sofia');
  print('\n7. Jugador eliminado: Sofia (tenía $puntajeEliminado puntos)');

  // 8. Imprime el contenido completo del mapa actualizado
  print('\n8. RANKING FINAL DE JUGADORES:');
  
  // Ordenar por puntaje descendente para mostrar el ranking
  List<MapEntry<String, int>> rankingOrdenado = puntajes.entries.toList();
  rankingOrdenado.sort((a, b) => b.value.compareTo(a.value));
  
  for (int i = 0; i < rankingOrdenado.length; i++) {
    print('   ${i + 1}° lugar: ${rankingOrdenado[i].key} - ${rankingOrdenado[i].value} puntos');
  }
}