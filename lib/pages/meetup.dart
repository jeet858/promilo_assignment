import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:promilo/components/bottom_appbar.dart';
import 'package:promilo/components/top_appbar.dart';
import 'package:promilo/pages/description.dart';

class Meetup extends StatefulWidget {
  const Meetup({super.key});

  @override
  State<Meetup> createState() => _MeetupState();
}

class _MeetupState extends State<Meetup> {
  final trendingMeetups = [
    'assets/images/images.jpeg',
    'assets/images/images.jpeg',
    'assets/images/images.jpeg',
    'assets/images/images.jpeg',
    'assets/images/images.jpeg',
  ];

  final bannerPics = [
    Image.asset('assets/images/banner-1.jpeg',
        width: double.infinity, fit: BoxFit.fill),
    Image.asset('assets/images/banner-2.jpeg',
        width: double.infinity, fit: BoxFit.fill),
    Image.asset('assets/images/banner-3.jpeg',
        width: double.infinity, fit: BoxFit.fill),
  ];
  int currentPic = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomAppBar(),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SafeArea(
            child: CustomTopAppBar(
          header: 'Individual Meetup',
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    color: const Color.fromRGBO(55, 88, 105, 1), width: 2),
              ),
              child: const Row(
                children: [
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search,
                        color: Color.fromRGBO(55, 88, 105, 1)),
                    padding: EdgeInsets.zero,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon:
                        Icon(Icons.mic, color: Color.fromRGBO(55, 88, 105, 1)),
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ), //Searchbar ends here
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  CarouselSlider(
                    items: bannerPics.map((item) {
                      return Stack(children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: item,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: const Text(
                              'Popular Meetups\nin India',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      ]);
                    }).toList(),
                    options: CarouselOptions(
                        viewportFraction: 1,
                        height: 240,
                        onPageChanged: ((index, reason) {
                          setState(() {
                            currentPic = index;
                          });
                        })),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: bannerPics.asMap().entries.map((entry) {
                        return GestureDetector(
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color.fromRGBO(0, 42, 64, 1)
                                    .withOpacity(
                                        currentPic == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ), // banner carousel ends
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10),
              child: const Text(
                '  Trending Popular People',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(2, 43, 63, 1),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 300,
                        height: 170,
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromRGBO(55, 88, 105, 1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(55, 88, 105, 1),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.access_alarm,
                                    color: Color.fromRGBO(55, 88, 105, 1),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Author',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: '',
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(2, 43, 63, 1),
                                      ),
                                    ),
                                    Text(
                                      '1,028 Meetups',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.grey,
                              width: double.infinity,
                              height: 1,
                              margin: const EdgeInsets.only(top: 5),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: 50,
                              child: const Stack(
                                children: [
                                  Positioned(
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-1.jpeg'),
                                        width: 75,
                                        height: 75,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 25,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-2.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-3.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-4.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-5.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(0, 101, 153, 1),
                                ),
                                child: RawMaterialButton(
                                  onPressed: (() => {}),
                                  padding: EdgeInsets.zero,
                                  child: const Text(
                                    'See More',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 170,
                        margin: const EdgeInsets.only(right: 10),
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromRGBO(55, 88, 105, 1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(55, 88, 105, 1),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.access_alarm,
                                    color: Color.fromRGBO(55, 88, 105, 1),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Author',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: '',
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(2, 43, 63, 1),
                                      ),
                                    ),
                                    Text(
                                      '1,028 Meetups',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.grey,
                              width: double.infinity,
                              height: 1,
                              margin: const EdgeInsets.only(top: 5),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: 50,
                              child: const Stack(
                                children: [
                                  Positioned(
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-1.jpeg'),
                                        width: 75,
                                        height: 75,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 25,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-2.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-3.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-4.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-5.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(0, 101, 153, 1),
                                ),
                                child: RawMaterialButton(
                                  onPressed: (() => {}),
                                  padding: EdgeInsets.zero,
                                  child: const Text(
                                    'See More',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 300,
                        height: 170,
                        margin: const EdgeInsets.only(right: 10),
                        padding:
                            const EdgeInsets.only(top: 15, left: 15, right: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color.fromRGBO(55, 88, 105, 1),
                            width: 1,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color:
                                          const Color.fromRGBO(55, 88, 105, 1),
                                      width: 1.5,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.access_alarm,
                                    color: Color.fromRGBO(55, 88, 105, 1),
                                  ),
                                ),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Author',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: '',
                                        fontWeight: FontWeight.w900,
                                        color: Color.fromRGBO(2, 43, 63, 1),
                                      ),
                                    ),
                                    Text(
                                      '1,028 Meetups',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              color: Colors.grey,
                              width: double.infinity,
                              height: 1,
                              margin: const EdgeInsets.only(top: 5),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              height: 50,
                              child: const Stack(
                                children: [
                                  Positioned(
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-1.jpeg'),
                                        width: 75,
                                        height: 75,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 25,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-2.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 50,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-3.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 75,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-4.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 100,
                                    child: CircleAvatar(
                                      backgroundImage: ResizeImage(
                                        AssetImage(
                                            'assets/images/circle-pic-5.jpeg'),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color.fromRGBO(0, 101, 153, 1),
                                ),
                                child: RawMaterialButton(
                                  onPressed: (() => {}),
                                  padding: EdgeInsets.zero,
                                  child: const Text(
                                    'See More',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, left: 10),
              child: const Text(
                '  Top Trending Meetups',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(2, 43, 63, 1),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                child: ListView.builder(
                    itemCount: trendingMeetups.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return RawMaterialButton(
                        onPressed: (() => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Description(),
                                ),
                              )
                            }),
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset(
                                trendingMeetups[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              width: 210,
                              height: 200,
                              // Adjust padding as needed
                              color: Colors.transparent,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    '0${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontFamily: 'Poppins',
                                      color: Color.fromRGBO(2, 43, 63, 1),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
