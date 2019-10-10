class User {
  int _id;
  String _email;
  String _name;
  String _gender;
  String _avatar;
  String _location;
  String _url;

  User(
      {int id,
      String email,
      String name,
      String gender,
      String avatar,
      String location,
      String url}) {
    this._id = id;
    this._email = email;
    this._name = name;
    this._gender = gender;
    this._avatar = avatar;
    this._location = location;
    this._url = url;
  }

  int get id => _id;
  set id(int id) => _id = id;
  String get email => _email;
  set email(String email) => _email = email;
  String get name => _name;
  set name(String name) => _name = name;
  String get gender => _gender;
  set gender(String gender) => _gender = gender;
  String get avatar => _avatar;
  set avatar(String avatar) => _avatar = avatar;
  String get location => _location;
  set location(String location) => _location = location;
  String get url => _url;
  set url(String url) => _url = url;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _email = json['email'];
    _name = json['name'];
    _gender = json['gender'];
    _avatar = json['avatar'];
    _location = json['location'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['email'] = this._email;
    data['name'] = this._name;
    data['gender'] = this._gender;
    data['avatar'] = this._avatar;
    data['location'] = this._location;
    data['url'] = this._url;
    return data;
  }
}