import 'package:flutter/material.dart';
import 'package:untitled1/data/task_inherited.dart';


class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController pictureController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    var mediaQuery = MediaQuery.of(context);

    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          title: const Text(
            'new task',
            style: TextStyle(color: Colors.white60),
          ),
          backgroundColor: Colors.blueGrey[700],
          elevation: 0,
          centerTitle: true,
        ),
        body: Center(
            child: Container(
          width: mediaQuery.size.width * 0.9,
          height: mediaQuery.size.height * 0.83,
          decoration: BoxDecoration(
              color: Colors.white60,
              border: Border.all(width: 5),
              borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value){
                      if(value != null && value.isEmpty){
                        return 'Insira o nome da tarefa';
                      }
                      return null;
                    },
                    controller: nameController,
                    textAlign: TextAlign.center,
                    decoration:  InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      labelText: 'nome',
                      border:  OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                      hintText: 'nome',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value){
                      if(value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1 ){
                        return 'Insira uma dificuldade entre 1 e 5';
                      }
                      return null;
                    },
                    controller: difficultyController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration:  InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      labelText: 'difficulty',
                      border:  OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                      hintText: 'difficulty',
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (String? value){
                      if(value!.isEmpty){
                        return 'Insira um image path';
                      }
                      return null;
                    },
                    onChanged: (text){
                      setState(() {
                      });
                    },
                    controller: pictureController,
                    textAlign: TextAlign.center,
                    decoration:  InputDecoration(
                      fillColor: Colors.white38,
                      filled: true,
                      labelText: 'image link',
                      border:  OutlineInputBorder( borderRadius: BorderRadius.circular(10)),
                      hintText: 'image link',
                    ),
                  ),
                ),

                Container(
                    width: mediaQuery.size.width * 0.93 * 0.27,
                    height: 110,
                    decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10)
                    ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      pictureController.text,
                      errorBuilder: (BuildContext context, Object exeption, StackTrace? stackTrace){
                        return Image.asset('assets/images/no_picture.png', fit: BoxFit.cover,);
                      },
                      fit: BoxFit.cover,

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()) {
                          TaskInherited.of(widget.taskContext).newTask(
                              nameController.text ,
                              pictureController.text,
                              int.parse(difficultyController.text)
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('submiting new task')));
                          Navigator.pop(context);

                        }
                      },
                      child: const Text('add task')),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
