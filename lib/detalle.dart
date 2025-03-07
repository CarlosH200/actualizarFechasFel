import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SecondScreen extends StatefulWidget {
  DateTime? dateUpdated; // Variable global almacena la fecha seleccionada
  DateTime firstDate = DateTime(2025, 1, 20); // variable con fecha por defecto

  @override
  // ignore: library_private_types_in_public_api
  _SecondScreenState createState() => _SecondScreenState();
}

// Inicio clases para estilos de la Pantalla.
class TextStyleApp {
  // Estilo para textos
  static const TextStyle textStyleResponse = TextStyle(
    fontSize: 17,
    color: Colors.black,
  );
  static const TextStyle textStyleTitle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
  static const TextStyle textStyleParrafo = TextStyle(
    fontSize: 14.5,
    color: Colors.black,
  );
}

class DividerEspaciador {
  static const Divider Espaciador = Divider(
    color: Color(0xFFCFCFCF),
    thickness: 1,
    height: 20,
  );
}
// Fin clases de estilo para la pantalla

class _SecondScreenState extends State<SecondScreen> {
  // Función para seleccionar una fecha
  Future<void> _selectDate(BuildContext context) async {
    DateTime today = DateTime.now();
    DateTime fourDaysAgo =
        today.subtract(const Duration(days: 4)); // 4 días antes de hoy

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.dateUpdated ??
          today, // Si dateUpdated es null, se inicia con hoy
      firstDate:
          fourDaysAgo, // No se pueden seleccionar fechas más antiguas que 4 días antes
      lastDate: today, // No se pueden seleccionar fechas mayores a hoy
    );

    if (picked != null) {
      setState(() {
        widget.dateUpdated = picked; // Guardar la fecha seleccionada
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('# 2501'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        // Añadido SingleChildScrollView aquí
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text('Id Doc Ref: ',
                        style: TextStyleApp.textStyleTitle),
                    Text(
                      '3500002140001',
                      style: TextStyleApp.textStyleResponse,
                    ),
                  ],
                ),
                DividerEspaciador.Espaciador,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        'Fecha: '
                        '${(widget.dateUpdated ?? widget.firstDate).day}/${(widget.dateUpdated ?? widget.firstDate).month}/${(widget.dateUpdated ?? widget.firstDate).year}',
                        style: TextStyleApp.textStyleTitle),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _selectDate(context),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                DividerEspaciador.Espaciador,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Empresa: ',
                      style: TextStyleApp.textStyleTitle,
                    ),
                    Text(
                      '(1) DEMOSOFT, S.A.',
                      style: TextStyleApp.textStyleResponse,
                    ),
                  ],
                ),
                DividerEspaciador.Espaciador,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Estacion: ',
                      style: TextStyleApp.textStyleTitle,
                    ),
                    Text(
                      '(1) CENTRAL',
                      style: TextStyleApp.textStyleResponse,
                    ),
                  ],
                ),
                DividerEspaciador.Espaciador,
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Tipo Documento:',
                            style: TextStyleApp.textStyleTitle),
                        Text(
                          '(3) FACTURA',
                          style: TextStyleApp.textStyleResponse,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Serie Documento:',
                            style: TextStyleApp.textStyleTitle),
                        Text(
                          '(1) FACT_DS',
                          style: TextStyleApp.textStyleResponse,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            DividerEspaciador.Espaciador,
            Text(
              'Datos FEL.',
              style: TextStyleApp.textStyleTitle,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('FE_Fecha: 12/02/2025 06:30 pm',
                                style: TextStyleApp.textStyleParrafo),
                            Text('FE_Numero: 3438363706',
                                style: TextStyleApp.textStyleParrafo),
                            Text('FE_Serie: E75E1155',
                                style: TextStyleApp.textStyleParrafo),
                            Text('FE_CAE: E75E1155-CCF1-443A-98BC-6BC3FB4D72A8',
                                style: TextStyleApp.textStyleParrafo),
                          ]),
                    ],
                  ),
                ],
              ),
            ),
            DividerEspaciador.Espaciador,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cliente:',
                          style: TextStyleApp.textStyleTitle,
                        ),
                        Text(
                          'Nit: C/F',
                          style: TextStyleApp.textStyleResponse,
                        ),
                        Text(
                          'Nombre: Consumidor Final',
                          style: TextStyleApp.textStyleResponse,
                        ),
                        Text(
                          'Direccion: Ciudad',
                          style: TextStyleApp.textStyleResponse,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            DividerEspaciador.Espaciador,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Vendedor: ',
                      style: TextStyleApp.textStyleTitle,
                    ),
                    Text(
                      'VENDEDOR PRUEBA',
                      style: TextStyleApp.textStyleParrafo,
                    ),
                  ],
                ),
                DividerEspaciador.Espaciador,
                Text(
                  'Productos:',
                  style: TextStyleApp.textStyleTitle,
                ),
                const Divider(
                  thickness: 0,
                  height: 5,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Efectivo (Venta)',
                                style: TextStyleApp.textStyleResponse,
                              ),
                              Text(
                                'Monto: 100.00',
                                style: TextStyleApp.textStyleResponse,
                              ),
                              Text(
                                'Diferencia: 0.00',
                                style: TextStyleApp.textStyleResponse,
                              ),
                              Text(
                                'Pago Total: 100.00',
                                style: TextStyleApp.textStyleResponse,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DividerEspaciador.Espaciador,
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 196, 196, 196),
                          width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Sub-Total:',
                              style: TextStyleApp.textStyleResponse,
                            ),
                            Text(
                              '100.00',
                              style: TextStyleApp.textStyleResponse,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '(+) Cargo:',
                              style: TextStyleApp.textStyleResponse,
                            ),
                            Text(
                              '0.00',
                              style: TextStyleApp.textStyleResponse,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '(-) Descuento:',
                              style: TextStyleApp.textStyleResponse,
                            ),
                            Text(
                              '0.00',
                              style: TextStyleApp.textStyleResponse,
                            ),
                          ],
                        ),
                        DividerEspaciador.Espaciador,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total:',
                              style: TextStyleApp.textStyleResponse,
                            ),
                            Text(
                              '100.00',
                              style: TextStyleApp.textStyleResponse,
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
