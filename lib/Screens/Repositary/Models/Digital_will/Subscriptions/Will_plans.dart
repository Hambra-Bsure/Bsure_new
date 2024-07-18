class DigitalwillPlans {
  bool? success;
  Product? product;

  DigitalwillPlans({this.success, this.product});

  DigitalwillPlans.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    product = json['products'] != null ? Product.fromJson(json['products']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.product != null) {
      data['products'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? label;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<Plan>? plans;

  Product({
    this.id,
    this.name,
    this.description,
    this.label,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.plans,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    label = json['label'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['Plan'] != null) {
      plans = [];
      json['Plan'].forEach((v) {
        plans!.add(Plan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['label'] = this.label;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.plans != null) {
      data['Plan'] = this.plans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plan {
  int? id;
  String? name;
  String? description;
  String? label;
  int? priceInPaisa;
  String? period;
  bool? isActive;
  int? productId;
  String? createdAt;
  String? updatedAt;

  Plan({
    this.id,
    this.name,
    this.description,
    this.label,
    this.priceInPaisa,
    this.period,
    this.isActive,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    label = json['label'];
    priceInPaisa = json['priceInPaisa'];
    period = json['period'];
    isActive = json['isActive'];
    productId = json['productId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['label'] = this.label;
    data['priceInPaisa'] = this.priceInPaisa;
    data['period'] = this.period;
    data['isActive'] = this.isActive;
    data['productId'] = this.productId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
