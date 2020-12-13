import 'package:flutter/material.dart';

class CounterClock extends StatefulWidget {
  @override
  _CounterClockState createState() => _CounterClockState();
}

class _CounterClockState extends State<CounterClock> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: ClockCard()),
        Expanded(child: ClockCard()),
        Text(
          ":",
          style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.w300,
              color: Colors.grey[500]),
        ),
        Expanded(child: ClockCard()),
        Expanded(child: ClockCard()),
      ],
    );
  }
}

class ClockCard extends StatefulWidget {
  // final double cardPaddingY;
  // final double cardPaddingX;
  // ClockCard({@required this.cardPaddingX, @required this.cardPaddingY});
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
          height: 100,
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
                color: Colors.grey[500],
                fontSize: 70,
                fontWeight: FontWeight.w200,
                fontFamily: 'Digital'),
          )),
        ),
      ),
    );
  }
}
