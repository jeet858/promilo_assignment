import 'package:flutter/material.dart';

class LoginIcon extends StatelessWidget {
  const LoginIcon({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
      ),
      child: Image.asset(
        imagePath,
        width: 40,
      ),
    );
  }
}
