import 'package:flutter/material.dart';
import '/ui/widgets/bottom_bar.dart';
import '/ui/widgets/curved_navigation_bar.dart';

class SingleNickname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit your nickname'),
      ),
      body: Container(),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
