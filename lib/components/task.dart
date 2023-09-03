import 'package:flutter/material.dart';

import '../data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final int serie;
  final int repeticao;

  Task(this.nome, this.serie, this.repeticao, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.black26,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black45),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: const TextStyle(
                                    fontSize: 24,
                                    overflow: TextOverflow.ellipsis),
                              )),

                          SizedBox(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.black26),
                              ),
                              onPressed: () {
                                TaskDao().delete(widget.nome);

                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Repeticão: ${widget.repeticao}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      'Serie: ${widget.serie}',
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
