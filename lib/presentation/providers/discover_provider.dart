import 'package:app_tiktak/domain/entities/video_post.dart';
import 'package:app_tiktak/infrastructure/models/local_video_model.dart';
import 'package:app_tiktak/shared/data/local_video_post.dart';
import 'package:flutter/material.dart';

class DiscoverProvider extends ChangeNotifier {
  bool _pauseOrPlay = true;
  bool initialLoading = true;
  final List<VideoPost> videos = [];

  bool get pauseOrPlay => _pauseOrPlay;
  set pauseOrPlay(bool v) {
    _pauseOrPlay = v;
    notifyListeners();
  }

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map(
          (e) => LocalVideoModel.fromJson(e).toVideoPostEntity(),
        )
        .toList();

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
