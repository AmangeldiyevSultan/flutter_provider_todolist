import 'package:flutter/material.dart';
import 'package:flutter_provider/features/homescreen/screens/homescreen.dart';
import 'package:flutter_provider/providers/tasks_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => TasksProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks',
      theme: ThemeData.light().copyWith(
        backgroundColor: Colors.lightBlueAccent,
        primaryColorDark: Colors.lightBlueAccent,
        primaryColorLight: Colors.lightBlueAccent,
      ),
      initialRoute: HomeScreen.homeroute,
      routes: {
        HomeScreen.homeroute: (context) => const HomeScreen(),
      },
    );
  }
}
