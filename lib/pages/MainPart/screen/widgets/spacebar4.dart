import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gallery360/pages/MainPart/screen/widgets/controls/data_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../../util/Util.dart';

class SpaceBar4 extends StatefulWidget {
  const SpaceBar4({super.key});

  @override
  State<SpaceBar4> createState() => _SpaceBar4State();
}

class _SpaceBar4State extends State<SpaceBar4> {
  final DataController _dataController = Get.put(DataController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveBreakpoints.of(context).isDesktop ? 160 :  120,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: const AssetImage("assets/images/mainPage/banner03.jpg"),
        fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.darken),
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: _dataController.getArtistCount(),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                //정상적으로 값을 가져온 경우
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "${snapshot.data} ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Util.fSize16)),
                      TextSpan(text: tr('main_43'), style: TextStyle(fontSize: Util.fSize15)),
                    ]
                  ),
                );
              }else if (snapshot.hasError){
                return const Center(
                  child: Text("Initialization Failed"),
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),

          Text(
            tr('main_44'),
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: Util.fSize16,
            ),
          )
        ],
      ),
    );
  }
}
