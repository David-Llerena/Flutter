// Clase Pelicula
class Pelicula {
  String titulo;
  int anioEstreno;
  
  Pelicula(this.titulo, this.anioEstreno);
  
  @override
  String toString() {
    return '$titulo ($anioEstreno)';
  }
}

void ejercicio3() {
  print('\n\n=== EJERCICIO 3: CATÁLOGO DE PELÍCULAS POR PLATAFORMA ===\n');

  // 2. Declara un Map<String, List<Pelicula>> llamado catalogoStreaming
  Map<String, List<Pelicula>> catalogoStreaming = {
    'Netflix': [
      Pelicula('Stranger Things', 2016),
      Pelicula('The Crown', 2016),
    ],
    'HBO': [
      Pelicula('Game of Thrones', 2011),
      Pelicula('Succession', 2018),
    ],
    'Disney+': [
      Pelicula('The Mandalorian', 2019),
      Pelicula('WandaVision', 2021),
    ]
  };

  print('1. Catálogo inicial:');
  catalogoStreaming.forEach((plataforma, peliculas) {
    print('   $plataforma: ${peliculas.length} películas');
  });

  // 3. Agrega al menos dos películas a cada plataforma
  catalogoStreaming['Netflix']!.addAll([
    Pelicula('Ozark', 2017),
    Pelicula('Money Heist', 2017)
  ]);
  
  catalogoStreaming['HBO']!.addAll([
    Pelicula('Westworld', 2016),
    Pelicula('True Detective', 2014)
  ]);
  
  catalogoStreaming['Disney+']!.addAll([
    Pelicula('Luca', 2021),
    Pelicula('Encanto', 2021)
  ]);

  // 4. Imprime los títulos de todas las películas disponibles en Netflix
  print('\n4. Películas disponibles en Netflix:');
  for (Pelicula pelicula in catalogoStreaming['Netflix']!) {
    print('   - ${pelicula.titulo}');
  }

  // 5. Agrega una película nueva a Disney+
  catalogoStreaming['Disney+']!.add(Pelicula('Elemental', 2023));
  print('\n5. Nueva película agregada a Disney+: ${catalogoStreaming['Disney+']!.last.titulo}');

  // 6. Cambia el año de estreno de una película en HBO
  catalogoStreaming['HBO']![0].anioEstreno = 2012; // Game of Thrones
  print('\n6. Año actualizado de ${catalogoStreaming['HBO']![0].titulo}: ${catalogoStreaming['HBO']![0].anioEstreno}');

  // 7. Elimina una película de Netflix
  Pelicula peliculaEliminada = catalogoStreaming['Netflix']!.removeAt(1);
  print('\n7. Película eliminada de Netflix: ${peliculaEliminada.titulo}');

  // 8. Recorre todo el mapa y muestra el nombre de cada plataforma seguido por la lista de películas
  print('\n8. CATÁLOGO COMPLETO POR PLATAFORMA:');
  catalogoStreaming.forEach((plataforma, peliculas) {
    print('\nPlataforma: $plataforma');
    for (Pelicula pelicula in peliculas) {
      print('  - $pelicula');
    }
  });
}

// Función principal que ejecuta todos los ejercicios
void main() {
  print('=== EJECUTANDO EJERCICIOS DE DART ===\n');
  
  // Ejecutar Ejercicio 3 (el único que está implementado)
  ejercicio3();
  
  print('\n=== FIN DE LOS EJERCICIOS ===');
}