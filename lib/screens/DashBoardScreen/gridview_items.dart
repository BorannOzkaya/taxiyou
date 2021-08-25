// To parse this JSON data, do
//
//     final videoApiDatas = videoApiDatasFromJson(jsonString);

import 'dart:convert';

List<VideoApiDatas> videoApiDatasFromJson(String str) =>
    List<VideoApiDatas>.from(
        json.decode(str).map((x) => VideoApiDatas.fromJson(x)));

String videoApiDatasToJson(List<VideoApiDatas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VideoApiDatas {
  VideoApiDatas({
    required this.image,
    required this.title,
    required this.desc,
    required this.videoButtonText,
    required this.video,
  });

  String image;
  String title;
  String desc;
  String videoButtonText;
  String video;

  factory VideoApiDatas.fromJson(Map<String, dynamic> json) => VideoApiDatas(
        image: json["image"],
        title: json["title"],
        desc: json["desc"],
        videoButtonText: json["video_button_text"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "title": title,
        "desc": desc,
        "video_button_text": videoButtonText,
        "video": video,
      };
}
