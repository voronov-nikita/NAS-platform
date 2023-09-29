// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:io';

import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:path_provider/path_provider.dart';

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



class CreateNewArticle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MarkdownEditor(),
    );
  }
}

class MarkdownEditor extends StatefulWidget {
  @override
  _MarkdownEditorState createState() => _MarkdownEditorState();
}

class _MarkdownEditorState extends State<MarkdownEditor> {
  final TextEditingController _markdownController = TextEditingController();
  String _markdownText = '';
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _loadSavedFile();
  }

  Future<void> _loadSavedFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/new.md');
      if (await file.exists()) {
        setState(() {
          _markdownText = file.readAsStringSync();
          _filePath = file.path;
        });
      }
    } catch (e) {
      print('Error loading file: $e');
    }
  }

  Future<void> _saveMarkdownToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/new.md');
      await file.writeAsString(_markdownText);
      setState(() {
        _filePath = file.path;
      });
    } catch (e) {
      print('Error saving file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markdown Editor'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _markdownController,
                onChanged: (text) {
                  setState(() {
                    _markdownText = text;
                  });
                },
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter Markdown here...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _saveMarkdownToFile,
            child: Text('Save Markdown'),
          ),
          if (_filePath.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: rootBundle.loadString(_filePath),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data!);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}