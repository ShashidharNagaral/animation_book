import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({@required this.onPress, this.text, this.color});

  final Function onPress;
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20.0,
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      color: color,
    );
  }
}
