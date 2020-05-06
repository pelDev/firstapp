class Course {

  int _id;
  String _coursename;
  double _unit;
  
  Course( this._coursename, this._unit );

  Course.withId(this._id, this._coursename, this._unit);

  int get id => _id;
  String get coursename => _coursename;
  double get unit => _unit;

  set coursename(String newCourseName) {
    if (newCourseName.length <= 40) {
      this._coursename = newCourseName;
    }
  }

  set unit(double newUnit) {
    if (newUnit <= 4.0  && newUnit > 0.0) {
      this._unit = newUnit;
    }
  }

  // convert course to map

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    } 

    map['coursename'] = _coursename;
    map['unit'] = _unit;

    return map;
  }

  // Extract Course from map

  Course.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._coursename = map['coursename'];
    this._unit = map['unit'];
  }

}