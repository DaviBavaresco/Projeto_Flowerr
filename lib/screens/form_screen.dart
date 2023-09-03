import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key, required this.taskContext}) : super(key: key);

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController repetionController = TextEditingController();
  TextEditingController serieeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool valueValidator(String? value) {
    if (value != null && value.isEmpty) {
      return true;
    }
    return false;
  }

  bool repetionValidator(String? value) {
    if (value != null && value.isEmpty) {
      if (int.parse(value) > 20 || int.parse(value) < 1) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Novo Exercicio'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 650,
              width: 375,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (String? value) {
                        if (valueValidator(value)) {
                          return 'Insira o nome do exercicio';
                        }
                        return null;
                      },
                      controller: nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Exercicio',
                        fillColor: Colors.white24,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (repetionValidator(value)) {
                          return 'Insira Quantas series serao:';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: serieeController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Serie',
                        fillColor: Colors.white24,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (repetionValidator(value)) {
                          return 'Insira Quantas Repeticoes serao: ';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: repetionController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Repeticao',
                        fillColor: Colors.white24,
                        filled: true,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        TaskDao().save(Task(
                          nameController.text,
                          int.parse(serieeController.text),
                          int.parse(repetionController.text),
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Criando um novo Exercicio'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Adicionar'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
