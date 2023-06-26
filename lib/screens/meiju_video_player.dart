import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class MeiJuVideoPalyer extends StatefulWidget {
  const MeiJuVideoPalyer({
    super.key,
    required this.title,
    required this.playUrl,
  });

  final String title;
  final String playUrl;

  @override
  State<MeiJuVideoPalyer> createState() => _MeiJuVideoPalyerState();
}

class _MeiJuVideoPalyerState extends State<MeiJuVideoPalyer> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  int? bufferDelay;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.pause();
    _chewieController?.dispose();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.playUrl);
    await Future.wait(
      [
        _videoPlayerController.initialize(),
      ],
    );
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: false,
      deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
      //   additionalOptions: (context) {
      //     return <OptionItem>[
      //       OptionItem(
      //         onTap: toggleVideo,
      //         iconData: Icons.live_tv_sharp,
      //         title: 'Toggle Video Src',
      //       ),
      //     ];
      //   },
      showControls: true,
      allowFullScreen: true,
      autoInitialize: true,
    );
  }

  Future<void> toggleVideo() async {
    await _videoPlayerController.pause();
    await initializePlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: GestureDetector(
              onDoubleTap: () {
                _chewieController?.enterFullScreen();
              },
              onTap: () {
                if (_videoPlayerController.value.isPlaying) {
                  setState(() {
                    _chewieController?.pause();
                  });
                } else {
                  setState(() {
                    _chewieController?.play();
                  });
                }
              },
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(controller: _chewieController!)
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text("Loading"),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
