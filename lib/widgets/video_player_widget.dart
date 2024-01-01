import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {Key? key, required this.videoUrl, required this.onVideoDuration})
      : super(key: key);

  final String videoUrl;
  final Function(int) onVideoDuration;

  @override
  VideoPlayerWidgetState createState() => VideoPlayerWidgetState();
}

class VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController videoPlayerController;
  var videoDuration = 0;

  @override
  void initState() {
    super.initState();
    initializeVideo();
  }

  initializeVideo() async {
    videoPlayerController = VideoPlayerController.asset(widget.videoUrl);
    await videoPlayerController.initialize();
    widget.onVideoDuration(videoPlayerController.value.duration.inSeconds);

    videoPlayerController.play();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  void pauseVideo() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
    }
  }

  void resumeVideo() {
    if (!videoPlayerController.value.isPlaying) {
      videoPlayerController.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(videoPlayerController);
  }
}
