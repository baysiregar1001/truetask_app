import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:truetask_app/services/workspace_service.dart';

class CreateTeam extends StatefulWidget {
  const CreateTeam({Key? key}) : super(key: key);

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final workspaceId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Form Create Team",
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
        //         builder: (context) => (Team()),
        //       ),
        //     );
        //   },
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        // ),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Image.asset("assets/image/team2.png"),
                  const SizedBox(
                    height: 30,
                  ),
                  // const Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "Name Member",
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.bold),
                  //     )),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextField(
                  //   maxLines: 1,
                  //   controller: nameController,
                  //   decoration: InputDecoration(
                  //     filled: true,
                  //     fillColor: const Color.fromARGB(255, 234, 234, 234),
                  //     hintText: "Input name member",
                  //     focusedBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: const BorderSide(
                  //         color: Colors.white,
                  //         width: 1,
                  //       ),
                  //     ),
                  //     enabledBorder: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //       borderSide: const BorderSide(
                  //         color: Colors.white,
                  //         width: 1,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    maxLines: 1,
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromARGB(255, 234, 234, 234),
                      hintText: "Input email",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      onPressed: () =>
                          _inviteTeam(workspaceId, emailController.text),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text("Create New Team"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _inviteTeam(workspaceId, email) async {
    setState(() {
      _isLoading = true;
    });
    final res = await FetchWorkspace().inviteTeam(workspaceId, email);
    if (res.statusCode == 200) {
      if (!mounted) return;
      Navigator.pop(context);
    } else {
      final body = jsonDecode(res.body);
      if (!mounted) return;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(body['info'])));
    }
    setState(() {
      _isLoading = false;
    });
  }
}
