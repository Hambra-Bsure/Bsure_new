import 'dart:async';
import 'dart:convert';
import 'package:Bsure_devapp/Screens/DigitalWill/Digitalwill_screens/video/video_page.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../Repositary/Models/User_models/Get_user_res.dart';
import '../../../Utils/DisplayUtils.dart';
import '../../../Utils/SharedPrefHelper.dart'; // Import the http package



class CameraExampleHome extends StatefulWidget {
  const CameraExampleHome({Key? key});

  @override
  State<CameraExampleHome> createState() => _CameraExampleHomeState();
}

class _CameraExampleHomeState extends State<CameraExampleHome> {
  CameraController? controller;
  var proof;
  late Timer _timer;
  int _start = 0;
  bool isLoaded = false;
  bool _isRecording = false;

  GetUserResponse? userProfile;

  String formattedDate = DateFormat.yMMMMd('en_US').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _loadUserId();
    getData();
  }

  Future<String> _loadUserId() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(SharedPrefHelper().USER_ID) ?? '';
  }

  Future<void> getData() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      final token = sharedPreferences.getString("token");

      if (token == null) {
        print("Token is null. Handle this case appropriately.");
        return;
      }

      final dio = Dio();
      dio.options.headers['Authorization'] = token;

      final response = await dio.get('http://43.205.12.154:8080/v2/users');

      if (response.statusCode == 200) {
        final getUserResponse = GetUserResponse.fromJson(response.data);
        setState(() {
          userProfile = getUserResponse;
          isLoaded = true;
        });
      } else {
        print('Failed to fetch user profile: ${response.statusCode}');
        DisplayUtils.showToast('Failed to fetch user profile');
        setState(() {
          isLoaded = true;
        });
      }
    } catch (error) {
      print("Error fetching data: $error");
      DisplayUtils.showToast("Error fetching data");
      setState(() {
        isLoaded = true;
      });
    }
  }

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
    } else {
      final frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
        orElse: () => cameras.first,
      );

      controller = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: true,
      );

      await controller!.initialize();

      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Camera', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            //Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: CameraPreview(controller!),
          ),
          _captureControlRowWidget(),
        ],
      ),
    );
  }

  Widget _captureControlRowWidget() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                const TextSpan(
                  text: 'Hi, This is ',
                ),
                if (userProfile != null &&
                    userProfile!.user!.firstName != null) // Accessing directly here
                  TextSpan(
                    text: '"${userProfile!.user!.firstName}"',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                if (userProfile == null ||
                    userProfile!.user!.firstName == null)
                  const TextSpan(
                    text: '"Name"',
                    // Use default "Name" if actual name is not available
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                const TextSpan(
                  text:
                  '. I am making this will on Bsure Platform without any Instead  on my own will. No one is forcing me to do this will. Today is ',
                ),
                TextSpan(
                  text: formattedDate,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(
                  text:
                  '. This is my final will and all the nominations and wills prior to making this will are null or void.',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.switch_camera),
                color: const Color(0xff429bb8),
                onPressed: onSwitchCameraButtonPressed,
              ),
              const SizedBox(width: 16),
              _isRecording
                  ? ElevatedButton(
                onPressed: onStopButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xff429bb8), // Set background color here
                ),
                child: const Text("Stop",
                    style: TextStyle(color: Colors.white)),
              )
                  : ElevatedButton(
                onPressed: onRecordButtonPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                      0xff429bb8), // Set background color here
                ),
                child: const Text("Start recording",
                    style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 16),
              if (_isRecording)
                ElevatedButton(
                  onPressed: onRestartButtonPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color(0xff429bb8), // Set background color here
                  ),
                  child: const Text("Restart",
                      style: TextStyle(color: Colors.white)),
                ),
              const SizedBox(width: 5),
              Text('Time: $_start', style: const TextStyle(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            _isRecording ? 'Recording...' : 'Not recording',
            style: TextStyle(
              fontSize: 16,
              color: _isRecording ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void onSwitchCameraButtonPressed() async {
    await controller?.dispose();
    await initializeCamera();
  }

  Future<void> onRecordButtonPressed() async {
    if (!_isRecording) {
      await startVideoRecording();
      _startTimer();
      setState(() {
        _isRecording = true;
      });
    }
  }

  Future<void> startVideoRecording() async {
    try {
      _start = 0; // Reset the timer when starting recording
      await controller?.startVideoRecording();
      if (mounted) {
        setState(() {});
      }
    } on CameraException catch (e) {}
  }

  Future<void> stopVideoRecording() async {
    try {
      proof = await controller?.stopVideoRecording();
      if (mounted) {
        setState(() {
          _timer.cancel(); // Cancel the timer when stopping recording
          _start = 0; // Reset timer
        });

        if (proof != null && mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VideoDisplayScreen(videoPath: proof!.path),
            ),
          );
        }
      }
    } on CameraException catch (e) {}
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          _start++;
        });
      },
    );
  }

  Future<void> onStopButtonPressed() async {
    await stopVideoRecording();
    if (mounted) {
      setState(() {
        _isRecording = false;
      });
    }
  }

  void onRestartButtonPressed() async {
    _start = 0; // Reset the timer
    setState(() {});
    await startVideoRecording();
  }
}

class CameraApp extends StatelessWidget {
  const CameraApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraExampleHome(),
    );
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CameraApp());
}
