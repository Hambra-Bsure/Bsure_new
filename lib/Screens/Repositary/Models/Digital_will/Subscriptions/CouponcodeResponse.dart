class CouponResponse {
  bool? success;
  int? discountedPriceInPaisa;
  String? discountType;
  int? discountValue;

  CouponResponse(
      {this.success,
        this.discountedPriceInPaisa,
        this.discountType,
        this.discountValue});

  CouponResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    discountedPriceInPaisa = json['discountedPriceInPaisa'];
    discountType = json['discountType'];
    discountValue = json['discountValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['discountedPriceInPaisa'] = this.discountedPriceInPaisa;
    data['discountType'] = this.discountType;
    data['discountValue'] = this.discountValue;
    return data;
  }
}
