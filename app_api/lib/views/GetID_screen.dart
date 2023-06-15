// ignore_for_file: file_names

import 'dart:convert';
import '../services/extensions/navigator/back.dart';
import '../views/signup_screen.dart';
import '../component/popup_order_id.dart';
import '../services/api/User/getByID.dart';
import 'package:flutter/material.dart';
import '../component/text_field_custom.dart';

class GetScreenID extends StatefulWidget {
  const GetScreenID({super.key});

  @override
  State<GetScreenID> createState() => _GetScreenIDState();
}

class _GetScreenIDState extends State<GetScreenID> {
  Map order = {};
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(leading: IconButton(
            onPressed: () {
              context.back(view: const SignUpScreen());
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.purple))),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextFieldCustom(
              controller: idController,
              hint: "enter id",
              label: "ID",
              icon: Icons.insert_drive_file),
          Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade200),
                  onPressed: () async {
                    try {
                      if (int.parse(idController.text) is int) {
                        order = json.decode(
                            (await getByID(id: idController.text)).body);
                            showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          PopUpOrderId(id: idController.text, order: order),
                    );
                        if ((order["data"] as List).isEmpty) {
                          order = {};
                        } else {
                          order = order["data"][0];
                        }

                        setState(() {});
                      }
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("plase enter correct number")));
                    }
                  },
                  child: const Text("Get the order by id"))),
          Visibility(
            visible: order.isNotEmpty,
            child: const SizedBox.shrink()),
        ]),
      ),
    );
  }
}