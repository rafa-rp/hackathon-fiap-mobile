import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hackathon_fiap_mobile/screens/home_screen.dart';

const users = const {
  'fiap@gmail.com': '12345',
};

class LoginScreen extends StatelessWidget {
  static const String id = '/login';
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Usuario não existe';
      }
      if (users[data.name] != data.password) {
        return 'Password Invalido';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }


  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Reclame Saúde',
      logo: AssetImage('images/healthcare.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
      }, onRecoverPassword: (String ) { return null; },
    );
  }
}