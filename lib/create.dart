import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class CreateBerita extends StatefulWidget {
  const CreateBerita({super.key});

  @override
  State<CreateBerita> createState() => _Createpemilikstate();
}

class _Createpemilikstate extends State<CreateBerita> {
  var Nama_PemilikController = TextEditingController();
  var No_HPController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Berita")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: Nama_PemilikController,
              decoration: InputDecoration(hintText: "Nama_Pemilik Berita"),
            ),
            TextField(
              controller: No_HPController,
              decoration: InputDecoration(hintText: "No_HP Berita"),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
                onPressed: () async {
                  Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  };
                  var response = await http.post(
                      Uri.parse('http://localhost:1337/api/pemiliks'),
                      headers: headers,
                      body: jsonEncode({
                        "data": {
                          "Nama_Pemilik": Nama_PemilikController.text,
                          "No_HP": No_HPController.text,
                        }
                      }));
                },
                child: Text("Simpan"))
          ],
        ),
      ),
    );
  }
}
