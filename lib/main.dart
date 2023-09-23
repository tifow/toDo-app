import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/homepage.dart';

void main() async {
  // initalize 
  await Hive.initFlutter();

  // open file from local storage

  var box = await Hive.openBox("mybox");
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: homePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.cyan),
  );
  }
}
