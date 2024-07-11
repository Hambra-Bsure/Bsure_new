class DigitalwillPlans {
  bool? success;
  List<Plans>? plans;

  DigitalwillPlans({this.success, this.plans});

  DigitalwillPlans.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['plans'] != null) {
      plans = <Plans>[];
      json['plans'].forEach((v) {
        plans!.add(new Plans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.plans != null) {
      data['plans'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plans {
  int? id;
  String? name;
  String? label;
  int? price;
  int? productId;
  String? period;

  Plans(
      {this.id,
        this.name,
        this.label,
        this.price,
        this.productId,
        this.period});

  Plans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    label = json['label'];
    price = json['price'];
    productId = json['productId'];
    period = json['period'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['label'] = this.label;
    data['price'] = this.price;
    data['productId'] = this.productId;
    data['period'] = this.period;
    return data;
  }
}
