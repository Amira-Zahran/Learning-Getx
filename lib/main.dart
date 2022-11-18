import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/pages/home.dart';

import 'controller/controller.dart';
import 'view/pages/login.dart';

void main() async{
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
