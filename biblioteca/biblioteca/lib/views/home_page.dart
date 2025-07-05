import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DatabaseHelper _databaseHelper = DatabaseHelper();
  
  List<QueryDocumentSnapshot> _books = [];
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadBooks();
  }

  // Cargar libros manualmente (solo cuando se llame)
  Future<void> _loadBooks() async {
    try {
      setState(() {
        _isLoading = true;
        _error = null;
      });

      print('🔍 Cargando libros desde Firestore...');
      
      var snapshot = await _firestore.collection('libro').get();
      
      setState(() {
        _books = snapshot.docs;
        _isLoading = false;
      });
      
      print('📚 Libros cargados: ${_books.length}');
      
      for (var doc in _books) {
        print('📖 Documento: ${doc.id} - ${doc.data()}');
      }
      
    } catch (e) {
      print('❌ Error al cargar libros: $e');
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  // Refrescar la lista manualmente
  void _refreshList() async {
    print('🔄 Refrescando lista de libros...');
    await _loadBooks();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Lista actualizada'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  // Eliminar libro
  void _deleteBook(String bookId, String bookTitle) async {
    bool? shouldDelete = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmar eliminación'),
        content: Text('¿Estás seguro de que deseas eliminar "$bookTitle"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (shouldDelete == true) {
      try {
        await _databaseHelper.deleteBook(bookId);
        print('✅ Libro eliminado: $bookTitle');
        
        // Después de eliminar, recargar la lista manualmente
        await _loadBooks();
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Libro "$bookTitle" eliminado')),
        );
      } catch (e) {
        print('❌ Error al eliminar libro: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al eliminar: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi biblioteca'),
        actions: [
          // Solo el botón de refresh
          IconButton(
            onPressed: _refreshList,
            icon: const Icon(Icons.refresh),
            tooltip: 'Refrescar lista',
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Navigator.pushNamed(context, '/add');
          // Si se agregó un libro, recargar la lista
          if (result == true) {
            _loadBooks();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Cargando libros...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Error: $_error'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _refreshList,
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );
    }

    if (_books.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.library_books, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('No hay libros registrados'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                var result = await Navigator.pushNamed(context, '/add');
                if (result == true) {
                  _loadBooks();
                }
              },
              child: const Text('Agregar primer libro'),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _books.length,
      itemBuilder: (context, index) {
        final doc = _books[index];
        final data = doc.data() as Map<String, dynamic>;
        final bookTitle = data['titulo'] ?? 'Sin título';
        
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              bookTitle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Autor: ${data['autor'] ?? 'Sin autor'}'),
                Text('Nota: ${data['nota'] ?? 'Sin nota'}'),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Chip(
                  label: Text(data['estado'] ?? 'Sin estado'),
                  backgroundColor: data['estado'] == 'Leído' 
                      ? Colors.green.shade100 
                      : Colors.orange.shade100,
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: () => _deleteBook(doc.id, bookTitle),
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  tooltip: 'Eliminar libro',
                ),
              ],
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(bookTitle),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ID: ${doc.id}'),
                      const SizedBox(height: 8),
                      Text('Autor: ${data['autor'] ?? 'Sin autor'}'),
                      Text('Estado: ${data['estado'] ?? 'Sin estado'}'),
                      Text('Nota: ${data['nota'] ?? 'Sin nota'}'),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cerrar'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _deleteBook(doc.id, bookTitle);
                      },
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      child: const Text('Eliminar'),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}