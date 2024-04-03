import 'package:flutter/material.dart';
import 'package:untitled1/components/difficulty.dart';

class Task extends StatefulWidget {
  const Task(
      {super.key,
      required this.name,
      required this.difficulty,
      required this.pictureLink});

  final String name;
  final int difficulty;
  final String pictureLink;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool picTest() {
    if (widget.pictureLink.trim().isEmpty) {
      return false;
    }
    return true;
  }

  int level = 1;

  void levelUp(){
    level++;
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(children: [
        Container(
          width: mediaQuery.size.width * 0.93,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.blue[800],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: mediaQuery.size.width * 0.93,
              height: 110,
              decoration: const BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: mediaQuery.size.width * 0.93 * 0.27,
                    height: 110,
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: picTest()
                        ? ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20)),
                            child: Image.asset(
                              widget.pictureLink,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20)),
                            child: Image.asset(
                              'assets/images/no_picture.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ), //Container da FOTO
                  SizedBox(
                    width: mediaQuery.size.width * 0.93 * 0.43,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Difficulty(difficultyLevel: widget.difficulty)
                      ],
                    ),
                  ), //NOME DA TAREFA
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      width: 82,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              levelUp();
                            });
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text('lvl up', )],
                          )),
                    ),
                  ) //elevatedbuton
                ],
              ),
            ), //CONTAINER DE CIMA COM FOTO, NOME E BOTAO
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 8,
                    width: mediaQuery.size.width * 0.93 * 0.6,
                    child: LinearProgressIndicator(
                      color: Colors.white,
                      backgroundColor: Colors.grey,
                      value: widget.difficulty <= 0 ?
                      1 : (level/widget.difficulty)/10,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Text("NVL $level", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
