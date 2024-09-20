import 'package:flutter/material.dart';
import '../services/book_service.dart';

class BookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<BookListScreen> {
  late Future<List> books;

  @override
  void initState() {
    super.initState();
    books = BookService().getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listado de Libros'),
      ),
      body: FutureBuilder<List>(
        future: books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay libros disponibles.'));
          } else {
            final bookList = snapshot.data!;
            return ListView.builder(
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                final book = bookList[index];
                final title = book['title'] ?? 'Título desconocido';
                final authors = book['author_name']?.join(', ') ?? 'Autor desconocido';
                final coverId = book['cover_id'];
                final coverUrl = coverId != null
                    ? 'https://covers.openlibrary.org/b/id/$coverId-L.jpg'
                    : 'https://via.placeholder.com/150';

                return ListTile(
                  leading: Image.network(
                    coverUrl,
                    width: 50,
                    height: 75,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                  title: Text(title),
                  subtitle: Text(authors),
                );
              },
            );
          }
        },
      ),
    );
  }
}
