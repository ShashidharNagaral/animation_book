import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animationbook/widgets/custom_raised_button.dart';

class PositionedTrans extends StatefulWidget {
  @override
  _PositionedTransState createState() => _PositionedTransState();
}

class _PositionedTransState extends State<PositionedTrans>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _flag = true;
  RelativeRectTween relativeRectTween = RelativeRectTween(
    begin: RelativeRect.fromLTRB(56, 0, 248, 20),
    end: RelativeRect.fromLTRB(112, 0, 192, 20),
  );
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 100,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              PositionedTransition(
                rect: relativeRectTween.animate(_controller),
                child: Container(
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          onPress: () {
            if (_flag)
              _controller.forward();
            else
              _controller.reverse();
            _flag = !_flag;
          },
          color: Colors.lightGreen,
          text: 'position transition',
        ),
      ],
    );
  }
}
