class Digitalwillvideo_response {
  bool? isValid;
  String? message;
  String? videoUrl;

  Digitalwillvideo_response({this.isValid, this.message, this.videoUrl});

  Digitalwillvideo_response.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'];
    message = json['message'];
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isValid'] = this.isValid;
    data['message'] = this.message;
    data['videoUrl'] = this.videoUrl;
    return data;
  }
}
