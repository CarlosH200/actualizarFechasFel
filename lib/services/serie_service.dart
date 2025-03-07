// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mi_app_flutter/models/series_model.dart';
import 'api_config.dart';

class SeriesService {
  final String _baseUrl = ApiConfig.baseUrl;

  // Método para obtener las series desde la API
  Future<List<Serie>> getSeries() async {
    try {
      Map<String, String> headers = {
        'documento': '3',
        'empresa': '1',
        'estacion': '1',
        'user': 'ds',
        'station': '1',
        'Authorization':
            'bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiJhZG1pbiIsIm5iZiI6MTcyNzgxODA5MywiZXhwIjoxNzU4OTIyMDkzLCJpYXQiOjE3Mjc4MTgwOTN9.1M7ieUsknqrdXdYnsf_iRTOeIVTrZl0Du4Koeexjo-Y',
      };

      final response =
          await http.get(Uri.parse('$_baseUrl/serie'), headers: headers);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        // Imprime la respuesta para verificar su estructura
        print(jsonResponse);

        // Verifica si la respuesta contiene el campo 'data' y es una lista
        if (jsonResponse.containsKey('data') && jsonResponse['data'] is List) {
          final List<dynamic> data = jsonResponse['data'];
          // Devuelve una lista de objetos Serie
          return data.map((item) => Serie.fromJson(item)).toList();
        } else {
          throw Exception(
              'Estructura de respuesta inesperada: ${response.body}');
        }
      } else {
        throw Exception('Error al obtener las series: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}
