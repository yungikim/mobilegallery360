import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../../../../util/Util.dart';

class SpaceBar6 extends StatelessWidget {
  const SpaceBar6({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // height: ResponsiveBreakpoints.of(context).isDesktop ? 400 :  300,
      height: ResponsiveBreakpoints.of(context).isDesktop ? 200 :  150,
     // color: Colors.yellow,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // const SizedBox(height: 10,),
            // Row(
            //   children: [
            //     Image.asset(
            //       "assets/images/mainPage/icon-event-01.png",
            //       width: 70,
            //     ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           tr('main_48'),
            //           style: TextStyle(
            //             fontSize: Util.fSize15,
            //           ),
            //         ),
            //         Text(
            //           tr('main_49'),
            //           style: TextStyle(fontSize: Util.fSize14, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/mainPage/icon-event-02@2x.png",
                  width: 70,
                ),
                const SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: (){
                    Util.UrlOpen("https://pf.kakao.com/_tAWTT/chat");
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tr('main_50'),
                        style: TextStyle(fontSize: Util.fSize15),
                      ),
                      Text(
                        tr('main_51'),
                        style: TextStyle(fontSize: Util.fSize14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
            ),
            // const SizedBox(height: 10,),
            // Row(
            //   children: [
            //     Image.asset(
            //       "assets/images/mainPage/icon-event-03@2x.png",
            //       width: 70,
            //     ),
            //     const SizedBox(
            //       width: 30,
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           tr('main_52'),
            //           style: TextStyle(fontSize: Util.fSize15),
            //         ),
            //         Text(
            //           tr('main_53'),
            //           style: TextStyle(fontSize: Util.fSize14, fontWeight: FontWeight.bold),
            //         ),
            //       ],
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
