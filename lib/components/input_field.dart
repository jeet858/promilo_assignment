import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key,
      required this.header,
      required this.hintText,
      required this.controller,
      required this.bottomText,
      required this.rememberMe,
      required this.type,
      required this.onchange});
  final String header;
  final String hintText;
  final String bottomText;
  final String type;
  final TextEditingController controller;
  final bool rememberMe;
  final Function onchange;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool checkboxValue = false;
  bool validateEmail(String email) {
    // Define a regular expression for a simple email validation
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              widget.header,
              style: const TextStyle(
                color: Color.fromRGBO(29, 65, 82, 1),
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.black26),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
              controller: widget.controller,
              onChanged: ((e) {
                if (widget.type == 'email') {
                  if (validateEmail(widget.controller.text)) {
                    Provider.of<AppData>(context, listen: false)
                        .updateValidEmail(true);
                  }
                } else {
                  if (widget.controller.text.length > 0) {
                    Provider.of<AppData>(context, listen: false)
                        .updateValidPass(true);
                  }
                }
              }),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            widget.rememberMe
                ? Row(
                    children: [
                      Checkbox(
                        value: Provider.of<AppData>(context, listen: true)
                            .rememberMe,
                        onChanged: ((e) => {
                              Provider.of<AppData>(context, listen: false)
                                  .updateRememberMe()
                            }),
                      ),
                      const Text(
                        'Remember Me',
                        // style: TextStyle(
                        //     color: Colors.blueAccent,
                        //     fontSize: 18,
                        //     fontFamily: 'Poppins',
                        //     fontWeight: FontWeight.w700),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  )
                : Container(),
            TextButton(
              onPressed: (() => {}),
              child: Text(
                widget.bottomText,
                style: const TextStyle(
                    color: Color.fromRGBO(10, 104, 153, 1),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.right,
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
