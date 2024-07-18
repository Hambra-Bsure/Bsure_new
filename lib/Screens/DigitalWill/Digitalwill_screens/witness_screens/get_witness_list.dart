import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../../../Repositary/Models/Digital_will/witness_get_res.dart';
import '../../../Repositary/Retrofit/node_api_client.dart';
import 'DigitalWitness1.dart';
import 'Edit_witness.dart';
import 'Executor.dart';
import 'willpdf_download.dart';

class DigitalWillGetWitness extends StatefulWidget {
  @override
  _DigitalWillGetWitnessState createState() => _DigitalWillGetWitnessState();
}

class _DigitalWillGetWitnessState extends State<DigitalWillGetWitness> {
  late Future<WitnessgetResponse> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<WitnessgetResponse> fetchData() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      throw Exception('Token is not available.');
    }

    Dio dio = Dio();
    dio.options.headers["Authorization"] = '$token';

    NodeClient nodeClient = NodeClient(dio);

    try {
      var response = await nodeClient.getWitnessData(token);
      return response;
    } catch (e) {
      if (e is DioError) {
        switch (e.response?.statusCode) {
          case 403:
            throw Exception('User does not have permission.');
          case 404:
            throw Exception('Assets not found.');
          default:
            throw Exception('Failed to fetch data. Please try again.');
        }
      } else {
        throw Exception('An unexpected error occurred. Please try again.');
      }
    }
  }

  Future<bool> _checkExecutorExists() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (token == null || token.isEmpty) {
      throw Exception('Token is not available.');
    }

    const url = 'https://dev.bsure.live/v2/will/executor';

    try {
      final response = await Dio().get(
        url,
        options: Options(headers: {'Authorization': token}),
      );

      if (response.statusCode == 200) {
        final executorData = response.data;
        return executorData != null;
      } else {
        print('Failed to check executor data');
        return false;
      }
    } catch (e) {
      print('Error checking executor data: $e');
      return false;
    }
  }

  Future<void> _checkAndNavigate() async {
    try {
      final data = await fetchData();
      final executorExists = await _checkExecutorExists();

      if (data.witnesses.length >= 2 && executorExists) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PdfDownloadScreen()),
        );
      } else {
        _showOptionsDialog(data.witnesses.length, executorExists);
      }
    } catch (e) {
      print('Error in navigation check: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error in navigation check. Please try again.'),
      ));
    }
  }

  void _showOptionsDialog(int witnessCount, bool executorExists) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (witnessCount < 2)
                ListTile(
                  leading: const Icon(Icons.person_add),
                  title: const Text('Add witness'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DigitalWitnessScreen()),
                    );
                  },
                ),
              // if (!executorExists)
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Add executor'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WillExecutorScreen()),
                  );
                },
              ),
              if (witnessCount >= 2)
                ListTile(
                  leading: const Icon(Icons.download),
                  title: const Text('Will pdf download'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfDownloadScreen()),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _editWitness(Witness witness) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WitnessEditScreen(witness: witness),
      ),
    );

    if (result == true) {
      // Re-fetch the data if the update was successful
      setState(() {
        _futureData = fetchData();
      });
    }
  }

  Future<void> _deleteWitness(int index, List<Witness> witnesses) async {
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
      try {
        final witnessId = witnesses[index].id;
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString("token");

        final response = await Dio().delete(
          'https://dev.bsure.live/v2/will/witness/$witnessId',
          options: Options(
            headers: {'Authorization': '$token'},
          ),
        );

        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Witness deleted successfully.'),
          ));
          setState(() {
            _futureData = fetchData();
          });
        } else {
          throw Exception(
              'Failed to delete witness. Status code: ${response.statusCode}');
        }
      } catch (e) {
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
        title: const Text('Digitalwill witness',
            style: TextStyle(color: Colors.white)),
      ),
      body: FutureBuilder<WitnessgetResponse>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.witnesses.isEmpty) {
            return const Center(child: Text('No witness details found.'));
          } else {
            final data = snapshot.data!;
            return buildWitnessList(data.witnesses);
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _checkAndNavigate,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Add New', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
    );
  }

  Widget buildWitnessList(List<Witness> witnesses) {
    return ListView.builder(
      itemCount: witnesses.length,
      itemBuilder: (context, index) {
        final witness = witnesses[index];
        return Card(
          margin: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text('Name: ${witness.firstName} ${witness.lastName}'),
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
                  onPressed: () => _editWitness(witness),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteWitness(index, witnesses),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
