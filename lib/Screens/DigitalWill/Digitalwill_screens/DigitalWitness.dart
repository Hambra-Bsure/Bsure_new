import 'package:flutter/material.dart';

class DigitalWitnessScreen extends StatefulWidget {
  const DigitalWitnessScreen({super.key});

  @override
  _DigitalWitnessScreenState createState() => _DigitalWitnessScreenState();
}

class _DigitalWitnessScreenState extends State<DigitalWitnessScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00436A),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Get2 witness",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _controller1,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'Witness 1 Name (Can\'t be nominees)',
                labelStyle: TextStyle(color: Colors.white), // Label color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when enabled
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller2,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'Age (Validation: 21+ Years)',
                labelStyle: TextStyle(color: Colors.white), // Label color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when enabled
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller3,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'Phone No',
                labelStyle: TextStyle(color: Colors.white), // Label color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when enabled
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller4,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'Email id',
                labelStyle: TextStyle(color: Colors.white), // Label color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when enabled
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller5,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'Otp',
                labelStyle: TextStyle(color: Colors.white), // Label color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when enabled
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller6,
              style: const TextStyle(color: Colors.white), // Text color
              decoration: const InputDecoration(
                labelText: 'sam',
                labelStyle: TextStyle(color: Colors.white), // Label color
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when focused
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff429bb8), // Border color when enabled
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Do something with the values entered in the text fields
                String field1Value = _controller1.text;
                String field2Value = _controller2.text;
                String field3Value = _controller3.text;
                String field4Value = _controller4.text;
                String field5Value = _controller5.text;
                String field6Value = _controller6.text;

                // Example: Print the values to the console
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
