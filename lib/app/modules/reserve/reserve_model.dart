class Reserve {
  String? modaCita;
  String? fechCita;
  String? horaCita;
  String? codiSani;

  Reserve({this.modaCita, this.fechCita, this.horaCita, this.codiSani});

  Reserve.fromJson(Map<String, dynamic> json) {
    modaCita = json['moda_cita'];
    fechCita = json['fech_cita'];
    horaCita = json['hora_cita'];
    codiSani = json['codi_sani'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['moda_cita'] = modaCita;
    data['fech_cita'] = fechCita;
    data['hora_cita'] = horaCita;
    data['codi_sani'] = codiSani;
    return data;
  }
}
