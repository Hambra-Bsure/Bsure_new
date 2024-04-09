// ignore_for_file: file_names

import 'package:Bsure_devapp/Screens/Repositary/Models/AssetModels/GetCategoryResponse.dart';
import 'package:flutter/material.dart';

import 'Assets/GetAssets.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentStep = 0;

  int selectedIndex = 0;
  //AssetDetailsBean? products;
  var isLoaded = false;

  StepperType stepperType = StepperType.vertical;

  ScrollController scrollController = ScrollController();
  var height = 0.0;
  var width = 0.0;

  bool backToTop = false;
  bool isLastindex = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        backToTop = -scrollController.offset > 400 ? true : false;
        isLastindex = -scrollController.offset >
                -scrollController.position.maxScrollExtent
            ? true
            : false;
      });
    });
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xff429bb8),
          automaticallyImplyLeading: false,
          title: Container(
            alignment: Alignment.topLeft,
            child: const Text(
              'Bsure',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu_open,
                size: 30,
                color: Colors.white,
              ),
              tooltip: 'account settings',
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => const ProfilePage()),
                // );
              },
            ), //IconButton
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topLeft,
                height: 50,
                width: double.infinity,
                color: const Color(0xff429bb8),
                padding: const EdgeInsets.only(top: 10, left: 40),
                child: const Text(
                  'Features',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    margin: const EdgeInsets.all(5.0),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 5.0),
                          SingleChildScrollView(
                            child: GridView.count(
                              crossAxisCount:
                                  MediaQuery.of(context).size.width > 600
                                      ? 3
                                      : 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                buildGridItem(
                                    context,
                                    'Assets',
                                    'assets/images/img_2.png',
                                    //const AssetList()),
                                buildGridItem(
                                    context,
                                    'Nominee',
                                    'assets/images/img_7.png',
                                   // const NomineeScreen()),
                                buildGridItem(
                                    context,
                                    'Nudge',
                                    'assets/images/img_1.png',
                                   // const NudgeScreen()),
                                buildGridItem(context, 'ShareAssets',
                                    Icons.share,
                                    //const AssetScreen()),
                                buildGridItem(context, 'Digitalwill',
                                    Icons.design_services,
                                    GetCategoryresponse() as Widget),
                                ))))],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // const SizedBox(height: 16),
                  // const Center(
                  //   child: Padding(
                  //     padding: EdgeInsets.all(16.0),
                  //     child: CustomCard(
                  //       title: 'Bsure Aid',
                  //       description:
                  //           'Help a family who lost their earning family Member',
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 50,
                    width: double.infinity,
                    color: const Color(0xff429bb8),
                    padding: const EdgeInsets.only(top: 10, left: 40),
                    child: const Text(
                      'Steps to follow',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    margin: const EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ClipPath(
                      clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Container(
                        color: Colors.white,
                        child: Theme(
                          data: ThemeData(
                            colorScheme: const ColorScheme.light(
                              primary: Color(0xff429bb8),
                            ),
                          ),
                          child: Container(
                            // Wrap the Flexible with Container
                            child: Stepper(
                              type: StepperType.vertical,
                              // Adjust stepperType as needed
                              physics: const ScrollPhysics(),
                              currentStep: _currentStep,
                              onStepTapped: (step) => tapped(step),
                              onStepContinue: continued,
                              onStepCancel: cancel,
                              steps: <Step>[
                                _buildStep(
                                  icon: Icons.account_circle,
                                  title1: "Create your profile",
                                  title2: "Fill your asset details",
                                ),
                                _buildStep(
                                  title1: "Assets",
                                  title2: "Fill your asset details",
                                  imageAsset: "assets/images/img_2.png",
                                ),
                                _buildStep(
                                  title1: "Nominee",
                                  title2: "Fill your Nominee details",
                                  imageAsset: "assets/images/img_7.png",
                                ),
                                _buildStep(
                                  title1: "Nudge",
                                  title2: "Subscribe to nudge plan",
                                  imageAsset: "assets/images/img_1.png",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ])));
  }

  Step _buildStep({
    IconData? icon,
    String? title1,
    String? title2,
    String? imageAsset,
  }) {
    return Step(
      content: const SizedBox(), // You can customize content here
      isActive: true,
      state: StepState.indexed,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: icon != null
                ? Icon(
                    icon,
                    size: 60,
                    color: const Color(0xff429bb8),
                  )
                : Image.asset(
                    imageAsset!,
                    height: 50.0, // Adjust the height as needed
                    fit: BoxFit.contain,
                  ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (title1 != null)
                  Text(
                    title1,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width > 600
                            ? Theme.of(context).textTheme.titleLarge!.fontSize
                            : Theme.of(context).textTheme.titleMedium!.fontSize,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                    //maxLines: 1, // Add this line if you want to limit the number of lines
                  ),
                const SizedBox(
                  height: 5,
                ),
                if (title2 != null)
                  Text(
                    title2,
                    style: const TextStyle(
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis), // Add this line
                    //maxLines: 2, // Add this line if you want to limit the number of lines
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void continued() {
    if (_currentStep == 0) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => const ProfileScreen()),
      // );
    } else if (_currentStep == 1) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => const AssetList()),
      // );
    } else if (_currentStep == 2) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => const NomineeScreen()),
      // );
    } else if (_currentStep == 3) {
      // Navigator.of(context).push(
      //   MaterialPageRoute(builder: (context) => const NudgeScreen()),
      // );
    }
    _currentStep < 1 ? setState(() => _currentStep += 1) : null;
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

Widget buildGridItem(
    BuildContext context, String title, dynamic icon, Widget route) {
  return InkWell(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon is String
            ? Image.asset(
                icon,
                width: MediaQuery.of(context).size.width > 600 ? 50.0 : 50.0,
                height: MediaQuery.of(context).size.width > 600 ? 50.0 : 50.0,
              )
            : Icon(
                icon,
                size: 50.0,
                color: const Color(0xff429bb8),
              ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 600
                  ? Theme.of(context).textTheme.titleLarge!.fontSize
                  : Theme.of(context).textTheme.titleMedium!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => route),
      );
    },
  );
}

class CustomCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomCard({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const CampaignListScreen(),
        //   ),
        // );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: ClickableCardWithMessage(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const CampaignListScreen(),
            //   ),
            // );
          },
          title: title,
          description: description,
        ),
      ),
    );
  }
}

class ClickableCardWithMessage extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;

  const ClickableCardWithMessage({
    required this.onTap,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color(0xff429bb8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xff317799),
              padding: const EdgeInsets.all(12.0),
              child: const Text(
                'Click here to proceed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
