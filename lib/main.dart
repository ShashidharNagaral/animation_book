import 'package:animationbook/explicit//position_transition.dart';
import 'package:animationbook/explicit//rotation_transition.dart';
import 'package:animationbook/explicit/animated_widget.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/header_tile.dart';
import 'widgets/custom_raised_button.dart';
import 'dart:math';

void main() => (runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationBook(),
    );
  }
}

class AnimationBook extends StatefulWidget {
  @override
  _AnimationBookState createState() => _AnimationBookState();
}

class _AnimationBookState extends State<AnimationBook> {
  final sinePeriod = pi;

  double _padding = 0;
  double _size = 80;
  double _opacity = 1.0;
  double _endValue = 0;

  // change opacity values for animations
  void animateOpacity() {
    setState(() {
      _opacity = _opacity == 0 ? 1 : 0;
    });
  }

  void animateSize() {
    setState(() {
      _size = _size == 0 ? 80 : 0;
    });
  }

  void animatePadding() {
    setState(() {
      _padding = _padding == 0 ? 10 : 0;
    });
  }

  void animateTranslate() {
    setState(() {
      _endValue = _endValue == 0 ? sinePeriod : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 10.0,
        ),
        children: <Widget>[
          Container(
            child: HeaderTile(
              header: 'Implicit Animation (AnimatedFoo)',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: AnimatedOpacity(
                  opacity: _opacity, // start and end values of opacity
                  duration:
                      Duration(milliseconds: 1500), //duration of animation
                  curve: Curves.easeInOutExpo, //type of animation
                  child: Center(
                    child: Container(
                      height: 80.0,
                      width: 80.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomButton(
                  onPress: () {
                    animateOpacity();
                  },
                  color: Colors.deepPurpleAccent,
                  text: 'animated opacity',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    width: _size,
                    height: _size,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              Expanded(
                child: CustomButton(
                  onPress: () {
                    animateSize();
                  },
                  color: Colors.blue,
                  text: 'animated container',
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Center(
                  child: Container(
                    color: Colors.orange,
                    child: AnimatedPadding(
                      duration: Duration(seconds: 2),
                      child: Text(
                        'padding',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: _padding, vertical: _padding),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CustomButton(
                  onPress: () {
                    animatePadding();
                  },
                  color: Colors.lightGreen,
                  text: 'animated padding',
                ),
              ),
            ],
          ),
          Container(
            child: HeaderTile(
              header: 'Tween Animation Build (custom implicit)',
            ),
          ),

          ///Sine Functions are used in many animation.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                /// When the widget first builds, the animation runs from [Tween.begin] to
                /// [Tween.end], if [Tween.begin] is non-null. A new animation can be
                /// triggered at anytime by providing a new [Tween] with a new [Tween.end]
                /// value. The new animation runs from the current animation value (which may
                /// be [Tween.end] of the old [tween], if that animation completed) to
                /// [Tween.end] of the new [tween]. The [Tween.begin] value is ignored except
                /// for the initial animation that is triggered when the widget builds for the
                /// first time.
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: _endValue),
                  curve: Curves.bounceInOut,
                  duration: Duration(seconds: 3),
                  builder: (context, value, child) {
                    final offset = sin(value) * 50;
                    return Transform.translate(
                      offset: Offset(offset, 0),
                      child: Center(
                        child: Material(
                          child: Container(
                            height: 80.0,
                            width: 80.0,
                            color: Colors.teal,
                          ),
                          elevation: value == 0 || value == sinePeriod ? 0 : 10,
                          shadowColor: Colors.teal,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: CustomButton(
                  onPress: () {
                    animateTranslate();
                  },
                  color: Colors.deepOrangeAccent,
                  text: 'translate',
                ),
              ),
            ],
          ),
          Container(
            child: HeaderTile(
              header: 'Builtin explicit (FooTransition)',
            ),
          ),
          Rotation(),
          SizedBox(
            height: 10,
          ),
          PositionedTrans(),
          HeaderTile(header: 'Custom explicit Animation (refactored)'),
          SizedBox(
            height: 10,
          ),
//          NonRefactoredWidget(),
          Animatedwidget(),
        ],
      ),
    );
  }
}
