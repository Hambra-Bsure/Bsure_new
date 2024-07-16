import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Repositary/Models/User_models/Get_user_res.dart';
import '../Utils/DisplayUtils.dart';
import '../homepage.dart';
import 'Create_profile.dart';
import 'Edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double height = 0.0;
  double width = 0.0;
  bool isLoaded = false;
  GetUserResponse? userProfile;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString("token");

      if (token == null) {
        return;
      }

      final dio = Dio();
      dio.options.headers['Authorization'] = token;

      final response = await dio.get('https://dev.bsure.live/v2/users');

      if (response.statusCode == 200) {
        final getUserResponse = GetUserResponse.fromJson(response.data);
        setState(() {
          userProfile = getUserResponse;
          isLoaded = true;
        });
      } else {
        DisplayUtils.showToast('Failed to fetch user profile');
        setState(() {
          isLoaded = true;
        });
      }
    } catch (error) {
      DisplayUtils.showToast("Error fetching data");
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          "Profile details",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const Homepage()),
                  (route) => false,
            );
          },
        ),
      ),
      body: isLoaded
          ? SingleChildScrollView(
        child: Center(
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            shadowColor: Colors.black,
            child: SizedBox(
              width: width * 0.9, // Responsive width
              height: height * 0.75, // Responsive height
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CircleAvatar(
                            backgroundColor: Color(0xff429bb8),
                            radius: 50,
                            child: Icon(
                              Icons.account_circle,
                              size: 100,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(child: _buildUserDetails()),
                        const SizedBox(height: 30),
                        _buildCreateButton(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xff429bb8)),
                      onPressed: () async {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => EditUser(userProfile: userProfile),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildUserDetails() {
    if (userProfile != null && userProfile!.user != null) {
      final user = userProfile!.user!;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildText(
                'Name:', '${user.firstName ?? ''} ${user.lastName ?? ''}'),
            _buildText('Gender:', user.gender ?? ''),
            _buildText('Whatsapp no:', user.whatsappNumber ?? ''),
            if (user.secondaryNumber != null &&
                user.secondaryNumber != '0' &&
                user.secondaryNumber!.isNotEmpty)
              _buildText('Secondary no:', user.secondaryNumber!),
            if (user.age != null) _buildText('Age:', user.age.toString()),
            if (user.email != null) _buildText('Email id:', user.email!),
            if (user.address != null) _buildText('Address:', user.address!),
            if (user.panNumber != null && user.panNumber!.isNotEmpty)
              _buildText('PanNumber:', user.panNumber!),
          ],
        ),
      );
    } else {
      return const SizedBox(); // Return an empty SizedBox if userProfile is null
    }
  }

  Widget _buildText(String label, String value) {
    if (value.isEmpty) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label $value',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCreateButton() {
    return Center(
      child: SizedBox(
        width: 150,
        child: ElevatedButton(
          onPressed: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditProfile(userProfile: userProfile),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xff429bb8)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
          ),
          child: const Text(
            'Create profile',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
