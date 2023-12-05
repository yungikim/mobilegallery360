import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AccordionSample(),
    );
  }
}


class AccordionSample extends StatelessWidget {
  const AccordionSample({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Accordion(
          headerBorderColor: Colors.black,
          headerBorderColorOpened: Colors.red,
          contentBackgroundColor: Colors.grey,
          contentBorderWidth: 10,
          contentHorizontalPadding: 1,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          sectionClosingHapticFeedback: SectionHapticFeedback.heavy,
          sectionOpeningHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
              headerBorderRadius: 15,
             // headerBackgroundColor: Colors.black,
              headerBackgroundColorOpened: Colors.green,
              headerBorderWidth: 10,
              contentBackgroundColor: Colors.red,
              contentBorderWidth: 5,
              contentHorizontalPadding: 20,
              contentVerticalPadding: 100,
              header: const Text("111111"),
              content: Container(
                height: 500,
                width: double.infinity,
              //  color: Colors.blue,
                child: Text("123123123123123123123123123123123123", style: TextStyle(color: Colors.white),),
              ),
            ),
            AccordionSection(
              header: const Text("222222"),
              content: Container(
                height: 500,
                color: Colors.blue,
                child: Text("222222222222222222222222"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
