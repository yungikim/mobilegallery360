import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Spacebar1 extends StatelessWidget {
  const Spacebar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140.0,
          decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
            image: const AssetImage("assets/images/mainPage/banner01.jpg"),
            fit: BoxFit.cover,
          )),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              tr('main_37'),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Colors.white,
                shadows:[
                  Shadow(
                    offset: Offset(1.0, 0.0),
                    blurRadius: 1.0,
                    color: Colors.black,
                  )
                ]
              ),
            ),
          ),
        )
      ],
    );
  }
}
