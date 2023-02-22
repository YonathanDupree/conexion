class Request {
  String? consRegi;
  String? consCupo;
  String? nombEmpl;
  String? horaSoli;
  String? tipoCupo;
  String? fechSoli;
  String? cupoDisp;
  String? cantCupo;
  String? mensaje;

  Request(
      {this.consRegi,
      this.consCupo,
      this.nombEmpl,
      this.horaSoli,
      this.tipoCupo,
      this.fechSoli,
      this.cupoDisp,
      this.cantCupo,
      this.mensaje});

  Request.fromJson(Map<String, dynamic> json) {
    consRegi = json['cons_regi'];
    consCupo = json['cons_cupo'];
    nombEmpl = json['nomb_empl'];
    horaSoli = json['hora_soli'];
    tipoCupo = json['tipo_cupo'];
    fechSoli = json['fech_soli'];
    cupoDisp = json['cupo_disp'];
    cantCupo = json['cant_cupo'];
    mensaje = json['mensaje'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cons_regi'] = consRegi;
    data['cons_cupo'] = consCupo;
    data['nomb_empl'] = nombEmpl;
    data['hora_soli'] = horaSoli;
    data['tipo_cupo'] = tipoCupo;
    data['fech_soli'] = fechSoli;
    data['cupo_disp'] = cupoDisp;
    data['cant_cupo'] = cantCupo;
    data['mensaje'] = mensaje;
    return data;
  }
}
