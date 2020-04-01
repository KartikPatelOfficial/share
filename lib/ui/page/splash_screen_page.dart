import 'dart:async';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:share_txt/core/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_txt/providers/auth_provider.dart';
import 'package:share_txt/providers/message_provider.dart';

class SpleshScreenPage extends StatefulWidget {
  @override
  _SpleshScreenPageState createState() => _SpleshScreenPageState();
}

class _SpleshScreenPageState extends State<SpleshScreenPage> {
  AuthProvider _provider;
  StreamSubscription _intentDataStreamSubscription;
  MessageProvider messageProvider;

  @override
  void initState() {
    super.initState();
    // For sharing or opening urls/text coming from outside the app while the app is in the memory
    _intentDataStreamSubscription =
        ReceiveSharingIntent.getTextStream().listen((String value) {
      messageProvider.sendMessage(value);
    }, onError: (err) {
      print("getLinkStream error: $err");
    });

    // For sharing or opening urls/text coming from outside the app while the app is closed
    ReceiveSharingIntent.getInitialText().then((String value) {
      messageProvider.sendMessage(value);
    });
    startTime();
  }

  @override
  void dispose() {
    _intentDataStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<AuthProvider>(context);
    messageProvider = Provider.of<MessageProvider>(context);
    return Scaffold(body: Center(child: Text("Splash Screen")));
  }

  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Router.navigator.pushReplacementNamed(
        _provider.isAuthenticated ? Router.homePage : Router.loginPage);
  }
}
