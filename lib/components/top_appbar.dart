import 'package:flutter/material.dart';

class CustomTopAppBar extends StatelessWidget {
  const CustomTopAppBar({super.key, required this.header});
  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1.0,
            offset: Offset(-1.0, 0.0),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 30,
              color: Color.fromRGBO(2, 43, 63, 1),
            ),
          ),
          Text(
            header,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              fontFamily: 'Poppins',
              color: Color.fromRGBO(2, 43, 63, 1),
            ),
          )
        ],
      ),
    );
  }
}
