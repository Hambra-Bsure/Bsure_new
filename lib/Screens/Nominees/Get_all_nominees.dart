import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../LoginScreen.dart';
import '../Utils/DisplayUtils.dart';
import 'package:Bsure_devapp/Screens/Repositary/Models/Nominee_models/Get_Nominee_response.dart';
import 'package:Bsure_devapp/Screens/Nominees/Add_nominee.dart';
import 'Edit_nominee.dart'; // Import the NomineeEdit screen

class GetNomineeScreen extends StatefulWidget {
  const GetNomineeScreen({super.key});

  @override
  _GetNomineeScreenState createState() => _GetNomineeScreenState();
}

class _GetNomineeScreenState extends State<GetNomineeScreen> {
  List<Nominees> nominees = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");

    if (token == null) {
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

    final url = Uri.parse('https://dev.bsure.live/v2/nominee/all');
    final response = await http.get(url, headers: {
      "Authorization": token.toString(),
      "ngrok-skip-browser-warning": "69420",
    });

    if (response.statusCode == 200) {
      final data = GetNomineeResponse.fromJson(jsonDecode(response.body));
      if (data.success!) {
        setState(() {
          nominees = data.nominees!;
          isLoading = false;
        });
      } else {
        // Handle error case
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to fetch bank accounts'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Nominee details',
            style: TextStyle(color: Colors.white)),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : nominees.isNotEmpty
              ? ListView.builder(
                  itemCount: nominees.length,
                  itemBuilder: (context, index) {
                    final nominee = nominees[index];
                    var age = int.tryParse(nominee.age?.toString() ?? '');
                    var showGuardianInfo = age != null && age < 18;
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () async {
                                    final updatedNominee = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => NomineeEditScreen(
                                          nominee: nominee,
                                        ),
                                      ),
                                    );
                                    if (updatedNominee != null) {
                                      setState(() {
                                        nominees[index] = updatedNominee;
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                            Text('First Name: ${nominee.firstName}'),
                            const SizedBox(height: 8.0),
                            Text('Last Name: ${nominee.lastName ?? ""}'),
                            const SizedBox(height: 8.0),
                            Text(
                                'Mobile Number: ${nominee.mobileNumber ?? ""}'),
                            const SizedBox(height: 8.0),
                            Text('Age: ${nominee.age ?? ""}'),
                            const SizedBox(height: 8.0),
                            if (showGuardianInfo) ...[
                              Text(
                                'Guardian name: ${nominee.guardianName}',
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Guardian mobile no: ${nominee.guardianMobileNumber}',
                              ),
                            ],
                            const SizedBox(height: 8.0),
                            Text('Email: ${nominee.email ?? ""}'),
                            const SizedBox(height: 8.0),
                            Text('Relation: ${nominee.relation ?? ""}'),
                            const SizedBox(height: 8.0),
                            Text('Address: ${nominee.address ?? ""}'),
                            // SizedBox(height: 8.0),
                            // Text('Image: ${nominee.image ?? ""}'),
                            const SizedBox(height: 8.0),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Delete Nominee?"),
                                        content: const Text(
                                            "Are you sure you want to delete this Nominee?"),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text(
                                              "Cancel",
                                              style: TextStyle(
                                                color: Color(0xff429bb8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text(
                                              "Confirm",
                                              style: TextStyle(
                                                color: Colors.red,
                                              ),
                                            ),
                                            onPressed: () async {
                                              Navigator.of(context).pop();
                                              deleteNominee(index);
                                              setState(() {
                                                nominees.removeAt(index);
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff429bb8),
                                ),
                                child: const Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'No nominees found',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNominee(),
            ),
          ).then((_) => getData()); // Refresh data after adding nominee
        },
        label: const Text(
          'Add New',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        icon: const Icon(
          Icons.add,
          size: 24,
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff429bb8),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Future<void> deleteNominee(int index) async {
    final nominee = nominees[index];
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

    final dio = Dio();
    dio.options.headers["Authorization"] = token;

    try {
      final response = await dio.delete(
        'https://dev.bsure.live/v2/nominee/${nominee.id}',
      );

      if (response.statusCode == 200) {
        DisplayUtils.showToast("Nominee deleted successfully");
      }
    } catch (e) {
      DisplayUtils.showToast("Failed to delete nominee. Please try again.");
    }
  }
}
