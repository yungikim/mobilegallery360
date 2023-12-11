import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

void main() {
  runApp(MM());
}

class MM extends StatelessWidget {
  const MM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FileDownload(),
    );
  }
}

class FileDownload extends StatelessWidget {
  const FileDownload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Download"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            print("donwload");
            FileDownloader.downloadFile(
                url: "https://meet.kmslab.com:8444/WMeet/FileDownload.do?em=jykim@kmslab.com&fd=20231211095819_LWZGDDMTKBKQLB1&ty=1&m5=b46ff6c9d5bc87707935643d671852e2.382085&fn=06-3.%20%EB%A9%94%ED%83%80%EB%B2%84%EC%8A%A4%20%ED%98%84%ED%99%A9%20%EB%B0%8F%20%ED%8A%B8%EB%A0%8C%EB%93%9C.pdf",
                name: "123.pdf",//(optional)
                onProgress: (fileName, progress) {
                  print('FILE fileName HAS PROGRESS $progress');
                },
                onDownloadCompleted: (String path) {
                  print('FILE DOWNLOADED TO PATH: $path');
                },
                onDownloadError: (String error) {
                  print('DOWNLOAD ERROR: $error');
                });


          },
          child: Text("FileDownload"),
        ),
      ),
    );
  }
}
