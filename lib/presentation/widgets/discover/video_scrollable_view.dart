import 'package:app_tiktak/domain/entities/video_post.dart';
import 'package:app_tiktak/presentation/widgets/discover/video_buttons.dart';
import 'package:app_tiktak/presentation/widgets/discover/video_full_screen.dart';
import 'package:flutter/material.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({
    super.key,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPost = videos[index];

        return Stack(
          children: [
            SizedBox.expand(
              child: VideoFullScreen(
                videoUrl: videoPost.videoUlr,
                caption: videoPost.caption,
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: VideoButtons(video: videoPost),
            ),
          ],
        );
      },
    );
  }
}
