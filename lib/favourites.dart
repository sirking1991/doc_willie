import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  final Widget child;

  Favourites({Key key, this.child}) : super(key: key);

  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}