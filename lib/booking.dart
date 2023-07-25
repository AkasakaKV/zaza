import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class _booking extends State<MyHomePage> {
  int _counter = 0;
  int total = 0;
  var dataJson;

  void _getDataFromStrapi() async {
    var response =
        await http.get(Uri.parse("http://localhost:1337/api/tabel-mahasiswas"));
    dataJson = await jsonDecode(response.body);
    print(dataJson["meta"]["pagination"]["total"]);
    setState(() {
      total = dataJson["meta"]["pagination"]["total"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: total,
          itemBuilder: (context, index) {
            return ListTile(
              title:
                  Text(dataJson["data"][index]["attributes"]["Nama_mahasiswa"]),
              leading: Icon(Icons.add_home),
              trailing: IconButton(
                  onPressed: () async {
                    var id = dataJson["data"][index]["id"];
                    var response = await http.delete(Uri.parse(
                        "http://localhost:1337/api/tabel-mahasiswas/$id"));
                    _getDataFromStrapi();
                  },
                  icon: Icon(Icons.delete)),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDataFromStrapi,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
