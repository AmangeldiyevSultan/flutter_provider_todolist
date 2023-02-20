import 'package:flutter_provider/providers/tasks_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  const BottomSheetWidget({super.key});
  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController? textContoller;

  @override
  void initState() {
    super.initState();
    textContoller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textContoller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TasksProvider>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        children: [
          Text('Add Task',
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: 30,
              )),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textContoller,
            autofocus: true,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.maxFinite,
            child: RawMaterialButton(
              elevation: 0,
              fillColor: Colors.lightBlueAccent,
              onPressed: () {
                if (textContoller!.text.isNotEmpty) {
                  provider.addTast(textContoller!.text.toString());
                }
              },
              child: const Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
