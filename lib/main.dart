import 'package:flutter/material.dart';
import 'package:promilo/pages/description.dart';
import 'package:promilo/pages/login_screen.dart';
import 'package:promilo/pages/meetup.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          'login': (context) => const Login(),
          'meetup': (context) => const Meetup(),
          'description': (context) => const Description(),
        },
        home: const Login(),
      ),
    );
  }
}

class AppData extends ChangeNotifier {
  bool rememberMe = false;
  bool validEmail = false;
  bool validPass = false;

  void updateRememberMe() {
    rememberMe = !rememberMe;
    notifyListeners();
  }

  void updateRememberMeWithValue(bool value) {
    rememberMe = value;
    notifyListeners();
  }

  void updateValidEmail(bool value) {
    validEmail = value;
    notifyListeners();
  }

  void updateValidPass(bool value) {
    validPass = value;
    notifyListeners();
  }
}
