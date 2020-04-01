import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:share_txt/model/message.dart';
import 'package:share_txt/providers/auth_provider.dart';
import 'package:share_txt/providers/message_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    MessageProvider messageProvider = Provider.of<MessageProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
              "Hello, ${authProvider.user.email.substring(0, authProvider.user.email.indexOf("@"))}"
                  .toUpperCase())),
      body: StreamProvider<List<Message>>.value(
          value: messageProvider.streamMessage,
          child: Column(
            children: <Widget>[
              Expanded(child: MessageList()),
              MessageTextField()
            ],
          )),
    );
  }
}

class MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var messages = Provider.of<List<Message>>(context);
    if (messages == null) {
      return NoMessageFound();
    }
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) =>
          MessageTile(messages[index]),
      itemCount: messages.length,
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 8),
    );
  }
}

class MessageTile extends StatelessWidget {
  Message message;
  MessageTile(this.message);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(message.content),
    );
  }
}

class NoMessageFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("No message found"),
    );
  }
}

class MessageTextField extends StatefulWidget {
  @override
  _MessageTextFieldState createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  MessageProvider provider;
  TextEditingController controller = TextEditingController();

  void _onClickSend() {
    String text = controller.text;
    controller.text = "";
    provider.messageService.send(text);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MessageProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: this.controller,
            ),
          ),
          MaterialButton(onPressed: _onClickSend, child: Icon(Icons.send))
        ],
      ),
    );
  }
}
