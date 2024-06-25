import 'package:flutter/material.dart';

class ReadyText extends StatelessWidget {
  const ReadyText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 250,),
        Icon(Icons.warning, size: 34,),
        Text('준비중입니다.', style: TextStyle(fontSize: 20),),
      ],
    );
  }
}
