import 'package:flutter/material.dart';
import 'package:flutter_provider/features/homescreen/widgets/bottomSheet.dart';
import 'package:flutter_provider/features/homescreen/widgets/task_checker.dart';
import 'package:flutter_provider/providers/tasks_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String homeroute = 'homescreen_route';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).backgroundColor,
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return const BottomSheetWidget();
              });
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding:
              const EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.list,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                "Todoey",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                provider.tasksLength.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.maxFinite,
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: ListView.builder(
                itemCount: provider.tasksLength,
                itemBuilder: (context, index) {
                  return Tasks(
                    task: provider.tasks[index],
                  );
                }),
          ),
        ),
      ]),
    );
  }
}
