class Status {
  String? consRegi;
  String? tipoCupo;
  String? estaSoli;
  String? horaSoli;
  String? fechSoli;
  String? cargEmpl;
  String? nombEmpl;
  String? horaApro;
  String? cantCupo;
  String? anotObse;
  String? mensaje;

  Status(
      {this.consRegi,
      this.tipoCupo,
      this.estaSoli,
      this.horaSoli,
      this.fechSoli,
      this.cargEmpl,
      this.nombEmpl,
      this.horaApro,
      this.cantCupo,
      this.anotObse,
      this.mensaje});

  Status.fromJson(Map<String, dynamic> json) {
    consRegi = json['cons_regi'];
    tipoCupo = json['tipo_cupo'];
    estaSoli = json['esta_soli'];
    horaSoli = json['hora_soli'];
    fechSoli = json['fech_soli'];
    cargEmpl = json['carg_empl'];
    nombEmpl = json['nomb_empl'];
    horaApro = json['hora_apro'];
    cantCupo = json['cant_cupo'];
    anotObse = json['anot_obse'];
    mensaje = json['mensaje'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cons_regi'] = consRegi;
    data['tipo_cupo'] = tipoCupo;
    data['esta_soli'] = estaSoli;
    data['hora_soli'] = horaSoli;
    data['fech_soli'] = fechSoli;
    data['carg_empl'] = cargEmpl;
    data['nomb_empl'] = nombEmpl;
    data['hora_apro'] = horaApro;
    data['cant_cupo'] = cantCupo;
    data['anot_obse'] = anotObse;
    data['mensaje'] = mensaje;
    return data;
  }
}
