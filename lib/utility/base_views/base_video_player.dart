import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:staff_app/backend/api_end_points.dart';
import 'package:staff_app/utility/base_views/base_loader.dart';
import 'package:video_player/video_player.dart';

class BaseVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const BaseVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<BaseVideoPlayer> createState() => _BaseVideoPlayerState();
}

class _BaseVideoPlayerState extends State<BaseVideoPlayer> {

  late VideoPlayerController videoPlayerController = VideoPlayerController.network(widget.videoUrl.contains("http") ? widget.videoUrl : ("${ApiEndPoints().concatBaseUrl}/star-backend/")+widget.videoUrl);
  late ChewieController chewieController;
  bool isVideoInitializing = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await videoPlayerController.initialize();
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
      );
      setState(() {
        isVideoInitializing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: isVideoInitializing
          ? const BaseLoader()
          : Chewie(
            controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
