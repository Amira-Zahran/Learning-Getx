import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/pages/bank_account.dart';
import 'package:getx/view/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'controller/controller.dart';
import 'view/pages/login.dart';

late Box? box;
Future<void> main() async{
  await Hive.initFlutter();
  box = await Hive.openBox('box');
  Hive.registerAdapter(BankAccountAdapter());
  box!.put('bankAccount', BankAccount(currency: "\$USD", myMoney: 1000000));
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
