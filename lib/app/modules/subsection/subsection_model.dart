class Subsection {
  String? nombSubs;
  String? drawIcon;
  String? urlsSubs;
  String? exteSubs;
  String? ordeSubs;

  Subsection(
      {this.nombSubs,
      this.drawIcon,
      this.urlsSubs,
      this.exteSubs,
      this.ordeSubs});

  Subsection.fromJson(Map<String, dynamic> json) {
    nombSubs = json['nomb_subs'];
    drawIcon = json['draw_icon'];
    urlsSubs = json['urls_subs'];
    exteSubs = json['exte_subs'];
    ordeSubs = json['orde_subs'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nomb_subs'] = nombSubs;
    data['draw_icon'] = drawIcon;
    data['urls_subs'] = urlsSubs;
    data['exte_subs'] = exteSubs;
    data['orde_subs'] = ordeSubs;
    return data;
  }
}
