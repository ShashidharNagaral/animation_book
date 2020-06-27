import 'dart:math';

import 'package:flutter/material.dart';

class NonRefactoredWidget extends StatefulWidget {
  @override
  _NonRefactoredWidgetState createState() => _NonRefactoredWidgetState();
}

class _NonRefactoredWidgetState extends State<NonRefactoredWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation, _curvedAnimation;
  double step = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation = Tween<double>(begin: 0, end: pi / 2).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (_controller.isAnimating)
              _controller.stop();
            else
              _controller.repeat();
          },
          child: Transform.rotate(
            alignment: AlignmentDirectional.bottomEnd,
            angle: _animation.value,
            child: Container(
              height: 80,
              width: 80,
              color: Colors.orange,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
