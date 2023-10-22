import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';

import '../Models/DB_Models/Local_Question.dart';

class DatabaseHelper {
  final String databaseName = 'MyAppDB.db';
  final int databaseVersion = 1;

  // Define table names
  final String questionTable = 'questions';
  final String ownerTable = 'owners';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final String path = await getDatabasesPath();
    final String databasePath = '$path/$databaseName';
    print ("sssssss" + databasePath);

    return openDatabase(
      databasePath,
      version: databaseVersion,
      onCreate: (db, version) async {
        // Create the 'questions' table
        await db.execute('''
          CREATE TABLE $questionTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            tags TEXT,
            owner INTEGER,
            isAnswered INTEGER,
            viewCount INTEGER,
            answerCount INTEGER,
            score INTEGER,
            lastActivityDate INTEGER,
            creationDate INTEGER,
            questionId INTEGER,
            contentLicense TEXT,
            link TEXT,
            title TEXT,
            lastEditDate INTEGER,
            closedDate INTEGER,
            closedReason TEXT,
            acceptedAnswerId INTEGER
          )
        ''');

        // Create the 'owners' table
        // Create the 'owners' table
        await db.execute('''
  CREATE TABLE $ownerTable (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    accountId INTEGER,
    reputation INTEGER,
    userId INTEGER,
    userType TEXT,
    acceptRate INTEGER,
    profileImage TEXT,
    displayName TEXT,
    link TEXT
  )
''');

      },
    );
  }

  // Create a new Question
  Future<int> insertQuestion(LocalQuestion question) async {
    final db = await database;
    return await db.insert(questionTable, question.toMap());
  }

  // Retrieve a Question by its ID
  Future<LocalQuestion?> getQuestion(int id) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      questionTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return LocalQuestion.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Retrieve all Questions
  Future<List<LocalQuestion>> getAllQuestions() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(questionTable);
    return List.generate(maps.length, (i) {
      return LocalQuestion.fromMap(maps[i]);
    });
  }

  // Create a new Owner
  Future<int> insertOwner(LocalOwner question) async {
    final db = await database;
    return await db.insert(ownerTable, question.toMap());
  }

  // Retrieve a Question by its ID
  Future<LocalQuestion?> getOwner(int id) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      ownerTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return LocalQuestion.fromMap(maps.first);
    } else {
      return null;
    }
  }

  // Retrieve all Questions
  Future<List<LocalQuestion>> getAllOwners() async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(ownerTable);
    return List.generate(maps.length, (i) {
      return LocalQuestion.fromMap(maps[i]);
    });
  }
}
