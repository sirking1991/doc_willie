import 'package:flutter/material.dart';

class GradientBackground extends StatefulWidget {
  final Widget child;

  GradientBackground({Key key, this.child}) : super(key: key);

  _GradientBackgroundState createState() => _GradientBackgroundState();
}

class _GradientBackgroundState extends State<GradientBackground> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          duration: Duration(seconds: 1),
          decoration: BoxDecoration(
              gradient: new LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [Colors.blue[900], Colors.blue[700]],
                stops: [0.0, 1.0],
              ),
              color: Colors.lightGreen
          ),
        );
  }
}
