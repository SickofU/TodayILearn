import 'package:flutter/cupertino.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(
        child: Text('Home Screen 123'),
      ),
    );
  }
}