import 'package:flutter/material.dart';

class AlertDialogComponent extends StatelessWidget {
  const AlertDialogComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: const Text('Clear Confirm'),
      content: const Text('ToDo Listをクリアしますか？'),
      actions: <Widget>[
        ElevatedButton.icon(
          icon: const Icon(
            Icons.tag_faces,
            color: Colors.white,
          ),
          label: const Text('はい'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        ElevatedButton.icon(
          icon: const Icon(
            Icons.sentiment_dissatisfied,
            color: Colors.white,
          ),
          label: const Text('いいえ'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            onPrimary: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
      ],
    );
  }
}
