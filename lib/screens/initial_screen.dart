import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

import '../components/task.dart';
import '../data/task_dao.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          leading: Container(),
          actions: [
            IconButton(onPressed: (){setState((){});}, icon: Icon(Icons.refresh)),
          ],
          title: const Text('Exercicios'),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 71),
          child: FutureBuilder<List<Task>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot) {
                List<Task>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.waiting:
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.active:
                    return Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando')
                        ],
                      ),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Task tarefa = items[index];
                              return tarefa;
                            });
                      }
                      return Center(
                        child: Column(
                          children:[
                            Icon(Icons.error_outline, size: 128),
                            Text('Não há nenhuma Exercicio', style: TextStyle(fontSize: 32),),
                            ],),
                      );
                    }
                    return Text('Erro ao carregar exercicios');
                    break;
                }
                return Text('Erro desconhecido');
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                ),
              ),
            ).then((value) => setState((){
              print('Recarregando a tela');
            }));
          },
          child: const Icon(Icons.add),
        ));
  }
}
