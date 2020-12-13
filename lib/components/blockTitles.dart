import 'package:flutter/material.dart';

class BlockTitle extends StatelessWidget {
  final String title;
  BlockTitle({@required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        this.title,
        style: TextStyle(
          fontSize: 30,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
