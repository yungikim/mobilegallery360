import 'package:flutter/material.dart';

class Spacebar3 extends StatelessWidget {
  const Spacebar3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
    //  color: Colors.blue,
      alignment: Alignment.center,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "당신이 기획한 전시와 아이디어",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Text(
            "대관 서비스",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
