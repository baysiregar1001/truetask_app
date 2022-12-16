import 'package:flutter/material.dart';

class Notif extends StatefulWidget {
  const Notif({super.key});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Notification',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: SizedBox(
                height: 85,
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.square, color: Colors.blueAccent),
                    title: Text(
                      'Slicing Ui Figma To Flutter',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Overdue Yesterday',
                      style: TextStyle(color: Colors.black54),
                    ),
                    trailing: Text(
                      '1d',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 3,
              child: SizedBox(
                height: 85,
                width: MediaQuery.of(context).size.width,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListTile(
                    leading: Icon(Icons.square, color: Colors.green),
                    title: Text(
                      'Slicing Ui Figma To Flutter',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Overdue Yesterday',
                      style: TextStyle(color: Colors.black54),
                    ),
                    trailing: Text(
                      '1d',
                      style: TextStyle(fontSize: 15),
                    ),
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
