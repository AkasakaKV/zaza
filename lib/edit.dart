import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditPage extends StatefulWidget {
  const EditPage(
      {super.key,
      required this.Nama_Pemilik,
      required this.No_HP,
      required this.id});
  final String Nama_Pemilik;
  final String No_HP;
  final int id;
  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var Nama_PemilikController = TextEditingController();
  var No_HPController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Nama_PemilikController.text = widget.Nama_Pemilik;
    No_HPController.text = widget.No_HP;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Data")),
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
                  var id = widget.id;
                  Map<String, String> headers = {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                  };
                  var response = await http.put(
                      Uri.parse('http://localhost:1337/api/pemiliks/$id'),
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
