import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:wee/constants.dart';
import 'package:wee/models/short_video_post_model.dart';
import 'package:wee/ui_helpers/videos_page_ui_helper.dart';
import 'package:wee/widgets/videoInteractionElementsOverlay.dart';

class VideoElement extends StatefulWidget {
  final int index;
  const VideoElement({super.key, required this.index});

  @override
  State<VideoElement> createState() => _VideoElementState();
}

class _VideoElementState extends State<VideoElement> {
  late VideoPlayerController _controller;
  late ShortVideoPost post;
  @override
  void initState() {
    super.initState();
    post = context.read<VideosPageUiHelper>().shortVideoPosts[widget.index];
    _controller = VideoPlayerController.network(context
        .read<VideosPageUiHelper>()
        .shortVideoPosts[widget.index]
        .submission!
        .mediaUrl!)
      ..setLooping(true)
      ..play()
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _controller.value.isInitialized
            ? GestureDetector(
                onTap: () {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                },
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: videoElementOverlayGradient,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),
        VideoInteractionElementsOverlay(post: post,)
      ],
    );
  }
}

