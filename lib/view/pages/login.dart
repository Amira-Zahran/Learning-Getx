import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controller.dart';

import '../component/auth_component.dart';
import 'home.dart';

class Login extends StatelessWidget {
  final controller = Get.put(LoginController());

  Login({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) {
          return Material(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50,),
                        const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, ),),
                        const SizedBox(height: 15,),
                        defaultField(type: TextInputType.emailAddress, text: 'E-Mail', controller: controller.emailController,),
                        const SizedBox(height: 12,),
                        passWordField(text: 'Password', controller: controller.passwordController, type: TextInputType.visiblePassword, isPassword: controller.isPassword, iconButton: IconButton(onPressed: () => controller.hidePass(), icon: controller.isPassword
                            ? const Icon(Icons.visibility_off, color: Colors.deepOrange, size: 20,)
                            : const Icon(Icons.visibility, color: Colors.deepOrange, size: 20,),)),
                        const SizedBox(height: 12,),
                        TextButton(onPressed: () {}, child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              decoration: TextDecoration.underline, height: 1),
                        ),),
                        const SizedBox(height: 40,),
                        Center(
                          child: ElevatedButton(onPressed: (){
                            controller.login();
                            if(_formKey.currentState!.validate()){
                              return;
                            }
                          },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepOrange,
                                fixedSize: const Size(320, 55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))), child: const Text('Login', style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        ),
                        const SizedBox(height: 12,),
                        or(),
                        const SizedBox(height: 12,),
                        Center(
                          child: Container(
                            width: 320,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.deepOrange,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
                              },
                              child: const Text('Sign Up', style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}
