
// ignore: file_names
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


// Класс для нашей базы данных
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDatabase();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'user.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('''
      CREATE TABLE users (
        username TEXT,
        password TEXT
      )
    ''');

    // Добавьте пользователей в таблицу при необходимости
    await db.insert('users', {'username': 'admin', 'password': 'admin'});
    await db.insert('users', {'username': 'user', 'password': '1234'});
  }

  Future<bool> verifyUser(String login, String password) async {
    final dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query('users',
        where: 'username = ? AND password = ?', whereArgs: [login, password]);

    // Если есть совпадение, значит, пользователь существует и пароль верный
    return result.isNotEmpty;
  }
}
