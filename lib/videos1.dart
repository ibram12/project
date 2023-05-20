import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Videos1 extends StatefulWidget {
  const Videos1({super.key});

  @override
  State<Videos1> createState() => _Videos1State();
}

class _Videos1State extends State<Videos1> {
  late YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId:
        YoutubePlayer.convertUrlToId('https://youtu.be/j02OZRjf2d8')!,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayer.convertUrlToId('https://youtu.be/j02OZRjf2d8')!,
        flags: YoutubePlayerFlags(autoPlay: false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("videos"),
      ),
      body:  SafeArea(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
