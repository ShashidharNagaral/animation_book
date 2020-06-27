import 'package:flutter/material.dart';

class HeaderTile extends StatelessWidget {
  const HeaderTile({@required this.header});

  final String header;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Center(
          child: Text(
            header,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black26),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
