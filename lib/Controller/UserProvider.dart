// ignore_for_file: file_names, unused_field, prefer_final_fields, non_constant_identifier_names, annotate_overrides, avoid_print, unused_import

import 'package:flutter/cupertino.dart';
import 'package:provider_apisql/Model/user_model.dart';
import 'package:provider_apisql/Services/db_helper.dart';
import 'package:provider_apisql/Services/user_services.dart';

class UserProvider extends ChangeNotifier {
  List<User> usrLst = [];

  Future<List<User>> getUserwithAPi() async {
    usrLst = await Services.getApiData();
    // DatabaseHelper dbHelper = DatabaseHelper();
    // usrLst = await dbHelper.checkDb();
    // print(abc[0].name);
    print(usrLst[0].name);
    notifyListeners();
    return usrLst;
  }
}
