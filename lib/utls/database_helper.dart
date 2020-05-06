import 'package:commercialapp/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:commercialapp/models/courseobject.dart';

class DatabaseHelper {
  
  
  static DatabaseHelper _databaseHelper;
  static Database _database;
  
  String courseTable = 'course_table';
  String colId = 'id';
  String colCourseName = 'coursename';
  String colUnit = 'unit';
  

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {

    Directory directory = await getApplicationDocumentsDirectory();

    String path = directory.path + 'course.db';

    var coursesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return coursesDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('CREATE TABLE $courseTable($colId INTEGER PRIMARY KEY AUTOINCREMENT,'
    '$colCourseName TEXT, $colUnit DOUBLE)');
  } 

  // fetch operation

  Future<List<Map<String, dynamic>>> getCourseMapList() async {
    Database db = await this.database;

    var result = await db.query(courseTable);
    return result;
  }

    // insert operation

  

  Future<int> insertCourse(Course course) async {
    Database db = await this.database;
    var result = await db.insert(courseTable, course.toMap());
    return result;
  }

  // update opertation
 
  Future<int> updateCourse(Course course) async {
    var db = await this.database;
    var result = await db.update(courseTable, course.toMap(), where: '$colId = ?', whereArgs: [course.id]);
    return result;
  }

  // delete operation

  Future<int> deleteCourse(int id) async {
    var db = await this.database;
    int result = await db.rawDelete('DELETE FROM $courseTable WHERE $colId = $id');
    return result;
  }

  // objects count in the database.
 
  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $courseTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<Course>> getCourseList() async {

    var courseMapList = await getCourseMapList();// get map list from datadase
    int count = courseMapList.length; // count of map entries in db table

    List<Course> courseList = List<Course>();
    // for loop to create a note list from a map list

    for (int i = 0; i < count; i++) {
      courseList.add(Course.fromMapObject(courseMapList[i]));
    }

    return courseList;
  }

}
