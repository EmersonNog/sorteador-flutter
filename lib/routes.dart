import 'package:flutter/cupertino.dart';
import 'package:sorteador/pages/home.dart';
import 'package:sorteador/pages/login.dart';
import 'package:sorteador/pages/cadastrar.dart';
import 'package:sorteador/pages/resetPass.dart';
import 'package:sorteador/pages/sorteador.dart';
import 'package:sorteador/checagem.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> routes = <String, WidgetBuilder>{
    '/login': (context) => Login(),
    '/home': (context) => Home(),
    '/signUp': (context) => SignupPage(),
    '/resetPass': (context) => ResetPasswordPage(),
    '/sorteador': (context) => Sorteador(),
    '/load': (context) => ChecagemPage(),
  };

  static String initialRoute = '/load';
}