import 'package:flutter/material.dart';

void main(){
  runApp(const ImageTest());
}

class ImageTest extends StatelessWidget {
  const ImageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tx(),
    );
  }
}


class Tx extends StatelessWidget {
  const Tx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

      ),
    );
  }
}

    