import 'package:flutter/cupertino.dart';
class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
