// ignore_for_file: file_names

import 'dart:convert';
import 'package:app_api/services/extensions/navigator/back.dart';

import '../component/popup_message.dart';
import '../services/api/Auth/login.dart';
import '../views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../component/label_screen.dart';
import '../component/text_field_custom.dart';
import 'create_order.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        const LabelScreen(
          title: "Welcome Back!",
        ),
        Column(children: [
          TextFieldCustom(
            hint: "example@gmail.com",
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),
          TextFieldCustom(
            hint: "******",
            label: "Password",
            icon: Icons.password,
            isPassword: true,
            controller: passwordController,
          ),
        ]),
        Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade200),
                    onPressed: () async {
                      final response = await loginUser(body: {
                        "email": emailController.text,
                        "password": passwordController.text,
                      });
                      if (response.statusCode == 200) {
                        final box = GetStorage();
                        box.write("token",
                            json.decode(response.body)["data"]["token"]);
                        context.back(view: CreateOrder());
                      } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => PopUpMessage(),
                          );
                        }
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(fontSize: 16),
                    ))),
            TextButton(
                onPressed: () {
                  context.back(view: const SignUpScreen());
                },
                child: const Text(
                  'Do not have an account? create new',
                  style: TextStyle(color: Colors.deepPurple),
                ))
          ],
        )
      ]),
    );
  }
}