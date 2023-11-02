class VideoPost {
  final String caption;
  final String videoUlr;
  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.videoUlr,
    this.likes = 0,
    this.views = 0,
  });
}
