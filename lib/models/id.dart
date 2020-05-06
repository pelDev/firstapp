class ID {

  int _id;
  String _name;
  String _phonenumber;
  String _level;
  String _email;


  
  ID( this._name, this._phonenumber, this._level, this._email );

  ID.withId(this._id, this._name, this._phonenumber, this._level, this._email);

  int get id => _id;
  String get name => _name;
  String get phonenumber => _phonenumber;
  String get level => _level;
  String get email => _email;

  set name(String newName) {
    if (newName.length <= 40) {
      this._name = newName;
    }
  }

  set phonenumber(String newPhonenumber) {
    if (newPhonenumber.length == 11) {
      this._phonenumber = newPhonenumber;
    }
  }

  set level(String newLevel) {
    if (int.parse(newLevel) > 100 && int.parse(newLevel) <= 500 ) {
      this._level = newLevel;
    }
  }

  set email(String newEmail) {
    if(newEmail.length > 6){
      this._email = newEmail;
    }
  }

  // convert course to map

  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = _id;
    } 

    map['name'] = _name;
    map['phonenumber'] = _phonenumber;
    map['level'] = _level;
    map['email'] = _email;


    return map;
  }

  // Extract Course from map

  ID.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._level = map['level'];
    this._phonenumber = map['phonenumber'];
    this._email = map['email'];
  }

}