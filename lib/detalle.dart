import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SecondScreen extends StatefulWidget {
  DateTime? dateUpdated; // Variable global almacena la fecha seleccionada
  DateTime firstDate = DateTime(2025, 1, 20); // variable con fecha por defecto

  @override
  // ignore: library_private_types_in_public_api
  _SecondScreenState createState() => _SecondScreenState();
}

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
                    const Text(
                      'Id Doc Ref: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '3500002140001',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                  thickness: 1,
                  height: 20,
                ),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ), // Agrega el estilo si lo necesitas
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => _selectDate(context),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                  thickness: 1,
                  height: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Empresa: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(1) DEMOSOFT, S.A.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                  thickness: 1,
                  height: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Estacion: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '(1) CENTRAL',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                  thickness: 1,
                  height: 20,
                ),
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
                        const Text(
                          'Tipo Documento:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(3) Factura',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Serie Documento:',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '(1) FACT_DS',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFCFCFCF),
              thickness: 1,
              height: 15,
            ),
            Text(
              'Datos FEL.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                            'FE_Fecha: 12/02/2025 06:30 pm',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'FE_Numero: 3438363706',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'FE_Serie: E75E1155',
                            style: TextStyle(fontSize: 14),
                          ),
                          Text(
                            'FE_CAE: E75E1155-CCF1-443A-98BC-6BC3FB4D72A8',
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Color(0xFFCFCFCF),
              thickness: 1,
              height: 20,
            ),
            const SizedBox(height: 0),
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Nit: C/F',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Nombre: Consumidor Final',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Direccion: Ciudad',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Color(0xFFCFCFCF),
              thickness: 1,
              height: 20,
            ),
            const SizedBox(height: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Vendedor: ',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'VENDEDOR PRUEBA',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                  thickness: 1,
                  height: 15,
                ),
                Text(
                  'Productos:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Monto: 100.00',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Diferencia: 0.00',
                                style: TextStyle(fontSize: 16),
                              ),
                              Text(
                                'Pago Total: 100.00',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                  thickness: 1,
                  height: 15,
                ),
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
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '100.00',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '(+) Cargo:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '0.00',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              '(-) Descuento:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '0.00',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color(0xFFCFCFCF),
                          thickness: 1,
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Total:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '100.00',
                              style: TextStyle(fontSize: 16),
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
