import 'package:flutter/material.dart';

class PopUpOrderId extends StatelessWidget {
  const PopUpOrderId({super.key, required this.id, required this.order});

  final Map order;
  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(id),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order['title']),
          Text(order['content']),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
          child: const Text('Close'),
        ),
      ],
    );
  }
}