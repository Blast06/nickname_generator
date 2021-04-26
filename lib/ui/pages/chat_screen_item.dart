import 'package:flutter/material.dart';
import 'package:generator/ui/widgets/chat_item.dart';



class ChatItemScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat Item"),
        backgroundColor: Colors.lightGreen,
      ),
      body: new ChatItem(), //calling chat_item.dart
    );
  }
}