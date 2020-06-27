import 'dart:math';

import 'package:flutter/material.dart';

class Animatedwidget extends StatefulWidget {
  @override
  _AnimatedwidgetState createState() => _AnimatedwidgetState();
}

class _AnimatedwidgetState extends State<Animatedwidget>
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
    _animation = Tween<double>(begin: 0, end: pi / 2).animate(_curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            if (_controller.isAnimating)
              _controller.stop();
            else
              _controller.repeat();
          },
          child: AnimatingWidget(
            animation: _animation,
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

///Both the animatedWidget and animatedBuilder do the same work related to the animations.
///AnimatedWidget only takes animation as a parameter whereas AnimatedBuilder takes two arguments "child" and "animation".
///AnimatedWidget is implemented as a class extending AnimatedWidget.
///Changing the animation in AnimatedWidget requires changing the widget that renders the logo or our child.
///So what AnimatedBuilder did is to provided a choice to is to pass both child of your choice and animation explicitly.
class AnimatingWidget extends AnimatedWidget {
  AnimatingWidget({@required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation =
        super.listenable as Animation<double>; //casting to Animating<double>
    return Transform.rotate(
      alignment: AlignmentDirectional.bottomEnd,
      angle: animation.value,
      child: Container(
        height: 80,
        width: 80,
        color: Colors.orange,
      ),
    );
  }
}
