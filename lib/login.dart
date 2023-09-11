// ignore_for_file: avoid_print, constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'styles.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({super.key});


  @override
  Widget build(BuildContext context) {

    String userInputLogin = '';
    String userInputPassword = '';

    return Scaffold(
      // основное тело
      body: Center(
        // дочерний обьект 
        child: Column(
          // ценрирование 
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
            // строка с логином
            TextField(
              onChanged: (value){
                userInputLogin = value;
              },
              decoration: LoginStyles.textinputlogin,
              ),
            // строка с паролем
            TextField(
              onChanged: (value){
                userInputPassword = value;
              },
              decoration: LoginStyles.textinputpassword,
              ),

            // кнопка авторизации
            ElevatedButton(
              onPressed: () {
                print("$userInputLogin - $userInputPassword");
              },
              style: LoginStyles.buttonStyle,
              child: const Text('Войти'),
            ),

            // кнока входа для гостя
            ElevatedButton(
              onPressed: () {
                print("гость");
              },
              style: LoginStyles.buttonStyle,
              child: const Text('Войти как гость'),
            ),
          ]
        ),
      ),
    );
  }
}





