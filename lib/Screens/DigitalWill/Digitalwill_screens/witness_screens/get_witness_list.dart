
import 'package:Bsure_devapp/Screens/Repositary/Models/Digital_will/digitalwill_get_res.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Repositary/Retrofit/node_api_client.dart';
import 'DigitalWitness1.dart';
import 'Edit_witness.dart';

class DigitalWillGetWitness extends StatefulWidget {
  @override
  _DigitalWillGetWitnessState createState() => _DigitalWillGetWitnessState();
}

class _DigitalWillGetWitnessState extends State<DigitalWillGetWitness> {
  late Future<DigitalwillgetResponse> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<DigitalwillgetResponse> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      throw Exception('Token is not available.');
    }

    Dio dio = Dio();
    dio.options.headers["Authorization"] = token; // Ensure Bearer token format

    NodeClient nodeClient = NodeClient(dio);

    try {
      var response = await nodeClient.digitalWillGetData(token);

      print("Response received:");
      print(response);

      // Ensure response data is parsed correctly
      return response;
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 403) {
          // Handle 403 error
          print("Error: User does not have permission.");
          throw Exception('User does not have permission.');
        } else if (e.response?.statusCode == 404) {
          // Handle 404 error
          print("Error: Assets not found.");
          throw Exception('Assets not found.');
        } else {
          // Handle other errors
          print(
              "Error: Failed to fetch data. Status code: ${e.response?.statusCode}");
          throw Exception('Failed to fetch data. Please try again.');
        }
      } else {
        // Handle other exceptions
        print("Error: An unexpected error occurred: $e");
        throw Exception('An unexpected error occurred. Please try again.');
      }
    }
  }

  void _editWitness(Witness witness) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WitnessEditScreen(witness: witness,),
      ),
    );
  }

  void _deleteWitness(int index, List<Witness> witnesses) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Are you sure you want to delete this witness?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != null && confirmed) {
      // Proceed with deletion
      try {
        final witnessId =
            witnesses[index].id; // Accessing witness ID from the provided list
        const token =
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIsInVzZXJNb2JpbGUiOiI4MzI4NTY0NjgzIiwiaWF0IjoxNzE2NjM1NzI4LCJleHAiOjE3MTcyNDA1Mjh9.qvdxr2kZ1T8793C-4l48UlAbq_mrD6x5ovMXafFIXAs";
        final response = await Dio().delete(
          'http://43.205.12.154:8080/v2/will/witness/$witnessId',
          options: Options(
            headers: {'Authorization': token},
          ),
        );

        // Check response status
        if (response.statusCode == 200) {
          // Deletion successful
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Witness deleted successfully.'),
          ));
          // Reload data after deletion
          setState(() {
            _futureData = fetchData();
          });
        } else {
          // Handle other status codes
          throw Exception(
              'Failed to delete witness. Status code: ${response.statusCode}');
        }
      } catch (e) {
        // Handle errors
        print('Error deleting witness: $e');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Failed to delete witness. Please try again.'),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text('Digital Will Witness',
            style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<DigitalwillgetResponse>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found.'));
          } else {
            final data = snapshot.data!;
            return Stack(
              children: [
                ListView.builder(
                  itemCount: data.witness.length,
                  itemBuilder: (context, index) {
                    final witness = data.witness[index];
                    return Card(
                      margin: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: Text(
                            'Name: ${witness.firstName} ${witness.lastName}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mobile: ${witness.mobile}'),
                            Text('Address: ${witness.address}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () =>
                                  _editWitness(witness),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _deleteWitness(index,
                                  data.witness), // Pass the list of witnesses
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                if (data.witness.length < 2)
                  Positioned(
                    bottom: 16.0,
                    right: 16.0,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DigitalWitnessScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text('Add New',
                          style: TextStyle(color: Colors.white)),
                      backgroundColor: const Color(0xff429bb8),
                      foregroundColor: Colors.white, // Set the foreground color
                    ),
                  ),
              ],
            );
          }
        },
      ),
    );
  }
}
