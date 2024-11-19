import 'package:flutter/cupertino.dart';

class AlbumTab extends StatelessWidget {
  const AlbumTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Shop'),
      ),
      child: Center(
        child: Text('Shop Screen'),
      ),
    );
  }
}
