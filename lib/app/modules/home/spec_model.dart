class Spec {
  String? nombSani;
  String? numeIden;
  String? codiSani;
  String? espeSani;
  String? perfSani;
  String? celuSani;
  String? mailSani;
  String? imagPort;
  String? imagPers;

  Spec(
      {this.nombSani,
      this.numeIden,
      this.codiSani,
      this.espeSani,
      this.perfSani,
      this.celuSani,
      this.mailSani,
      this.imagPort,
      this.imagPers});

  Spec.fromJson(Map<String, dynamic> json) {
    nombSani = json['nomb_sani'];
    numeIden = json['nume_iden'];
    codiSani = json['codi_sani'];
    espeSani = json['espe_sani'];
    perfSani = json['perf_sani'];
    celuSani = json['celu_sani'];
    mailSani = json['mail_sani'];
    imagPort = json['imag_port'];
    imagPers = json['imag_pers'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nomb_sani'] = nombSani;
    data['nume_iden'] = numeIden;
    data['codi_sani'] = codiSani;
    data['espe_sani'] = espeSani;
    data['perf_sani'] = perfSani;
    data['celu_sani'] = celuSani;
    data['mail_sani'] = mailSani;
    data['imag_port'] = imagPort;
    data['imag_pers'] = imagPers;
    return data;
  }
}
