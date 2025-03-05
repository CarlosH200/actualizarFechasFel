// import 'package:flutter/material.dart';
// import 'package:mi_app_flutter/detalle.dart';
// import 'package:mi_app_flutter/testApiWidget.dart'; // Asegúrate de que este archivo existe

// void main() => runApp(TestApi());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "MyApp",
//       initialRoute: '/', // Definir la ruta inicial correctamente
//       routes: {
//         '/': (context) =>
//             Inicio(), // Corregido: La pantalla principal es Inicio
//         '/second': (context) =>
//             SecondScreen(), // Asegúrate de que esta clase existe en detalle.dart
//       },
//     );
//   }
// }

// class Inicio extends StatefulWidget {
//   const Inicio({super.key});

//   @override
//   State<Inicio> createState() => _InicioState();
// }

// class _InicioState extends State<Inicio> {
//   String dropdownValue1 = 'Factura';
//   String dropdownValue2 = 'Serie A';
//   DateTime? selectedDate1;
//   DateTime? selectedDate2;

//   // Función para seleccionar una fecha
//   Future<void> _selectDate(BuildContext context, int buttonIndex) async {
//     DateTime initialDate = DateTime.now();
//     DateTime firstDate = DateTime(2000);
//     DateTime lastDate = DateTime(2101);

//     if (buttonIndex == 1 && selectedDate1 != null) {
//       initialDate = selectedDate1!;
//     } else if (buttonIndex == 2 && selectedDate2 != null) {
//       initialDate = selectedDate2!;
//     }

//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: lastDate,
//     );

//     if (picked != null && picked != initialDate) {
//       setState(() {
//         if (buttonIndex == 1) {
//           selectedDate1 = picked;
//         } else {
//           selectedDate2 = picked;
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: const Color.fromARGB(175, 0, 38, 255),
//           title: Text('')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       focusedBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Color.fromARGB(255, 189, 189, 189),
//                           width: 1,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.search, color: Colors.black),
//                   onPressed: () {},
//                 )
//               ],
//             ),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Expanded(
//                   child: DropdownButton<String>(
//                     isExpanded: true,
//                     value: dropdownValue1,
//                     items: <String>[
//                       'Factura',
//                       'Cotizacion',
//                       'Factura Cambiaria'
//                     ].map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         dropdownValue1 = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: DropdownButton<String>(
//                     isExpanded: true,
//                     value: dropdownValue2,
//                     items: <String>['Serie A', 'Serie B', 'Serie C']
//                         .map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         dropdownValue2 = newValue!;
//                       });
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () => _selectDate(context, 1),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.date_range_rounded,
//                             size: 20, color: Colors.black),
//                         SizedBox(width: 8),
//                         Text(
//                           selectedDate1 == null
//                               ? 'Fecha Inicial'
//                               : '${selectedDate1!.day}/${selectedDate1!.month}/${selectedDate1!.year}',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () => _selectDate(context, 2),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.date_range_rounded,
//                             size: 20, color: Colors.black),
//                         SizedBox(width: 8),
//                         Text(
//                           selectedDate2 == null
//                               ? 'Fecha Final'
//                               : '${selectedDate2!.day}/${selectedDate2!.month}/${selectedDate2!.year}',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 25),
//             GestureDetector(
//                 onTap: () {
//                   if (context.mounted) {
//                     // Evita errores al navegar si el Widget ha sido eliminado
//                     Navigator.pushNamed(context, '/second');
//                   }
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(230, 234, 234, 234),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text('ID: 001',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14)),
//                               SizedBox(height: 4),
//                               Text('NIT: 123456789',
//                                   style: TextStyle(fontSize: 14)),
//                             ],
//                           ),
//                           Spacer(), // Empuja la columna de la derecha al final
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text('Fecha: 10/02/2025',
//                                   style: TextStyle(fontSize: 14)),
//                               SizedBox(height: 6),
//                               Text('ACTIVO',
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: const Color.fromARGB(
//                                           255, 0, 163, 5))),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8), // Espaciado entre secciones
//                       RichText(
//                         text: TextSpan(
//                           children: [
//                             TextSpan(
//                               text: 'Cliente: ', // Solo esta parte en negrita
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: 'DESARROLLO MODENO DE SOFTWARE, S.A.',
//                               style: TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.normal,
//                                   color: Colors.black),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Divider(
//                           height: 20,
//                           thickness: 1,
//                           color: const Color.fromARGB(255, 215, 215, 215)),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'Fecha Certificación: 12/02/2025 06:30 pm',
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                                 fontSize: 15, fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 6),
//                           Wrap(
//                             spacing: 10,
//                             runSpacing: 5,
//                             alignment: WrapAlignment.center,
//                             children: [],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mi_app_flutter/detalle.dart';
import 'package:mi_app_flutter/services/documento_service.dart';
import 'package:mi_app_flutter/models/documento_model.dart';

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
  String dropdownValue2 = 'Serie A';
  DateTime? selectedDate1;
  DateTime? selectedDate2;
  late Future<List<DocumentoModel>> documentos;

  @override
  void initState() {
    super.initState();
    documentos = DocumentoService().getDocumentos();
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
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: dropdownValue2,
                    items: <String>['Serie A', 'Serie B', 'Serie C']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue2 = newValue!;
                      });
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
