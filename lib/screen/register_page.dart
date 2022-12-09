import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truetask_app/services/api_service.dart';
import 'package:truetask_app/utils/routes.dart';
import 'package:truetask_app/utils/validator.dart';
import 'package:truetask_app/widgets/input_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validator = Validator();

  bool _obscureText = true;
  bool _obscureText2 = true;

  bool _isLoading = false;

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset('assets/image/Truetask.png')),
            const SizedBox(height: 42),
            const Text(
              "Let’s Get Started",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const Text(
              "Create an account to continue",
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: InputTextField(
                        prefixIcon: const Icon(Icons.person_outline),
                        controller: _firstnameController,
                        validator: (value) =>
                            _validator.validateField(field: value!),
                        hintText: 'first name',
                      )),
                      const SizedBox(width: 4),
                      Expanded(
                        child: InputTextField(
                          controller: _lastnameController,
                          validator: (value) =>
                              _validator.validateField(field: value!),
                          hintText: 'last name',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  InputTextField(
                    prefixIcon: const Icon(Icons.mail_outline),
                    controller: _emailController,
                    validator: (value) =>
                        _validator.validateEmail(email: value!),
                    hintText: 'enter your email',
                    obscureText: false,
                    suffixIcon: const SizedBox(),
                  ),
                  const SizedBox(height: 12),
                  InputTextField(
                    prefixIcon: const Icon(Icons.phone_enabled_outlined),
                    controller: _phoneController,
                    validator: (value) =>
                        _validator.validateField(field: value!),
                    hintText: 'enter your phone number',
                    obscureText: false,
                    suffixIcon: const SizedBox(),
                  ),
                  const SizedBox(height: 12),
                  InputTextField(
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: _passwordController,
                    validator: (value) =>
                        _validator.validateField(field: value!),
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
                  const SizedBox(height: 12),
                  InputTextField(
                    prefixIcon: const Icon(Icons.lock_outline),
                    controller: _confirmPasswordController,
                    validator: (value) =>
                        _validator.validateField(field: value!),
                    hintText: 'enter your password',
                    obscureText: _obscureText2,
                    suffixIcon: IconButton(
                      onPressed: () =>
                          setState(() => _obscureText2 = !_obscureText2),
                      icon: Icon(
                        _obscureText2 ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _register();
                        }
                      },
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      SizedBox(width: 16),
                      Text(
                        "You can connect with",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      SizedBox(width: 16),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
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
                            "Sign Up With Google",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushReplacementNamed(loginPage),
                          child: const Text("Sign in"))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _register() async {
    setState(() {
      _isLoading = true;
    });
    dynamic data = {
      "first_name": _firstnameController.text,
      "last_name": _lastnameController.text,
      "username": _firstnameController.text + _lastnameController.text,
      "email": _emailController.text,
      "phone_number": _phoneController.text,
      "password": _passwordController.text,
      "password_confirmation": _confirmPasswordController.text,
    };
    var res = await ApiService().auth(data, '/auth/register');
    var body = jsonDecode(res.body);
    if (res.statusCode == 200) {
      final loginRes = await ApiService().auth({
        "email": _emailController.text,
        "password": _passwordController.text,
      }, '/auth/login');
      if (loginRes.statusCode == 200) {
        final body = jsonDecode(loginRes.body);
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString(
            'token', jsonEncode(body['data']['access_token']));
        localStorage.setString('user', jsonEncode(body['data']['user']));
        if (mounted) {
          Navigator.of(context).pushReplacementNamed(dashboardPage);
        }
      }
    } else {
      _showMsg(body['info']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
