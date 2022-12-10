// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

const String name = "Amogh";

class ChatMessage extends StatelessWidget {

final String text;
ChatMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(
              child: new Text(name[0]),
            ),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              new Text(name, style: Theme.of(context).textTheme.subtitle1,),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              )

            ],
          )
        ],
      ),
    );
  }
}
