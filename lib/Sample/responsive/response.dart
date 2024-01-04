import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: pp(),
        );
      }
    );

  }
}

class pp extends StatelessWidget {
  const pp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("우리나라 대한민국", style: TextStyle(fontSize: 12.0.sp),)
          ],
        ),
      ),
    );
  }
}

