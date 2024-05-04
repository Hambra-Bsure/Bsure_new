import 'package:flutter/material.dart';
import 'my_button.dart';

class Layout extends StatelessWidget {
  const Layout({Key? key,  required this.childWidget, required this.onTap}) : super(key: key);


  final Widget childWidget;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF00436A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Asset Distribution",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: childWidget,
              ),
              const SizedBox(height: 20),
              SaveButton(text: "Save", onTap: onTap),
            ],
          ),
        ),
      ),
    );
  }
}