class DocumentoModel {
  final String user;
  final int consecutivoInterno;
  final String documentoNombre;
  final String documentoNIT;
  final String documentoDireccion;
  final String documentoDireccion2;
  final String idDocumento;
  final DateTime fechaDocumento;
  final DateTime fechaHora;
  final String userName;
  final bool? bloqueado;
  final int impresionDoc;
  final String desTipoDocumento;
  final String desSerieDocumento;
  final String desEstadoDocumento;
  final String? refIdDocumento;
  final String? refSerie;
  final String? bodegaOrigen;
  final String? bodegaDestino;
  final String? idDocAlt;
  final double tTraM;
  final String fECae;
  final double? gpSLatitud;
  final double? gpSLongitud;
  final String fENumero;
  final String fENumeroDocumento;
  final String fEFechaCertificacion;
  final String feLUUIDAnulacion;
  final int traConsecutivoInterno;
  final int transaccion;
  final int empresa;
  final int localizacio;
  final int estacionTrabajo;
  final int fechaReg;
  final String fDesProducto;
  final String fIdProductoUM;
  final double traCantidad;
  final double traMonto;
  final String? carAboConsecutivoInterno;
  final String? cargoAbono;
  final String? empresa2;
  final String? localizacion;
  final String? estacionTrabajo2;
  final String? fechaReg2;
  final String? fDesTipoCargoAbono;
  final String? carAboMonto;

  DocumentoModel({
    required this.user,
    required this.consecutivoInterno,
    required this.documentoNombre,
    required this.documentoNIT,
    required this.documentoDireccion,
    required this.documentoDireccion2,
    required this.idDocumento,
    required this.fechaDocumento,
    required this.fechaHora,
    required this.userName,
    required this.bloqueado,
    required this.impresionDoc,
    required this.desTipoDocumento,
    required this.desSerieDocumento,
    required this.desEstadoDocumento,
    this.refIdDocumento,
    this.refSerie,
    this.bodegaOrigen,
    this.bodegaDestino,
    this.idDocAlt,
    required this.tTraM,
    required this.fECae,
    this.gpSLatitud,
    this.gpSLongitud,
    required this.fENumero,
    required this.fENumeroDocumento,
    required this.fEFechaCertificacion,
    required this.feLUUIDAnulacion,
    required this.traConsecutivoInterno,
    required this.transaccion,
    required this.empresa,
    required this.localizacio,
    required this.estacionTrabajo,
    required this.fechaReg,
    required this.fDesProducto,
    required this.fIdProductoUM,
    required this.traCantidad,
    required this.traMonto,
    this.carAboConsecutivoInterno,
    this.cargoAbono,
    this.empresa2,
    this.localizacion,
    this.estacionTrabajo2,
    this.fechaReg2,
    this.fDesTipoCargoAbono,
    this.carAboMonto,
  });

  factory DocumentoModel.fromJson(Map<String, dynamic> json) {
    return DocumentoModel(
      user: json['user'],
      consecutivoInterno: json['consecutivo_Interno'],
      documentoNombre: json['documento_Nombre'],
      documentoNIT: json['documento_NIT'],
      documentoDireccion: json['documento_Direccion'],
      documentoDireccion2: json['documento_Direccion2'],
      idDocumento: json['id_Documento'],
      fechaDocumento: DateTime.parse(json['fecha_Documento']),
      fechaHora: DateTime.parse(json['fecha_Hora']),
      userName: json['userName'],
      bloqueado: json['bloqueado'],
      impresionDoc: json['impresion_Doc'],
      desTipoDocumento: json['des_Tipo_Documento'],
      desSerieDocumento: json['des_Serie_Documento'],
      desEstadoDocumento: json['des_Estado_Documento'],
      refIdDocumento: json['ref_Id_Documento'],
      refSerie: json['ref_Serie'],
      bodegaOrigen: json['bodega_Origen'],
      bodegaDestino: json['bodega_Destino'],
      idDocAlt: json['id_Doc_Alt'],
      tTraM: json['t_Tra_M'],
      fECae: json['fE_CAE'],
      gpSLatitud: json['gpS_Latitud'],
      gpSLongitud: json['gpS_Longitud'],
      fENumero: json['fE_Numero'],
      fENumeroDocumento: json['fE_numeroDocumento'],
      fEFechaCertificacion: json['fE_Fecha_Certificacion'],
      feLUUIDAnulacion: json['feL_UUID_Anulacion'],
      traConsecutivoInterno: json['tra_Consecutivo_Interno'],
      transaccion: json['transaccion'],
      empresa: json['empresa'],
      localizacio: json['localizacio'],
      estacionTrabajo: json['estacion_Trabajo'],
      fechaReg: json['fecha_Reg'],
      fDesProducto: json['fDes_Producto'],
      fIdProductoUM: json['fId_Producto_U_M'],
      traCantidad: json['tra_Cantidad'],
      traMonto: json['tra_Monto'],
      carAboConsecutivoInterno: json['car_Abo_Consecutivo_Interno'],
      cargoAbono: json['cargo_Abono'],
      empresa2: json['empresa2'],
      localizacion: json['localizacion'],
      estacionTrabajo2: json['estacion_Trabajo2'],
      fechaReg2: json['fecha_Reg2'],
      fDesTipoCargoAbono: json['fDes_Tipo_Cargo_Abono'],
      carAboMonto: json['car_Abo_Monto'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'consecutivo_Interno': consecutivoInterno,
      'documento_Nombre': documentoNombre,
      'documento_NIT': documentoNIT,
      'documento_Direccion': documentoDireccion,
      'documento_Direccion2': documentoDireccion2,
      'id_Documento': idDocumento,
      'fecha_Documento': fechaDocumento.toIso8601String(),
      'fecha_Hora': fechaHora.toIso8601String(),
      'userName': userName,
      'bloqueado': bloqueado,
      'impresion_Doc': impresionDoc,
      'des_Tipo_Documento': desTipoDocumento,
      'des_Serie_Documento': desSerieDocumento,
      'des_Estado_Documento': desEstadoDocumento,
      'ref_Id_Documento': refIdDocumento,
      'ref_Serie': refSerie,
      'bodega_Origen': bodegaOrigen,
      'bodega_Destino': bodegaDestino,
      'id_Doc_Alt': idDocAlt,
      't_Tra_M': tTraM,
      'fE_CAE': fECae,
      'gpS_Latitud': gpSLatitud,
      'gpS_Longitud': gpSLongitud,
      'fE_Numero': fENumero,
      'fE_numeroDocumento': fENumeroDocumento,
      'fE_Fecha_Certificacion': fEFechaCertificacion,
      'feL_UUID_Anulacion': feLUUIDAnulacion,
      'tra_Consecutivo_Interno': traConsecutivoInterno,
      'transaccion': transaccion,
      'empresa': empresa,
      'localizacio': localizacio,
      'estacion_Trabajo': estacionTrabajo,
      'fecha_Reg': fechaReg,
      'fDes_Producto': fDesProducto,
      'fId_Producto_U_M': fIdProductoUM,
      'tra_Cantidad': traCantidad,
      'tra_Monto': traMonto,
      'car_Abo_Consecutivo_Interno': carAboConsecutivoInterno,
      'cargo_Abono': cargoAbono,
      'empresa2': empresa2,
      'localizacion': localizacion,
      'estacion_Trabajo2': estacionTrabajo2,
      'fecha_Reg2': fechaReg2,
      'fDes_Tipo_Cargo_Abono': fDesTipoCargoAbono,
      'car_Abo_Monto': carAboMonto,
    };
  }
}
