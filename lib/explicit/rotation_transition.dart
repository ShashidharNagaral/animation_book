import 'dart:math';
import 'package:animationbook/widgets/custom_raised_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rotation extends StatefulWidget {
  @override
  _RotationState createState() => _RotationState();
}

class _RotationState extends State<Rotation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _controller.addListener(() {
      print(_controller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Expanded(
          child: Center(
            child: RotationTransition(
              turns: _controller,

              /// by default 0-1 is one complete rotation in RotationTransition So, no need of tween
              alignment: Alignment.bottomRight,
              child: Container(
                width: 80,
                height: 80,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            onPress: () {
              if (_controller.isAnimating)
                _controller.stop();
              else
                _controller.repeat();
            },
            color: Colors.cyan,
            text: 'rotation transition',
          ),
        )
      ],
    );
  }
}
