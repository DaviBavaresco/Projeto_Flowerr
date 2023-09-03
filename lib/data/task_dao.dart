import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

import '../components/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablenamee('
      '$_name TEXT, '
      '$_repetion INTEGER, '
      '$_seriee INTEGER)';

  static const String _tablenamee = 'taskTablee';
  static const String _name = 'name';
  static const String _repetion = 'repetion';
  static const String _seriee = 'seriee';

  save(Task tarefa) async {
    final Database bancoDeDados = await getDataBase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);

    if (itemExists.isEmpty) {
      return await bancoDeDados.insert(_tablenamee, taskMap);
    } else {
      return await bancoDeDados.update(
        _tablenamee,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    final Map<String, dynamic> mapaDetarefas = Map();
    mapaDetarefas[_name] = tarefa.nome;
    mapaDetarefas[_repetion] = tarefa.repeticao;
    mapaDetarefas[_seriee] = tarefa.serie;
    return mapaDetarefas;
  }

  Future<List<Task>> findAll() async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablenamee);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(linha[_name], linha[_seriee], linha[_repetion]);
      tarefas.add(tarefa);
    }
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDataBase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablenamee,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDataBase();
    return bancoDeDados.delete(
      _tablenamee,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
