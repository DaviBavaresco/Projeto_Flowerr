import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'taske.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDao.tableSql);
  }, version: 1);
}
