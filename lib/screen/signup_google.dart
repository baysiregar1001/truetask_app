import 'package:flutter/material.dart';
import 'package:truetask_app/screen/dashboard/dashboard_page.dart';
import 'package:truetask_app/viewmodels/auth_user.dart';

class SignGoogle extends StatelessWidget {
  const SignGoogle({super.key, required this.signText});

  final String signText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          signText,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              shape: Border.all(color: Colors.black12),
              child: SizedBox(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 8,
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icon/google_logo.png'),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Sign up with google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 1),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Choose an Account',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'To continue to true task',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/image/Avatar2.png'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'tester2',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('betatester2@gmail.com')
                              ],
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                        child: Divider(thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: Row(
                          children: const [
                            Icon(Icons.account_circle_outlined),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Use another account',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  AuthUser().login(
                      email: "betatester2@gmail.com", password: "asdasd");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const DashboardPage(),
                  ));
                },
                child: Text(signText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
