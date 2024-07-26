import 'package:Bsure_devapp/Screens/DigitalWill/Digitalwill_screens/witness_screens/Executor/AddExecutor.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Repositary/Models/Digital_will/Subscriptions/GetExecutorResponse.dart';
import 'EditExecutor.dart';

class GetExecutor extends StatefulWidget {
  @override
  _GetExecutorState createState() => _GetExecutorState();
}

class _GetExecutorState extends State<GetExecutor> {
  String? _message;
  bool _loading = true;
  ExecutorResponse? _executorResponse;
  bool _executorExists = false;

  @override
  void initState() {
    super.initState();
    _fetchExecutor();
  }

  Future<void> _fetchExecutor() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isEmpty) {
      setState(() {
        _loading = false;
        _message = 'Token not found';
      });
      return;
    }

    try {
      final dio = Dio();
      final response = await dio.get(
        'http://43.205.12.154:8080/v2/will/executor',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        final executorResponse = ExecutorResponse.fromJson(response.data);
        setState(() {
          _loading = false;
          _executorResponse = executorResponse;
          _executorExists = executorResponse.executor != null;
        });
      } else {
        setState(() {
          _loading = false;
          _message = 'Failed to fetch executor';
        });
      }
    } catch (e) {
      setState(() {
        _loading = false;
        _message = 'Error: $e';
      });
    }
  }

  Widget _buildExecutorCard() {
    if (_executorResponse?.executor == null) {
      return const Text(
        'Executor details not available',
        style: TextStyle(fontSize: 16),
      );
    }

    final executor = _executorResponse!.executor!;
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditExecutor(executor: executor),
                  ),
                ).then((_) {
                  _fetchExecutor(); // Refresh the data after returning from the edit executor screen
                });
              },
            ),
            const SizedBox(width: 8),
            _buildLabelValueRow('First Name:', executor.firstName ?? 'N/A'),
            const SizedBox(height: 8),
            _buildLabelValueRow('Last Name:', executor.lastName ?? 'N/A'),
            const SizedBox(height: 8),
            _buildLabelValueRow('Father Name:', executor.fatherName ?? 'N/A'),
            const SizedBox(height: 8),
            _buildLabelValueRow('Mobile:', executor.mobile ?? 'N/A'),
            const SizedBox(height: 8),
            _buildLabelValueRow('Age:', executor.age?.toString() ?? 'N/A'),
            const SizedBox(height: 8),
            _buildLabelValueRow('Religion:', executor.religion ?? 'N/A'),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: _showDeleteConfirmationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff429bb8),
                ),
                child: const Text('Delete', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this executor?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _deleteExecutor();
              },
              child: const Text('Delete', style: TextStyle(color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteExecutor() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';


    if (token.isEmpty) {
      setState(() {
        _message = 'Token not found';
      });
      return;
    }

    try {
      final dio = Dio();
      final response = await dio.delete(
        'http://43.205.12.154:8080/v2/will/executor',
        options: Options(
          headers: {
            'Authorization': token,
          },
        ),
      );

      if (response.statusCode == 200) {
        _message = 'Executor deleted successfully';
        setState(() {
          //_message = 'Executor deleted successfully';
          _executorResponse = null; // Clear the executor response
          _executorExists = false; // Update the executor existence status
        });
      } else {
        setState(() {
          _message = 'Failed to delete executor';
        });
      }
    } catch (e) {
      setState(() {
        _message = 'Error: $e';
      });
    }
  }

  Widget _buildLabelValueRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff429bb8),
        title: const Text(
          'Get Executor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _loading
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : _executorExists
          ? SingleChildScrollView(
        padding: const EdgeInsets.all(5.0),
        child: _buildExecutorCard(),
      )
          : const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'No executor found for this user/will',
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      floatingActionButton: _executorExists
          ? null
          : FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WillExecutorScreen(),
            ),
          ).then((_) {
            _fetchExecutor(); // Refresh the data after returning from the add executor screen
          });
        },
        icon: const Icon(Icons.add,color: Colors.white),
        label: const Text('Add Executor',style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff429bb8),
      ),
    );
  }
}
