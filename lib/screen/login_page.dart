import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/screen/signup_google.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/utils/validator.dart';
import 'package:truetask_app/viewmodels/auth_user.dart';
import 'package:truetask_app/widgets/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validator = Validator();

  bool _isLoading = false;
  bool _obscureText = true;
  bool _rememberMe = false;

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkRememberMe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/image/Truetask.png')),
            const SizedBox(height: 42),
            const Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 42,
              ),
            ),
            const SizedBox(height: 42),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputTextField(
                    prefixIcon: const Icon(Icons.mail_outline),
                    controller: _emailController,
                    validator: (value) =>
                        _validator.validateEmail(email: value!),
                    hintText: 'enter your email',
                    obscureText: false,
                  ),
                  const SizedBox(height: 12),
                  InputTextField(
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: _passwordController,
                    validator: (value) =>
                        _validator.validatePassword(password: value!),
                    hintText: 'enter your password',
                    obscureText: _obscureText,
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _obscureText = !_obscureText),
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _rememberMe = !_rememberMe;
                        // print(_rememberMe);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          _rememberMe
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 4),
                        const Text("Remember me")
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _login();
                        }
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            const SignGoogle(signText: 'Sign In'),
                      )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 24,
                              width: 24,
                              child:
                                  Image.asset('assets/icon/google_logo.png')),
                          const SizedBox(width: 16),
                          const Text(
                            "Sign In With Google",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(forgetPasswordPage),
                    child: const Text("Forgot Password"),
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't Have Account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context)
                            .pushReplacementNamed(registerPage),
                        child: const Text("Create One"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _login() async {
    setState(() {
      _isLoading = true;
    });

    final res = await AuthUser().login(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      if (_rememberMe == true) {
        localStorage.setString('rememberMe', _emailController.text);
      } else {
        localStorage.remove('rememberMe');
      }
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(dashboardPage);
    } else {
      final body = jsonDecode(res.body);
      _showMsg(body['info']);
    }

    setState(() {
      _isLoading = false;
    });
  }

  _checkRememberMe() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final email = localStorage.getString('rememberMe');
    if (email != null) {
      setState(() {
        _emailController.text = email;
      });
    }
  }
}
