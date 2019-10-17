import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'list.dart';


class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/intro.mp4')
      ..initialize().then((_){
        _controller.setLooping(true);
        _controller.setVolume(0);
        _controller.play();
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
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;
    final double scaleFactor = h/(720/(380/w));
    return Material(
      color: Colors.black,
      child: _controller.value.initialized 
            ? Stack(
              children: <Widget>[
                Transform.scale(
                  scale: scaleFactor,
                  child: VideoPlayer(_controller),
                ),
                SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      Text(
                        'Новости',
                        style: Theme.of(context).textTheme.title,
                      ),
                      Text(
                        'ДОНБАССА',
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                      Spacer(),
                      Ink(
                        child: InkWell(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          onTap: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ListPage()) 
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(25.0)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                              child: Text(
                                'ЧИТАТЬ',
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          )
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                )
              ],
            ) 
            : Container(),
    );
  }
}