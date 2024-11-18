import 'package:flutter/cupertino.dart';

class AlbumTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Shop'),
      ),
      child: Center(
        child: Text('Shop Screen'),
      ),
    );
  }
}
