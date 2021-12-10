// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, missing_return

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_apisql/Controller/UserProvider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    //  getData();
    // DatabaseHelper.instance.checkDb();
  }

  // Future<void> getData() async {
  //   var UserInfo = Provider.of<UserProvider>(context, listen: false);
  //   await UserInfo.getUserwithAPi();
  // }

  @override
  Widget build(BuildContext context) {
    var UserInfo = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: Center(
          child: FutureBuilder(
        future: UserInfo.getUserwithAPi(),
        //  initialData: InitialData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            //print('NO data 1');
            return CircularProgressIndicator(
              color: Colors.blue,
            );
          }
          return ListView.builder(
            itemCount: UserInfo.usrLst.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(UserInfo.usrLst[index].name),
                subtitle: Text(UserInfo.usrLst[index].username),
                leading: CircleAvatar(),
              );
            },
          );
        },
      )),
    );
  }
}
