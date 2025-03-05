// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_app_flutter/models/documento_model.dart';
import 'api_config.dart';

class DocumentoService {
  final String _baseUrl = ApiConfig.baseUrl;

  // Método para obtener los documentos desde la API
  Future<List<DocumentoModel>> getDocumentos() async {
    try {
      Map<String, String> headers = {
        'user': 'ds',
        'doc': '20',
        'serie': '2',
        'enterprise': '1',
        'station': '1',
        'start': '01/08/2020',
        'end': '01/08/2025',
        'desc': '454',
        'Authorization':
            'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJhZG1pbiIsIm5iZiI6MTczMzg1MDc0MCwiZXhwIjoxNzY0OTU0NzQwLCJpYXQiOjE3MzM4NTA3NDB9.Sv1ZWvpuz7vWswV5Ju_TsSiJtRxCihvCFvajgFEk3j0',
        'filter': 'false',
      };

      final response = await http.get(Uri.parse('$_baseUrl/Documento/buscar'),
          headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Imprime la respuesta para verificar su estructura
        print(jsonResponse);

        // Si la API devuelve un objeto JSON, verificamos dónde está la lista
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          final List<dynamic> data = jsonResponse['data'];
          return data.map((item) => DocumentoModel.fromJson(item)).toList();
        } else {
          throw Exception(
              'Estructura de respuesta inesperada: ${response.body}');
        }
      } else {
        throw Exception(
            'Error al obtener los documentos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
