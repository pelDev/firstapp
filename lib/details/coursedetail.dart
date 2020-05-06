import 'package:commercialapp/models/courseobject.dart';
import 'package:commercialapp/utls/database_helper.dart';
import 'package:flutter/material.dart';

class CourseDetail extends StatefulWidget {

  final Course course;
  final String appBarTitle;

  CourseDetail(this.course, this.appBarTitle);

  @override
  _CourseDetailState createState() => _CourseDetailState(this.course, this.appBarTitle);
}

class _CourseDetailState extends State<CourseDetail> {

  Course course;
  String appBarTitle;
 

  _CourseDetailState(this.course, this.appBarTitle);
  
  TextEditingController coursenameController = TextEditingController();
  TextEditingController unitController = TextEditingController();

  DatabaseHelper _helper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {

    //double unit = course.unit;

    coursenameController.text = course.coursename;
    unitController.text = '${course.unit}';
    

    void updateUnit() {
    course.unit = double.parse(unitController.text);
    }
    
    return Scaffold(

      appBar: AppBar(
        title: Text(
          appBarTitle,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 12.0, right: 12.0),
        child: ListView(
          children: <Widget>[

            // first element

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: coursenameController,
                onChanged: (value) {
                  print('Changes in coursename text field');
                  updateCourseName();
                },
                decoration: InputDecoration(
                  labelText: 'Course Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: unitController,
                onChanged: (value) {
                  print('Changes in unit text field');
                  updateUnit();
                },
                decoration: InputDecoration(
                  labelText: 'Unit',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Center(
                child: FlatButton(
                  color: Colors.deepPurple,
                  onPressed: () {
                   if (coursenameController.text.length > 3 && double.parse(unitController.text) > 0 && double.parse(unitController.text) <= 4) { 
                    _save();
                   } else if (coursenameController.text.length < 3) {
                   _showAlertDialog('Status', 'Course name should be more than 3 words');
                   } else if (double.parse(unitController.text) == 0 ) {
                     _showAlertDialog('Status', 'Unit should be greater than 0');
                   }  else if (double.parse(unitController.text) > 4) {
                     _showAlertDialog('Status', 'Unit should be less than 5');
                   }

                  }, 
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ), 
            ),

          ],
        ), 
      ),
      
    );
  }

  void updateCourseName() {
    course.coursename = coursenameController.text;
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void _save() async {

    moveToLastScreen();
    
    int result;
    if (course.id != null) {
      result = await _helper.updateCourse(course);
    } else {
      result = await _helper.insertCourse(course);
    }

    if (result != 0) {
      _showAlertDialog('Status', 'Course Saved Succesfully');
    } else {
      _showAlertDialog('Status', 'Problem Saving Course');
    }
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
  }

}