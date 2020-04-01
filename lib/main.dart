import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_txt/core/router.gr.dart';
import 'package:share_txt/providers/auth_provider.dart';
import 'package:share_txt/providers/message_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
          onGenerateRoute: Router.onGenerateRoute,
          initialRoute: Router.spleshScreenPage,
          navigatorKey: Router.navigator.key),
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        Provider(
          create: (_) => MessageProvider(),
        )
      ],
    );
  }
}
