
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/network_layer/firestore_utils.dart';
import 'package:todo/core/utils/extensions.dart';
import 'package:todo/models/task_model.dart';
import '../../widgets/task_item_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<TaskModel> tasks = [];

  final displayedItems = <TaskModel>[];
  
  DateTime selectedDate = DateTime(DateTime.now().year , DateTime.now().month , DateTime.now().day);
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      children: [
        Stack(
          alignment: const Alignment(0, 2),
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 175,
              width: double.infinity,
              color: theme.primaryColor,
              child: Text(
                "To Do List",
                style: theme.textTheme.titleLarge,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CalendarTimeline(
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(const Duration(days: 365)),
              onDateSelected: (date) {
                setState(() {
                  setDisplayedTasks(date);
                });
              },
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: theme.primaryColor,
              activeBackgroundDayColor: Colors.white,
              dotColor: theme.primaryColor,
              locale: 'en_ISO',
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: StreamBuilder <QuerySnapshot<TaskModel>> (
              stream: FirestoreUtils.getRealtimeDataFromFireStore(),
              builder: (context,snapshot)
              {
            if (snapshot.hasError){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.error.toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.refresh)),
                ],
              );
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child:  CircularProgressIndicator(
                  color: theme.primaryColor,
                ),
              );
            }

            tasks.clear();
            final list = snapshot.data?.docs.map((e)=>e.data()).toList() ?? [];
            tasks.addAll(list);
            setDisplayedTasks(selectedDate);
            return ListView.builder(
                     padding: EdgeInsets.zero,
                     itemBuilder: (context, index) {
                       return TaskItemWidget(taskModel: displayedItems[index]);
                     },
                    itemCount: displayedItems.length,
            );
          }
          ),
        ),
      ],
    );
  }

  // 0.215 -> date
  // 5464 -> date2

  void setDisplayedTasks(DateTime date){
    displayedItems.clear();
    displayedItems.addAll(tasks.where((task) => task.dateTime.isTheSameDay(date)));
    selectedDate = date;
  }

}
