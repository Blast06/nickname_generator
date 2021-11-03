import 'package:flutter/material.dart';
import '/ui/widgets/bottom_bar.dart';
import '/ui/widgets/curved_navigation_bar.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('text')),
      body: Container(),
      bottomNavigationBar: CurvedNavigationBar(),
    );
  }
}
