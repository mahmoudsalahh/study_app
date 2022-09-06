import 'package:flutter/material.dart';
import 'package:salahh/models/user/user_model.dart';
import 'package:salahh/modules/archived_tasks/archived.dart';
import 'package:salahh/modules/done_tasks/done_tasks.dart';
import 'package:salahh/modules/agenda/agenda.dart';
import 'package:salahh/modules/settings/settings.dart';
import 'package:salahh/modules/subjects/subjects.dart';
import 'package:sqflite/sqflite.dart';

class AppProvider extends ChangeNotifier {
  int currentIndex = 0;
  List tasks = [Agenda(), Subjects() ,DoneTasks(), ArchivedTasks() ,Settings()];
  List<String> titles = ['Your Tasks', 'your Subject','Done Tasks', 'Archived Tasks','Settings'];
  List<BottomNavigationBarItem> bottomNavBarItem = [
    BottomNavigationBarItem(label: 'Agenda', icon: Icon(Icons.task)),
    BottomNavigationBarItem(
       label: 'Subjects', icon: Icon(Icons.subject)),
    BottomNavigationBarItem(
        label: 'Done Tasks', icon: Icon(Icons.done_all_rounded)),
    BottomNavigationBarItem(
        label: 'Archived', icon: Icon(Icons.archive_outlined)),
    BottomNavigationBarItem(
        label: 'Settings', icon: Icon(Icons.settings)),

  ];
  void changeBar(index) {
    currentIndex = index;
    notifyListeners();
  }

  Database? database;

  void createDatabae() async {
    database =
        await openDatabase('todo', version: 1, onCreate: (database, version) {
      print(' database Created');
      database
          .execute(
              'CREATE TABLE tasks (id INTGER PRIMARY KEY , title TEXT , time TEXT,date TEXT)')
          .then((value) {
        print('table created ');
      });
    }, onOpen: (database) {
          getFromDatabase(database).then((value){
             gettask = value;
            // value.forEach((element) {
            //   userModel =UserModel.fromDatabase(element);
            //   print(userModel!.subjectName);
            // });
            print(gettask![0]['title']);

          });
      print('database open');
    });
    notifyListeners();
  }
UserModel? userModel ;
  Future insertToDatabase({
   required String title,
    required String time,
    required String color,
  }) async {
    return await database!.transaction((txn)async  {
      await txn.rawInsert(
              'INSERT INTO tasks(title,time,color ) VALUES ("$title ","$time", "$color") ')
          .then((value) {
        getFromDatabase(database).then((value){
          gettask = value;
          // value.forEach((element) {
          //   userModel =UserModel.fromDatabase(element);
          //   print(userModel!.subjectName);
          // });
          print(gettask![0]['title']);

        });
        print('$value table inserted ');
      }).catchError((error){});
      notifyListeners();
      return null;
    });
  }

List<Map>? gettask=[];
  Future<List<Map>> getFromDatabase(database) async {
    notifyListeners();
   return await database!.rawQuery('SELECT * FROM Tasks');




  }
}
