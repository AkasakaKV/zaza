import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'create.dart';
import 'edit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Booking',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 250, 27, 27)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Service Booking'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int totalData = 0;
  var dataJson;

  void _getDataFromStrapi() async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    var response = await http
        .get(Uri.parse('http://localhost:1337/api/pemiliks'), headers: headers);

    dataJson = jsonDecode(response.body);

    setState(() {
      totalData = dataJson["meta"]["pagination"]["total"];
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDataFromStrapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: totalData,
          itemBuilder: (data, index) {
            return ListTile(
              onTap: () {
                var Nama_Pemilik =
                    dataJson["data"][index]["attributes"]["Nama_Pemilik"];
                var No_HP = dataJson["data"][index]["attributes"]["No_HP"];
                var id = dataJson["data"][index]["id"];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditPage(
                            Nama_Pemilik: Nama_Pemilik,
                            No_HP: No_HP,
                            id: id,
                          )),
                );
              },
              leading: Icon(Icons.add_call),
              trailing: IconButton(
                  onPressed: () async {
                    var id = dataJson["data"][index]["id"];
                    Map<String, String> headers = {
                      'Content-Type': 'application/json',
                      'Accept': 'application/json'
                    };
                    var response = await http.delete(
                        Uri.parse('http://localhost:1337/api/pemiliks/$id'),
                        headers: headers);
                    _getDataFromStrapi();
                  },
                  icon: Icon(Icons.delete)),
              title:
                  Text(dataJson["data"][index]["attributes"]["Nama_Pemilik"]),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateBerita()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
