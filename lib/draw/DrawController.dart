
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class DrawerController extends GetxController{
  final zoomDrawerController = ZoomDrawerController();
  void toggleDrawer(){
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}