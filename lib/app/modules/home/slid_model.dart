class Slid {
  String? numeSlid;
  String? urlsSlid;
  String? urlsAcce;
  String? exteAcce;

  Slid({this.numeSlid, this.urlsSlid, this.urlsAcce, this.exteAcce});

  Slid.fromJson(Map<String, dynamic> json) {
    numeSlid = json['nume_slid'];
    urlsSlid = json['urls_slid'];
    urlsAcce = json['urls_acce'];
    exteAcce = json['exte_acce'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nume_slid'] = numeSlid;
    data['urls_slid'] = urlsSlid;
    data['urls_acce'] = urlsAcce;
    data['exte_acce'] = exteAcce;
    return data;
  }
}
