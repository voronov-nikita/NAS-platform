// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import "styles.dart";


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ACCOUNT', textAlign: TextAlign.center,),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: ElevatedButton(
          style: LoginStyles.buttonStyle,
          onPressed: () {
            // Возврат на первый экран при нажатии на кнопку
            Navigator.pop(context);
          },
          child: Text('Вернуться на первый экран'),
        ),
      ),
    );
  }
}