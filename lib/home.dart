// ignore_for_file: prefer_const_constructors, avoid_print

import "package:flutter/material.dart";

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateNewArticle()),
          );
        },
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Радиус закругления углов
        ),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}



class CreateNewArticle extends StatelessWidget{
  const CreateNewArticle({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новая Запись'),
      ),
      body: Center(
        
      ),
    );
  }
}