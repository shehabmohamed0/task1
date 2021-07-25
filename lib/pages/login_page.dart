import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/widgets/show_alert_dialog.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  TextField _buildEmailTextField() {
    return TextField(
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'asdasdasd@asdasd.com',
      ),
    );
  }

  TextField _buildPasswordTextField() {
    return TextField(
      obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        labelText: 'Password',
      ),
    );
  }

  List<Widget> _createChildren(BuildContext context) {
    return [
      _buildEmailTextField(),
      SizedBox(
        height: 10,
      ),
      _buildPasswordTextField(),
      SizedBox(
        height: 10,
      ),
      ElevatedButton(
        onPressed: () => showAlertDialog(context,
            title: 'Login',
            content: 'Are you sure you want to sing in?',
            defaultActionText: 'OK', onDefaultAction: () {
          _showSnackBar(context);
        }, cancelActionText: 'Cancel'),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Login'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: _createChildren(context),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('your successfully login'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
