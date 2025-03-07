import 'package:flutter/material.dart';
import 'package:mi_app_flutter/detalle.dart';
import 'package:mi_app_flutter/models/series_model.dart';
import 'package:mi_app_flutter/services/documento_service.dart';
import 'package:mi_app_flutter/models/documento_model.dart';
import 'package:mi_app_flutter/services/serie_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  String dropdownValue1 = 'Factura';
  String? dropdownValue2;
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  late Future<List<DocumentoModel>> documentos;
  late Future<List<Serie>> series;

  @override
  void initState() {
    super.initState();
    documentos = DocumentoService().getDocumentos();
    series = SeriesService().getSeries();
  }

  Future<void> _selectDate(BuildContext context, int buttonIndex) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (buttonIndex == 1) {
          selectedDate1 = picked;
        } else {
          selectedDate2 = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(175, 0, 38, 255),
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 189, 189, 189),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.black),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue1,
                    items: <String>[
                      'Factura',
                      'Cotizacion',
                      'Factura Cambiaria'
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue1 = newValue!;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: FutureBuilder<List<Serie>>(
                    future: series,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.data == null ||
                          snapshot.data!.isEmpty) {
                        return const Text('No hay series disponibles');
                      } else {
                        List<Serie> seriesList = snapshot.data!;
                        dropdownValue2 ??= seriesList.first.descripcion;
                        return DropdownButton<String>(
                          isExpanded: true,
                          value: dropdownValue2,
                          items: seriesList.map((serie) {
                            return DropdownMenuItem<String>(
                              value: serie.descripcion,
                              child: Text(serie.descripcion),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue2 = newValue;
                            });
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _selectDate(context, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.date_range_rounded,
                            size: 20, color: Colors.black),
                        const SizedBox(width: 8),
                        Text(
                          selectedDate1 == null
                              ? 'Fecha Inicial'
                              : '${selectedDate1!.day}/${selectedDate1!.month}/${selectedDate1!.year}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _selectDate(context, 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.date_range_rounded,
                            size: 20, color: Colors.black),
                        const SizedBox(width: 8),
                        Text(
                          selectedDate2 == null
                              ? 'Fecha Final'
                              : '${selectedDate2!.day}/${selectedDate2!.month}/${selectedDate2!.year}',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Aquí integramos el FutureBuilder para mostrar los documentos
            Expanded(
              child: FutureBuilder<List<DocumentoModel>>(
                future: documentos,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    debugPrint(
                        'Error al obtener documentos: ${snapshot.error}');
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('No hay documentos disponibles.'));
                  } else {
                    final docs = snapshot.data!;
                    return ListView.builder(
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (context.mounted) {
                              Navigator.pushNamed(context, '/second');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(230, 234, 234, 234),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'ID: ${docs[index].consecutivoInterno}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        const SizedBox(height: 4),
                                        Text('NIT: ${docs[index].documentoNIT}',
                                            style:
                                                const TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            'Fecha: ${docs[index].fechaDocumento}',
                                            style:
                                                const TextStyle(fontSize: 14)),
                                        const SizedBox(height: 6),
                                        Text(
                                          docs[index].desEstadoDocumento,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: docs[index]
                                                          .desEstadoDocumento ==
                                                      'Activo'
                                                  ? Colors.green
                                                  : Colors.red),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('Cliente: ${docs[index].documentoNombre}',
                                    style: const TextStyle(fontSize: 15)),
                                const Divider(
                                    height: 20,
                                    thickness: 1,
                                    color: Color.fromARGB(255, 215, 215, 215)),
                                Text(
                                  'Fecha Certificación: ${docs[index].fEFechaCertificacion}',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
