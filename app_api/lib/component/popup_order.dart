import 'package:flutter/material.dart';

class PopUpOrder extends StatelessWidget {
  const PopUpOrder({super.key, required this.order});

  final Map order;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(order['id'].toString()),
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
