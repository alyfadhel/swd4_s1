import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:swd4_s1/features/todo/archive/archive_screen.dart';
import 'package:swd4_s1/features/todo/done/done_screen.dart';
import 'package:swd4_s1/features/todo/new/new_screen.dart';
import 'package:path/path.dart' as p;

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

Database? database;
List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'New'),
  BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'Done'),
  BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived'),
];
int currentIndex = 0;
List<Widget> screens = [NewScreen(), DoneScreen(), ArchiveScreen()];
List<String> titles = ['New', 'Done', 'Archive'];
var scaffoldKey = GlobalKey<ScaffoldState>();
bool isBottomShow = false;
IconData fabIcon = Icons.edit;

class _TodoAppState extends State<TodoApp> {
  @override
  void initState() {
    createDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          titles[currentIndex],
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (isBottomShow) {
            Navigator.pop(context);
            setState(() {
              isBottomShow = false;
              fabIcon = Icons.edit;
            });
          } else {
            scaffoldKey.currentState!
                .showBottomSheet(
                  (context) => Container(height: 150.0, color: Colors.red),
                )
                .closed
                .then((value) {
                  setState(() {
                    isBottomShow = false;
                    fabIcon = Icons.edit;
                  });
            });
            setState(() {
              isBottomShow = true;
              fabIcon = Icons.add;
            });
          }
        },
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(fabIcon, color: Colors.white),
      ),
      body: screens[currentIndex],
    );
  }
}

void createDataFromDatabase() async {
  var databasesPath = await getDatabasesPath();
  String path = p.join(databasesPath, 'tasks.db');
  openDataFromDatabase(path: path);
}

void openDataFromDatabase({required String path}) async {
  await openDatabase(
    path,
    version: 1,
    onCreate: (Database database, int version) async {
      debugPrint('Database created');
      await database
          .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)',
          )
          .then((value) {
            debugPrint('Table created');
          })
          .catchError((error) {
            debugPrint('Error When Table Opened ${error.toString()}');
          });
    },
    onOpen: (database) {
      debugPrint('Database opened');
    },
  ).then((value) {
    database = value;
  });
}

void insertDataFromDatabase() async {
  await database!.transaction((txn) async {
    txn
        .rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("some name", "1234", "456", "new")',
        )
        .then((value) {
          debugPrint('$value inserted Successfully');
        })
        .catchError((error) {
          debugPrint('Error when insert new record ${error.toString()}');
        });
  });
}
