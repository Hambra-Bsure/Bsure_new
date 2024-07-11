class CreateOrderSubscription {
  bool? success;
  Options? options;

  CreateOrderSubscription({this.success, this.options});

  CreateOrderSubscription.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    options =
    json['options'] != null ? new Options.fromJson(json['options']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.options != null) {
      data['options'] = this.options!.toJson();
    }
    return data;
  }
}

class Options {
  String? key;
  String? name;
  String? orderId;
  Prefill? prefill;
  Theme? theme;

  Options({this.key, this.name, this.orderId, this.prefill, this.theme});

  Options.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    name = json['name'];
    orderId = json['order_id'];
    prefill =
    json['prefill'] != null ? new Prefill.fromJson(json['prefill']) : null;
    theme = json['theme'] != null ? new Theme.fromJson(json['theme']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['name'] = this.name;
    data['order_id'] = this.orderId;
    if (this.prefill != null) {
      data['prefill'] = this.prefill!.toJson();
    }
    if (this.theme != null) {
      data['theme'] = this.theme!.toJson();
    }
    return data;
  }
}

class Prefill {
  String? contact;
  String? email;

  Prefill({this.contact, this.email});

  Prefill.fromJson(Map<String, dynamic> json) {
    contact = json['contact'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['email'] = this.email;
    return data;
  }
}

class Theme {
  String? color;

  Theme({this.color});

  Theme.fromJson(Map<String, dynamic> json) {
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    return data;
  }
}
