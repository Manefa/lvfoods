import 'package:flutter/material.dart';
import 'package:ivfoods_mobile_app/ui/onbaording/widgets/onbaording_one.dart';
import 'package:ivfoods_mobile_app/ui/onbaording/widgets/onbaording_three.dart';
import 'package:ivfoods_mobile_app/ui/onbaording/widgets/onbaording_two.dart';

class OnbaordingPage extends StatefulWidget {
  @override
  _OnbaordingPageState createState() => _OnbaordingPageState();
}

class _OnbaordingPageState extends State<OnbaordingPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: PageView(
            pageSnapping: true,
            children: <Widget>[
              OnbaordingOne(),
              OnbaordingTwo(),
              OnbaordingThree(),
            ],
          ),
        ),
      ),
    );
  }
}
