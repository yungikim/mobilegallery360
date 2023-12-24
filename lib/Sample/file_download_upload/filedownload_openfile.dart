import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: cc(),
    );
  }
}

class cc extends StatelessWidget {
  const cc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Download & Open"),
                onPressed: () =>
                // openFile(
                //   url: "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
                //   fileName : "video.mp4"
                // ),
                openFile(
                  url: "https://www.gallery360.co.kr/cp_downloadFile.gu?type=Company",
                  fileName: "1111.pdf"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async{
    final file = await downloadFile(url, fileName!);
    if (file == null){
      return;
    }
    print('Path : ${file.path}');
    final result = await OpenFile.open(file.path);
    print("${result.type} / ${result.message}");

  }

  //Download file into private folder not visible to user
  Future<File?> downloadFile(String url, String name) async{
    try{
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/$name');
      final response = await Dio().get(
          url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: const Duration(minutes: 100000),
          )
      );

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    }catch(e){
      return null;
    }

  }
}
