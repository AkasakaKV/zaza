import 'package:flutter/material.dart';
import 'package:zaza/dealer.dart';
import 'package:zaza/booking.dart';
import 'package:zaza/profile.dart';
import 'package:zaza/ecare.dart';

class DesainHalamanUtama extends StatefulWidget {
  const DesainHalamanUtama({super.key});

  @override
  State<DesainHalamanUtama> createState() => _DesainHalamanUtamaState();
}

class _DesainHalamanUtamaState extends State<DesainHalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("AMT Motoworks"),
        backgroundColor: Color.fromARGB(255, 250, 27, 27),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "Perry Admin",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text("Akasakakv@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/media/Fx8vNzZaMAA14pK?format=jpg&name=large"),
              ),
              decoration:
                  new BoxDecoration(color: Color.fromARGB(255, 250, 27, 27)),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text("Change Password"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Exit"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
                splashColor: Color.fromARGB(255, 43, 99, 255),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.phone_android,
                        size: 70.0,
                      ),
                      Text("Service Booking",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profile()));
                },
                splashColor: Color.fromARGB(255, 43, 99, 255),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.account_box,
                        size: 70.0,
                      ),
                      Text("User Profile", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ecare()));
                },
                splashColor: Color.fromARGB(255, 43, 99, 255),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.contact_support,
                        size: 70.0,
                      ),
                      Text("E-Care", style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const dealer()));
                },
                splashColor: Color.fromARGB(255, 43, 99, 255),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.garage,
                        size: 70.0,
                      ),
                      Text("Dealer Location",
                          style: new TextStyle(fontSize: 17.0))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
