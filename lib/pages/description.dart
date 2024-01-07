import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:promilo/components/bottom_appbar.dart';
import 'package:promilo/components/top_appbar.dart';
import 'package:share_plus/share_plus.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  final bannerPics = [
    Image.asset('assets/images/hd-a5u9zq0a0ymy2dug.jpg',
        width: double.infinity, fit: BoxFit.fill),
    Image.asset('assets/images/hd-a5u9zq0a0ymy2dug.jpg',
        width: double.infinity, fit: BoxFit.fill),
    Image.asset('assets/images/hd-a5u9zq0a0ymy2dug.jpg',
        width: double.infinity, fit: BoxFit.fill),
    Image.asset('assets/images/hd-a5u9zq0a0ymy2dug.jpg',
        width: double.infinity, fit: BoxFit.fill),
    Image.asset('assets/images/hd-a5u9zq0a0ymy2dug.jpg',
        width: double.infinity, fit: BoxFit.fill),
  ];

  int currentPic = 0;
  bool seeMore = false;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: SafeArea(
          child: CustomTopAppBar(
            header: 'Description',
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(224, 224, 223, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                                height: 250.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentPic = index;
                                  });
                                }),
                            items: bannerPics.map((imageUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: imageUrl,
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: bannerPics.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(
                                            currentPic == entry.key
                                                ? 0.9
                                                : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.save_alt, size: 30),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.bookmark),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(FontAwesomeIcons.heart),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.expand,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            FontAwesomeIcons.star,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Share.share(
                              'Jeet is a awesome flutter developer and probably the best-fit for this role',
                            );
                          },
                          icon: const Icon(
                            Icons.share,
                            size: 30,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.bookmark,
                      size: 15,
                      color: Colors.lightBlueAccent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '1034',
                      style: TextStyle(color: Colors.grey.shade900),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const FaIcon(
                      FontAwesomeIcons.heart,
                      size: 15,
                      color: Colors.lightBlueAccent,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '1034',
                      style: TextStyle(color: Colors.grey.shade900),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(226, 226, 225, 1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 5),
                      child: RatingBar.builder(
                        initialRating: 3.2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.lightBlueAccent,
                        ),
                        itemSize: 15,
                        onRatingUpdate: (rating) {},
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      '3.2',
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: const Text(
                  'Actor Name',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(2, 43, 63, 1),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  'Indian Actress',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: const Row(
                  children: [
                    Icon(
                      Icons.watch_later_outlined,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Duration 20 mins',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: const Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.wallet,
                      size: 18,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Total Average Fees ₹9,999',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: const Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    color: Color.fromRGBO(2, 43, 63, 1),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: double.infinity,
                child: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea com',
                  style: TextStyle(
                      color: Colors.grey, overflow: TextOverflow.fade),
                ),
              ),
              !seeMore
                  ? Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        child: const Text(
                          'See more',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        onPressed: () {
                          setState(() {
                            seeMore = !seeMore;
                          });
                        },
                      ),
                    )
                  : const SizedBox(),
              seeMore
                  ? Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: double.infinity,
                      child: const Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea com',
                        style: TextStyle(
                            color: Colors.grey, overflow: TextOverflow.fade),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
