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
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "좋은 작품을 만나는 현명한 방법!",
              style: TextStyle(
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
