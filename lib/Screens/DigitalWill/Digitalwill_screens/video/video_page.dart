import 'dart:convert';
import 'dart:io' show File;
import 'package:Bsure_devapp/Screens/DigitalWill/Digitalwill_screens/witness_screens/get_witness_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:video_player/video_player.dart';
import 'dart:io' if (dart.library.io) 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../../LoginScreen.dart';
import '../../../Utils/DisplayUtils.dart';
import '../Digitalwill_success_message.dart';

class VideoDisplayScreen extends StatefulWidget {
  final String videoPath;

  const VideoDisplayScreen({super.key, required this.videoPath});

  @override
  _VideoDisplayScreenState createState() => _VideoDisplayScreenState();
}

class _VideoDisplayScreenState extends State<VideoDisplayScreen> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    if (UniversalPlatform.isWeb) {
      _initializeWebVideoPlayer();
    } else {
      _initializeLocalVideoPlayer();
    }
  }

  void _initializeWebVideoPlayer() {
    _videoController = VideoPlayerController.network(widget.videoPath)
      ..initialize().then((_) {
        setState(() {
          _videoController.play();
        });
      });
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  void _initializeLocalVideoPlayer() {
    _videoController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {
          _videoController.play();
        });
      });
    _initializeVideoPlayerFuture = _videoController.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Video Display',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_videoController.value.isPlaying) {
                        _videoController.pause();
                      } else {
                        _videoController.play();
                      }
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _videoController.seekTo(Duration.zero); // Restart the video
                    _videoController.play(); // Start playing the video
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child: const Text(
                    'Replay',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    submitVideoFile(widget.videoPath);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff429bb8),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  Future<void> submitVideoFile(String videoPath) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Invalid Token'),
          content: const Text('Please log in again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    try {
      var uri = Uri.parse('https://dev.bsure.live/v2/will/video');
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        'Authorization': token,
        'Content-Type': 'multipart/form-data',
      });

      if (kIsWeb) {
        var fileBytes = await File(videoPath).readAsBytes();
        var file = http.MultipartFile.fromBytes('video', fileBytes,
            filename: 'video.mp4');
        request.files.add(file);
      } else {
        var file = await http.MultipartFile.fromPath('video', videoPath);
        request.files.add(file);
      }

      // Send the request
      var response = await request.send();

      // Check if the response is successful
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = utf8.decode(responseData);

        // Log the raw response for debugging
        print('Response: $responseString');

        // Decode the JSON response
        var jsonResponse = json.decode(responseString);

        // Check if the video was uploaded successfully
        if (jsonResponse['isValid'] == true) {
          DisplayUtils.showToast('Video uploaded successfully');
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DigitalWillGetWitness(),
            ),
          );
        } else {
          DisplayUtils.showToast(
              'Failed to upload video: ${jsonResponse['message']}');
        }
      } else {
        // Handle non-200 responses
        DisplayUtils.showToast(
            'Failed to upload video: Server returned ${response.statusCode}');
      }
    } catch (e) {
      // Log the exception for debugging
      print('Error uploading video: $e');
      DisplayUtils.showToast('Error uploading video: $e');
    }
  }
}
