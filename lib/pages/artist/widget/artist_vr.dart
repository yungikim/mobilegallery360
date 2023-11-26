import 'package:flutter/material.dart';
import 'package:gallery360/pages/artist/controller/artist_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArtistVRWidget extends StatefulWidget {
  const ArtistVRWidget({super.key});

  @override
  State<ArtistVRWidget> createState() => _ArtistVRWidgetState();
}

class _ArtistVRWidgetState extends State<ArtistVRWidget> {

  final ArtistController _artistController = Get.put(ArtistController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
