import '../models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final CollectionReference librosCollection = _firestore.collection('libro');

  // Insertar libro
  Future<void> insertBook(Book book) async {
    await librosCollection.add(book.toMap());
  }

  // Obtener todos los libros
  Future<List<Book>> getBooks() async {
    final snapshot = await librosCollection.get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;

      return Book(
        id: doc.id,
        title: data['titulo'] ?? '',
        author: data['autor'] ?? '',
        status: data['estado'] ?? '',
        note: data['nota'] ?? '',
      );
    }).toList();
  }

  // Actualizar libro
  Future<void> updateBook(Book book) async {
    await librosCollection.doc(book.id).update(book.toMap());
  }

  // Eliminar libro - MÉTODO IMPORTANTE PARA EL EJERCICIO
  Future<void> deleteBook(String id) async {
    try {
      await librosCollection.doc(id).delete();
      print('✅ Libro eliminado de Firestore: $id');
    } catch (e) {
      print('❌ Error al eliminar libro: $e');
      rethrow;
    }
  }
}