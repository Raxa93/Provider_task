// ignore_for_file: prefer_collection_literals, deprecated_member_use, avoid_print, prefer_const_declarations, missing_return
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:provider_apisql/Model/user_model.dart';

class Services {
  static const String url = "https://jsonplaceholder.typicode.com/users";

  static Future<List<User>> getApiData() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        //  print(response.body);
          var values = json.decode(response.body);

         List<User> user  =List<User>.from(values.map((x) => User.fromJson(x)));
          print('lllll ${user.length}');
        //    if(values.length>0){
        //       Map<String,dynamic> map; 
        // for(int i=0;i<values.length;i++){
        //   if(values[i]!=null){
        //     Map<String,dynamic> map =values[i];
            
          
        //   }
        // }
        // print('values in map is $map');
      // var userList =   User.fromJson(map);
     
     
      // }
        // var list = User.fromJson(response.body).toList());
        // User.fromJson(list);
        // // print(users.last.name);
        // return users;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      return List<User>();
    }
  }
}
