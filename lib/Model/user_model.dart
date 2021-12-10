// ignore_for_file: unused_label, missing_return, unused_local_variable
// List<User> usersFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
// String usersToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class User {
  String id;
  String name;
  String username;

  User({this.id, this.name, this.username});

 factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'] ,
        name: json['name'],
        username: json['username'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
     'name': name, 
     'username': username
    };
  }




  // User.fromJson(Map<dynamic, dynamic> json) {
  //   id:json['id'];
  //   name:json['name'];
  //   username:json['username'];
  // }

  // Map<dynamic, dynamic> toJson() {
  //   var map = <String, dynamic>
  //   {'id': id,
  //    'name': name, 
  //    'username': username};
  // }


  //  User.fromMap(Map<dynamic, dynamic> map) {
  //   id = map['id'];
  //   name = map['name'];
  //   username:
  //   map["username"];
  
  // }

  // Map<String, dynamic> toMap() {
  //   var map = <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'username': username,
      
  //   };
  //   return map;
  // }
}
