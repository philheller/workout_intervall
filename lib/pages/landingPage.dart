import 'package:flutter/material.dart';
import 'package:workout_intervaller/components/clock.dart';
import 'package:workout_intervaller/components/customAppBar.dart';
import 'package:workout_intervaller/data/sizeConfig.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool workout_not_pause = true;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 450),
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying
          ? _animationController.forward()
          : _animationController.reverse();
      _startCounters();
    });
  }

  void _startCounters() {
    // workout_not_pause ?
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(180, 180, 180, 1),
              Color.fromRGBO(250, 250, 250, 1)
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            CustomAppBar(
              title: "Work harder!",
              secondaryMsg: "Interval workout",
              height: SizeConfig.screenHeight * 0.25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.04),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                    child: CounterClock(
                      title: "Interval Time",
                      height: 0.12,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07),
                    child: CounterClock(
                      title: "Pause",
                      height: 0.12,
                    ),
                  ),
                  IconButton(
                    iconSize: SizeConfig.textScaleFactor *
                        SizeConfig.screenHeight *
                        0.1,
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: _animationController,
                      color: Color.fromRGBO(150, 23, 20, 1),
                    ),
                    onPressed: () {
                      _handleOnPressed();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
