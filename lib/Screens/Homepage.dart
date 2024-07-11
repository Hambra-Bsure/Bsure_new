import 'package:Bsure_devapp/Screens/Assets/get_asset_screens/category.dart';
import 'package:Bsure_devapp/Screens/Nominees/Get_all_nominees.dart';
import 'package:flutter/material.dart';
import 'DigitalWill/WillScreen.dart';
import 'Nudge/Nudge_plans.dart';
import 'Settings_screen/Profile_page.dart';
import 'ShareAssets/AssetScreen.dart';
import 'UserProfile/Get_profile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentStep = 0;

  int selectedIndex = 0;

  var isLoaded = false;

  StepperType stepperType = StepperType.vertical;

  ScrollController scrollController = ScrollController();
  var height = 0.0;
  var width = 0.0;

  bool backToTop = false;
  bool isLastIndex = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        backToTop = -scrollController.offset > 400 ? true : false;
        isLastIndex = -scrollController.offset >
                -scrollController.position.maxScrollExtent
            ? true
            : false;
      });
    });
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
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu_open,
              size: 30,
              color: Colors.white,
            ),
            tooltip: 'Account settings',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            _buildSectionTitle('Features'),
            const SizedBox(height: 20),
            _buildFeatureCards(context),
            const SizedBox(height: 20),
            _buildSectionTitle('Steps to follow'),
            const SizedBox(height: 30),
            _buildStepper(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      alignment: Alignment.topLeft,
      height: 50,
      width: double.infinity,
      color: const Color(0xff429bb8),
      padding: const EdgeInsets.only(top: 10, left: 40),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFeatureCards(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10.0),
      // Slightly larger margin for better spacing
      elevation: 4.0,
      // Slightly lower elevation for a smoother look
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // More rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            SizedBox(
              height: 100.0, // Increased height for better spacing
              child: Stack(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildGridItem(
                          context,
                          'Assets',
                          'assets/images/img_2.png',
                          const CategoriesScreen(),
                        ),
                        buildGridItem(
                          context,
                          'Nominee',
                          'assets/images/img_7.png',
                          const GetNomineeScreen(),
                        ),
                        buildGridItem(
                          context,
                          'Nudge',
                          'assets/images/img_1.png',
                          const NudgeScreen(),
                        ),
                        buildGridItem(
                          context,
                          'ShareAssets',
                          Icons.share,
                          const AssetScreen(),
                        ),
                        buildGridItem(
                          context,
                          'Digitalwill',
                          Icons.design_services,
                          const WillScreen(),
                        ),
                      ],
                    ),
                  ),
                  // Adding an indicator to show there are more items
                  Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 30.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(0.0),
                          ],
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGridItem(
    BuildContext context,
    String title,
    dynamic icon,
    Widget route,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width / 3 - 20,
      // Adjust width to fit 3 items
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      // Adjusted for better spacing
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => route),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon is String
                ? Image.asset(
                    icon,
                    width: 60.0, // Slightly larger icon size
                    height: 60.0,
                  )
                : Icon(
                    icon,
                    size: 60.0, // Slightly larger icon size
                    color: const Color(0xff429bb8),
                  ),
            const SizedBox(height: 10.0),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center, // Centered text
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Card(
      color: Colors.white,
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
            child: Stepper(
              type: StepperType.vertical,
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
    );
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
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                const SizedBox(height: 5),
                if (title2 != null)
                  Text(
                    title2,
                    style: const TextStyle(
                      fontSize: 15,
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

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void continued() {
    if (_currentStep == 0) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (_currentStep == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const CategoriesScreen()),
      );
    } else if (_currentStep == 2) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const GetNomineeScreen()),
      );
    } else if (_currentStep == 3) {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NudgeScreen()),
      );
    }
    _currentStep < 1 ? setState(() => _currentStep += 1) : null;
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}

Widget buildGridItem(
  BuildContext context,
  String title,
  dynamic icon,
  Widget route,
) {
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
