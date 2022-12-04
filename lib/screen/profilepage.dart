import 'package:flutter/material.dart';
import 'package:truetask_app/models/user.dart';
import 'package:truetask_app/services/fetchUserProfile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future<User?> user = FetchProfile().getProfile();
    return Scaffold(
      body: FutureBuilder<User?>(
        future: user,
        builder: (context, snapshot) {
          final data = snapshot.data!;
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.username!),
                  Text(data.firstname!),
                  Text(data.lastname!),
                  Text(data.phoneNumber!),
                  Text(data.email!),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
