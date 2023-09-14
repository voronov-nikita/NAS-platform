// ignore_for_file: avoid_print, constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'styles.dart';
import 'account.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({super.key});

  @override
  Widget build(BuildContext context) {

    String userInputLogin = '';
    String userInputPassword = '';
    List listUsers = ["admin-admin", "user-1234"];

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
              obscureText: true,
              ),

            // кнопка авторизации
            ElevatedButton(
              // при нажатии проверить строку и перейти
              onPressed: () {
                if (listUsers.contains("$userInputLogin-$userInputPassword")){
                  // Переход на домашний экран при нажатии на кнопку
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondScreen()),
                  );
                } else{
                  // иначе показать диалоговое окно
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text('Неверный логин или пароль. Попробуйте снова!'),
                      actions: [
                        FloatingActionButton(
                          backgroundColor: Colors.black,
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
                }

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





