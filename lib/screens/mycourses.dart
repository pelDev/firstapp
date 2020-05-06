import 'package:commercialapp/utls/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:commercialapp/details/coursedetail.dart';
import 'package:commercialapp/models/courseobject.dart';
import 'package:flutter/material.dart';

class MyCourses extends StatefulWidget {
  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  List<Course> courseList;
  int count = 0;

  // String newCourseName;
  // double newUnit;

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  updateListView() async {
    final Future<Database> dbFuture = _databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Course>> courseListFuture = _databaseHelper.getCourseList();
      courseListFuture.then((courseList) {
        setState(() {
          this.courseList = courseList;
          this.count = courseList.length;
        });
      });
    });
  }

  Course course;

  @override
  Widget build(BuildContext context) {
    print('bjbh');
    void moveToHomeScreen() {
      Navigator.pop(context);
    }

    if (courseList == null) {
      courseList = List<Course>();
      updateListView();
    }

    //print('${courses[1].unit}');
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'My Courses',
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RaisedButton.icon(
                    color: Colors.deepPurple,
                    onPressed: () {
                      moveToHomeScreen();
                    },
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: count,
                    itemBuilder: (BuildContext context, int index) {
                      //double _unit = courseList[index].unit;
                      return GestureDetector(
                           onTap: () {
                                  navigateToDetail(
                                      this.courseList[index], 'Edit Course');
                                },
                          child: Card(
                          color: Colors.deepPurple,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Expanded(
                                                                          child: Text(
                                        courseList[index].coursename,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${courseList[index].unit}',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              FlatButton.icon(
                                onPressed: () {
                                  _delete(context, courseList[index]);
                                },
                                icon: Icon(Icons.delete),
                                label: Text('Delete'),
                              ),

                              // FlatButton.icon(
                              //   onPressed: () {
                              //     navigateToDetail(
                              //         this.courseList[index], 'Edit Course');
                              //   },
                              //   icon: Icon(Icons.edit),
                              //   label: Text('Edit'),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          navigateToDetail(Course('', 0.0), 'Add Course');
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _delete(BuildContext context, Course course) async {
    int result = await _databaseHelper.deleteCourse(course.id);
    if (result != 0) {
      _showSnackBar(context, 'Course Deleted Succesfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackbar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackbar);
  }

  void moveToLastScreen() {
    Navigator.pop(context);
  }

  void navigateToDetail(Course course, String appBarTitle) async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CourseDetail(course, appBarTitle);
    }));
    if (result == true) {
      updateListView();
    }
  }
  
}
