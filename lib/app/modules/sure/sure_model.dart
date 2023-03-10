class Sure {
  String? consSecc;
  String? consCate;
  String? nombSecc;
  String? drawIcon;
  String? drawPort;

  Sure(
      {this.consSecc,
      this.consCate,
      this.nombSecc,
      this.drawIcon,
      this.drawPort});

  Sure.fromJson(Map<String, dynamic> json) {
    consSecc = json['cons_secc'];
    consCate = json['cons_cate'];
    nombSecc = json['nomb_secc'];
    drawIcon = json['draw_icon'];
    drawPort = json['draw_port'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cons_secc'] = consSecc;
    data['cons_cate'] = consCate;
    data['nomb_secc'] = nombSecc;
    data['draw_icon'] = drawIcon;
    data['draw_port'] = drawPort;
    return data;
  }
}
