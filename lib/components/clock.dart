import 'package:flutter/material.dart';
import 'package:workout_intervaller/data/sizeConfig.dart';

class CounterClock extends StatefulWidget {
  final double height;
  final String title;
  CounterClock({@required this.height, @required this.title});
  @override
  _CounterClockState createState() => _CounterClockState();
}

class _CounterClockState extends State<CounterClock> {
  void _startCounter() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: () {
              _startCounter();
            },
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize:
                    SizeConfig.textScaleFactor * SizeConfig.screenWidth * 0.07,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: ClockCard(
              height: widget.height,
            )),
            Expanded(
                child: ClockCard(
              height: widget.height,
            )),
            Text(
              ":",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[600]),
            ),
            Expanded(
                child: ClockCard(
              height: widget.height,
            )),
            Expanded(
                child: ClockCard(
              height: widget.height,
            )),
          ],
        ),
      ],
    );
  }
}

class ClockCard extends StatefulWidget {
  final double height;
  ClockCard({@required this.height});
  @override
  _ClockCardState createState() => _ClockCardState();
}

class _ClockCardState extends State<ClockCard> {
  int _length = 0;
  bool _pressing = false;

  void _increaseCounterWhilePressed() async {
    _pressing = true;
    int counter = 1;
    while (_pressing) {
      counter++;
      setState(() {
        _length == 9 ? _length = 0 : _length++;
      });
      await Future.delayed(
          Duration(milliseconds: counter < 5 ? 400 ~/ counter : 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _length == 9 ? _length = 0 : _length++;
          });
        },
        onLongPress: () {
          _increaseCounterWhilePressed();
        },
        onLongPressEnd: (_) {
          _pressing = false;
        },
        child: Container(
          height: widget.height * MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
                style: BorderStyle.solid,
              )),
          child: Center(
              child: Text(
            "$_length",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 70,
                fontWeight: FontWeight.w200,
                fontFamily: 'Digital'),
          )),
        ),
      ),
    );
  }
}
