import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery360/const/const.dart';
import 'package:gallery360/pages/aipainter/controller/template.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import 'model/image_template.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main(){
  HttpOverrides.global =
      MyHttpOverrides(); //Network.Image, Http로 ReverseProxy형태의 호출시 SSL에러 처리

  runApp(mm());
}

class mm extends StatelessWidget {
  const mm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: aiPainter(),
    );
  }
}


class aiPainter extends StatefulWidget {
  const aiPainter({super.key});

  @override
  State<aiPainter> createState() => _aiPainterState();
}

class _aiPainterState extends State<aiPainter> {

  final ImagePicker _picker = ImagePicker();
  late List<XFile?> _pickedImages = [];
  final templateController _templateController = Get.put(templateController());

  void getImage(ImageSource source) async{
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _pickedImages = [];
      _pickedImages.add(image);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AI Painter", textAlign: TextAlign.left,),
        leading: IconButton(icon : const Icon(Icons.arrow_back_ios), onPressed: () {
          Get.back();
        },),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.send_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ElevatedButton(onPressed: (){
                      getImage(ImageSource.gallery);
                    }, child: Text("이미지 선택")),
                    SizedBox(width: 5,),
                    ElevatedButton(onPressed: (){
                      setState(() {
                        _pickedImages.removeLast();
                      });
                    }, child: Text("이미지 삭제")),
                  ],
                ),
                // ElevatedButton(onPressed: (){
                //   setState(() {
                //     _pickedImages.removeLast();
                //   });
                // }, child: Text("이미지 삭제")),
              ],
            ),
            const SizedBox(height: 20,),
            _gridPhoto(),
            _selectImageGrid()
          ],
        ),
      ),
    );
  }

  Widget _gridPhoto(){
    return _pickedImages.isNotEmpty
      ? _photoDisplay(_pickedImages[0]!)
      : const SizedBox();
  }

  Widget _photoDisplay(XFile e){
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(e.path)),
          fit: BoxFit.fitHeight
        ),
      ),
    );
  }

  Widget _selectImageGrid(){
    final width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: _templateController.getTemplateList(),
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index){
              template item = snapshot.data(index);
              String url = "{$base_url}/artimage/ai_sample/{item.name}_small.jpg";
              return Container(
                width: 300,
                height: 200,
                color: Colors.grey,
              );
            },
          );
        }else{
          if (snapshot.hasError){
            return const Center(
              child: Text("Connection error"),
            );
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
      },
    );
  }

  Widget _OnePhoto(XFile e){
    return Stack(
      children: [
        Positioned.fill(
          child: Image.file(File(e.path), fit: BoxFit.cover,),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: IconButton(
            iconSize: 50,
            icon: const Icon(Icons.cancel_rounded, color: Colors.black,),
            onPressed: (){
              setState(() {
                _pickedImages.remove(e);
              });
            },
          ),
        )
      ],
    );
  }
}
