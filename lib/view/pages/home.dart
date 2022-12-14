import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/pages/bank_account.dart';

import '../../controller/controller.dart';
import '../../main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BankAccount bankAccount = box!.get('bankAccount');
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder:(_)=> Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _.increment();
          print('llll');
          },
        child: const Icon(Icons.add),
      ),
      body: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){
            print('mic');
            _.decrement();
          }, icon: const Icon(Icons.minimize)),
          Text(_.count.toString()),
          Text('${bankAccount.myMoney.toString()} ${bankAccount.currency}'),
        ],
      )),),
    );
  }
}
