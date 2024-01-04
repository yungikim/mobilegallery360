import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import '../../../../util/Util.dart';
import '../../../search/search_main.dart';

class Spacebar2 extends StatelessWidget {
  const Spacebar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveBreakpoints.of(context).isDesktop ? 180.0 :  140.0,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage("assets/images/mainPage/banner02.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.darken))),
      child: Stack(
        children: [
          Positioned(
            top: 10.0,
            left: 10.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('main_38'),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: Util.fSize15,
                  ),
                ),
                Text(
                  tr('main_39'),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: Util.fSize15,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: TextButton(
              onPressed: () {
                Get.to(() => const SearchBarScreen(), transition: Transition.fadeIn);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.0))),
                side: BorderSide(color: Colors.white.withOpacity(0.8)),
              ),
              child: Text(
                tr('main_40'),
                style: TextStyle(
                  fontSize: Util.fSize14,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
