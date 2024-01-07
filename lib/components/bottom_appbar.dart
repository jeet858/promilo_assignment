import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: 60,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              offset: Offset(0.0, -1.0),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 45,
              height: 70,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home_outlined,
                        color: Color.fromRGBO(64, 96, 112, 1), size: 35),
                    Text(
                      'Home',
                      style: TextStyle(
                          color: Color.fromRGBO(54, 87, 104, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 45,
              height: 70,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.flag,
                        color: Color.fromRGBO(64, 96, 112, 1), size: 35),
                    Text(
                      'Prolet',
                      style: TextStyle(
                          color: Color.fromRGBO(54, 87, 104, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 50,
              height: 70,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.handshake_outlined,
                        color: Color.fromRGBO(121, 230, 235, 1), size: 35),
                    Text(
                      'Meetups',
                      style: TextStyle(
                        color: Color.fromRGBO(121, 230, 235, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 45,
              height: 70,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.search,
                        color: Color.fromRGBO(64, 96, 112, 1), size: 35),
                    Text(
                      'Explore',
                      style: TextStyle(
                          color: Color.fromRGBO(54, 87, 104, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 50,
              height: 70,
              child: MaterialButton(
                padding: EdgeInsets.zero,
                onPressed: null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.person_2_outlined,
                        color: Color.fromRGBO(64, 96, 112, 1), size: 35),
                    Text(
                      'Account',
                      style: TextStyle(
                          color: Color.fromRGBO(54, 87, 104, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
