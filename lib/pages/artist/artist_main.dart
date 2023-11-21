import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ArtistMainPage extends StatelessWidget {
  const ArtistMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()){
              ZoomDrawer.of(context)!.close();
            }else{
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Image(
            image: AssetImage("assets/images/logo/logo.png"),
            width: 130,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],

      ),

      body: Container(
        color: Colors.yellow,
      ),
    );
  }
}
