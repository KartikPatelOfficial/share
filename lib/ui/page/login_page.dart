import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_txt/core/router.gr.dart';
import 'package:share_txt/providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  AuthProvider _authProvider;
  BuildContext _context;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _onClickNext() {
    _authProvider
        .signInWithEmailAndPassword(
            _emailController.text, _passwordController.text)
        .catchError((e) {
      _onGetError(e.message);
    });
  }

  void _onAuthenticated() {
    Router.navigator.popAndPushNamed(Router.homePage);
  }

  void _onGetError(String err) {
    showDialog(
        context: _context,
        builder: (dialogContext) => AlertDialog(
              title: Text("Error"),
              content: Text(err),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                    },
                    child: Text("Ok"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    _authProvider = Provider.of<AuthProvider>(context);

    if (_authProvider.isAuthenticated) {
      _onAuthenticated();
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
            ),
            TextFormField(
              controller: _passwordController,
            ),
            MaterialButton(onPressed: _onClickNext, child: Text("Sign in"))
          ],
        ),
      ),
    );
  }
}
