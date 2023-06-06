import 'package:flutter/material.dart';

class booking extends StatelessWidget {
  const booking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Booking"),
        backgroundColor: Color.fromARGB(255, 250, 27, 27),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("ini adalah Service "),
          ],
        ),
      ),
    );
  }
}
