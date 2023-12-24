import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Spacebar3 extends StatelessWidget {
  const Spacebar3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
    //  color: Colors.blue,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tr('main_41'),
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          Text(
            tr('main_42'),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
