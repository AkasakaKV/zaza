import 'package:flutter/material.dart';

class ecare extends StatelessWidget {
  const ecare({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Service"),
        backgroundColor: Color.fromARGB(255, 250, 27, 27),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text("ini adalah CostumerService "),
          ],
        ),
      ),
    );
  }
}
