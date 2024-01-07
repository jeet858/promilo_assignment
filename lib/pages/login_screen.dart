import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:promilo/components/input_field.dart';
import 'package:promilo/components/login_icons.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;
import 'package:promilo/pages/meetup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';

  Future<void> apiLogin() async {
    const url = 'https://apiv2stg.promilo.com/user/oauth/token/';
    var email = emailController.text;
    var password = passwordController.text;
    var md5Password = crypto.md5.convert(utf8.encode(password)).toString();
    try {
      var response = await http.post(
        Uri.parse(url),
        body: jsonEncode(
          {
            'username': email,
            'password': md5Password,
            'grant_type': 'password'
          },
        ),
      );
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('success');
        }
      } else {
        if (kDebugMode) {
          print(response.statusCode);
          print(response.body);
          print(md5Password);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    } finally {
      if (emailController.text == 'test45@yopmail.com' &&
          passwordController.text == 'Test@123' &&
          context.mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Meetup(),
          ),
        );
      } else {
        // Show alert for incorrect credentials

        context.mounted
            ? showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Incorrect Credentials'),
                    content: const Text(
                        'Please check your email and password and try again.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // Close the alert dialog
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              )
            : null;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 20),
              width: double.infinity,
              height: 150,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Text('promilo',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24))),
                  Center(
                    child: Text(
                      'Hi, Welcome Back!',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(2, 43, 63, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            InputField(
              header: 'Please Sign in to continue',
              hintText: 'Enter Email or Mob no.',
              controller: emailController,
              bottomText: 'Sign in with otp',
              rememberMe: false,
              type: 'email',
              onchange: () {},
            ),
            InputField(
              header: 'Password',
              hintText: 'Enter Password.',
              controller: passwordController,
              bottomText: 'Forgot Password',
              rememberMe: true,
              type: 'password',
              onchange: () {},
            ),
            Provider.of<AppData>(context, listen: true).validPass &&
                    Provider.of<AppData>(context, listen: true).validEmail
                ? MaterialButton(
                    onPressed: (() => {apiLogin()}),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueAccent,
                        border: Border.all(
                          color: const Color.fromRGBO(18, 144, 230, 1),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  )
                : MaterialButton(
                    onPressed: (() => {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Incorrect Credentials'),
                                content:
                                    const Text('Enter valid Id and password'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(
                                          context); // Close the alert dialog
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          )
                        }),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromRGBO(181, 198, 211, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(18, 144, 230, 1),
                          width: 2,
                        ),
                      ),
                      child: const Center(
                          child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.black26,
                  height: 2,
                ),
                const Text('Or'),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.black26,
                  height: 2,
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoginIcon(imagePath: 'assets/images/google.png'),
                  LoginIcon(imagePath: 'assets/images/linkedin.png'),
                  LoginIcon(imagePath: 'assets/images/facebook.png'),
                  LoginIcon(imagePath: 'assets/images/instagram.png'),
                  LoginIcon(imagePath: 'assets/images/whatsapp.png'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Business User?',
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(padding: EdgeInsets.zero),
                        child: const Text(
                          'Login Here',
                          style: TextStyle(
                              color: Color.fromRGBO(10, 104, 153, 1),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w700),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "Don't have an account",
                        style: TextStyle(
                            color: Colors.black26,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromRGBO(10, 104, 153, 1),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Column(
              children: [
                Text(
                  'By continuing, you agree to',
                  style: TextStyle(
                    color: Colors.black26,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Promilo's ",
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Terms of use and policy',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
