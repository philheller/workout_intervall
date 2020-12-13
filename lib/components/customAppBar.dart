import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String secondaryMsg;
  final double height;
  CustomAppBar(
      {@required this.title, @required this.height, this.secondaryMsg});

  List<Widget> _createWidgetList(title, msg) {
    List<Widget> customList = [];
    customList.add(Text(
      this.title,
      style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
    ));
    if (secondaryMsg != null) {
      customList.add(
        Text(
          this.secondaryMsg,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              letterSpacing: 3,
              color: Colors.white),
        ),
      );
    }
    return customList;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList =
        _createWidgetList(this.title, this.secondaryMsg);
    return ClipPath(
      clipper: LinePath(),
      child: Container(
        height: MediaQuery.of(context).size.height * this.height,
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            gradient: RadialGradient(
                center: Alignment.bottomLeft,
                radius: 1.95,
                stops: [
              0.25,
              0.7,
              1
            ],
                colors: <Color>[
              Color.fromRGBO(50, 30, 150, 1),
              Color.fromRGBO(100, 17, 15, 1),
              Color.fromRGBO(200, 0, 0, 1)
            ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widgetList,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LinePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        0, size.height * 7 / 8, size.width * 1 / 4, size.height * 7 / 8);
    path.quadraticBezierTo(size.width * 3 / 8, size.height * 87 / 100,
        size.width * 1 / 2, size.height * 7 / 8);
    path.quadraticBezierTo(size.width * 5 / 8, size.height * 87 / 100,
        size.width * 3 / 4, 7 / 8 * size.height);
    path.quadraticBezierTo(
        size.width, size.height * 7 / 8, size.width, size.height * 6 / 8);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
