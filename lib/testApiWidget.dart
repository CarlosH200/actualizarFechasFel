// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mi_app_flutter/models/documento_model.dart';
import 'package:mi_app_flutter/services/documento_service.dart';

void main() {
  runApp(TestApi());
}

class TestApi extends StatelessWidget {
  const TestApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DocumentoDisplayPage(),
    );
  }
}

class DocumentoDisplayPage extends StatefulWidget {
  const DocumentoDisplayPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DocumentoDisplayPageState createState() => _DocumentoDisplayPageState();
}

class _DocumentoDisplayPageState extends State<DocumentoDisplayPage> {
  late Future<List<DocumentoModel>> documentos;

  @override
  void initState() {
    super.initState();
    documentos = DocumentoService().getDocumentos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Documentos'),
      ),
      body: FutureBuilder<List<DocumentoModel>>(
        future: documentos,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            debugPrint('Error al obtener documentos: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay documentos disponibles.'));
          } else {
            final docs = snapshot.data!;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(docs[index].documentoNombre),
                    subtitle: Text(
                        'NIT: ${docs[index].documentoNIT} | Usuario:${docs[index].userName}'),
                    leading: const Icon(Icons.document_scanner),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
