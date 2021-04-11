import 'package:flutter/material.dart';
import 'package:generator/ui/widgets/bottom_bar.dart';


class SingleNickname extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
      appBar: AppBar(
        title: Text('Edit your nickname'),
      ),
      body: Container(),
      bottomNavigationBar: Column(
        children: [
          
          BottomBar(),
        ],
      ),
    );
  }
}