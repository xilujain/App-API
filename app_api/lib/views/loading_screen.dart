import '../views/signup_screen.dart';
import '../views/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadgingPageState();
}

class _LoadgingPageState extends State<LoadingPage> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return box.hasData("token") ? LoginScreen() : const SignUpScreen();
  }
}
