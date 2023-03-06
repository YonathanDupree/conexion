class Reserve {
  String? descModa;
  String? modaCita;
  String? fechCita;
  String? horaCita;
  String? codiSani;

  Reserve(
      {this.descModa,
      this.modaCita,
      this.fechCita,
      this.horaCita,
      this.codiSani});

  Reserve.fromJson(Map<String, dynamic> json) {
    descModa = json['desc_moda'];
    modaCita = json['moda_cita'];
    fechCita = json['fech_cita'];
    horaCita = json['hora_cita'];
    codiSani = json['codi_sani'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['desc_moda'] = descModa;
    data['moda_cita'] = modaCita;
    data['fech_cita'] = fechCita;
    data['hora_cita'] = horaCita;
    data['codi_sani'] = codiSani;
    return data;
  }
}
