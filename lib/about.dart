import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final Widget child;

  About({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('images/big.jpg'),
          SizedBox(
            height: 10,
          ),
          Text("This is an UNOFFICIAL app of Dr. Willie Ong. "
              + "\nDr. Ong did not commision or pay me to develop this app. "
              + "This is to show my support to Dr.Ong and his advocacy and also to practice my mobile app development skills. "
              + "\nThank you for using this app. You may email your questions/suggestions to sirking1991@gmail.com"),
        ],
      ),
    );
  }
}
