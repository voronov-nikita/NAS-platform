// ignore_for_file: file_names

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


// КЛАСС БАЗЫ ДАННЫХ
class DataBase{

  // создаем родительские объекты для нашей БД
  DataBase._();
  static final DataBase instance = DataBase._();

  // абстрагируем класс
  static Database? _database;

  // проводим подключение БД
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // функция инициализации БД
  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(
      // указываем  путь размещения
      path,
      version: 1,
      // вызываем метод создать
      onCreate: (db, version) async {
        // задаем параметры для пользователя
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            login TEXT,
            password TEXT,
            level INTEGER
          )
        ''');
      },
    );
  }
}
