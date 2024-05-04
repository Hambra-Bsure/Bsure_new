class Digitalwill_video_request {
  String? video;

  Digitalwill_video_request({this.video});

  Digitalwill_video_request.fromUrl(String url) {
    this.video = video;
  }

  factory Digitalwill_video_request.fromJson(Map<String, dynamic> json) {
    return Digitalwill_video_request(
      video: json['video'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['video'] = video;
    return data;
  }
}