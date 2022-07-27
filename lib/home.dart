// ignore_for_file: avoid_unnecessary_containers, must_be_immutable, avoid_print

import 'package:coursesql/sqldb.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  SqlDb sqlDb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQFLITE"),
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  int response = await sqlDb.insertData(
                      "INSERT INTO 'notes' ('note') VALUES ('note one')");
                  print(response);
                },
                child: const Text("insertData"),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  List<Map> response =
                      await sqlDb.readData("SELECT * FROM 'notes'");
                  print(response);
                },
                child: const Text("readData"),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  int response = await sqlDb
                      .deleteData("DELETE FROM 'notes' WHERE id = 2");
                  print(response);
                },
                child: const Text("deleteData"),
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: () async {
                  int response = await sqlDb.updateData(
                      "UPDATE 'notes' SET 'note' = 'note three' WHERE id = 3");
                  print(response);
                },
                child: const Text("updateData"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
