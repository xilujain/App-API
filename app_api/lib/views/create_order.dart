// ignore_for_file: file_names

import 'dart:convert';
import '../services/extensions/navigator/back.dart';
import '../component/label_screen.dart';
import '../component/popup_order.dart';
import '../views/signup_screen.dart';
import '../component/card_orders.dart';
import '../services/api/User/create_order.dart';
import '../services/api/User/get_orders.dart';
import '../views/GetID_screen.dart';
import 'package:flutter/material.dart';
import '../component/text_field_custom.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  List listOrders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.back(view: const SignUpScreen());
            },
            icon: const Icon(Icons.exit_to_app, color: Colors.purple)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                context.back(view: const GetScreenID());
              },
              child: const Text('to get order by id',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.deepPurple)))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LabelScreen(title: 'create order here'),
            const SizedBox(height: 64),
            Column(children: [
              TextFieldCustom(
                hint: "title",
                label: "Title",
                icon: Icons.title,
                controller: titleController,
              ),
              TextFieldCustom(
                hint: "content",
                label: "Content",
                icon: Icons.content_paste,
                controller: contentController,
              ),
              const SizedBox(height: 64),
              Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade200),
                      onPressed: () async {
                        await createOrder(body: {
                          "title": titleController.text,
                          "content": contentController.text,
                        });
                        listOrders =
                            json.decode((await getOrders()).body)['data'];

                        setState(() {});
                      },
                      child: const Text(
                        "View all orders",
                        style: TextStyle(fontSize: 16),
                      )))
            ]),
            for (var item in listOrders.reversed)
              InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          PopUpOrder(order: item),
                    );
                  },
                  child: CardOrders(order: item)),
          ],
        ),
      ),
    );
  }
}
