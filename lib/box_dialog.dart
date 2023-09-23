import 'package:flutter/material.dart';
import 'package:to_do_list/my_buttons.dart';

class boxDialog extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback oncencel;
  boxDialog(
      {super.key,
      required this.controller,
      required this.onsave,
      required this.oncencel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[200],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // input for user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Add New Task")),
            ),
            // button -> save or cencel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                myButton(name: "save", onPressed: onsave),
                const SizedBox(width: 6),
                // cencel button
                myButton(name: "cencel", onPressed: oncencel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
