import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import 'LoginScreen.dart';

const viewColor = Color(0xFFF5D9CE);
const textPinkColor = Color(0xFFF51678);
const buttonPinkColor = Color(0xFFF5147C);
const pinkColor = Color(0xFFF51479);
const pinkBackground = Color(0xFFF5C3C7);
const startColorBackground = Color(0xFFF5F4F2);
const endColorBackground = Color(0xFFF5EAE6);

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  late double height;
  late double width;
  int mCurrentIndex = -1;
  final List<Widget> pages = [
    const PageItem(
      message: "The Digital Repository",
      imagePath: "assets/images/img_2.png",
      description:
          "The digital repository that stores user's basic information and passes on the information to the user family when the user is not around",
    ),
    const PageItem(
      message: "Your Family's Friend",
      imagePath: "assets/images/img_7.png",
      description:
          "80% families lose money to unclaimed fund after the death of their kin. Bsure ensures your family is not the one!!",
    ),
    const PageItem(
      message: "With Bsure you can trust!!",
      imagePath: "assets/images/img_1.png",
      description:
          "Your assets and insurances can be transferred to your family without fail!!",
    ),
  ];
  late PageController _controller;

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [startColorBackground, endColorBackground],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Container(
                      height: height * 0.8, // Adjust this value as needed
                      child: PageIndicatorContainer(
                        align: IndicatorAlign.bottom,
                        length: pages.length,
                        indicatorSpace: 10.0,
                        indicatorColor: Colors.white,
                        indicatorSelectorColor: Colors.black,
                        child: PageView.builder(
                          controller: _controller,
                          onPageChanged: _onPageViewChange,
                          itemBuilder: (context, position) {
                            mCurrentIndex = position;
                            return pages[position];
                          },
                          itemCount: pages.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (mCurrentIndex != 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                        child: const Text(
                          'Prev',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  else
                    Container(),
                  if (mCurrentIndex != pages.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(right: 30.0, bottom: 30.0),
                      child: GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                  else
                    Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                      bottom: 10,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        backgroundColor: const Color(0xff429bb8),
                        minimumSize: const Size(500, 50),
                        elevation: 20,
                        textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'SIGN IN',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onPageViewChange(int page) {
    setState(() {
      mCurrentIndex = page;
    });
  }
}

class PageItem extends StatelessWidget {
  final String message;
  final String imagePath;
  final String description;

  const PageItem({
    Key? key,
    required this.message,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 200.0,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Playfair',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center, // Align text center
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center, // Align text center
                    style: const TextStyle(fontSize: 18),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
