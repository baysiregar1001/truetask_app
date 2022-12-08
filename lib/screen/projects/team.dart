import 'package:flutter/material.dart';
import 'package:truetask_app/utils/routes.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  // @override
  // void initState(){
  //   super.initState();
  // }
  int currentIndex = 0;

  List<String> namaTeam = [
    "Nur Imro'atus Solikha",
    "Muhammad Baihaqi Siregar",
    "Imam Agus Faisal",
    "Angga Raafdika",
    "Tio Triananda"
  ];
  List<String> emailTeam = [
    "icha@gmail.com",
    "baihaqi@gmail.com",
    "imam@gmail.com",
    "angga@gmail.com",
    "tio@gmail.com"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Team",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pushReplacement(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => (ProjectDetailsPage()),
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: ListView.builder(
        itemCount: namaTeam.length,
        itemBuilder: (context, idx) {
          return ListTile(
            leading: CircleAvatar(
              // backgroundImage: AssetImage("assets/profile2.jpg"),
              child: Text(namaTeam[idx][0]),
            ),
            title: Text(
              namaTeam[idx],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "Email: ${emailTeam[idx]}",
              style: const TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, createTeamPage);
        },
        label: const Text("Create Team"),
        icon: const Icon(
          Icons.add_box,
        ),
      ),
    );
  }
}
