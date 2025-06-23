void main() {
  // 1. Declara una List<String> llamada comidasFavoritas con al menos 5 platos
  List<String> comidasFavoritas = [
    'Pizza Margherita',
    'Pasta Carbonara',
    'Arroz con Pollo',
    'Sushi de Salmón',
    'Tacos al Pastor',
    'Lasaña Boloñesa'
  ];

  print('=== EJERCICIO 1: PLANIFICADOR DE COMIDAS SEMANAL ===\n');
  
  print('1. Lista inicial de comidas favoritas:');
  for (int i = 0; i < comidasFavoritas.length; i++) {
    print('   ${i + 1}. ${comidasFavoritas[i]}');
  }

  // 2. Agrega una nueva comida al final de la lista
  comidasFavoritas.add('Paella Valenciana');
  print('\n2. Después de agregar nueva comida:');
  print('   Última comida agregada: ${comidasFavoritas.last}');

  // 3. Elimina una de las comidas existentes
  String comidaEliminada = comidasFavoritas.removeAt(2); // Elimina "Arroz con Pollo"
  print('\n3. Comida eliminada: $comidaEliminada');

  // 4. Imprime la comida en la posición 2
  print('\n4. Comida en posición 2: ${comidasFavoritas[2]}');

  // 5. Crea una List<List<String>> llamada menuSemanal
  List<List<String>> menuSemanal = [
    ['Pancakes', 'Ensalada César', 'Pizza Margherita'],           // Lunes
    ['Tostadas', 'Pasta Carbonara', 'Sushi de Salmón'],          // Martes
    ['Cereal', 'Sandwich', 'Tacos al Pastor'],                   // Miércoles
    ['Huevos Benedict', 'Sopa', 'Lasaña Boloñesa'],              // Jueves
    ['Smoothie Bowl', 'Wrap de Pollo', 'Paella Valenciana'],     // Viernes
    ['Waffles', 'Hamburguesa', 'Filete a la Plancha'],           // Sábado
    ['Bagel', 'Risotto', 'Pollo al Curry']                       // Domingo
  ];

  List<String> diasSemana = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];

  // 6. Imprime el almuerzo del día martes (índice 1)
  print('\n6. Almuerzo del martes: ${menuSemanal[1][1]}');

  // 7. Cambia la cena del viernes (índice 4) por otra comida
  menuSemanal[4][2] = 'Ceviche Peruano';
  print('\n7. Nueva cena del viernes: ${menuSemanal[4][2]}');

  // 8. Recorre el menú semanal y muestra todas las comidas organizadas por día
  print('\n8. MENÚ SEMANAL COMPLETO:');
  for (int i = 0; i < menuSemanal.length; i++) {
    print('\n   ${diasSemana[i]}:');
    print('     - Desayuno: ${menuSemanal[i][0]}');
    print('     - Almuerzo: ${menuSemanal[i][1]}');
    print('     - Cena: ${menuSemanal[i][2]}');
  }
}