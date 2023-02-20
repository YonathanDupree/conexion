class Coupon {
  String? consCupo;
  String? fechNaci;
  String? numeDias;
  String? jefeInme;
  String? autoEmp1;
  String? autoEmp2;
  String? totaUsad;
  String? cupoCump;
  String? cupoMome;
  String? cupoTram;
  String? cupoCita;
  String? cupoIngr;
  String? cupoSali;
  String? urlCump;
  String? urlMome;
  String? urlTram;
  String? urlCita;
  String? urlIngr;
  String? urlSali;
  String? mensaje;

  Coupon(
      {this.consCupo,
      this.fechNaci,
      this.numeDias,
      this.jefeInme,
      this.autoEmp1,
      this.autoEmp2,
      this.totaUsad,
      this.cupoCump,
      this.cupoMome,
      this.cupoTram,
      this.cupoCita,
      this.cupoIngr,
      this.cupoSali,
      this.urlCump,
      this.urlMome,
      this.urlTram,
      this.urlCita,
      this.urlIngr,
      this.urlSali,
      this.mensaje});

  Coupon.fromJson(Map<String, dynamic> json) {
    consCupo = json['cons_cupo'];
    fechNaci = json['fech_naci'];
    numeDias = json['nume_dias'];
    jefeInme = json['jefe_inme'];
    autoEmp1 = json['auto_emp1'];
    autoEmp2 = json['auto_emp2'];
    totaUsad = json['tota_usad'];
    cupoCump = json['cupo_cump'];
    cupoMome = json['cupo_mome'];
    cupoTram = json['cupo_tram'];
    cupoCita = json['cupo_cita'];
    cupoIngr = json['cupo_ingr'];
    cupoSali = json['cupo_sali'];
    urlCump = json['url_cump'];
    urlMome = json['url_mome'];
    urlTram = json['url_tram'];
    urlCita = json['url_cita'];
    urlIngr = json['url_ingr'];
    urlSali = json['url_sali'];
    mensaje = json['mensaje'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cons_cupo'] = consCupo;
    data['fech_naci'] = fechNaci;
    data['nume_dias'] = numeDias;
    data['jefe_inme'] = jefeInme;
    data['auto_emp1'] = autoEmp1;
    data['auto_emp2'] = autoEmp2;
    data['tota_usad'] = totaUsad;
    data['cupo_cump'] = cupoCump;
    data['cupo_mome'] = cupoMome;
    data['cupo_tram'] = cupoTram;
    data['cupo_cita'] = cupoCita;
    data['cupo_ingr'] = cupoIngr;
    data['cupo_sali'] = cupoSali;
    data['url_cump'] = urlCump;
    data['url_mome'] = urlMome;
    data['url_tram'] = urlTram;
    data['url_cita'] = urlCita;
    data['url_ingr'] = urlIngr;
    data['url_sali'] = urlSali;
    data['mensaje'] = mensaje;
    return data;
  }
}
