// ignore_for_file: use_build_context_synchronously

import 'package:app_api/component/popup_message.dart';
import 'package:app_api/services/extensions/navigator/back.dart';

import '../services/api/Auth/createUser.dart';
import '../views/Login_screen.dart';
import 'package:flutter/material.dart';
import '../component/label_screen.dart';
import '../component/text_field_custom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const LabelScreen(title: "Create Account"),
          Column(
            children: [
              TextFieldCustom(
                hint: "@username",
                label: "User name",
                icon: Icons.person,
                controller: usernameController,
              ),
              TextFieldCustom(
                hint: "Fahad Alazmi",
                label: "Name",
                icon: Icons.email,
                controller: nameController,
              ),
              TextFieldCustom(
                hint: "example@gmail.com",
                label: "Email",
                icon: Icons.email,
                controller: emailController,
              ),
              TextFieldCustom(
                hint: "AAaa1100229933",
                label: "password",
                icon: Icons.remove_red_eye,
                isPassword: true,
                controller: passwordController,
              ),
            ],
          ),
          Column(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade200),
                      onPressed: () async {
                        final response = await createUser(body: {
                          "email": emailController.text,
                          "password": passwordController.text,
                          "username": usernameController.text,
                          "name": nameController.text
                        });
                        if (response.statusCode == 200) {
                          context.back(view: LoginScreen());
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => PopUpMessage(),
                          );
                        }
                      },
                      child: Text("Sign Up", style: TextStyle(fontSize: 16)))),
              TextButton(
                  onPressed: () {
                    context.back(view: LoginScreen());
                  },
                  child: const Text(
                    'already have an account? Sign in',
                    style: TextStyle(color: Colors.deepPurple),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
