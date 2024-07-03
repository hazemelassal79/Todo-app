import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFFec4b4b),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Slidable(
        startActionPane: ActionPane(
            extentRatio: 0.25,
            motion: DrawerMotion(), children: [
          SlidableAction(
            // An action can be bigger than the others.
            flex: 2,
            onPressed: (context) {},
            borderRadius: BorderRadius.circular(15),
            backgroundColor: Color(0xFFec4b4b),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'delete',
          ),
        ]),
        child: Container(
          width: 400,
          height: 115,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("play basket ball", style: theme.textTheme.bodyLarge),
                  Text("go club ", style: theme.textTheme.bodyMedium),
                  Row(
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text("10:30 Am", style: theme.textTheme.bodySmall),
                    ],
                  ),
                ],
              ),
              Container(
                width: 70,
                height: 35,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset("assets/images/icon_check.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
