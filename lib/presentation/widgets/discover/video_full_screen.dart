import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/discover_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:app_tiktak/presentation/widgets/discover/video_gradient.dart';

class VideoFullScreen extends StatefulWidget {
  final String videoUrl;
  final String caption;

  const VideoFullScreen({
    Key? key,
    required this.videoUrl,
    required this.caption,
  }) : super(key: key);

  @override
  State<VideoFullScreen> createState() => _VideoFullScreenState();
}

class _VideoFullScreenState extends State<VideoFullScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pauseOrPlayProvider = context.watch<DiscoverProvider>();
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
              child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
          ));
        }
        return AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: GestureDetector(
            onTap: () {
              if (controller.value.isPlaying) {
                pauseOrPlayProvider.pauseOrPlay = false;
                controller.pause();
              } else {
                pauseOrPlayProvider.pauseOrPlay = true;
                controller.play();
              }
              controller.pause();
              setState(() {});
            },
            child: Stack(
              children: [
                VideoPlayer(controller),
                const VideoGradient(),
                Positioned(
                  left: 5,
                  bottom: 10,
                  child: _Caption(widget.caption),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Caption extends StatelessWidget {
  final String caption;

  const _Caption(this.caption);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final captionStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        style: captionStyle,
      ),
    );
  }
}
