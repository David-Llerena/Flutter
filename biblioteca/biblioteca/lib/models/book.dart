class Book {
  final String id;
  final String title;
  final String author;
  final String status;
  final String note;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': title,
      'autor': author,
      'estado': status,
      'nota': note,
    };
  }

  // factory Book.fromFirestore(String id, Map<String, dynamic> data) {
  //   return Book(
  //     id: id,
  //     title: data['titulo'] ?? '',
  //     author: data['autor'] ?? '',
  //     status: data['estado'] ?? '',
  //     note: data['nota'] ?? '',
  //   );
  // }

  // factory Book.fromDocument(DocumentSnapshot doc) {
  //   final data = doc.data() as Map<String, dynamic>;
  //   return Book.fromFirestore(doc.id, data);
  // }
}