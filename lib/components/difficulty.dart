

import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty({super.key, required this.difficultyLevel});

  final int difficultyLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: difficultyLevel >0 ? Colors.yellow : Colors.grey, size: 21 ,),
        Icon(Icons.star, color: difficultyLevel >1 ? Colors.yellow : Colors.grey, size: 21 ,),
        Icon(Icons.star, color: difficultyLevel >2 ? Colors.yellow : Colors.grey, size: 21 ,),
        Icon(Icons.star, color: difficultyLevel >3 ? Colors.yellow : Colors.grey, size: 21 ,),
        Icon(Icons.star, color: difficultyLevel >4 ? Colors.yellow : Colors.grey, size: 21 ,),
      ],
    );
  }
}
