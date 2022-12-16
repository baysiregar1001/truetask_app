import 'package:flutter/material.dart';
import 'package:truetask_app/models/workspace.dart';
import 'package:truetask_app/services/workspace_service.dart';
import 'package:truetask_app/utils/routes.dart';

class Team extends StatefulWidget {
  const Team({Key? key}) : super(key: key);

  @override
  State<Team> createState() => _TeamState();
}

class _TeamState extends State<Team> {
  final getUser = FetchWorkspace();
  int currentIndex = 0;

  // List<String> namaTeam = [
  //   "Nur Imro'atus Solikha",
  //   "Muhammad Baihaqi Siregar",
  //   "Imam Agus Faisal",
  //   "Angga Raafdika",
  //   "Tio Triananda"
  // ];
  // List<String> emailTeam = [
  //   "icha@gmail.com",
  //   "baihaqi@gmail.com",
  //   "imam@gmail.com",
  //   "angga@gmail.com",
  //   "tio@gmail.com"
  // ];

  @override
  Widget build(BuildContext context) {
    final workspaceId = ModalRoute.of(context)!.settings.arguments as String;
    // print(workspaceId);
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
      body: FutureBuilder<Workspace?>(
        future: getUser.getWorkspaceById(id: workspaceId),
        builder: (context, snapshot) {
          // print(snapshot.data);
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final data = snapshot.data!.userWorkspace;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                // print(data);
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(data[index].userId.toString()),
                  ),
                  title: Text(
                    data[index].username!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Email: ${data[index].email}",
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                      tooltip: 'Remove this user',
                      onPressed: () => getUser
                          .removeTeam(
                              workspaceId: workspaceId,
                              email: data[index].email!)
                          .then((value) => setState(
                                () {},
                              )),
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          } else {
            return const Center(child: Text("No team "));
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.pushNamed(context, createTeamPage, arguments: workspaceId)
              .then((value) => setState(() {}));
        },
        label: const Text("Invite Team"),
        icon: const Icon(
          Icons.add_box,
        ),
      ),
    );
  }
}
