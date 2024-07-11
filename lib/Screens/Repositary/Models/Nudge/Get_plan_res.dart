class PlanDetailsResponseBean {
  List<Plans>? plans;

  PlanDetailsResponseBean({this.plans});

  PlanDetailsResponseBean.fromJson(Map<String, dynamic> json) {
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? label;
  int? price;
  String? period;

  Plans({this.id, this.label, this.price, this.period});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    label = json['label'];
    price = json['price'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['label'] = this.label;
    data['price'] = this.price;
    data['period'] = this.period;
    return data;
  }
}