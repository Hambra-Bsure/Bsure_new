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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isValid'] = isValid;
    data['message'] = message;
    data['videoUrl'] = videoUrl;
    return data;
  }
}
