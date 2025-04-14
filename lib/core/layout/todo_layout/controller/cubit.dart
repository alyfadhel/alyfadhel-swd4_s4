import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:swd4_s4/core/layout/todo_layout/controller/state.dart';
import 'package:swd4_s4/features/todo/archive/presentation/screens/archive_screen.dart';
import 'package:swd4_s4/features/todo/done/presentation/screens/done_screen.dart';
import 'package:swd4_s4/features/todo/new/presentation/screens/new_screen.dart';
import 'package:path/path.dart' as p;


class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(AppInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'New'),
    BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Done'),
    BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
  ];
  int currentIndex = 0;
  List<Widget> screens = [NewScreen(), DoneScreen(), ArchiveScreen()];
  List<String> titles = ['New', 'Done', 'Archive'];
  List<Map>newTasks = [];
  List<Map>doneTasks = [];
  List<Map>archiveTasks = [];
  Database? database;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomShow = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();


  void changeFabIcon({
    required bool isShow,
    required IconData icon,
})
  {
    isBottomShow = isShow;
    fabIcon = icon;
    emit(AppChangeFabIconState());
  }

  void changeBottomNav(index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavState());
  }


  void createDataFromDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, 'tasks.db');
    openDataFromDataBase(path: path);
    emit(AppCreateDataFromDatabaseState());
  }

  void openDataFromDataBase({required String path})
  async {
    await openDatabase(
      path,
      version: 1,
      onCreate: (Database database, int version) async {
        debugPrint('Database Created');
        await database
            .execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
        )
            .then((value) {
          debugPrint('Table Created');
        })
            .catchError((error) {
          debugPrint('Error when table created${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database);
        emit(AppOpenDataFromDatabaseState());
        debugPrint('Database Opened');
      },
    ).then((value) {
      database = value;
    });
  }

  void insertDataFromDataBase({
    required String title,
    required String date,
    required String time,
  })
  async {
    await database!.transaction((txn) async {
      await txn
          .rawInsert(
        'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
      )
          .then((value) {
        getDataFromDatabase(database);
        emit(AppInsertDataFromDatabaseState());
        debugPrint('$value Insert Successfully');
      })
          .catchError((error) {
        debugPrint('Error when insert new record ${error.toString()}');
      });
    });
  }

  void getDataFromDatabase(database)async
  {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
     await database.rawQuery('SELECT * FROM tasks').then((value){
       value.forEach((element){
         if(element['status'] == 'new'){
           newTasks.add(element);
         }else if(element['status'] == 'done'){
           doneTasks.add(element);
         }else{
           archiveTasks.add(element);
         }
       });
       titleController.clear();
       timeController.clear();
       dateController.clear();
       emit(AppGetDataFromDatabaseState());
     });
  }

  void updateDataFromDatabase({
    required String status,
    required int id,
})async
  {
    await database!.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status, id]).then((value){
          getDataFromDatabase(database);
          emit(AppUpdateDataFromDatabaseState());
    });
  }

  void deleteDataFromDatabase({
    required int id,
})async
  {
    await database!
        .rawDelete('DELETE FROM tasks WHERE id = ?', [id])
        .then((value){
          getDataFromDatabase(database);
          emit(AppDeleteDataFromDatabaseState());
    });
  }

}