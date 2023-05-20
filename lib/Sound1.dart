import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:audioplayers/audioplayers.dart';

class sound1 extends StatefulWidget {
  const sound1({super.key});

  @override
  State<sound1> createState() => _sound1State();
}

class _sound1State extends State<sound1> {
  final player = AudioPlayer();
  Duration cur = const Duration();
  Duration mus = const Duration();
  bool isplaying = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // player.setSource(AssetSource('1.mp3'));
    setup();
  }

  setup() async {
    player.onPositionChanged.listen((d) {
      setState(() {
        cur = d;
      });
      player.onDurationChanged.listen((d) {
        setState(() {
          mus = d;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sound'),
      ),
      body: SafeArea(
          child: Center(
        child: Row(
          children: [
            IconButton(
                onPressed: () async {
                  if (isplaying) {
                    setState(() {
                      isplaying = false;
                    });
                    player.pause();
                  } else {
                    setState(() {
                      isplaying = true;
                    });

                    player.play(AssetSource('1.mp3'));
                  }
                },
                icon: isplaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow)),
            SizedBox(
                width: 280,
                child: Slider(
                    value: cur.inSeconds.toDouble(),
                    max: mus.inSeconds.toDouble(),
                    onChanged: (val) {
                      player.seek(Duration(seconds: val.toInt()));
                    })),
          ],
        ),
      )),
    );
  }
}
