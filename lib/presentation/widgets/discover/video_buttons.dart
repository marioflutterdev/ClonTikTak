import 'package:animate_do/animate_do.dart';
import 'package:app_tiktak/domain/entities/video_post.dart';
import 'package:app_tiktak/presentation/providers/discover_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../config/helpers/human_formats.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pauseOrPlayProvider = context.watch<DiscoverProvider>();
    return Column(
      children: [
        _ButtonCustom(
          value: video.likes,
          icon: Icons.favorite,
          iconColor: Colors.red,
        ),
        const SizedBox(height: 10),
        _ButtonCustom(
          value: video.views,
          icon: Icons.remove_red_eye_outlined,
        ),
        const SizedBox(height: 10),
        SpinPerfect(
          animate: pauseOrPlayProvider.pauseOrPlay,
          infinite: true,
          duration: const Duration(seconds: 5),
          child: const _ButtonCustom(
            value: 0,
            icon: Icons.play_circle_outline_outlined,
          ),
        ),
      ],
    );
  }
}

class _ButtonCustom extends StatelessWidget {
  final int value;
  final IconData icon;
  final Color? color;

  const _ButtonCustom({
    required this.value,
    required this.icon,
    iconColor,
  }) : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
