import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDoList extends StatelessWidget {
  final String teskName;
  final bool teskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onPressed;
  toDoList(
      {super.key,
      required this.teskName,
      required this.teskCompleted,
      required this.onChanged,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onPressed,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(8),
            )
          ],
        ),
        child: Container(
          child: Row(
            children: [
              // checbox
              Checkbox(
                value: teskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // test name
              Text(
                teskName,
                style: TextStyle(
                    decoration: teskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.cyan, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
