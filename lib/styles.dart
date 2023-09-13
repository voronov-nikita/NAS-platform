// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';



class LoginStyles{


  // <-------------- Стиль для кнопок -------------->
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    tapTargetSize: MaterialTapTargetSize.padded,
    foregroundColor: Colors.white, 
    backgroundColor: Colors.black,
    textStyle: TextStyle(fontSize: 18),
    padding: EdgeInsets.all(18.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0.0),
    ),
  );

// <--------- Стили для ввода текста --------->

  static InputDecoration textinput = InputDecoration(
    contentPadding: EdgeInsets.only(left:30.0),
    // стиль при активном фокусе
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.green),

    ),
  );

  // текст для логина
  static InputDecoration textinputlogin = textinput.copyWith(
    // параметры для текста
    labelText: 'Login',
    hintText: 'Login',
  );

  // текст для пароля
  static InputDecoration textinputpassword = textinput.copyWith(
    // параметры для текста
    labelText: 'Password',
    hintText: 'Password',
  );
}
