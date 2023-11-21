import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../pages/MainPart/screen/main_page.dart';


class ZoomDrawPage extends GetView<DrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: MenuScreen(),
        mainScreen: MenuScreen(),
        borderRadius: 24.0,
        showShadow: true,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.grey,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
      ),
    );
  }
}

class MainScreen extends GetView<DrawerController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: ElevatedButton(
          onPressed: controller.toggleDrawer,
          child: Text("Toggle Drawer"),
        ),
      ),
    );
  }
}

class MenuScreen extends GetView<DrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class DrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();
  void toggleDrawer(){
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}