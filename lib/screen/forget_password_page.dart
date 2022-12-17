import 'package:flutter/material.dart';
import 'package:truetask_app/utils/validator.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final _emailController = TextEditingController();
  final _validator = Validator();
  final _key = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 96),
            const Center(
              child: Text(
                "Forgot Password?",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                "Please enter  your email address to\nrecieve a verification code",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Email Address",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextFormField(
              key: _key,
              controller: _emailController,
              validator: (value) => _validator.validateEmail(email: value!),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline),
                hintText: 'enter your email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 3, color: Colors.blue),
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: SizedBox(
                height: 48,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {}
                  },
                  child: const Text(
                    "Send Verification Code",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
