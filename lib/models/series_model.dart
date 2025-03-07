class SeriesModel {
  final String storeProcedure;
  final List<Serie> data;

  SeriesModel({
    required this.storeProcedure,
    required this.data,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Serie> data = dataList.map((item) => Serie.fromJson(item)).toList();

    return SeriesModel(
      storeProcedure: json['storeProcedure'],
      data: data,
    );
  }
}

class Serie {
  final int tipoDocumento;
  final String serieDocumento;
  final int empresa;
  final int bodega;
  final String descripcion;
  final int serieIni;
  final int serieFin;
  final int estado;
  final String campo01;
  final String campo02;
  final String campo03;
  final String campo04;
  final String campo05;
  final String campo06;
  final String campo07;
  final String campo08;
  final String campo09;
  final String campo10;
  final int documentoDisp;
  final int documentoAviso;
  final dynamic documentoFrecuencia;
  final String fechaHora;
  final dynamic docDet;
  final dynamic limiteImpresion;
  final String userName;
  final String mFechaHora;
  final String mUserName;
  final dynamic orden;
  final int grupo;
  final dynamic opcVenta;
  final bool bloquearImprimir;
  final String desTipoDocumento;

  Serie({
    required this.tipoDocumento,
    required this.serieDocumento,
    required this.empresa,
    required this.bodega,
    required this.descripcion,
    required this.serieIni,
    required this.serieFin,
    required this.estado,
    required this.campo01,
    required this.campo02,
    required this.campo03,
    required this.campo04,
    required this.campo05,
    required this.campo06,
    required this.campo07,
    required this.campo08,
    required this.campo09,
    required this.campo10,
    required this.documentoDisp,
    required this.documentoAviso,
    required this.documentoFrecuencia,
    required this.fechaHora,
    required this.docDet,
    required this.limiteImpresion,
    required this.userName,
    required this.mFechaHora,
    required this.mUserName,
    required this.orden,
    required this.grupo,
    required this.opcVenta,
    required this.bloquearImprimir,
    required this.desTipoDocumento,
  });

  factory Serie.fromJson(Map<String, dynamic> json) {
    return Serie(
      tipoDocumento: json['tipo_Documento'],
      serieDocumento: json['serie_Documento'],
      empresa: json['empresa'],
      bodega: json['bodega'],
      descripcion: json['descripcion'],
      serieIni: json['serie_Ini'],
      serieFin: json['serie_Fin'],
      estado: json['estado'],
      campo01: json['campo01'],
      campo02: json['campo02'],
      campo03: json['campo03'],
      campo04: json['campo04'],
      campo05: json['campo05'],
      campo06: json['campo06'],
      campo07: json['campo07'],
      campo08: json['campo08'],
      campo09: json['campo09'],
      campo10: json['campo10'],
      documentoDisp: json['documento_Disp'],
      documentoAviso: json['documento_Aviso'],
      documentoFrecuencia: json['documento_Frecuencia'],
      fechaHora: json['fecha_Hora'],
      docDet: json['doc_Det'],
      limiteImpresion: json['limite_Impresion'],
      userName: json['userName'],
      mFechaHora: json['m_Fecha_Hora'],
      mUserName: json['m_UserName'],
      orden: json['orden'],
      grupo: json['grupo'],
      opcVenta: json['opc_Venta'],
      bloquearImprimir: json['bloquear_Imprimir'],
      desTipoDocumento: json['des_Tipo_Documento'],
    );
  }
}
