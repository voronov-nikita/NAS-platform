// ignore_for_file: avoid_print, constant_identifier_names

import 'package:flutter/material.dart';
import 'styles.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // основное тело
      body: Center(
        // дочерний обьект 
        child: Column(
          // ценрирование 
          mainAxisAlignment: MainAxisAlignment.center,
          // конопки 
          children:[
            // кнопка авторизации
            ElevatedButton(
              onPressed: () {
                print("войти");
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





