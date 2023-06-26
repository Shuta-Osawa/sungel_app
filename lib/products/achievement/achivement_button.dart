import 'package:flutter/material.dart';

class AchievementButton extends StatelessWidget {
  const AchievementButton({
    super.key,
    required this.title,
    required this.countValue,
    required this.onDecrement,
    required this.onIncrement,

  });

  final String title;
  final int countValue;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.indigo,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.remove),
            onPressed: onDecrement,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          '$countValue',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.indigo,
            ),
          ),
          child: IconButton(
            icon: const Icon(Icons.add),
            onPressed: onIncrement,
          ),
        ),
      ],
    );
  }
}







