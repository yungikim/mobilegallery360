import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gallery360/pages/tech/controller/tech_controller.dart';
import 'package:get/get.dart';
import '../../util/Util.dart';

class Tech extends StatefulWidget {
  Tech({super.key, required this.id});
  String id;

  @override
  State<Tech> createState() => _TechState();
}

class _TechState extends State<Tech> {
  @override
  final techController _techcontroller = Get.put(techController());

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: actionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: customAppBar(context),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _techcontroller.getNewsData(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              String title = snapshot.data["title"];
              String content2 = "<html>${Util.chageText(snapshot.data["content"])}</html>";
              String content = snapshot.data['content'];
              print(content2);
              return Html(data: content2);
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Connection Error"),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
