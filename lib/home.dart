// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Второй экран'),
      ),
      body: Center(
        child: ElevatedButton(
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