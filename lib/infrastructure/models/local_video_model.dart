//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

import 'package:app_tiktak/domain/entities/video_post.dart';

List<LocalVideoModel> videoModelFromJson(String str) =>
    List<LocalVideoModel>.from(
        json.decode(str).map((x) => LocalVideoModel.fromJson(x)));

String videoModelToJson(List<LocalVideoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json["name"] ?? "no-name",
        videoUrl: json["videoUrl"],
        likes: json["likes"],
        views: json["views"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "videoUrl": videoUrl,
        "likes": likes,
        "views": views,
      };

  VideoPost toVideoPostEntity() => VideoPost(
        caption: name,
        videoUlr: videoUrl,
        likes: likes,
        views: views,
      );
}
