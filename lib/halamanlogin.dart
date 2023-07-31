import 'package:flutter/material.dart';
import 'package:zaza/halamanutama.dart';

class DesainHalamanLogin extends StatefulWidget {
  const DesainHalamanLogin({super.key});

  @override
  State<DesainHalamanLogin> createState() => _DesainHalamanLoginState();
}

class _DesainHalamanLoginState extends State<DesainHalamanLogin> {
  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: fromKey,
          child: Center(
            child: Container(
              width: 280,
              height: 250,
              child: Card(
                elevation: 10,
                shadowColor: Color.fromARGB(255, 15, 15, 15),
                color: Color.fromARGB(255, 250, 27, 27),
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: cUser,
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: " Input Username",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "User Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: cPass,
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: " Input Password",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            String tUser = "admin";
                            String tPass = "admin";
                            if (fromKey.currentState!.validate()) {
                              if (cUser.text == tUser && cPass.text == tPass) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const DesainHalamanUtama(),
                                  ),
                                );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Login Confirmation"),
                                        content:
                                            Text("User or Password Incorrect"),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                cUser.text = "";
                                                cPass.text = "";
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK"))
                                        ],
                                      );
                                    });
                              }
                            }
                          },
                          child: Text("Login"))
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
