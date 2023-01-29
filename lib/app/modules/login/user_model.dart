class User {
  String? numeIden;
  String? nombEmpl;
  String? apelEmpl;
  String? corrEmpl;
  String? fechIngr;
  String? nombGere;
  String? nombArea;
  String? nombPues;
  String? fechNaci;
  String? jefeInme;

  User(
      {this.numeIden,
      this.nombEmpl,
      this.apelEmpl,
      this.corrEmpl,
      this.fechIngr,
      this.nombGere,
      this.nombArea,
      this.nombPues,
      this.fechNaci,
      this.jefeInme});

  User.fromJson(Map<String, dynamic> json) {
    numeIden = json['nume_iden'];
    nombEmpl = json['nomb_empl'];
    apelEmpl = json['apel_empl'];
    corrEmpl = json['corr_empl'];
    fechIngr = json['fech_ingr'];
    nombGere = json['nomb_gere'];
    nombArea = json['nomb_area'];
    nombPues = json['nomb_pues'];
    fechNaci = json['fech_naci'];
    jefeInme = json['jefe_inme'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nume_iden'] = numeIden;
    data['nomb_empl'] = nombEmpl;
    data['apel_empl'] = apelEmpl;
    data['corr_empl'] = corrEmpl;
    data['fech_ingr'] = fechIngr;
    data['nomb_gere'] = nombGere;
    data['nomb_area'] = nombArea;
    data['nomb_pues'] = nombPues;
    data['fech_naci'] = fechNaci;
    data['jefe_inme'] = jefeInme;
    return data;
  }
}
