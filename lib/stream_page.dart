import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class ChannelView extends StatefulWidget {
  @override
  _ChannelViewState createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> {
  PageController controller = PageController();
  List<Widget> _list = <Widget>[
    ChewieDemo(
      title: "Arun",
    ),
    ChewieDemo(
      title: "Arun",
    ),
  ];
  int _curr = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
          children: _list,
          scrollDirection: Axis.vertical,
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              _curr = num;
            });
          }),
    );
  }
}

class ChewieDemo extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform = TargetPlatform.iOS;
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  double _aspectRatio = 16 / 9;

  @override
  void initState() {
    super.initState();

    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://g0.ipcamlive.com/c1d94734-b6f3-4c2d-849c-d2e4746a51ad');
    _videoPlayerController2 = VideoPlayerController.network(
        'https://g0.ipcamlive.com/c1d94734-b6f3-4c2d-849c-d2e4746a51ad');
    await Future.wait([
      _videoPlayerController1.initialize(),
      _videoPlayerController2.initialize()
    ]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      fullScreenByDefault: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
      ],

      // Try playing around with some of these other options:
      autoInitialize: true,
      aspectRatio: _aspectRatio,
      isLive: true,


      allowFullScreen: false,
      allowedScreenSleep: false,

      showControls: false,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 35,
            width: 80,
            child: ElevatedButton.icon(

              icon: Icon(Icons.visibility,size: 20,),
              label: Text("102"),
              onPressed: () => print("it's pressed"),

              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                textStyle: TextStyle(
                  fontSize: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
            ),
          )
        ),
        _chewieController != null &&
                _chewieController.videoPlayerController.value.isInitialized
            ? Chewie(
                controller: _chewieController,
              )
            : Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(height: 20),
                    Text('Loading'),
                  ],
                ),
            ),
      ],
    );
  }
}
