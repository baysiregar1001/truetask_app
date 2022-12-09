import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/services/api_service.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/utils/validator.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30),
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
                      suffixIcon: const SizedBox()),
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
                        print(_rememberMe);
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
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed(forgetPasswordPage),
                    child: const Text("Forgot Password"),
                  ),
                  const SizedBox(height: 48),
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
    dynamic data = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };
    var res = await ApiService().auth(data, '/auth/login');
    var body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', jsonEncode(body['data']['access_token']));
      localStorage.setString('user', jsonEncode(body['data']['user']));
      if (_rememberMe == true) {
        localStorage.setBool('rememberMe', true);
      }
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(dashboardPage);
      }
    } else {
      _showMsg(body['info']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
