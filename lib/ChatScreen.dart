// ignore_for_file: unnecessary_new, unused_field

import 'package:chatting_app/chatMessage.dart';
import 'package:chatting_app/chatMessage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];

  void handleSubmit(String text) {
    textController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget textComposerWidget() {
    return IconTheme(
      data: new IconThemeData(color: Colors.green),
      child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.only(top: 4.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                child: new TextField(
                  decoration:
                      new InputDecoration.collapsed(hintText: "Send a message"),
                  controller: textController,
                  onSubmitted: handleSubmit,
                ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(
                    onPressed: () => handleSubmit(textController.text),
                    icon: new Icon(Icons.send)),
              )
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Flexible(
          child: new ListView.builder(
            padding: const EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(
          height: 1.0,
        ),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: textComposerWidget(),
        )
      ],
    );
  }
}
